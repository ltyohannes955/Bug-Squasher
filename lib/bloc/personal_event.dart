part of 'personal_bloc.dart';

@immutable
abstract class PersonalEvent {}

class PersonalEventFetch extends PersonalEvent {
  PersonalEventFetch();
  @override
  List<Object> get props => [];
}
