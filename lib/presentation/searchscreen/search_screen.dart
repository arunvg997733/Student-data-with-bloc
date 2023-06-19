import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studentwithbloc/function/db_function.dart';
import 'package:studentwithbloc/model/studentmodel.dart';
import 'package:studentwithbloc/presentation/homescreen/bloc/homescreen_bloc.dart';
import 'package:studentwithbloc/presentation/searchscreen/searchblock/search_bloc.dart';
import 'package:studentwithbloc/presentation/viewscreen/view_screen.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SearchBloc>().add(SearchList(studentlist: allstudentlist));
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Search Students'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: CupertinoSearchTextField(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 207, 207, 207),
                  borderRadius: BorderRadius.circular(15)
                ),
                onChanged: (value) {
                  List<StudentModel> newlist = allstudentlist.where((element) => element.name.toLowerCase().contains(value.toLowerCase())).toList();
                  context.read<SearchBloc>().add(SearchList(studentlist: newlist));
                },
              ),
            ),
            
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                return state.studentlist.isEmpty?Expanded(child: Center(child: Text('No student details found'))) : Expanded(
                  child: ListView.separated(itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewScreen(data: state.studentlist[index]),));
                        },
                        title: Text(state.studentlist[index].name),
                        subtitle: Text(state.studentlist[index].mobile),
                        leading: CircleAvatar(
                          backgroundImage: FileImage(File(state.studentlist[index].image)),
                        ),
                      );
                    }, separatorBuilder: (context, index) {
                      return Divider();
                    }, itemCount: state.studentlist.length),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}