import 'package:to_do_hive/global_presentation/global_widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global_features/color_manager.dart';
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

  const PrimaryTextField({
    Key? key,
    this.hintText,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.onTap,
    this.readOnly = false,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.multiLines = false,
    this.textInputAction = TextInputAction.none,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle hintStyle = TextStyle(color: ColorManager.grey, fontSize: 14.sp);
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
              suffixIcon: suffixIcon,
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
                  : OutlineInputBorder(borderRadius: BorderRadius.circular(8),),
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
