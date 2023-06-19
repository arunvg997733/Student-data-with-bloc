import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studentwithbloc/bloc/bottomnavcount_bloc.dart';
import 'package:studentwithbloc/function/db_function.dart';
import 'package:studentwithbloc/presentation/addscreen/add_screen.dart';
import 'package:studentwithbloc/presentation/homescreen/home_screen.dart';

class ScreenMain extends StatelessWidget {
   ScreenMain({super.key});

  List pages =  [
    ScreenHome(),
    ScreenAdd()
  ];
  

  @override
  Widget build(BuildContext context) {
    getdetailsfromdatabase(context);
    return Scaffold(
      body: BlocBuilder<BottomnavcountBloc, BottomnavcountState>(
        builder: (context, state) {
          return pages[state.count];
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomnavcountBloc, BottomnavcountState>(
        builder: (context, state) {
          return BottomNavigationBar(
              currentIndex: state.count,
              onTap: (value) {
                context.read<BottomnavcountBloc>().add(OnTapIndex(index: value));
              },
              items:const [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.add),label: 'Add')
            ]);
        },
      ),
    );
  }
}