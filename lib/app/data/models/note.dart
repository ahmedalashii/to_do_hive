import '../../../constants/exports.dart';
import '../../modules/home/controllers/home_controller.dart';
part "note.g.dart";

@HiveType(typeId: 0)
class Note extends HiveObject {
  final HomeController homeController = Get.find();

  @HiveField(0)
  String? title;
  @HiveField(1)
  String content;
  @HiveField(2)
  DateTime remindingDate;
  @HiveField(3)
  late String backgroundColor;
  @HiveField(4)
  late bool isPinned;
  @HiveField(5)
  late int id;
  Note(
      {this.title,
      required this.content,
      required this.remindingDate,
      required this.backgroundColor,
      this.isPinned = false}) {
    id = homeController.noOfCreatedNotes++;
  }
}
