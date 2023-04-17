part of 'popular_bloc.dart';

@immutable
abstract class PopularState extends Equatable {
  const PopularState();

  @override
  List<Object> get props => [];
}

class PopularInitial extends PopularState {}

class PopularLoading extends PopularState {}

class PopularSuccess extends PopularState {
  final List items;
  const PopularSuccess({required this.items});
}
