import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class EnableButton extends StatelessWidget {
  bool enabled;
  String text;
  double? borderRadius;
  EnableButton(
      {super.key,
      required this.text,
      required this.enabled,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 0.2, color: ThemeConstants.blackcolor),
          ],
          color: enabled == true
              ? ThemeConstants.bluecolor
              : ThemeConstants.ultraLightgreyColor2,
          borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
          border: Border.all(width: 1, color: Colors.transparent)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: CustomAutoSizeTextMontserrat(
          text: text,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          textColor: enabled == true
              ? ThemeConstants.whitecolor
              : ThemeConstants.blackcolor,
        ),
      ),
    );
  }
}
