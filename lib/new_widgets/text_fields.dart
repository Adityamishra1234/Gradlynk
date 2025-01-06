import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/utils/theme.dart';

TextStyle buttonStyleOpenSans(Color color, FontWeight fWeight, double size,{bool? textDecoration = false}) {
  return GoogleFonts.openSans(
      textStyle: TextStyle(
        fontSize: size,
        fontWeight: fWeight,
        color: color,
        decoration: textDecoration==true ? TextDecoration.underline : null,
        decorationColor: textDecoration==true ? ThemeConstants.greenColor: null,
        decorationThickness: textDecoration==true ? 2 :null,
        overflow: TextOverflow.ellipsis,
      ));
}



InputDecoration textFieldWithIconDecoration(
    IconData icon, String label, double borderRadius,{textColor,iconColor,enabledBorderColor, disabledBorderColor}) {
  return InputDecoration(
    prefixIcon: Icon(
      icon,
      color: iconColor ?? ThemeConstants.greenColor,
    ),
    counterText: "",
    labelText: label,
    labelStyle: TextStyle(color: textColor?? ThemeConstants.blackcolor),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: enabledBorderColor ?? ThemeConstants.TextColor)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: disabledBorderColor ?? ThemeConstants.blackcolor)),
  );
}