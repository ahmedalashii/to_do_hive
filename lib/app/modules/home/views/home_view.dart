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
              List<Note> pinnedNotes = [];
              List<Note> upcomingNotes = [];
              for (Note note in controller.notes) {
                if (note.isPinned) {
                  pinnedNotes.add(note);
                } else {
                  upcomingNotes.add(note);
                }
              }
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
                                itemCount: pinnedNotes.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GridViewItem(note: pinnedNotes[index]);
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
                                itemCount: upcomingNotes.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GridViewItem(
                                      note: upcomingNotes[index]);
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
      padding: EdgeInsets.symmetric(vertical: 75.h),
      child: FloatingActionButton(
        onPressed: () {
          Get.toNamed(
            Routes.SINGLE_NOTE,
            arguments: [
              Note(
                title: "",
                content: "",
                backgroundColor: "#7eccff",
                remindingDate: DateTime.now(),
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
