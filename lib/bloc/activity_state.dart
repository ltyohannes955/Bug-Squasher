part of 'activity_bloc.dart';

@immutable
abstract class ActivityState extends Equatable {
  const ActivityState();

  @override
  List<Object> get props => [];
}

class ActivityInitial extends ActivityState {
  @override
  List<Object> get props => [];
}

class ActivityLoading extends ActivityState{
  @override
  List<Object> get props => [];
}

class ActivityLoaded extends ActivityState{
  final List card;

  const ActivityLoaded({required this.card});

  @override
  List<Object> get props => [];
}

class ActivityFailed extends ActivityState{}
