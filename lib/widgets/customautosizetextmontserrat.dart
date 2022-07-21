import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAutoSizeTextMontserrat extends StatelessWidget {
  String? text;
  int? maxLines, fontSize;
  FontWeight? fontWeight;
  Color? textColor;

  CustomAutoSizeTextMontserrat(
      {Key? key,
      required this.text,
      required this.maxLines,
      this.fontSize,
      this.textColor,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(text!,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        style: GoogleFonts.montserrat(
          fontWeight: fontWeight ?? FontWeight.w500,
          color: textColor ?? Colors.black,
          fontSize: fontSize == null ? 16.0 : fontSize! * 1.00,
        )
        // GoogleFonts.monster(
        //   fontWeight: fontWeight ?? FontWeight.w500,
        //   fontSize: fontSize == null ? 16.0 : fontSize! * 1.00,
        // ),
        );
  }
}
