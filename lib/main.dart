import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:studentwithbloc/bloc/bottomnavcount_bloc.dart';
import 'package:studentwithbloc/function/db_function.dart';
import 'package:studentwithbloc/model/studentmodel.dart';
import 'package:studentwithbloc/presentation/addscreen/image_bloc/image_bloc.dart';
import 'package:studentwithbloc/presentation/homescreen/bloc/homescreen_bloc.dart';
import 'package:studentwithbloc/presentation/homescreen/home_screen.dart';
import 'package:studentwithbloc/presentation/mainscreen/main_Screen.dart';
import 'package:studentwithbloc/presentation/searchscreen/searchblock/search_bloc.dart';

void main() async{
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(StudentModelAdapter().typeId)){
    Hive.registerAdapter(StudentModelAdapter());
  }
  await Hive.openBox<StudentModel>("StudentDB");
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers: [ 
            BlocProvider(
          create: (context) => BottomnavcountBloc(),
    
        ),
            BlocProvider(
                create: (context) => ImageBloc(),
            ),

            BlocProvider(
                create: (context) => HomescreenBloc(),
            ),

            BlocProvider(
                create: (context) => SearchBloc(),
            ),
        ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue
              ),
              home: ScreenMain(),
            ),
    );
  }
}