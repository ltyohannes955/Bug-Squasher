part of 'catagory_bloc.dart';

@immutable
abstract class CatagoryEvent {}

class CatagoryEventFetch extends CatagoryEvent {
  CatagoryEventFetch();
  @override
  List<Object> get props => [];
}
