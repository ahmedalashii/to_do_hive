import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:to_do_hive/app/modules/home/controllers/home_controller.dart';
import 'package:to_do_hive/app/modules/single_note/views/widgets/animated_botton_nav_bar.dart';
import 'package:to_do_hive/app/routes/app_pages.dart';
import 'package:to_do_hive/constants/exports.dart';
import '../../../data/models/note.dart';
import '../controllers/single_note_controller.dart';

class SingleNoteView extends GetView<SingleNoteController> {
  SingleNoteView({Key? key}) : super(key: key);

  final HomeController homeController = Get.find();

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
            await savingNote(controller);
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
                            savingNote(controller);
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back_rounded),
                        ),
                        const Spacer(),
                        GetBuilder<SingleNoteController>(
                            builder: (SingleNoteController controller) {
                          return Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.pin();
                                },
                                child: (Get.arguments != null)
                                    ? Icon(
                                        ((Get.arguments[0] as Note).isPinned ==
                                                false)
                                            ? Icons.push_pin_outlined
                                            : Icons.push_pin_rounded)
                                    : const Icon(Icons.push_pin_outlined),
                              ),
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
                                      content: SizedBox(
                                        width: Get.width,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const PrimaryText(
                                              "When to remind?",
                                              fontSize: 25,
                                              fontWeight:
                                                  FontWeightManager.regular,
                                            ),
                                            SizedBox(height: 5.h),
                                            PrimaryTextField(
                                              controller: controller
                                                  .datePickerController,
                                              readOnly: true,
                                              filled: true,
                                              filledColor: ColorManager.grey
                                                  .withOpacity(0.3),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color:
                                                      ColorManager.transparent,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color:
                                                      ColorManager.transparent,
                                                ),
                                              ),
                                              hintText: DateFormat("EEEE")
                                                  .format(controller.date!),
                                              title: "",
                                              suffixIcon: IconButton(
                                                icon: Icon(
                                                  Icons.date_range_rounded,
                                                  color: ColorManager.textColor,
                                                ),
                                                onPressed: () async {
                                                  DateTime? tempDate =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate:
                                                        controller.date!,
                                                    firstDate: DateTime(2022),
                                                    lastDate: DateTime(2100),
                                                  );
                                                  controller
                                                      .changeDate(tempDate);
                                                },
                                              ),
                                            ),
                                            PrimaryTextField(
                                              controller: controller
                                                  .timePickerController,
                                              readOnly: true,
                                              filled: true,
                                              filledColor: ColorManager.grey
                                                  .withOpacity(0.3),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color:
                                                      ColorManager.transparent,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color:
                                                      ColorManager.transparent,
                                                ),
                                              ),
                                              hintText: afterWhat(controller),
                                              title: "",
                                              suffixIcon: IconButton(
                                                icon: Icon(
                                                  Icons.access_time_rounded,
                                                  color: ColorManager.textColor,
                                                ),
                                                onPressed: () async {
                                                  TimeOfDay? tempTime =
                                                      await showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        controller.time!,
                                                  );
                                                  controller
                                                      .changeTime(tempTime!);
                                                },
                                              ),
                                            ),
                                            SizedBox(height: 25.h),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                GestureDetector(
                                                  onTap: () => Get.back(),
                                                  child: Container(
                                                    width: 100.w,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 7.h,
                                                            horizontal: 10.w),
                                                    decoration: BoxDecoration(
                                                      color: ColorManager
                                                          .transparent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: PrimaryText(
                                                      "Cancel",
                                                      fontSize: 20,
                                                      textAlign:
                                                          TextAlign.center,
                                                      color: ColorManager
                                                          .textColor,
                                                      fontWeight:
                                                          FontWeightManager
                                                              .regular,
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    width: 100.w,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 7.h,
                                                            horizontal: 10.w),
                                                    decoration: BoxDecoration(
                                                      color: ColorManager
                                                          .darkOrange,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: PrimaryText(
                                                      "Save",
                                                      color: ColorManager
                                                          .textColor,
                                                      fontSize: 20,
                                                      textAlign:
                                                          TextAlign.center,
                                                      fontWeight:
                                                          FontWeightManager
                                                              .regular,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
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
                                      controller.contentTextEditingController
                                          .text.isNotEmpty;
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
                                                    "Title: ${controller.titleTextEditingController.text}\nContent: ${controller.contentTextEditingController.text}\nBackgroundColor: ${(Get.arguments![0] as Note).backgroundColor}\nisPinned: ${(Get.arguments![0] as Note).isPinned}\nReminder Time: ${controller.date!.year}/${controller.date!.month}/${controller.date!.day} At ${controller.time!.hour}:${controller.time!.minute} ${controller.time!.period.toString().split("DayPeriod.")[1]}",
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
                          );
                        }),
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

  String afterWhat(SingleNoteController controller) {
    if (controller.date!.weekday == DateTime.now().weekday) {
      if (controller.time!.hour != TimeOfDay.now().hour) {
        if ((controller.time!.hour - TimeOfDay.now().hour) < 0) {
          return "Reminded";
        } else if ((controller.time!.hour - TimeOfDay.now().hour) == 0) {
          return "After ${controller.time!.minute} Mins.";
        } else {
          return "After ${controller.time!.hour - TimeOfDay.now().hour} Hrs & ${controller.time!.minute} Mins.";
        }
      } else {
        if (controller.time!.minute - TimeOfDay.now().minute > 0) {
          return "After ${controller.time!.minute - TimeOfDay.now().minute} Mins.";
        } else {
          return "Reminded";
        }
      }
    } else {
      return "At ${controller.time!.hour}:${controller.time!.minute} ${controller.time!.period.toString().split("DayPeriod.")[1]}";
    }
  }

  Future<void> savingNote(SingleNoteController controller) async {
    Note note = Get.arguments[0] as Note;
    note.title = controller.titleTextEditingController.text;
    note.content = controller.contentTextEditingController.text;
    note.backgroundColor = controller.staticColors[controller.selectedIndex];
    bool isSucceed = await homeController.addOrUpdate(note);
    if (isSucceed) {
      String message = (Get.arguments != null)
          ? (Get.arguments[1] == ScreenVisitingType.addNote)
              ? "Saved Succesfully"
              : "Edited Succesfully"
          : "Saved Succesfully";
      Get.showSnackbar(GetSnackBar(
        message: message,
        duration: const Duration(seconds: 1),
      ));
      Get.offNamed(Routes.HOME);
    } else {
      Get.showSnackbar(const GetSnackBar(
        message:
            "You can't save a note that doesn't contain both subject and content!",
        duration: Duration(seconds: 2),
      ));
    }
  }
}
