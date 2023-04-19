import 'package:equatable/Equatable.dart';

abstract class ActivityEvent extends Equatable {
  const ActivityEvent();
}

class LoadUserEvent extends ActivityEvent {
  LoadUserEvent();
  @override
  List<Object?> get props => [];
}
