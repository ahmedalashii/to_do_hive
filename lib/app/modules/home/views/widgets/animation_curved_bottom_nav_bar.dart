import '../../../../../constants/exports.dart';
import '../../controllers/home_controller.dart';

class ConvexAnimatedBottomNavBar extends GetView<HomeController> {
  const ConvexAnimatedBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(30),
        topLeft: Radius.circular(30),
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 7.h,
        elevation: 50,
        color: ColorManager.white.withOpacity(0.85),
        child: Container(
          padding: EdgeInsets.only(bottom: 30.h, top: 40.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.menu_rounded),
                Icon(Icons.search_rounded),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
