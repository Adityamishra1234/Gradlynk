import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConstants {
  static TextStyle defaultTextStyle = const TextStyle(
      color: Colors.white70, fontSize: 20, fontWeight: FontWeight.w600);
  static TextStyle selectedTextStyle = const TextStyle(
      color: Colors.teal, fontSize: 20, fontWeight: FontWeight.w600);

  static TextStyle montserrattextstyle = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle montserrattextstyleForPlaceHolder = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle montserrattextstyleForFilledText = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle montserrattextstyleForFilledTextEnableEdit =
      GoogleFonts.montserrat(
    color: Color.fromARGB(255, 124, 124, 124),
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static TextStyle montserrattextstyle2 = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static TextStyle montserrattextstyle3 = GoogleFonts.montserrat(
    color: bluecolor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static TextStyle montserrattextstyle4 = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static getTextStyle(bool sizechange) {
    return GoogleFonts.montserrat(
        color: TextColor,
        fontSize: sizechange == false ? 16 : 12,
        fontWeight: FontWeight.w600);
  }

  static Color selectedColor = const Color(0xff4ac8ae);
  static Color drawerBackgroundColor = const Color(0xff272d34);
  static Color bluecolor = const Color(0xFF1940B3);
  static Color yellowColor = const Color(0xFFF1B95C);
  static Color greenColor = const Color(0xff185946);
  static Color whitecolor = const Color(0xFFFFFFFF);
  static Color ultrilightblue = const Color(0xFFF2F5FF);
  static Color blackcolor = const Color(0xFF0c0c0c);
  static Color lightgreycolor = const Color(0xFFD3D3D3);
  static Color bluegreycolor = const Color(0xFF525863);
  static Color bluelightgreycolor = const Color(0xFF525863);
  static Color lightVioletColor = const Color(0xFFF6F6FF);
  static Color VioletColor = const Color(0xFF6366F1);
  static Color lightgreentColor = const Color(0xFFF4FDF8);
  static Color lightblueColor = const Color(0xFFF1F4FB);
  static Color lightblueColor2 = Color.fromARGB(255, 198, 215, 255);

  static Color lightorangeColor = const Color(0xFFFFF7F1);
  static Color orangeColor = const Color(0xFFF97316);
  static Color TextColor = Color.fromARGB(255, 85, 85, 85);
  static Color IconColor = const Color(0xFF3C4351);
  static Color GreenColor = const Color(0xFF2FAF5E);
  static Color ultraLightgreyColor = const Color(0xFFF6F6F6);
  static Color ultraLightgreyColor2 = Color(0xFFF2F1F1);
  static Color ultraLightYellow = const Color(0xFFFFFDF9);
  static Color lightYellow = const Color(0xFFFFEFD8);
  static Color lightSkyblue = const Color(0xFFe7fbfc);
  static Color lightbrow = const Color(0xFFfbefde);
  static Color browcolor = const Color(0xFFBC7B1D);
  static Color lightRed = const Color(0xFFffe2e2);
  static Color red = const Color(0xFFcf3b3b);
  static Color yellow = Color.fromARGB(255, 247, 160, 38);
  static Color progressBar = const Color(0xffF737373);
  static Color progressBarBg = const Color(0xffFFDA9D);
  static Color skycolor = const Color.fromARGB(255, 36, 197, 206);
  static Color bluelightgreycolor2 = const Color.fromARGB(255, 164, 178, 202);
  static Color Lightcian = const Color(0xFFE9FEFF);
  static Color cianColor = const Color(0xFF0EB0B5);
  static Color bluechatColor = const Color(0xFFD9E6FF);
  static Color firstColor = const Color(0xffff9900);

  static Color lightOrangeColor = const Color(0xFFFFEDE5);
  static Color skinColour = const Color(0xFFF8F8F8);
  static Color shadowColor = const Color(0xFFF8F8F8);

  static LinearGradient backgroundGradient =
  LinearGradient(colors: [greenColor, const Color(0x60019E6F)]);

  static String icons = """<?xml version="1.0" encoding="utf-8"?>
<!-- Generator: Adobe Illustrator 26.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 100 100" style="enable-background:new 0 0 100 100;" xml:space="preserve">

<polygon class="st0" points="71.2,54.5 71.1,45.6 55.3,45.6 55.2,29.8 45.7,29.8 45.7,45.5 29.8,45.5 29.8,54.4 45.7,54.4 
	45.8,70.2 55.3,70.2 55.3,54.5 "/>
<path class="st0" d="M86.1,2.8H13.9c-6.1,0-11.1,5-11.1,11.1v72.3c0,6.1,5,11.1,11.1,11.1h72.3c6.1,0,11.1-5,11.1-11.1V13.9
	C97.2,7.8,92.2,2.8,86.1,2.8z M91.4,86.1c0,2.9-2.4,5.3-5.3,5.3H13.9c-2.9,0-5.3-2.4-5.3-5.3V13.9c0-2.9,2.4-5.3,5.3-5.3h72.3
	c2.9,0,5.3,2.4,5.3,5.3V86.1z"/>
</svg>
 """;



}
