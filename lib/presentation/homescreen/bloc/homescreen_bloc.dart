import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:studentwithbloc/function/db_function.dart';
import 'package:studentwithbloc/model/studentmodel.dart';

part 'homescreen_event.dart';
part 'homescreen_state.dart';

class HomescreenBloc extends Bloc<HomescreenEvent, HomescreenState> {
  HomescreenBloc() : super(HomescreenInitial()) {
    on<AddStudent>((event, emit) {
      return emit(HomescreenState(newlist: event.studentlist));
    });
  }
}
