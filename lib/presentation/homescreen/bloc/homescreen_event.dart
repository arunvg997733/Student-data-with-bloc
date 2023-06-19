part of 'homescreen_bloc.dart';

@immutable
abstract class HomescreenEvent {}

class AddStudent extends HomescreenEvent{
  List<StudentModel> studentlist;
  AddStudent({required this.studentlist});
}

class searchstudent extends HomescreenEvent{
  List<StudentModel> studentlist;
  searchstudent({required this.studentlist});
}
