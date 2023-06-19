import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:studentwithbloc/function/function.dart';
import 'package:studentwithbloc/model/studentmodel.dart';
import 'package:studentwithbloc/presentation/homescreen/bloc/homescreen_bloc.dart';

List<StudentModel> allstudentlist = [];

addtodatabase(StudentModel data,BuildContext context)async{
  final studentDB = Hive.box<StudentModel>("StudentDB");
   final id = await studentDB.add(data);
   final newdata =StudentModel(name: data.name, age: data.age, mobile: data.mobile, image: data.image,id: id);
  //  data.id = id;
   studentDB.put(id,newdata);
  getdetailsfromdatabase(context);
}
getdetailsfromdatabase(BuildContext context)async{
  
  final studentDB = Hive.box<StudentModel>("StudentDB");
  allstudentlist.clear();
  allstudentlist.addAll(studentDB.values);
  context.read<HomescreenBloc>().add(AddStudent(studentlist: allstudentlist));
}

updatedatabase(int id,StudentModel data,BuildContext context)async{
  final studentDB = await Hive.openBox<StudentModel>("StudentDB");
  studentDB.put(id, data);
  getdetailsfromdatabase(context);
  showsnackbar(context, 'Updated successfully ' );

}

deletefromdatabase(BuildContext context, StudentModel data)async{
  final studentDB = await Hive.openBox<StudentModel>("StudentDB");
  studentDB.delete(data.id);
  getdetailsfromdatabase(context);
  showsnackbar(context,'Deleted');
}