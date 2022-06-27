import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import '../../constants/exports.dart';
import '../../app/modules/home/controllers/home_controller.dart';

class CustomNavigationBar extends GetView<HomeController> {
  const CustomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (HomeController controller) {
        return AnimatedBottomNavigationBar(
          backgroundColor: ColorManager.white.withOpacity(0.9),
          notchMargin: 7.h,
          height: 50.h,
          icons: const [
            Icons.menu_rounded,
            Icons.search_rounded,
          ],
          inactiveColor: ColorManager.darkGrey,
          iconSize: 30,
          activeIndex: controller.bottomNavigationBarIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.sharpEdge,
          leftCornerRadius: 32.w,
          rightCornerRadius: 32.w,
          onTap: (int index) =>
              controller.changeBottomNavigationBarIndex(index),
        );
      },
    );
  }
}
