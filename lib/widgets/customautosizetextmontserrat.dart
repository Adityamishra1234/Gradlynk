import 'package:auto_size_text/auto_size_text.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAutoSizeTextMontserrat extends StatelessWidget {
  bool? underline;
  bool? mandatory;
  String? text;
  int? maxLines, fontSize;
  FontWeight? fontWeight;
  Color? textColor;

  CustomAutoSizeTextMontserrat(
      {Key? key,
      required this.text,
      required this.maxLines,
      this.mandatory,
      this.fontSize,
      this.textColor,
      this.fontWeight,
      this.underline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: AutoSizeText(
        text!,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        style: GoogleFonts.montserrat(
          fontWeight: fontWeight ?? FontWeight.w500,
          color: textColor ?? Colors.black,
          fontSize: fontSize == null ? 16.0 : fontSize! * 1.00,
          decoration: underline != null
              ? underline == true
                  ? TextDecoration.underline
                  : TextDecoration.none
              : TextDecoration.none,
        ),
        // GoogleFonts.monster(
        //   fontWeight: fontWeight ?? FontWeight.w500,
        //   fontSize: fontSize == null ? 16.0 : fontSize! * 1.00,
        // ),
      ),
    );
  }
}
