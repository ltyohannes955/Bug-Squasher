import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:digital_business_card/service/api.dart';
import 'package:digital_business_card/model/model.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  final _apiService = ApiServiceProvider();
  final _service = Service();
  PopularBloc() : super(PopularInitial()) {
    on<PopularFetchEvent>((event, emit) async {
      emit(PopularLoading());
      try {
        final activity = await _apiService.fetchActivity();
        await ((val) => {

        });
        
      }catch(e){

      }
    });
  }
}
