import 'package:to_do_hive/app/modules/home/controllers/home_controller.dart';
import 'package:to_do_hive/app/modules/single_note/views/widgets/animated_botton_nav_bar.dart';
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
                                child: Icon(
                                    ((Get.arguments[0] as Note).isPinned ==
                                            false)
                                        ? Icons.push_pin_outlined
                                        : Icons.push_pin_rounded),
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

  Future<void> savingNote(SingleNoteController controller) async {
    Note note = Get.arguments[0] as Note;
    note.title = controller.titleTextEditingController.text;
    note.content = controller.contentTextEditingController.text;
    note.backgroundColor = controller.staticColors[controller.selectedIndex];
    bool isSucceed = await homeController.addOrUpdate(note);
    if (isSucceed) {
      Get.back();
      Get.showSnackbar(GetSnackBar(
        message: (Get.arguments[1] == ScreenVisitingType.addNote)
            ? "Saved Succesfully"
            : "Editedxx Succesfully",
        duration: const Duration(seconds: 1),
      ));
    } else {
      Get.showSnackbar(const GetSnackBar(
        message:
            "You can't save a note that doesn't contain both subject and content!",
        duration: Duration(seconds: 2),
      ));
    }
  }
}
