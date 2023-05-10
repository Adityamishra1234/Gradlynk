import 'dart:async';
import 'dart:io';
import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
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
  print("object");

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
                  Get.find<ApplicationCompleteDetailsController>()
                      .model
                      .documents![index]
                      .viewLink = "";
                  Get.find<ApplicationCompleteDetailsController>().update();
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

const html =
    r"""<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://student.siecindia.com/css/app.css">
    <link rel="stylesheet" href="https://student.siecindia.com/css/custom.css">
    <link rel="stylesheet" href="https://student.siecindia.com/css/media.css">
    <title>Document</title>
    <style>
        .main-panel{width:100%;margin-top:4px;}
        .student-back{min-height:auto;}
    </style>
</head>
<body>


<div class="main-panel">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="student-back">
                    
                    <div class="row">
                        
                        <div class="col-md-12">
                            <div class="mb-3">
                                    <div class="white-box pb-3 student-detail top-information">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <h2 class="h2-f mb-2 text-blue">Welcome to SIEC Gradlynk Student Panel</h2>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                            <h4 class="text-dark mb-4 font-weight-normal">In order to start with your application,Please follow the below steps -</h4>


                                            <div id="content" class="mobile-show mobile-instruction" style="display:inherit;">
                                                <div class="row">
                                                    <div class="col-12 col-sm-12 col-xl-6 col-lg-6 col-md-6">
                                                    <a href="#"> <div class="white-box">
                                                            <div class="d-flex">
                                                                <div class="mr-3">
                                                                    <img src="https://student.siecindia.com/images/upload-svgrepo-com.svg" class="img-fluid mt-0" width="30">
                                                                </div>
                                                                <h3 class="mb-0 mr-2">1. To Get Started,Upload Identity Proof</h3>
                                                            </div>
                                                        </div></a>
                                                    </div>

                                                    <div class="col-12 col-sm-12 col-xl-6 col-lg-6 col-md-6">
                                                        <div class="white-box">
                                                            <div class="d-flex">
                                                                <div class="mr-3">
                                                                    <img src="https://student.siecindia.com/images/user-profile-svgrepo-com.svg" class="img-fluid mt-0" width="30">
                                                                </div>
                                                                <h3 class="mb-0 mr-2">2. Complete your Profile Information</h3>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="col-12 col-sm-12 col-xl-6 col-lg-6 col-md-6">
                                                        <div class="white-box">
                                                            <div class="d-flex">
                                                                <div class="mr-3">
                                                                    <img src="https://student.siecindia.com/images/book-svgrepo-com.svg" class="img-fluid mt-0" width="30">
                                                                </div>
                                                                <h3 class="mb-0 mr-2">3. Start your Course Search</h3>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-12 col-sm-12 col-xl-6 col-lg-6 col-md-6"> 
                                                        <div class="white-box">
                                                            <div class="d-flex">
                                                                <div class="mr-3">
                                                                    <img src="https://student.siecindia.com/images/file-svgrepo.svg" class="img-fluid mt-0" width="30">
                                                                </div>
                                                                <h3 class="mb-0 mr-2">4. Create your Course Shortlist</h3>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-12 col-sm-12 col-xl-6 col-lg-6 col-md-6">
                                                        <div class="white-box">
                                                            <div class="d-flex">
                                                                <div class="mr-3">
                                                                    <img src="https://student.siecindia.com/images/shortlist.svg" class="img-fluid mt-0" width="30">
                                                                </div>
                                                                <h3 class="mb-0 mr-2">5. Finalize your Application Shortlist</h3>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-12 col-sm-12 col-xl-6 col-lg-6 col-md-6">
                                                        <div class="white-box">
                                                            <div class="d-flex">
                                                                <div class="mr-3">
                                                                    <img src="https://student.siecindia.com/images/document.svg" class="img-fluid mt-0" width="40">
                                                                </div>
                                                                <h3 class="mb-0 mr-2">6. Get customized Document Checklist</h3>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-12 col-sm-12 col-xl-6 col-lg-6 col-md-6">   
                                                        <div class="white-box">
                                                            <div class="d-flex">
                                                                <div class="mr-3">
                                                                    <img src="https://student.siecindia.com/images/track.svg" class="img-fluid mt-0" width="30">
                                                                </div>
                                                                <h3 class="mb-0 mr-2">7. Track your Application Progress</h3>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-12 col-sm-12 col-xl-6 col-lg-6 col-md-6">
                                                        <div class="white-box">
                                                            <div class="d-flex">
                                                                <div class="mr-3">
                                                                    <img src="https://student.siecindia.com/images/receive-app.svg" class="img-fluid mt-0" width="30">
                                                                </div>
                                                                <h3 class="mb-0 mr-2">8. Receive Decision on your Application</h3>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-12 col-sm-12 col-xl-6 col-lg-6 col-md-6">
                                                        <div class="white-box">
                                                            <div class="d-flex">
                                                                <div class="mr-3">
                                                                    <img src="https://student.siecindia.com/images/fee-payment.svg" class="img-fluid mt-0" width="30">
                                                                </div>
                                                                <h3 class="mb-0 mr-2">9. Fee Payment <br><span class="text-success">(SIEC facilitates Education Loan as well)</span></h3>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-12 col-sm-12 col-xl-6 col-lg-6 col-md-6">
                                                        <div class="white-box">
                                                            <div class="d-flex">
                                                                <div class="mr-3">
                                                                    <img src="https://student.siecindia.com/images/visa-application.svg" class="img-fluid mt-0" width="30">
                                                                </div>
                                                                <h3 class="mb-0 mr-2">10. Document preparation for Visa Application</h3>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    
                                                    <div class="col-12 col-sm-12 col-xl-6 col-lg-6 col-md-6">
                                                        <div class="white-box">
                                                            <div class="d-flex">
                                                                <div class="mr-3">
                                                                    <img src="https://student.siecindia.com/images/visa-sub.svg" class="img-fluid mt-0" width="30">
                                                                </div>
                                                                <h3 class="mb-0 mr-2">11. Visa Submission</h3>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-12 col-sm-12 col-xl-6 col-lg-6 col-md-6">
                                                        <div class="white-box">
                                                            <div class="d-flex">
                                                                <div class="mr-3">
                                                                    <img src="https://student.siecindia.com/images/decision-visa.svg" class="img-fluid mt-0" width="30">
                                                                </div>
                                                                <h3 class="mb-0 mr-2">12. Decision on Visa Application</h3>
                                                            </div>
                                                        </div>
                                                    </div>
                                                        

                                                    <div class="col-12 col-sm-12 col-xl-6 col-lg-6 col-md-6">
                                                        <div class="white-box">
                                                            <div class="d-flex">
                                                                <div class="mr-3">
                                                                    <img src="https://student.siecindia.com/images/worldwide-aeroplane.svg" class="img-fluid mt-0" width="30">
                                                                </div>
                                                                <h3 class="mb-0 mr-2">13. Pre Departure - <br> <span>Book your Accomodation &amp; Tickets</span></h3>
                                                            </div>
                                                        </div>
                                                    </div>

                                                        
                                                    </div>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    
</body>
</html>""";

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


