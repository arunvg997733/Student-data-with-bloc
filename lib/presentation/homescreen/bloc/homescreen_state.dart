part of 'homescreen_bloc.dart';

class HomescreenState {
  List<StudentModel> newlist;
  HomescreenState({required this.newlist});
}
class HomescreenInitial extends HomescreenState{
  HomescreenInitial():super(newlist: allstudentlist);
}


