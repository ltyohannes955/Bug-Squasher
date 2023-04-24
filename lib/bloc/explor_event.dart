part of 'explor_bloc.dart';

@immutable
abstract class ExplorEvent {}

class ExplorEventFetch extends ExplorEvent {
  ExplorEventFetch();
  @override
  List<Object> get props => [];

}

class ExplorerEventFetch extends ExplorEvent {
   final String catagory;
  ExplorerEventFetch({required this.catagory});
  @override
  List<Object> get props => [];

get data => catagory;
 

}
