import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:digital_business_card/model/explor_list.dart';
import 'package:digital_business_card/service/apiservice.dart';
import 'package:meta/meta.dart';

import '../service/apiservice.dart';

part 'personal_event.dart';
part 'personal_state.dart';

class PersonalBloc extends Bloc<PersonalEvent, PersonalState> {
  final apiServiceProvider = ApiServiceProvider();
  final _service = Service();

  PersonalBloc() : super(PersonalInitial()) {
    on<PersonalEvent>((event, emit) async {
      emit(Personalloading());
      try {
        final activity = await apiServiceProvider.fetchActivity();
        emit(Personalsuccess(
          personal_list: activity!,
        ));
      } catch (e) {
        print(e);
      }
    });
  }
}
