import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottomnavcount_event.dart';
part 'bottomnavcount_state.dart';

class BottomnavcountBloc extends Bloc<BottomnavcountEvent, BottomnavcountState> {
  BottomnavcountBloc() : super(Initialstate()) {
 
    on<OnTapIndex>((event, emit) {
      return emit(BottomnavcountState(count: event.index));
    },);
  }
}
