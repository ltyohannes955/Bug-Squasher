import 'package:equatable/Equatable.dart';
import 'package:digital_business_card/model/cards.dart';

abstract class ActivityState extends Equatable {
  const ActivityState();
}

class ActivityInitial extends ActivityState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ActivityLoadingState extends ActivityState {
  @override
  List<Object> get props => [];
}

class ActivitySuccessState extends ActivityState {
    final List  popular;
  const ActivitySuccessState(
    cards activity, 
    {required this.popular});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ActivityFailState extends ActivityState {
  String message;

  ActivityFailState(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
