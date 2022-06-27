import 'package:to_do_hive/constants/exports.dart';

import '../../../data/models/note.dart';

class SingleNoteController extends GetxController {
  late TextEditingController titleTextEditingController;
  late TextEditingController contentTextEditingController;

  int selectedIndex = 0;

  List<Color> staticColors = [
    ColorManager.accent,
    ColorManager.primary,
    ColorManager.darkOrange,
    ColorManager.blueAccent,
    ColorManager.pink,
    ColorManager.lightGreen,
    ColorManager.lightYellow,
    ColorManager.lightGreen,
    ColorManager.lightBlue,
  ];

  void selectColor(int index) {
    selectedIndex = index;
    update();
  }

  @override
  void onInit() {
    titleTextEditingController = TextEditingController();
    titleTextEditingController.text = "Coffee";
    contentTextEditingController = TextEditingController();
    super.onInit();
  }

  void addNote(Note note){
    // adding process
    debugPrint(note.title);
  }

  @override
  void onClose() {
    titleTextEditingController.dispose();
    contentTextEditingController.dispose();
  }
}
