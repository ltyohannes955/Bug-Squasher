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
    on<ExplorerEventFetch>((event, emit) async {
      emit(Explorloding());
      try {
        List filter = [];
        final activity = await apiServiceProvider.fetchexplor();
        print(event.data);
        for (var element in activity!) {
          print(element.workarea.toString() == event.data.toString());
          if (element.workarea == event.data.toString()) {
            filter.add(element);
            continue;
          }
        }
        print(filter);
        emit(ExplorIsucsess(
          explor_list: filter,
        ));
      } catch (e) {
        print(e);
      }
    });
  }
}
