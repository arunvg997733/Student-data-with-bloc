import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:studentwithbloc/function/db_function.dart';
import 'package:studentwithbloc/model/studentmodel.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchList>((event, emit) {
     return emit(SearchState(studentlist: event.studentlist));
    });
  }
}
