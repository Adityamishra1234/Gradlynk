import 'dart:async';
import 'dart:io';
import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/ui/screen/internet_connection.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownfordailog.dart';

class Constants {
  String? id;
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
      gravity: ToastGravity.BOTTOM,
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
            icon: svgImage("warning", ThemeConstants.yellow, 90, 90),
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

getsnakbar(String title, String data) {
  return Get.snackbar(
    title,
    duration: const Duration(seconds: 2),
    data,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.white.withOpacity(0.0),
    margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
  );
}

svgImage(String endpoint, Color color, double height, double width) {
  return FittedBox(
    fit: BoxFit.scaleDown,
    child: CachedNetworkSVGImage(
      'https://sieceducation.in/assets/assets/icons/$endpoint.svg',
      // placeholder: const CircularProgressIndicator(color: Colors.blue),
      errorWidget: const Icon(Icons.error, color: Colors.red),
      height: height,
      width: width,
      color: color,
      fadeDuration: const Duration(milliseconds: 500),
    ),
  );
}

getNotification(
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
              child: Container(
            // color: ThemeConstants.GreenColor,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    child: GetBuilder<BaseController>(builder: (_) {
                      return CustomAutoSizeTextMontserrat(
                          text: _.notificationModel![0].notificationTitle);
                    }),
                  ),
                )
              ],
            ),
          ))));
}

String reverseStringUsingSplit(String input) {
  var chars = input.split('');
  return chars.reversed.join();
}

getSourceSelected(Function callbackSelectedSource, String id, int index,
    String applicationId) {
  Get.bottomSheet(Container(
    color: ThemeConstants.whitecolor,
    height: 300,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: CustomAutoSizeTextMontserrat(
            text: "Select Source",
            fontSize: 18,
            textColor: ThemeConstants.bluecolor,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          children: [
            const Spacer(),
            InkWell(
              onTap: () {
                Get.back();
                callbackSelectedSource(
                    "Camera,${id.toString()},${index.toString()}");
              },
              child: Column(
                children: [
                  svgImage("cameracapture", ThemeConstants.bluecolor, 100, 100),
                  CustomAutoSizeTextMontserrat(
                    text: "Camera",
                  )
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Get.back();
                callbackSelectedSource(
                    "Gallery,${id.toString()},${index.toString()}");
              },
              child: Column(
                children: [
                  svgImage("gallery", ThemeConstants.bluecolor, 100, 100),
                  CustomAutoSizeTextMontserrat(
                    text: "Gallery",
                  )
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ],
    ),
  ));
}

getLoading(BuildContext context) {
  return Center(
    child: Container(
      height: MediaQuery.of(context).size.height * 0.50,
      width: MediaQuery.of(context).size.width * 0.50,
      child: Image.asset(
        "assets/icons/loading1.gif",
        gaplessPlayback: false,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.contain,
      ),
    ),
  );
}

late StreamSubscription subscription;
bool isDeviceConnected = false;
bool isAlertSet = false;

bool ActiveConnection = false;
String T = "";

Future checkUserConnection() async {
  try {
    final result = await InternetAddress.lookup('google.com');

    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      // var controller1 = Get.put(BaseController());
      // controller1.refresh();
      // // Get.find<BaseController>().refresh();
      // Get.back();
      if (ActiveConnection == false) {
        Get.deleteAll();
        Get.find<BaseController>().profiledetail();
        Get.find<BaseController>().upcomingEvents();
        Get.toNamed(DashBoard.routeNamed);
        ActiveConnection = true;
        T = "Turn off the data and repress again";
      }
    }
  } on SocketException catch (_) {
    ActiveConnection = false;
    Get.toNamed(InternetConnectionStatusScreen.routeNamed);
    // T = "Turn On the data and repress again";
  }
}

firstLetterChaptial(String? data) {
  String? dataReturn;
  if (data != null) {
    List temp = data.split("");
    for (var i = 0; i < temp.length; i++) {
      if (i == 0) {
        dataReturn = temp[i].toUpperCase();
      } else {
        dataReturn = dataReturn! + temp[i];
      }
    }
    return dataReturn;
  } else {
    return null;
  }
}

getTable(
    {var firstField,
    var secondField,
    var firstFiledName,
    var secondFieldName}) {
  if (getNUllChecker(firstFiledName) == false ||
      getNUllChecker(secondFieldName) == false) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Table(
        children: [
          TableRow(children: [
            if (getNUllChecker(firstFiledName) == false)
              CustomAutoSizeTextMontserrat(
                text: firstField,
                maxLines: 2,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            if (getNUllChecker(secondFieldName) == false)
              CustomAutoSizeTextMontserrat(
                text: secondField,
                maxLines: 2,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
          ]),
          TableRow(children: [
            if (getNUllChecker(firstFiledName) == false)
              CustomAutoSizeTextMontserrat(
                text: firstFiledName,
                textColor: ThemeConstants.TextColor,
                maxLines: 2,
                fontSize: 12,
              ),
            if (getNUllChecker(secondFieldName) == false)
              CustomAutoSizeTextMontserrat(
                text: secondFieldName,
                textColor: ThemeConstants.TextColor,
                maxLines: 2,
                fontSize: 12,
              ),
          ]),
        ],
      ),
    );
  } else {
    return Container();
  }
}

// getScheduleExpertCall() {
//   return Get.bottomSheet(Container(
//     height: 345,
//     decoration: BoxDecoration(
//       color: ThemeConstants.whitecolor,
//       borderRadius: const BorderRadius.only(
//           topRight: Radius.circular(15.0), topLeft: Radius.circular(15.0)),
//     ),
//     child: Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(10),
//           child: Container(
//             height: 50,
//             width: displayMobileLayout == true
//                 ? MediaQuery.of(context).size.width - 240
//                 : MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//                 color: ThemeConstants.lightblueColor,
//                 borderRadius: BorderRadiusDirectional.circular(10.0)),
//             child: Center(
//               child: CustomAutoSizeTextMontserrat(
//                 text: "Schedule an Expert call",
//                 textColor: ThemeConstants.bluecolor,
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Align(
//           alignment: AlignmentDirectional.topStart,
//           child: Padding(
//             padding: const EdgeInsets.only(left: 10),
//             child: CustomAutoSizeTextMontserrat(
//               text: "Select your Counsellor",
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: CustomDropDown(
//               border: true,
//               hint: "Select your Counsellor",
//               callbackFunction: callbackDropDownButton,
//               model: const ["1", "2", "3"]),
//         ),
//         Align(
//           alignment: AlignmentDirectional.topStart,
//           child: Padding(
//             padding: const EdgeInsets.only(left: 10),
//             child: CustomAutoSizeTextMontserrat(text: "Select your Counsellor"),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: CustomDropDown(
//               border: true,
//               hint: "Select your Counsellor",
//               callbackFunction: callbackDropDownButton,
//               model: const ["1", "2", "3"]),
//         ),
//         Align(
//           alignment: AlignmentDirectional.topStart,
//           child: Padding(
//             padding: const EdgeInsets.only(left: 10),
//             child: CustomAutoSizeTextMontserrat(text: "Select your Counsellor"),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: CustomDropDown(
//               border: true,
//               hint: "Select your Counsellor",
//               callbackFunction: callbackDropDownButton,
//               model: const ["1", "2", "3"]),
//         ),
//       ],
//     ),
//   ));
// }
