import 'package:bloc/bloc.dart';
import 'package:digital_business_card/database/model.dart';
import 'package:digital_business_card/database/service.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'activity_event.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  List card = [];
  List cards = [];
  final _service = Services();
  ActivityBloc() : super(ActivityInitial()) {
    on<GetActivity>((event, emit) async {
      emit(ActivityLoading());

      try{
        await _service.readCard().then((val) =>{
        card = val,
      });
      cards = Business_card.historyList(card);
      emit(ActivityLoaded(card: cards));
      }catch (e){
        emit(ActivityFailed());
      }
    });

    on<PersonalEvent>((event, emit) => {
      if(!cards.contains(event.data)){
        cards.add(event.data),
        _service.saveCard(event.data),
      }
    });

    on<CardEdit>((event, emit) => {

    },);

    on<CardRemove>((event, emit) => {
      _service.deleteCard(cards[event.data].id),
      cards.removeAt(event.data),
    },);
  }
}
