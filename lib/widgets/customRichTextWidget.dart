import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/utils/theme.dart';

class CustomRichTextWidget extends StatelessWidget {
  bool? underline;
  bool? mandatory;
  String? text;
  String? text1;
  String? text3;
  int? maxLines, fontSize;
  Color? textColor2;
  FontWeight? fontWeight;
  Color? textColor;
  Color? underlinceColor;
  FontWeight? fontWeight2;
  TextStyle? customMiddleTextStyle;
  Color? firstTextColor;

  CustomRichTextWidget(
      {Key? key,
      this.firstTextColor,
      this.customMiddleTextStyle,
      this.fontWeight2,
      this.textColor2,
      this.underlinceColor,
      this.text1,
      required this.text,
      this.text3,
      this.maxLines,
      this.mandatory,
      this.fontSize,
      this.textColor,
      this.fontWeight,
      this.underline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      // text ?? "",
      textAlign: TextAlign.center,
      TextSpan(children: <InlineSpan>[
        TextSpan(
          text: text1,
          style: TextStyle(
              fontSize: fontSize == null ? 16.0 : fontSize! * 1.00,
              color: firstTextColor ??
                  textColor ??
                  const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
              // shadows: [
              //   Shadow(
              //       offset: Offset(0, -3),
              //       color: textColor ?? ThemeConstants.blackcolor)
              // ],
              // decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
              decorationColor: underlinceColor ?? ThemeConstants.blackcolor,
              decorationThickness: 4),
        ),
        TextSpan(
          text: text,
          style: customMiddleTextStyle ??
              GoogleFonts.montserrat(
                  fontWeight: fontWeight2 ?? FontWeight.w600,
                  color: textColor2 ?? ThemeConstants.bluecolor,

                  // shadows: [
                  //   Shadow(
                  //       offset: Offset(0, -3),
                  //       color: textColor ?? ThemeConstants.blackcolor)
                  // ],
                  fontSize: fontSize == null ? 16.0 : fontSize! * 1.00,
                  // decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationColor: Colors.transparent,
                  decorationThickness: 4
                  // decoration: TextDecoration.underline,

                  //   decoration: underline != null
                  //       ? underline == true
                  //           ? TextDecoration.underline
                  //           : TextDecoration.none
                  //       : TextDecoration.none,
                  ),
        ),
        TextSpan(
          text: text3,
          style: GoogleFonts.montserrat(
              fontWeight: fontWeight ?? FontWeight.w600,
              color: ThemeConstants.blackcolor,
              // shadows: [
              //   Shadow(
              //       offset: Offset(0, -3),
              //       color: textColor ?? ThemeConstants.blackcolor)
              // ],
              fontSize: fontSize == null ? 16.0 : fontSize! * 1.00,
              // decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
              decorationColor: Colors.transparent,
              decorationThickness: 4
              // decoration: TextDecoration.underline,

              //   decoration: underline != null
              //       ? underline == true
              //           ? TextDecoration.underline
              //           : TextDecoration.none
              //       : TextDecoration.none,
              ),
        ),
        if (mandatory == true)
          const TextSpan(text: '*', style: TextStyle(color: Colors.red))
      ]),

      maxLines: maxLines ?? 100000,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.montserrat(
        fontWeight: fontWeight ?? FontWeight.w600,
        color: textColor ?? Colors.black,
        fontSize: fontSize == null ? 16.0 : fontSize! * 1.00,
        // decoration: TextDecoration.underline,

        //   decoration: underline != null
        //       ? underline == true
        //           ? TextDecoration.underline
        //           : TextDecoration.none
        //       : TextDecoration.none,
      ),

      // GoogleFonts.monster(
      //   fontWeight: fontWeight ?? FontWeight.w500,
      //   fontSize: fontSize == null ? 16.0 : fontSize! * 1.00,
      // ),
    );
  }
}
