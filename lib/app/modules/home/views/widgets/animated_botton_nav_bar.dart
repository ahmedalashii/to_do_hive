import '../../../../../constants/exports.dart';
import '../../controllers/home_controller.dart';

class AnimatedBottomNavBar extends GetView<HomeController> {
  const AnimatedBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorManager.grey,
            blurRadius: 50,
            spreadRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10.h,
          elevation: 0,
          color: ColorManager.white.withOpacity(0.85),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            padding: EdgeInsets.only(bottom: 15.h, top: 40.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.menu_rounded, size: 30),
                  Icon(Icons.search_rounded, size: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
