import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studentwithbloc/core/constant.dart';
import 'package:studentwithbloc/function/db_function.dart';
import 'package:studentwithbloc/presentation/homescreen/bloc/homescreen_bloc.dart';
import 'package:studentwithbloc/presentation/searchscreen/search_screen.dart';
import 'package:studentwithbloc/presentation/viewscreen/view_screen.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details List'),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenSearch(
              
            ),));
          }, icon: Icon(Icons.search))
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<HomescreenBloc, HomescreenState>(
          builder: (context, state) {
            return allstudentlist.isEmpty ?Center(child: Text('No Student Details')):ListView.separated(itemBuilder: (context, index) {
                  
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewScreen(data: state.newlist[index]),));
                    },
                    child: Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 200, 232, 255),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 70,
                                    height:100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: FileImage(File(state.newlist[index].image)),fit: BoxFit.cover)
                                    ),
                                  ),
                                ),
                               const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Name'),
                                    Text('Age'),
                                    Text('Mobile')
                                  ],
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(' :  '),
                                    Text(' :  '),
                                    Text(' :  ')
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(state.newlist[index].name),
                                      Text(state.newlist[index].age),
                                      Text(state.newlist[index].mobile)
                                    ],
                                  ),
                                ),
                                IconButton(onPressed: () {
                                  showDialog(context: context, builder: (context) {
                                    return AlertDialog(
                                      title: Text('Do you want delete'),
                                      actions: [
                                        TextButton(onPressed: () {
                                          deletefromdatabase(context, state.newlist[index]);
                                          Navigator.pop(context);
                                        }, child: Text('Yes')),
                                        TextButton(onPressed: () {
                                          Navigator.pop(context);
                                        }, child: Text('No'))
                                      
                                    ],);
                                  },);
                                  
                                }, icon: Icon(Icons.delete))
                              ],
                            ),
                          ),
                  );
                }, separatorBuilder: (context, index) {
                  return kheight10;
                }, itemCount: state.newlist.length);
          },
        ),
      ),
      
    );
  }
}