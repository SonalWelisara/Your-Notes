import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject{

  @HiveField(0)
  String title;
  
  @HiveField(1)
  String body;
  
  @HiveField(2)
  bool isHearted;
  
  @HiveField(3)
  String dateTime;

  NoteModel({required this.title, this.body = '', required this.isHearted, required this.dateTime});
}
