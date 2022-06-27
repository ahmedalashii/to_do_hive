import '../../../../../constants/exports.dart';
import '../../controllers/single_note_controller.dart';

class ConvexAnimatedBottomNavBar extends GetView<SingleNoteController> {
  const ConvexAnimatedBottomNavBar({
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
            offset: const Offset(-2, 2),
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
          elevation: 50,
          color: ColorManager.white.withOpacity(0.9),
          child: Container(
            padding: EdgeInsets.only(bottom: 20.h, top: 52.h),
            height: 120.h,
            child: ListView.builder(
              itemCount: controller.staticColors.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    controller.selectColor(index);
                  },
                  child: GetBuilder<SingleNoteController>(
                      builder: (SingleNoteController controller) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      width: 45.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: (controller.selectedIndex == index)
                            ? ColorManager.transparent
                            : HexColor.fromHex(controller.staticColors[index]),
                        borderRadius: BorderRadius.circular(10.w),
                        border: (controller.selectedIndex == index)
                            ? Border.all(color: ColorManager.grey, width: 1)
                            : null,
                      ),
                      child: Visibility(
                        visible: controller.selectedIndex == index,
                        child: Center(
                          child: Icon(
                            Icons.check_rounded,
                            color: ColorManager.darkGrey,
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
