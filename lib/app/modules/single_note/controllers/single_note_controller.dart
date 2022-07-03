import 'package:to_do_hive/constants/exports.dart';

import '../../../core/helper_functions.dart';
import '../../../data/models/note.dart';
import '../../../routes/app_pages.dart';
import '../../home/controllers/home_controller.dart';

class SingleNoteController extends GetxController {
  late TextEditingController titleTextEditingController;
  late TextEditingController contentTextEditingController;
  // Dialog TextFields:
  late TextEditingController datePickerController;
  late TextEditingController timePickerController;
  Rx<DateTime>? dateAndTime = DateTime.now().obs;
  bool isPinned = (Get.arguments[0] as Note).isPinned;
  final HomeController homeController = Get.find();

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
    dateAndTime!.value = (Get.arguments[0] as Note).remindingDate;
    super.onInit();
  }

  void changeDate(DateTime? dateAndTime) {
    this.dateAndTime!.value = dateAndTime!;
    update();
  }

  void saveDate() {
    (Get.arguments[0] as Note).remindingDate = dateAndTime!.value;
    update();
  }

  @override
  void onClose() {
    titleTextEditingController.dispose();
    contentTextEditingController.dispose();
    datePickerController.dispose();
    timePickerController.dispose();
  }

  String afterWhat() {
    String? formatedDate = formatTimeOfDay(dateAndTime!.value);
    if (dateAndTime!.value
            .difference(DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day))
            .inDays >
        0) {
      return "At $formatedDate";
    } else if (dateAndTime!.value
            .difference(DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day))
            .inDays ==
        0) {
      if ((dateAndTime!.value.hour - DateTime.now().hour) > 0) {
        return "After ${dateAndTime!.value.hour - DateTime.now().hour} Hrs & ${dateAndTime!.value.minute} Mins.";
      } else if ((dateAndTime!.value.hour - DateTime.now().hour) == 0) {
        if (dateAndTime!.value.minute - DateTime.now().minute > 0) {
          return "After ${dateAndTime!.value.minute - DateTime.now().minute} Mins.";
        } else {
          return "Reminded";
        }
      } else {
        return "Reminded";
      }
    } else {
      return "Reminded";
    }
  }

  Future<void> savingNote() async {
    debugPrint((Get.arguments == null).toString());
    Note note = Get.arguments[0] as Note;
    note.title = titleTextEditingController.text;
    note.content = contentTextEditingController.text;
    note.backgroundColor = staticColors[selectedIndex];
    note.remindingDate = dateAndTime!.value;
    bool isSucceed = await homeController.addOrUpdate(note);
    if (isSucceed) {
      String message = (Get.arguments != null)
          ? (Get.arguments[1] == ScreenVisitingType.addNote)
              ? "Saved Succesfully"
              : "Edited Succesfully"
          : "Saved Succesfully";
      Get.showSnackbar(GetSnackBar(
        message: message,
        duration: const Duration(seconds: 1),
      ));
      Get.offNamed(Routes.HOME);
    } else {
      Get.showSnackbar(const GetSnackBar(
        message:
            "You can't save a note that doesn't contain both subject and content!",
        duration: Duration(seconds: 2),
      ));
    }
  }
}

enum ScreenVisitingType { addNote, editNote }
