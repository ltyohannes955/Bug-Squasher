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
    on<PersonalEventFetch>((event, emit) async {
      emit(Personalloading());
      try {
        List filter = [];
        final activity = await apiServiceProvider.fetchexplor();
        
        for (var element in activity!) {
          if (element.workarea == event.data.toString()) {
            filter.add(element);
            continue;
          }
        }
        emit(Personalsuccess(
          personal_list: filter,
        ));
      } catch (e) {
        print(e);
      }
    });
  }
}
