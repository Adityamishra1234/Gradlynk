import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CustomButtonWidget extends StatelessWidget {
  Color? borderColor;
  Color? backgroundColor;
  String text;

  CustomButtonWidget({
    super.key,
    this.backgroundColor,
    this.borderColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        constraints: BoxConstraints(minWidth: 140),
        height: 35,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 1,
                  spreadRadius: 1,
                  color: ThemeConstants.shadowColor)
            ],
            border: Border.all(
                width: 1, color: borderColor ?? ThemeConstants.bluecolor),
            color: backgroundColor ?? ThemeConstants.whitecolor,
            borderRadius: BorderRadius.circular(20)),
        child: CustomAutoSizeTextMontserrat(
          text: '$text',
          fontWeight: FontWeight.w400,
          fontSize: 8,
        ),
      ),
    );
  }
}
