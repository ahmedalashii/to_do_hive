import 'package:to_do_hive/constants/exports.dart';

AppBar globalAppBar({String? title, List<Widget>? actions,Widget? leading}) {
  return AppBar(
    backgroundColor: (Get.isDarkMode) ? ColorManager.scaffoldDarkColor: ColorManager.white,
    centerTitle: false,
    elevation: 0,
    title: title != null
        ? PrimaryText(
            title,
            fontSize: 24,
            color: ColorManager.black.withOpacity(0.7),
            fontWeight: FontWeightManager.medium,
          )
        : const SizedBox(),
    leading: leading ?? InkWell(
      onTap: () {
        Get.back();
      },
      child: Icon(
        Icons.arrow_back_rounded,
        color: (Get.isDarkMode) ? ColorManager.white: ColorManager.black.withOpacity(0.7) ,
        size: 30.w,
      ),
    ),
    actions: actions ?? [],
  );
}
