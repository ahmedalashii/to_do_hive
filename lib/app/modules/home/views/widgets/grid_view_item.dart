import 'package:intl/intl.dart';
import 'package:to_do_hive/app/core/helper_functions.dart';
import 'package:to_do_hive/app/modules/single_note/controllers/single_note_controller.dart';
import '../../../../../constants/exports.dart';
import '../../../../data/models/note.dart';
import '../../../../routes/app_pages.dart';
import '../../controllers/home_controller.dart';

class GridViewItem extends GetView<HomeController> {
  const GridViewItem({
    Key? key,
    required this.note,
  }) : super(key: key);

  final Note note;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          Routes.SINGLE_NOTE,
          arguments: [
            note,
            ScreenVisitingType.editNote,
          ],
        );
      },
      child: Container(
        padding: EdgeInsets.all(15.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: HexColor.fromHex(note.backgroundColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (note.title != null)
                        ? PrimaryText(
                            note.title ?? "",
                            fontSize: 20,
                            fontWeight: FontWeightManager.regular,
                          )
                        : const SizedBox(),
                    PopupMenuButton<String>(
                      elevation: 5,
                      position: PopupMenuPosition.under,
                      onSelected: (String value) {
                        if (value == "delete") {
                          controller.removeNote(note);
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: "delete",
                          child: PrimaryText(
                            "Delete",
                            fontSize: 20,
                            color: ColorManager.black,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                PrimaryText(
                  note.content,
                  fontSize: 17,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2.5.w, horizontal: 6.w),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.5,
                  color: ColorManager.darkGrey,
                ),
                borderRadius: BorderRadius.circular(5.h),
              ),
              child: PrimaryText(
                "${DateFormat("EEEE").format(note.remindingDate)}, ${formatTimeOfDay(note.remindingDate)}",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
