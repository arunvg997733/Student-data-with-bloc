import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentwithbloc/bloc/bottomnavcount_bloc.dart';
import 'package:studentwithbloc/core/constant.dart';
import 'package:studentwithbloc/function/db_function.dart';
import 'package:studentwithbloc/function/function.dart';
import 'package:studentwithbloc/model/studentmodel.dart';
import 'package:studentwithbloc/presentation/addscreen/image_bloc/image_bloc.dart';

class ScreenAdd extends StatelessWidget {
   ScreenAdd({super.key});

  String? imagepath;
  final namectr = TextEditingController();
  final agectr = TextEditingController();
  final mobilectr = TextEditingController();


  @override
  Widget build(BuildContext context) {
    context.read<ImageBloc>().add(AddImage(imagepath: ''));
    final screensize = MediaQuery.of(context).size;
    return  Scaffold(
      resizeToAvoidBottomInset: false,
     appBar: AppBar(
      title: Text('Add Student Details',),
      centerTitle: true,
     ),
     body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 15),
       child: ListView(
        children: [
          kheight10,
          BlocBuilder<ImageBloc, ImageState>(
            builder: (context, state) {
              return CircleAvatar(
                        radius: screensize.width*.25,
                        backgroundImage:state.imagepath.isEmpty ? AssetImage('assets/Student Image.png')as ImageProvider : FileImage(File(state.imagepath)),
                      );
            },
          ),
          InkWell(
            onTap: ()async {
              await takepicture();
              context.read<ImageBloc>().add(AddImage(imagepath: imagepath!));
            },
            child: Icon(Icons.add_a_photo)),
          kheight10,
          TextField(
            textCapitalization: TextCapitalization.words,
            controller: namectr,
            maxLength: 30,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
            hintText: 'Name',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
          ),),
          kheight10,
          TextField(
            keyboardType: TextInputType.number,
            controller: agectr,
            maxLength: 2,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
            hintText: 'Age',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
          ),),
          kheight10,
          TextField(
            keyboardType: TextInputType.number,
            controller: mobilectr,
            textAlign: TextAlign.center,
            maxLength: 10,
            decoration: InputDecoration(
            hintText: 'Mobile Number',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
          ),),
          kheight10,
          Center(
            child: ElevatedButton.icon(onPressed: () {
              addstudent(context);
              
            }, icon: Icon(Icons.add), label: Text('Add')),
          )
        ],
       ),
     ),
    );
  }

  takepicture()async{

  final picker = await ImagePicker().pickImage(source: ImageSource.gallery);
  if(picker!= null){
    imagepath = picker.path;
  }
}

addstudent(BuildContext context)async{
  String name = namectr.text;
  String age = agectr.text;
  String mobile = mobilectr.text;
  

  if(name.isEmpty || age.isEmpty || mobile.isEmpty){
    showsnackbar(context, 'Please fill all the field');
  }else if(mobile.length != 10){
    showsnackbar(context, 'Please enter valid number');
  }else if(imagepath == null ){
    showsnackbar(context, 'Please add image');
  }else{
    final data = StudentModel(name: name, age: age, mobile: mobile, image: imagepath!);
    await addtodatabase(data,context);
    context.read<BottomnavcountBloc>().add(OnTapIndex(index: 0));
    context.read<ImageBloc>().add(AddImage(imagepath:''));
    namectr.clear();
    agectr.clear();
    mobilectr.clear();
    imagepath = null;
    

  }
}

}




