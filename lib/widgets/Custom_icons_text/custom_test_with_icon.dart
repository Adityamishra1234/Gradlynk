import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CustomIconTextTogether extends StatelessWidget {
  Icon? iconData;
  String text;
  Color? color;
  Color? Bgcolor;
  double? textSize;

  FontWeight? fontWeight;

  CustomIconTextTogether(
      {super.key,
      this.fontWeight,
      this.textSize,
      this.Bgcolor,
      this.iconData,
      this.color,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 0.2, color: ThemeConstants.blackcolor),
          ],
          color: Bgcolor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: color ?? Colors.transparent)),
      child: Row(
        children: [
          iconData ?? const SizedBox.shrink(),
          const SizedBox(
            width: 5,
          ),
          CustomAutoSizeTextMontserrat(
            text: '$text',
            textColor: color,
            fontSize: textSize ?? 14.00,
            fontWeight: fontWeight,
          ),
        ],
      ),
    );
  }
}
