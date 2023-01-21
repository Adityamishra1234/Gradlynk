import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownfordailog.dart';

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
          ));
}

getDashboardScreen(
  BuildContext context,
  Function callback,
) {
  return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            content: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 300,
                    height: 80.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: CustomAutoSizeTextMontserrat(
                        text:
                            "For prevent abuse of application and to utilize all feature of the application your ID proof is mandatory",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 15),
                      child: CustomAutoSizeTextMontserrat(
                        text: "Upload an Identity Proof Document",
                        textColor: ThemeConstants.bluecolor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 300,
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomDropDownSingleDailog(
                          model: ["sample"],
                          callbackFunction: callback,
                          choosefieldtype: false,
                          initialSelectedValue: "sample"),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Container(
                      color: ThemeConstants.red,
                      width: 340,
                      height: 50,
                      child: CheckboxListTile(
                        title: CustomAutoSizeTextMontserrat(
                            text: "Are you available on Social Media"),
                        value: true,
                        onChanged: (newValue) {
                          // true = newValue!;
                        },
                        controlAffinity: ListTileControlAffinity
                            .leading, //  <-- leading Checkbox
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));
}

getEmailvaliation(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  if (value != null) {
    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  } else if (value == null) {
    return "Please enter email address";
  }
}

getPhoneNumbervalidation(String? value) {
  if (value != null) {
    if (value.length != 10) {
      return 'Mobile Number must be of 10 digit';
    } else
      return null;
  } else {
    return "Mobile Number must be of 10 digit";
  }
}
