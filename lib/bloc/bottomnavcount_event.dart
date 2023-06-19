part of 'bottomnavcount_bloc.dart';

@immutable
abstract class BottomnavcountEvent {}
// class OnTapzero extends BottomnavcountEvent{

// }

// class OnTapOne extends BottomnavcountEvent{

// }

class OnTapIndex extends BottomnavcountEvent{
  int index;
  OnTapIndex({required this.index});
}
