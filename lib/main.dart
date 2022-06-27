import 'app/routes/app_pages.dart';
import 'constants/exports.dart';

void main() {
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
