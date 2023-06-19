import 'package:hive_flutter/adapters.dart';
part 'studentmodel.g.dart';
@HiveType(typeId: 1)
class StudentModel{
  @HiveField(0)
  int? id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String age;
  @HiveField(3)
  String mobile;
  @HiveField(4)
  String image;
  StudentModel({required this.name,required this.age,required this.mobile,required this.image,this.id});
}