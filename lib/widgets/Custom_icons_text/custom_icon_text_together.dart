import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CustomIconTextTogether extends StatelessWidget {
  final Icon iconData;
  final String text;
  final Color color;
  final Color Bgcolor;
  final int textSize;
  final FontWeight fontWeight;

  const CustomIconTextTogether(
      {super.key,
      required this.fontWeight,
      required this.textSize,
      required this.Bgcolor,
      required this.iconData,
      required this.color,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 0.2, color: ThemeConstants.blackcolor),
          ],
          color: Bgcolor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: color)),
      child: Row(
        children: [
          iconData,
          SizedBox(
            width: 5,
          ),
          CustomAutoSizeTextMontserrat(
            text: '$text',
            textColor: color,
            fontSize: textSize.toDouble(),
            fontWeight: fontWeight,
          ),
        ],
      ),
    );
  }
}
