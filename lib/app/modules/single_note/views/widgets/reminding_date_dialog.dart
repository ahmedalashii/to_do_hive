import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../../../../constants/exports.dart';
import '../../controllers/single_note_controller.dart';

class RemindingDateDialogContent extends GetView<SingleNoteController> {
  const RemindingDateDialogContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PrimaryText(
            "When to remind?",
            fontSize: 25,
            fontWeight: FontWeightManager.regular,
          ),
          SizedBox(height: 5.h),
          Obx(() {
            return PrimaryTextField(
              controller: controller.datePickerController,
              readOnly: true,
              filled: true,
              filledColor: ColorManager.grey.withOpacity(0.3),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: ColorManager.transparent,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: ColorManager.transparent,
                ),
              ),
              hintText:
                  "${DateFormat("EEEE").format(controller.dateAndTime!.value)}, ${controller.afterWhat()}",
              title: "",
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.date_range_rounded,
                  color: ColorManager.textColor,
                ),
                onPressed: () async {
                  Get.bottomSheet(
                    SizedBox(
                      height: 200.h,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.dateAndTime,
                        initialDateTime: controller.dateAndTime!.value,
                        onDateTimeChanged: (DateTime date) {
                          controller.changeDate(date);
                        },
                      ),
                    ),
                    backgroundColor: ColorManager.white,
                  );
                },
              ),
            );
          }),
          SizedBox(height: 25.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  width: 100.w,
                  padding:
                      EdgeInsets.symmetric(vertical: 7.h, horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: ColorManager.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: PrimaryText(
                    "Cancel",
                    fontSize: 20,
                    textAlign: TextAlign.center,
                    color: ColorManager.textColor,
                    fontWeight: FontWeightManager.regular,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.saveDate();
                },
                child: Container(
                  width: 100.w,
                  padding:
                      EdgeInsets.symmetric(vertical: 7.h, horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: ColorManager.darkOrange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: PrimaryText(
                    "Save",
                    color: ColorManager.textColor,
                    fontSize: 20,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeightManager.regular,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
