part of 'popular_bloc.dart';

@immutable
abstract class PopularState {}

class PopularInitial extends PopularState {}

class PopularLoading extends PopularState {}

class PopularSuccess extends PopularState {
  final List Popular_items;

  PopularSuccess({
    required this.Popular_items,
  });
}

class PopularFailed extends PopularState {}
