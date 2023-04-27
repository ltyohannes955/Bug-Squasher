part of 'personal_bloc.dart';

@immutable
abstract class PersonalState {}

class PersonalInitial extends PersonalState {}

class Personalloading extends PersonalState {}

class Personalsuccess extends PersonalState {
  final List personal_list;

  Personalsuccess({
    required this.personal_list,
  });

}

class PersonalFailed extends PersonalState{}
