part of 'personal_bloc.dart';

@immutable
abstract class PersonalEvent {}

class PersonalEventFetch extends PersonalEvent {
  PersonalEventFetch();
  @override
  List<Object> get props => [];
}

class PersonalEventsFetch extends PersonalEvent {
  final String personal;
  PersonalEventsFetch({required this.personal});
  @override
  List<Object> get props => [];

  get data => personal;
}
