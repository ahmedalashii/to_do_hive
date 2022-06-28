import 'package:to_do_hive/constants/exports.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global_features/theme_manager.dart';

class PrimaryTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Function(String)? onFieldSubmitted;
  final bool readOnly;
  final bool? multiLines;
  final TextInputAction? textInputAction;
  final String title;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final bool filled;
  final Color? filledColor;

  
  const PrimaryTextField({
    Key? key,
    this.hintText,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.onTap,
    this.focusedBorder,
    this.enabledBorder,
    this.filled = false,
    this.filledColor,
    this.readOnly = false,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.multiLines = false,
    this.textInputAction = TextInputAction.none,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle hintStyle = TextStyle(color: ColorManager.grey, fontSize: 14.sp,fontWeight: FontWeightManager.medium);
    TextStyle style = TextStyle(
        color: isDarkMoodEnabled() ? Colors.white : ColorManager.fontColor);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryText(
          title,
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            color: isDarkMoodEnabled()
                ? ColorManager.darkAccent
                : ColorManager.white,
          ),
          child: TextFormField(
            controller: controller,
            readOnly: readOnly,
            textInputAction: textInputAction,
            maxLines: multiLines! ? 10 : 1,
            cursorColor: isDarkMoodEnabled()
                ? ColorManager.darkPrimary
                : ColorManager.fontColor,
            style: Get.locale!.languageCode == 'en'
                ? GoogleFonts.anekLatin(textStyle: style)
                : GoogleFonts.tajawal(
                    textStyle: style,
                  ),
            keyboardType: keyboardType,
            onTap: onTap ?? () {},
            onFieldSubmitted: onFieldSubmitted ?? (String value) {},
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              filled: filled,
              fillColor: filledColor,
              suffixIcon: suffixIcon,
              focusedBorder: focusedBorder ?? InputBorder.none,
              enabledBorder: enabledBorder ?? InputBorder.none,
              focusColor: ColorManager.primary,
              hoverColor: ColorManager.primary,
              hintText: hintText ?? "",
              hintStyle: Get.locale!.languageCode == 'en'
                  ? GoogleFonts.anekLatin(textStyle: hintStyle)
                  : GoogleFonts.tajawal(
                      textStyle: hintStyle,
                    ),
              border: isDarkMoodEnabled()
                  ? InputBorder.none
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            ),
            validator: validator ??
                (String? value) {
                  return null;
                },
          ),
        ),
      ],
    );
  }
}
