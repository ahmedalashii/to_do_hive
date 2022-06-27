import '../../../constants/exports.dart';
part "note.g.dart";

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String content;
  @HiveField(2)
  DateTime createdDate;
  @HiveField(3)
  Color? backgroundColor;
  @HiveField(4)
  bool isPinned = false;
  Note(
      {this.title,
      required this.content,
      required this.createdDate,
      this.backgroundColor});
}