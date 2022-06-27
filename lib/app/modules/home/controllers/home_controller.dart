import 'package:to_do_hive/constants/exports.dart';

import '../../../data/models/note.dart';

class HomeController extends GetxController {
  int bottomNavigationBarIndex = 0;
  List<Note> notes = [
    Note(
      title: "Coffee",
      content: "Contentaa,ldkaskdas;lda;'sdasdasd",
      createdDate: DateTime(2022, 10, 18, 4, 30),
      backgroundColor: ColorManager.darkOrange,
    ),
    Note(
      title: "Title",
      content:
          "Contentaa,ldkaskdas;lda;'sdasdasd Contentaa,ldkaskdas;lda;'sdasdasdContentaa,ldkaskdas;lda;'sdasdasdContentaa,ldkaskdas;lda;'sdasdasdContentaa,ldkaskdas;lda;'sdasdasdContentaa,ldkaskdas;lda;'sdasdasdContentaa,ldkaskdas;lda;'sdasdasd",
      createdDate: DateTime(2022, 10, 18, 4, 30),
      backgroundColor: ColorManager.pink,
    ),
    Note(
      title: "Title",
      content: "Contentaa,ldkaskdas;lda;'sdasdasd",
      createdDate: DateTime(2022, 10, 18, 4, 30),
      backgroundColor: ColorManager.lightGreen,
    ),
    Note(
      content: "Contentaa,ldkaskdas;lda;'sdasdasd",
      createdDate: DateTime(2022, 10, 18, 4, 30),
      backgroundColor: ColorManager.lightBlue,
    ),
  ];

  void changeBottomNavigationBarIndex(int index) {
    bottomNavigationBarIndex = index;
    update();
  }

  @override
  void onClose() {}
}
