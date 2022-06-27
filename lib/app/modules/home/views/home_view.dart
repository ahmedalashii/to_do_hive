import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:to_do_hive/app/modules/home/views/widgets/animated_botton_nav_bar.dart';
import 'package:to_do_hive/app/routes/app_pages.dart';
import 'package:to_do_hive/constants/exports.dart';
import '../../../data/models/note.dart';
import '../../single_note/controllers/single_note_controller.dart';
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
            GetBuilder<HomeController>(builder: (HomeController controller) {
              return Align(
                alignment: AlignmentDirectional.topStart,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: 10.w, left: 10.w, top: 10.h, bottom: 120.h),
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
                        ((controller.notes.firstWhereOrNull(
                                    (Note note) => note.isPinned == true))) !=
                                null
                            ? MasonryGridView.count(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                mainAxisSpacing: 10.h,
                                crossAxisSpacing: 10.w,
                                itemCount: controller.notes.length,
                                itemBuilder: (BuildContext context, int index) {
                                  if (controller.notes[index].isPinned ==
                                      true) {
                                    return GridViewItem(
                                        note: controller.notes[index]);
                                  }
                                  return Container();
                                },
                              )
                            : emptyNotesList(
                                title: "You don't have any pinned note yet!"),
                        SizedBox(height: 10.h),
                        PrimaryText(
                          "Upcoming",
                          color: ColorManager.grey2,
                          fontSize: 18,
                        ),
                        SizedBox(height: 10.h),
                        ((controller.notes.firstWhereOrNull(
                                    (Note note) => note.isPinned == false))) !=
                                null
                            ? MasonryGridView.count(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                mainAxisSpacing: 10.h,
                                crossAxisSpacing: 10.w,
                                itemCount: controller.notes.length,
                                itemBuilder: (BuildContext context, int index) {
                                  if (controller.notes[index].isPinned ==
                                      false) {
                                    return GridViewItem(
                                        note: controller.notes[index]);
                                  } else {
                                    return const SizedBox();
                                  }
                                },
                              )
                            : emptyNotesList(
                                title: "You don't have any upcoming note yet!"),
                      ],
                    ),
                  ),
                ),
              );
            }),
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

  Padding emptyNotesList({required String title}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Center(
        child: PrimaryText(title, fontSize: 18),
      ),
    );
  }

  Widget? floatingActionButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 80.h),
      child: FloatingActionButton(
        onPressed: () {
          Get.toNamed(
            Routes.SINGLE_NOTE,
            arguments: [
              Note(
                title: "",
                content: "",
                backgroundColor: "#7eccff",
                createdDate: DateTime.now(),
              ),
              ScreenVisitingType.addNote,
            ],
          );
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