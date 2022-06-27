import 'package:to_do_hive/constants/exports.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global_features/theme_manager.dart';

class PasswordTextField extends StatefulWidget {
  final String? hintText;
  final String? title;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final Function(String)? onFieldSubmitted;

  const PasswordTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.validator,
      this.onFieldSubmitted,
      this.title})
      : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    TextStyle hintStyle = TextStyle(color: ColorManager.grey, fontSize: 14.sp);
    TextStyle style = TextStyle(
        color: isDarkMoodEnabled() ? Colors.white : ColorManager.fontColor);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryText(
          widget.title ?? "",
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
            controller: widget.controller,
            cursorColor: isDarkMoodEnabled()
                ? ColorManager.darkPrimary
                : ColorManager.fontColor,
            style: Get.locale!.languageCode == 'en'
                ? GoogleFonts.poppins(textStyle: style)
                : GoogleFonts.tajawal(
                    textStyle: style,
                  ),
            keyboardType: TextInputType.visiblePassword,
            obscureText: !visiblePassword,
            onFieldSubmitted: widget.onFieldSubmitted ?? (v) {},
            decoration: InputDecoration(
              focusColor: ColorManager.primary,
              hoverColor: ColorManager.primary,
              hintStyle: Get.locale!.languageCode == 'en'
                  ? GoogleFonts.poppins(textStyle: hintStyle)
                  : GoogleFonts.tajawal(
                      textStyle: hintStyle,
                    ),
              border: isDarkMoodEnabled()
                  ? InputBorder.none
                  : OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              prefixIcon: Icon(
                Icons.lock_outline,
                color: ColorManager.grey,
                size: 23.w,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    visiblePassword = !visiblePassword;
                  });
                },
                icon: visiblePassword
                    ? Icon(
                        Icons.visibility_off,
                        color: ColorManager.grey,
                      )
                    : Icon(
                        Icons.visibility,
                        color: ColorManager.grey,
                      ),
              ),
              hintText: widget.hintText!.isNotEmpty ? widget.hintText!.tr : '',
            ),
            validator: widget.validator,
          ),
        ),
      ],
    );
  }
}
