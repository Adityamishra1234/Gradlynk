import 'package:flutter/material.dart';
import 'package:studentpanel/new_widgets/text_fields.dart';
import 'package:studentpanel/utils/theme.dart';

class CustomMandatoryText extends StatelessWidget {
  final bool? textAlignCentre;
  final bool? underline;
  final bool mandatory;
  final String text;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;

  const CustomMandatoryText(
      {Key? key,
      this.textAlignCentre = false,
      required this.text,
      this.maxLines,
      this.mandatory = false,
      this.fontSize,
      this.textColor,
      this.fontWeight,
      this.underline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(textAlign: textAlignCentre == true ? TextAlign.center : TextAlign.left,
        text: TextSpan(children: [
      TextSpan(
          text: text,
          style: buttonStyleOpenSans(textColor ?? ThemeConstants.blackcolor,
              fontWeight ?? FontWeight.w400, fontSize ?? 18,
              textDecoration: underline)),
      if (mandatory)
        TextSpan(
            text: " *",
            style: buttonStyleOpenSans(
                ThemeConstants.red,
                fontWeight ?? FontWeight.w400,
                fontSize ?? 18,
                textDecoration: underline))
    ]));
  }
}
