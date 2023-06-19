import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentwithbloc/core/constant.dart';
import 'package:studentwithbloc/function/db_function.dart';
import 'package:studentwithbloc/function/function.dart';
import 'package:studentwithbloc/model/studentmodel.dart';
import 'package:studentwithbloc/presentation/addscreen/image_bloc/image_bloc.dart';
import 'package:studentwithbloc/presentation/mainscreen/main_Screen.dart';

class ScreenUpdate extends StatelessWidget {
   ScreenUpdate({super.key,required this.data});

   StudentModel data;

  String? imagepath;
  final namectr = TextEditingController();
  final agectr = TextEditingController();
  final mobilectr = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    namectr.text = data.name;
    agectr.text = data.age;
    mobilectr.text = data.mobile;
    imagepath = data.image;
    context.read<ImageBloc>().add(AddImage(imagepath: imagepath!));
    // final screensize = MediaQuery.of(context).size;
    return  Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Edit Student detail'),
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
                        radius: 90,
                        backgroundImage:FileImage(File(state.imagepath)),
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
              updatestudent(context,data.id!);
            
              
            }, icon: Icon(Icons.add), label: Text('Update')),
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

updatestudent(BuildContext context,int id)async{
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
    final updateddata = StudentModel(name: name, age: age, mobile: mobile, image: imagepath!,id: id);
    await updatedatabase(id,updateddata,context);
    context.read<ImageBloc>().add(AddImage(imagepath:''));
 
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => ScreenMain(),), (route) => false);
    
  }
}
}