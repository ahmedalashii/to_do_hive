import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/single_note/bindings/single_note_binding.dart';
import '../modules/single_note/views/single_note_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SINGLE_NOTE,
      page: () => SingleNoteView(),
      binding: SingleNoteBinding(),
    ),
  ];
}
