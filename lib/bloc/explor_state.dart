part of 'explor_bloc.dart';

@immutable
abstract class ExplorState {}

class ExplorInitial extends ExplorState {}

class Explorloding extends ExplorState {}

class ExplorIsucsess extends ExplorState {
  // ignore: non_constant_identifier_names
  final List explor_list;

  // ignore: non_constant_identifier_names
  ExplorIsucsess({
    required this.explor_list,
  });
}

class ExplorFaild extends ExplorState {}
