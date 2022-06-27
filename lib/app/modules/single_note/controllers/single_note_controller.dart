import 'package:to_do_hive/constants/exports.dart';

import '../../../data/models/note.dart';

class SingleNoteController extends GetxController {
  late TextEditingController titleTextEditingController;
  late TextEditingController contentTextEditingController;

  int selectedIndex = 0;
  bool isPinned = false;
  List<String> staticColors = [
    "#FFC600",
    "#1D5FB8",
    "#ffa348",
    "#525252",
    "#C7C7CC",
    "#F9F9F9",
    '#CBF6FF',
    "#B3ED9728",  
    "#ffa6c4",
    "#1ecdc4",
    "#FFF6DB",
    "#1ecdc4",
    "#7eccff",
  ];

  void selectColor(int index) {
    selectedIndex = index;
    update();
  }

  void pin() {
    isPinned = !isPinned;
    (Get.arguments[0] as Note).isPinned = isPinned;
    debugPrint((Get.arguments[0] as Note).isPinned.toString());
    update();
  }

  @override
  void onInit() {
    titleTextEditingController = TextEditingController();
    contentTextEditingController = TextEditingController();
    titleTextEditingController.text = (Get.arguments[0] as Note).title!;
    contentTextEditingController.text = (Get.arguments[0] as Note).content;
    super.onInit();
  }

  @override
  void onClose() {
    titleTextEditingController.dispose();
    contentTextEditingController.dispose();
  }
}

enum ScreenVisitingType { addNote, editNote }
