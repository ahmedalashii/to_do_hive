import 'package:get/get.dart';

import '../controllers/single_note_controller.dart';

class SingleNoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SingleNoteController>(SingleNoteController(), permanent: true);
  }
}
