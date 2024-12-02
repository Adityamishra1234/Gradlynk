import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CustomIconTextTogether extends StatelessWidget {
  final Widget? iconData;
  final String text;
  Color? color;
  Color? Bgcolor;
  double textSize;
  bool? showICOn;
  FontWeight? fontWeight;
  double? verticalPadding;
  double? horizontelPadding;
  Color? borderColor;

  CustomIconTextTogether(
      {super.key,
      this.borderColor,
      this.verticalPadding,
      this.horizontelPadding,
      required this.showICOn,
      this.fontWeight,
      required this.textSize,
      this.Bgcolor,
      this.iconData,
      this.color,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 5, horizontal: horizontelPadding ?? 5),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 0.2, color: ThemeConstants.blackcolor),
          ],
          color: Bgcolor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 1, color: borderColor ?? ThemeConstants.bluecolor.withOpacity(0.1))),
      child: Row(
        children: [
          showICOn == true ? iconData ?? const SizedBox.shrink() : const SizedBox.shrink(),
          const SizedBox(
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
