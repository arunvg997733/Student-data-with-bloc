
import 'package:flutter/material.dart';

showsnackbar(BuildContext context,String message){
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message),behavior: SnackBarBehavior.floating,),
    );
}