import 'package:flutter/material.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CustomIconTextTogetherWithDecorator extends StatelessWidget {
  Icon iconData;
  final String text;
  bool? textalingCentre = false;
  bool? underline;
  bool? mandatory;
  int? maxLines;
  double? fontSize;
  FontWeight? fontWeight;
  Color? textColor;

  CustomIconTextTogetherWithDecorator(
      {Key? key,
      required this.iconData,
      this.textalingCentre,
      required this.text,
      this.maxLines,
      this.mandatory,
      this.fontSize,
      this.textColor,
      this.fontWeight,
      this.underline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        iconData,
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width / 2 - 38,
          child: CustomAutoSizeTextMontserrat(
            text: text,
            fontSize: fontSize,
            fontWeight: fontWeight,
            mandatory: mandatory,
            maxLines: maxLines,
            textColor: textColor,
          ),
        ),
      ],
    );
  }
}
