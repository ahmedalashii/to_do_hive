import 'package:to_do_hive/constants/exports.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global_features/theme_manager.dart';

class PrimaryText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int maxLines;
  final bool lineThrow;
  final double height;

  const PrimaryText(
    this.text, {
    Key? key,
    this.fontSize = 15,
    this.color,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.visible,
    this.maxLines = 5,
    this.lineThrow = false,
    this.height = 1.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
      color: !isDarkMoodEnabled()
          ? (color ?? ColorManager.textColor)
          : ColorManager.white,
      fontSize: (fontSize - 2).sp,
      fontWeight: fontWeight,
      height: height,
      decoration: lineThrow ? TextDecoration.lineThrough : TextDecoration.none,
    );
    return Text(text.tr,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        textDirection: TextDirection.ltr,
        style: Get.locale!.languageCode == 'en'
            ? GoogleFonts.anekLatin(textStyle: style)
            : GoogleFonts.tajawal(
                textStyle: style,
              ));
  }
}
