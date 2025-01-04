import 'package:flutter/material.dart';
import 'package:studentpanel/new_widgets/text_fields.dart';
import 'package:studentpanel/utils/theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final double? buttonTextSize;
  final FontWeight? fw;
  final double? height;

  const CustomButton(
      {super.key,
      required this.text,
      this.onTap,
      this.buttonTextSize,
      this.fw,
      this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: height ?? 45,
        decoration: BoxDecoration(
            gradient: ThemeConstants.backgroundGradient,
            border: Border.all(color: ThemeConstants.greenColor),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                  spreadRadius: -2,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                  color: Colors.white)
            ]),
        child: Center(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            textScaler: TextScaler.noScaling,
            style: buttonStyleOpenSans(ThemeConstants.whitecolor,
                fw ?? FontWeight.bold, buttonTextSize ?? 15),
          ),
        ),
      ),
    );
  }
}

class CustomButton1 extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final double? height, buttonRadius;
  final double buttonTextSize;
  final FontWeight fw;
  final Gradient? gradient;
  final Color? borderColor, shadowColor, textColor, iconColor;
  final IconData? icon;

  const CustomButton1(
      {super.key,
      required this.text,
      this.onTap,
      required this.height,
      required this.buttonTextSize,
      required this.fw,
      this.gradient,
      this.borderColor,
      this.icon,
      this.shadowColor,
      this.textColor,
      this.iconColor,
      this.buttonRadius});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: height,
        decoration: BoxDecoration(
            gradient: gradient ?? ThemeConstants.backgroundGradient,
            border: Border.all(color: borderColor ?? ThemeConstants.greenColor),
            borderRadius: BorderRadius.circular(buttonRadius ?? 12),
            boxShadow: [
              BoxShadow(
                  spreadRadius: -2,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                  color: shadowColor ?? Colors.white)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                textAlign: TextAlign.center,
                text,
                overflow: TextOverflow.ellipsis,
                textScaler: TextScaler.noScaling,
                style: buttonStyleOpenSans(
                    textColor ?? ThemeConstants.whitecolor, fw, buttonTextSize),
              ),
            ),
            Visibility(
              visible: icon != null,
              child: Icon(
                icon,
                color: iconColor ?? ThemeConstants.whitecolor,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final double height;
  final double buttonTextSize;
  final FontWeight fw;
  final Gradient? gradient;
  final Color? borderColor, shadowColor;
  final IconData? icon;

  const CustomButton2(
      {super.key,
      required this.text,
      this.onTap,
      required this.height,
      required this.buttonTextSize,
      required this.fw,
      this.gradient,
      this.borderColor,
      this.icon,
      this.shadowColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: height,
        decoration: BoxDecoration(
            gradient: gradient ?? ThemeConstants.backgroundGradient,
            border: Border.all(color: borderColor ?? ThemeConstants.greenColor),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  spreadRadius: -2,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                  color: shadowColor ?? Colors.white)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: icon != null,
              child: Icon(
                icon,
                color: ThemeConstants.whitecolor,
                size: 25,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                text,
                overflow: TextOverflow.ellipsis,
                textScaler: TextScaler.noScaling,
                style: buttonStyleOpenSans(
                    ThemeConstants.whitecolor, fw, buttonTextSize),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton3 extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final double height;
  final double buttonTextSize;
  final FontWeight fw;
  final Color? containerColor, textColor;
  final Color? borderColor, shadowColor;
  final IconData? icon;

  const CustomButton3(
      {super.key,
      required this.text,
      this.onTap,
      required this.height,
      required this.buttonTextSize,
      required this.fw,
      this.containerColor,
      this.borderColor,
      this.icon,
      this.shadowColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: height,
        decoration: BoxDecoration(
          color: containerColor ?? ThemeConstants.greenColor,
          border: Border.all(color: borderColor ?? ThemeConstants.greenColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              text,
              overflow: TextOverflow.ellipsis,
              textScaler: TextScaler.noScaling,
              style: buttonStyleOpenSans(
                  textColor ?? ThemeConstants.whitecolor, fw, buttonTextSize),
            ),
            Visibility(
              visible: icon != null,
              child: Icon(
                icon,
                color: textColor ?? ThemeConstants.whitecolor,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
