import 'package:to_do_hive/app/modules/single_note/views/widgets/animation_curved_bottom_nav_bar.dart';
import 'package:to_do_hive/constants/exports.dart';
import '../../../data/models/note.dart';
import '../controllers/single_note_controller.dart';

class SingleNoteView extends GetView<SingleNoteController> {
  const SingleNoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(vertical: 95.h),
        child: FloatingActionButton(
          onPressed: () {
            controller.addNote(Get.arguments as Note);
            Get.back();
          },
          focusColor: ColorManager.transparent,
          splashColor: ColorManager.transparent,
          backgroundColor: ColorManager.white,
          child: Icon(
            Icons.check_rounded,
            color: ColorManager.accent,
            size: 45,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              clipBehavior: Clip.none,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(Icons.arrow_back_rounded),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Icon(Icons.push_pin_outlined),
                            ),
                            SizedBox(width: 10.w),
                            InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.notifications_none_rounded,
                                size: 25,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            InkWell(
                              onTap: () {},
                              child: const Icon(Icons.qr_code_rounded),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    TextField(
                      onChanged: (String? value) {},
                      controller: controller.titleTextEditingController,
                      style: TextStyle(
                        color: ColorManager.textColor,
                        decoration: TextDecoration.none,
                        fontSize: 30,
                        fontWeight: FontWeightManager.bold,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                    TextField(
                      controller: controller.contentTextEditingController,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: ColorManager.textColor,
                        fontSize: 20,
                      ),
                      maxLines: 100,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
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
}