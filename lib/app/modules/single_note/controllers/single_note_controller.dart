import 'package:to_do_hive/constants/exports.dart';

import '../../../data/models/note.dart';

class SingleNoteController extends GetxController {
  late TextEditingController titleTextEditingController;
  late TextEditingController contentTextEditingController;
  // Dialog TextFields:
  late TextEditingController datePickerController;
  late TextEditingController timePickerController;
  DateTime? date = DateTime.now();
  TimeOfDay? time = TimeOfDay.now();

  bool isPinned = false;
  List<String> staticColors = [
    "#FFC600",
    "#1D5FB8",
    "#ffa348",
    "#525252",
    "#C7C7CC",
    "#CA6F1E",
    '#CBF6FF',
    "#B3ED9728",
    "#ffa6c4",
    "#1ecdc4",
    "#FFF6DB",
    "#1ecdc4",
    "#7eccff",
  ];
  late int selectedIndex;

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
    selectedIndex = staticColors.indexWhere((String staticColor) =>
        (Get.arguments[0] as Note).backgroundColor == staticColor);
    titleTextEditingController = TextEditingController();
    contentTextEditingController = TextEditingController();
    datePickerController = TextEditingController();
    timePickerController = TextEditingController();
    titleTextEditingController.text = (Get.arguments[0] as Note).title!;
    contentTextEditingController.text = (Get.arguments[0] as Note).content;
    super.onInit();
  }

  void changeDate(DateTime? date) {
    this.date = date;
    update();
  }

  void changeTime(TimeOfDay? time) {
    this.time = time;
    update();
  }

  @override
  void onClose() {
    titleTextEditingController.dispose();
    contentTextEditingController.dispose();
    datePickerController.dispose();
    timePickerController.dispose();
  }
}

enum ScreenVisitingType { addNote, editNote }
