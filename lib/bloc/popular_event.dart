part of 'popular_bloc.dart';

@immutable
abstract class PopularEvent {}

class PopularEventFetch extends PopularEvent {
  PopularEventFetch();
  @override
  List<Object> get props => [];
}
