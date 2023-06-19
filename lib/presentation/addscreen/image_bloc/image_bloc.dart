import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:studentwithbloc/presentation/addscreen/add_screen.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(InitialImage()) {
    on<AddImage>((event, emit) {
      return emit(ImageState(imagepath: event.imagepath));
    });
  }
}
