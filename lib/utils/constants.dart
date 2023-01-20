import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class Constants {
  static const String enterEmail = "Enter Email";

  // Color
  static const LinearGradient linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFFFFFF),
      Color.fromARGB(255, 228, 230, 255),
    ],
  );

  static const BoxDecoration boxDecorationfield = BoxDecoration(
    gradient: Constants.linearGradient,
  );
  static const textstyle = TextStyle(fontSize: 16, color: Colors.black);

  static const lightgrey = Color(0xFFD3D3D3);
  static const textstyle2 =
      TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w500);
  static const textstyle3 =
      TextStyle(fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold);
}

//Null check
bool getNUllChecker(var data) {
  if (data == null) {
    return true;
  } else if (data == "null") {
    return true;
  } else if (data == "") {
    return true;
  } else if (data == "0") {
    return true;
  } else {
    return false;
  }
}

String getRemoveSquarebracket(String data) {
  var temp = data.split('[');
  var temp2 = temp[1].split(']')[0];
  return temp2;
}

getToast(String data) {
  return Fluttertoast.showToast(
      // webBgColor: "linear-gradient(to right, #F1F4FB, #F1F4FB)",
      // webPosition: "Top",
      webPosition: "center",
      msg: data,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: ThemeConstants.lightblueColor,
      textColor: ThemeConstants.blackcolor,
      fontSize: 16.0);
}

getDailog(BuildContext context, String data) {
  return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            icon: SvgPicture.asset("assets/icons/warning.svg",
                color: ThemeConstants.yellow,
                height: 80,
                width: 80,
                fit: BoxFit.scaleDown),
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Divider(
                    thickness: 0.5,
                    color: ThemeConstants.lightgreycolor,
                  ),
                  SizedBox(
                      width: 200.0,
                      height: 80.0,
                      child: Center(
                          child: CustomAutoSizeTextMontserrat(text: data))),
                ],
              ),
            ),
          )

      // AlertDialog(
      //   title: const Text("Alert Dialog Box"),
      //   icon: SvgPicture.asset("assets/icons/warning.svg",
      //       color: const Color(0xFF6F61FF),
      //       height: 80,
      //       width: 80,
      //       fit: BoxFit.scaleDown),
      //   content: CustomAutoSizeTextMontserrat(text: data),
      // ),
      );
}
