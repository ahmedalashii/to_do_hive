import 'package:to_do_hive/app/modules/single_note/controllers/single_note_controller.dart';
import 'package:to_do_hive/constants/exports.dart';

import '../../../data/models/note.dart';

class HomeController extends GetxController {
  int bottomNavigationBarIndex = 0;
  late Box<Note> notesBox;
  int noOfCreatedNotes = 0;

  List<Note> notes = [];

  void changeBottomNavigationBarIndex(int index) {
    bottomNavigationBarIndex = index;
    update();
  }

  Future<bool> addOrUpdate(Note note) async {
    // this method will return whether the adding/updating process is completely succeed or not.
    if (((note.title == null || note.title!.isEmpty) && note.content.isEmpty) ||
        Get.arguments == null) {
      return false;
    } else {
      if (Get.arguments[1] == ScreenVisitingType.addNote) {
        notes.add(note);
      } else {
        notes[notes.indexWhere((Note tempNote) => tempNote.id == note.id)] =
            note;
      }
      await notesBox.put(note.id, note);
      update();
      return true;
    }
  }

  void removeNote(Note note) {
    notesBox.delete(note.id);
    notes.remove(note);
    Get.showSnackbar(const GetSnackBar(
      message:
          "Note has been deleted Succesfully!",
      duration: Duration(seconds: 2),
    ));
    update();
  }

  // Single Responsibility Method ..
  void initNotes() {
    for (int index = 0; index < notesBox.values.length; index++) {
      debugPrint(notesBox.getAt(index)!.title);
      debugPrint(notesBox.getAt(index)!.isPinned.toString());
      notes.add(notesBox.getAt(index)!);
    }
    update();
  }

  @override
  void onInit() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NoteAdapter());
    notesBox = await Hive.openBox<Note>("notesBox");
    noOfCreatedNotes = notesBox.length;
    // await clearBox(notesBox);
    initNotes();
    super.onInit();
  }

  // Single Responsibility Method ..
  Future<void> clearBox(Box box) async {
    await box.clear();
    update();
  }

  @override
  void onClose() {}
}
