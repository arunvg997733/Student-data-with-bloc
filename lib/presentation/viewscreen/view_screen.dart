import 'dart:io';

import 'package:flutter/material.dart';
import 'package:studentwithbloc/function/db_function.dart';
import 'package:studentwithbloc/model/studentmodel.dart';
import 'package:studentwithbloc/presentation/mainscreen/main_Screen.dart';
import 'package:studentwithbloc/presentation/updatescreen/update_screen.dart';

class ViewScreen extends StatelessWidget {
   ViewScreen({super.key,required this.data});

  StudentModel data;
  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Student Details'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            showDialog(context: context, builder: (context) {
                                    return AlertDialog(
                                      title: Text('Do you want delete'),
                                      actions: [
                                        TextButton(onPressed: () {
                                          deletefromdatabase(context, data);
                                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => ScreenMain(),), (route) => false);
                                        }, child: Text('Yes')),
                                        TextButton(onPressed: () {
                                          Navigator.pop(context);
                                        }, child: Text('No'))
                                      
                                    ],);
                                  },);
            
          }, icon: Icon(Icons.delete)),
          IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenUpdate(data: data),));
          }, icon: Icon(Icons.edit))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 200, 232, 255),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: screensize.width*.5,
                  height: screensize.width*.6,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: FileImage(File(data.image)),fit: BoxFit.cover)
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: screensize.width*.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(data.name,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      Text('Age : ${data.age}',style: TextStyle(fontSize: 25),),
                      Text('Mobile : ${data.mobile}',style: TextStyle(fontSize: 25),),
                    ],
                  ),
                ),
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}