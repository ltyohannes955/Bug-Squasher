part of 'activity_bloc.dart';

@immutable
abstract class ActivityEvent extends Equatable {
  const ActivityEvent();

  @override
  List<Object> get props => [];
}
class GetActivity extends ActivityEvent{
  const GetActivity();

  @override
  List<Object> get props => [];
}

class PersonalEvent extends ActivityEvent{
  final Business_card business_card;
  const PersonalEvent({required this.business_card});

  @override
  List<Object> get props => [];

  get data => business_card;
}

class CardEdit extends ActivityEvent{
  final int index;

  CardEdit(this.index);

  @override
  List<Object> get props => [];

  get data => index;
}

class CardRemove extends ActivityEvent{
  final int index;
  CardRemove(this.index);

  @override
  List<Object> get props => [];

  get data => index;
}
