import 'package:bloc/bloc.dart';
import 'package:equatable/Equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:digital_business_card/repos/repositorys.dart';

import 'activity_state.dart';
import 'activity_event.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final _repository = ApiServiceProvider();
  ActivityBloc() : super(ActivityInitial()) {
    on<ActivityEvent>((event, emit) async {
      emit(ActivityLoadingState());
      final activity = await _repository.fetchActivity();
      emit(ActivitySuccessState(activity!, popular: []));
    });
  }
}
