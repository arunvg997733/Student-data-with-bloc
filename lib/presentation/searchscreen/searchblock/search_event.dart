part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchList extends SearchEvent{
  List <StudentModel> studentlist;
  SearchList({required this.studentlist});
}
