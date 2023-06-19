part of 'image_bloc.dart';

@immutable
abstract class ImageEvent {}

class AddImage extends ImageEvent {
  String imagepath;
  AddImage({required this.imagepath});
}
