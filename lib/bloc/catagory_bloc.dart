import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../service/apiservice.dart';

part 'catagory_event.dart';
part 'catagory_state.dart';

class CatagoryBloc extends Bloc<CatagoryEvent, CatagoryState> {
  final apiServiceProvider = ApiServiceProvider();
  final _service = Service();

  CatagoryBloc() : super(CatagoryInitial()) {
    on<CatagoryEventFetch>((event, emit) async {
      emit(Catagoryloding());
      try {
        final activity = await apiServiceProvider.fetchActivity();

        emit(CatagoryIsucsess(
          catagory_list: activity!,
        ));
      } catch (e) {
        print(e);
      }
    });
  }
}
