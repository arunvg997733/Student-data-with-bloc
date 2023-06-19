part of 'image_bloc.dart';

@immutable
class ImageState {
  String imagepath;
  ImageState({required this.imagepath});
}

class InitialImage extends ImageState{
  InitialImage():super(imagepath: '');
}


