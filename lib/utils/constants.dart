import 'dart:async';
import 'dart:io';
import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/applicationcompletedetails.dart';
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
  } else if (data == 0) {
    return true;
  } else if (data == 0.0) {
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
  FocusManager.instance.primaryFocus?.unfocus();
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
                  SizedBox(
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
                  SizedBox(
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
                    width: 300,
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomDropDownSingleDailog(
                          model: const ["sample"],
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

  if (value == null || value == "") {
    return "Please enter email address";
  } else {
    return value.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }
}

getPhoneNumbervalidation(String? value) {
  if (value != null) {
    if (value.length != 10) {
      return 'Mobile Number must be of 10 digit';
    }
    {
      return null;
    }
  } else {
    return "Mobile Number must be of 10 digit";
  }
}

getEmptyValidation(String? value) {
  print(value);
  if (value == null) {
    return '* Required';
  } else if (value.isEmpty) {
    return '* Required';
  } else
    return null;
}

getEmptyDropDownValidation(String? value) {
  print(value);
  if (value == null || value == '') {
    return '* Please Select one Field';
  } else {
    return null;
  }
}

getOtpvalidation(String? value) {
  if (value != null) {
    if (value.length != 6) {
      return 'OTP must be of 6 digit';
    } else {
      return null;
    }
  } else {
    return "OTP must be of 6 digit";
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
  Get.bottomSheet(
      Stack(
        children: [
          Container(
            color: ThemeConstants.whitecolor,
            height: 200,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CustomAutoSizeTextMontserrat(
                    text: "Select Source",
                    fontSize: 18,
                    textColor: ThemeConstants.bluecolor,
                    fontWeight: FontWeight.w600,
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
                          svgImage("cameracapture", ThemeConstants.bluecolor,
                              50, 50),
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
                          svgImage("gallery", ThemeConstants.bluecolor, 50, 50),
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
          ),
          Positioned(
              right: 10,
              top: 10,
              child: InkWell(
                onTap: () {
                  // Get.find<ApplicationCompleteDetailsController>()
                  //     .model
                  //     .documents![index]
                  //     .viewLink = "";
                  // Get.find<ApplicationCompleteDetailsController>().update();
                  Get.back();
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: ThemeConstants.lightblueColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.close,
                      color: ThemeConstants.blackcolor,
                    ),
                  ),
                ),
              ))
        ],
      ),
      isDismissible: false);
}

getLoading(BuildContext context) {
  return Center(
    child: SizedBox(
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

// late StreamSubscription subscription;
// bool isDeviceConnected = false;
// bool isAlertSet = false;
// bool ActiveConnection = false;
// String T = "";

Future checkUserConnectionWithoutLogin() async {
  try {
    final result = await InternetAddress.lookup('google.com');

    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      // var controller1 = Get.put(BaseController());
      // controller1.refresh();
      // // Get.find<BaseController>().refresh();
      // Get.back();
      if (ActiveConnection == false) {
        // Get.deleteAll();
        // Get.find<BaseController>().profiledetail();
        // Get.find<BaseController>().upcomingEvents();
        // Get.toNamed(DashBoard.routeNamed);
        // ActiveConnection = true;
        // T = "Turn off the data and repress again";
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

ApiServices apiservice = ApiServices();

getDailogForAgree(
  BuildContext context,
) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      width: 300.0,
                      height: 60.0,
                      child: Center(
                          child: CustomAutoSizeTextMontserrat(
                        text: "Welcome to SIEC Gradlynk Student Panel",
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        textColor: ThemeConstants.bluecolor,
                      ))),
                  SizedBox(
                      width: 300.0,
                      height: 40.0,
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "I, agree to the following :",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          textColor: ThemeConstants.blackcolor,
                        ),
                      )),
                  SizedBox(
                      width: 300.0,
                      height: 150.0,
                      child: Center(
                          child: CustomAutoSizeTextMontserrat(
                        text:
                            """1. Neither, I nor my heirs, will claim against SIC for using my information throughout the process.
2. All the information submitted is correct and collaborates with my legal documents.
3. In case of any discrepancy in information, SIEC will not be liable for any halt throughout the process.
4.I, agree to all SIEC's Terms & Conditions.""",
                        fontSize: 18,
                        textColor: ThemeConstants.blackcolor,
                      ))),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () async {
                        await apiservice.agree(context);
                      },
                      child: Container(
                        height: 35,
                        width: 300,
                        decoration: BoxDecoration(
                            color: ThemeConstants.bluecolor,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Center(
                            child: CustomAutoSizeTextMontserrat(
                          text: "I Agree",
                          textColor: ThemeConstants.whitecolor,
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ));
}

getBookAnAppointment(
  BuildContext context,
) {
  return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (ctx) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            content: SingleChildScrollView(
              child: SizedBox(
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Book an appointment",
                          fontSize: 17,
                          textalingCentre: false,
                          fontWeight: FontWeight.w700,
                          textColor: ThemeConstants.bluecolor,
                        ),
                        const Spacer(),
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: ThemeConstants.lightblueColor,
                          child: Icon(
                            Icons.close,
                            color: ThemeConstants.TextColor,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                        width: 300.0,
                        height: 40.0,
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: CustomAutoSizeTextMontserrat(
                            text: "Select the Counsellor",
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            textColor: ThemeConstants.blackcolor,
                          ),
                        )),
                    SizedBox(
                        width: 300.0,
                        height: 40.0,
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: CustomAutoSizeTextMontserrat(
                            text:
                                "Your Advisor Simranjeet Canada brampton is in Head Office Branch",
                            fontSize: 12,
                            textColor: ThemeConstants.red,
                          ),
                        )),
                    SizedBox(
                        width: 300.0,
                        height: 40.0,
                        child: Row(
                          children: [
                            const Icon(Icons.location_on_sharp),
                            CustomAutoSizeTextMontserrat(
                              text: "Branch Address:",
                              fontSize: 12,
                              textColor: ThemeConstants.blackcolor,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              width: 150,
                              child: CustomAutoSizeTextMontserrat(
                                text:
                                    "B-2/0 1st floor Opposite Happy Model School",
                                fontSize: 12,
                                textColor: ThemeConstants.skycolor,
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      width: 300.0,
                      height: 40.0,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: ThemeConstants.lightgreycolor),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: Row(
                                children: [
                                  CustomAutoSizeTextMontserrat(
                                    text: "Connect Virtually",
                                    fontSize: 12,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: ThemeConstants.lightgreycolor),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: Row(
                                children: [
                                  CustomAutoSizeTextMontserrat(
                                    text: "Visit Nearest Branch",
                                    fontSize: 12,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                        height: 80.0,
                        width: 300,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 20,
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                  width: 80.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Icon(Icons.abc),
                                      const SizedBox(height: 8.0),
                                      Text('Item $index'),
                                    ],
                                  ));
                            }))
                  ],
                ),
              ),
            ),
          ));
}

getPhoneNumber() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var phoneNumber = prefs.getString('phonenumber');
  return phoneNumber;
}

getUserID() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var phoneNumber = prefs.getString('userid');
  return phoneNumber;
}

getUserToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var phoneNumber = prefs.getString('userToken');
  return phoneNumber;
}

getUserEnqID() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var phoneNumber = prefs.getString('enq_id');
  return phoneNumber;
}
