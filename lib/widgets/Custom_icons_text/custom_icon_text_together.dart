import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CustomIconTextTogether extends StatelessWidget {
  final Widget iconData;
  final String text;
  final Color color;
  final Color Bgcolor;
  final int textSize;
  bool showICOn;
  final FontWeight fontWeight;
  final double verticalPadding;
  final double horizontelPadding;

  CustomIconTextTogether(
      {super.key,
      required this.verticalPadding,
      required this.horizontelPadding,
      required this.showICOn,
      required this.fontWeight,
      required this.textSize,
      required this.Bgcolor,
      required this.iconData,
      required this.color,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontelPadding),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 0.2, color: ThemeConstants.blackcolor),
          ],
          color: Bgcolor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: color)),
      child: Row(
        children: [
          showICOn == true ? iconData : SizedBox.shrink(),
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
