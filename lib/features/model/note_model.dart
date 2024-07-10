import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String body;

  @HiveField(2)
  bool isHearted;

  @HiveField(3)
  String dateTime;

  NoteModel(
      {required this.title,
      required this.body,
      this.isHearted = false,
      required this.dateTime});

  @override
  String toString() {
    return 'NoteModel{title: $title, body: $body, dateTime: $dateTime, isHearted: $isHearted}';
  }
}
