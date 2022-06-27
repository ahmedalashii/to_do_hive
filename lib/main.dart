import 'app/routes/app_pages.dart';
import 'constants/exports.dart';

late Box box;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // box = await Hive.openBox("box");
  // Hive.registerAdapter(NoteAdapter());
  // box.put(
  //     "note",
  //     Note(
  //         content: "ads", createdDate: DateTime(2022, 10, 18), title: "asd  "));
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "To Do List App",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          locale: const Locale("en"),
        );
      },
    ),
  );
}
