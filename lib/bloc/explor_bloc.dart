import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:digital_business_card/model/explor_list.dart';
import 'package:digital_business_card/service/apiservice.dart';
import 'package:meta/meta.dart';

import '../service/apiservice.dart';

part 'explor_event.dart';
part 'explor_state.dart';

class ExplorBloc extends Bloc<ExplorEvent, ExplorState> {
  final apiServiceProvider = ApiServiceProvider();
  final _service = Service();
  ExplorBloc() : super(ExplorInitial()) {
    on<ExplorEvent>((event, emit) async {
      emit(Explorloding());
      try {
        final activity = await apiServiceProvider.fetchActivity();
        emit(ExplorIsucsess(
          explor_list: activity!,
        ));
      } catch (e) {
        print(e);
      }
    });
  }
}
