part of 'catagory_bloc.dart';

@immutable
abstract class CatagoryState {}

class CatagoryInitial extends CatagoryState {}

class Catagoryloding extends CatagoryState {}

class CatagoryIsucsess extends CatagoryState {
  // ignore: non_constant_identifier_names
  final List catagory_list;

  // ignore: non_constant_identifier_names
  CatagoryIsucsess({
    required this.catagory_list,
  });
}

class CatagoryFailed extends CatagoryState {}
