part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
  
  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class profileLoading extends ProfileState{
}

class profileSuccess extends ProfileState{
  List<Business_card> CardData;
  profileSuccess(this.CardData);

  @override
  List<Object> get props => [CardData];
}

class profileFailed extends ProfileState{}
