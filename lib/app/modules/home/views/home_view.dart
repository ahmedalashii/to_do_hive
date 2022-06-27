import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:to_do_hive/app/modules/home/views/widgets/animation_curved_bottom_nav_bar.dart';
import 'package:to_do_hive/constants/exports.dart';
import '../controllers/home_controller.dart';
import 'widgets/grid_view_item.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      floatingActionButton: floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          ImagesManager.imageAvatar,
                          width: 60.w,
                          height: 60.h,
                        ),
                      ],
                    ),
                    PrimaryText(
                      "Reminders",
                      color: ColorManager.textColor,
                      fontSize: 35,
                      fontWeight: FontWeightManager.medium,
                    ),
                    SizedBox(height: 10.h),
                    PrimaryText(
                      "Pinned",
                      color: ColorManager.grey2,
                      fontSize: 18,
                    ),
                    SizedBox(height: 10.h),
                    GetBuilder<HomeController>(
                      builder: (HomeController controller) {
                        return MasonryGridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.h,
                          crossAxisSpacing: 10.w,
                          itemCount: controller.notes.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GridViewItem(note: controller.notes[index]);
                          },
                        );
                      },
                    ),
                    SizedBox(height: 10.h),
                    PrimaryText(
                      "Upcoming",
                      color: ColorManager.grey2,
                      fontSize: 18,
                    ),
                    SizedBox(height: 10.h),
                    GetBuilder<HomeController>(
                      builder: (HomeController controller) {
                        return MasonryGridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.h,
                          crossAxisSpacing: 10.w,
                          itemCount: controller.notes.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GridViewItem(note: controller.notes[index]);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ConvexAnimatedBottomNavBar(),
            ),
          ],
        ),
      ),
    );
  }

  Widget? floatingActionButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50.h),
      child: FloatingActionButton(
        onPressed: () {
          // controller.addNote();
        },
        focusColor: ColorManager.transparent,
        splashColor: ColorManager.transparent,
        backgroundColor: ColorManager.white,
        child: Icon(
          Icons.add,
          color: ColorManager.accent,
          size: 45,
        ),
      ),
    );
  }
}
