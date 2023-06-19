part of 'search_bloc.dart';

class SearchState {
  List <StudentModel> studentlist;
  SearchState({required this.studentlist}); 
}
class SearchInitial extends SearchState{
  SearchInitial() : super(studentlist: allstudentlist);
}


