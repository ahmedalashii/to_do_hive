import 'package:qr_flutter/qr_flutter.dart';
import 'package:to_do_hive/app/modules/single_note/views/widgets/animated_botton_nav_bar.dart';
import 'package:to_do_hive/constants/exports.dart';
import '../../../core/helper_functions.dart';
import '../../../data/models/note.dart';
import '../controllers/single_note_controller.dart';
import 'widgets/reminding_date_dialog.dart';

// ignore: must_be_immutable
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
          onPressed: () async {
            await controller.savingNote();
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
                          onPressed: () {
                            controller.savingNote();
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back_rounded),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            GetBuilder<SingleNoteController>(
                                builder: (SingleNoteController controller) {
                              return InkWell(
                                onTap: () {
                                  controller.pin();
                                },
                                child: (Get.arguments != null)
                                    ? Icon((controller.isPinned == false)
                                        ? Icons.push_pin_outlined
                                        : Icons.push_pin_rounded)
                                    : const Icon(Icons.push_pin_outlined),
                              );
                            }),
                            SizedBox(width: 10.w),
                            GetBuilder<SingleNoteController>(
                                builder: (SingleNoteController controller) {
                              return InkWell(
                                onTap: () {
                                  Get.defaultDialog(
                                    title: "",
                                    titleStyle: const TextStyle(fontSize: 0),
                                    middleText: "",
                                    middleTextStyle:
                                        const TextStyle(fontSize: 0),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 20.w),
                                    content: const RemindingDateDialogContent(),
                                  );
                                },
                                child: const Icon(
                                  Icons.notifications_none_rounded,
                                  size: 25,
                                ),
                              );
                            }),
                            SizedBox(width: 10.w),
                            InkWell(
                              onTap: () {
                                bool isValidNote = controller
                                        .titleTextEditingController
                                        .text
                                        .isNotEmpty ||
                                    controller.contentTextEditingController.text
                                        .isNotEmpty;
                                Get.defaultDialog(
                                    title: "",
                                    titleStyle: const TextStyle(fontSize: 0),
                                    middleText: "",
                                    middleTextStyle:
                                        const TextStyle(fontSize: 0),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 20.w),
                                    content: SizedBox(
                                      width: Get.width,
                                      height: 300.h,
                                      child: (isValidNote)
                                          ? QrImage(
                                              data:
                                                  "Title: ${controller.titleTextEditingController.text}\nContent: ${controller.contentTextEditingController.text}\nBackgroundColor: ${(Get.arguments![0] as Note).backgroundColor}\nisPinned: ${(Get.arguments![0] as Note).isPinned}\nReminder Time: ${controller.dateAndTime!.value.year}/${controller.dateAndTime!.value.month}/${controller.dateAndTime!.value.day} At ${formatTimeOfDay((Get.arguments[0] as Note).remindingDate)}",
                                              version: QrVersions.auto,
                                              size: 300.h,
                                            )
                                          : const Center(
                                              child: PrimaryText(
                                                "You can't generate a QR code for a note that doesn't contain both subject and content! at least one of them must not be empty.",
                                                fontSize: 20,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                    ));
                              },
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
                        hintText: "Subject",
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
                        hintText: "Content",
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
              child: AnimatedBottomNavBar(),
            ),
          ],
        ),
      ),
    );
  }
}
