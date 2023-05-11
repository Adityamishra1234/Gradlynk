import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/receiveACallback/ui/recieveACallback_view.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customRichTextWidget.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:url_launcher/url_launcher.dart';

// class FunkyOverlay extends StatefulWidget {
//   late BuildContext context;

//   FunkyOverlay({required this.context});

//   @override
//   State<StatefulWidget> createState() => FunkyOverlayState();
// }

// class FunkyOverlayState extends State<FunkyOverlay>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation<Offset> scaleAnimation;

//   @override
//   void initState() {
//     super.initState();

//     controller =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 450));
//     scaleAnimation = Tween<Offset>(
//       begin: Offset.zero,
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: controller,
//       curve: Curves.elasticIn,
//     ));

//     controller.addListener(() {
//       setState(() {});
//     });

//     controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Material(
//         color: Colors.transparent,
//         child: SlideTransition(
//             position: scaleAnimation, child: contactUsDialog(widget.context)),
//       ),
//     );
//   }
// }

contactUsDialog(
  BuildContext context,
) {
  // barrierDismissible: true,
  // context: context,
  // pageBuilder: (ctx, a1, a2) {
  //   return Container();
  // },
  // transitionDuration: const Duration(milliseconds: 0),
  // transitionBuilder: (ctx, a1, a2, child) {
  //   print(a2.value);
  //   print(a1.value);
  //   return Transform.translate(
  //       offset: Offset(0, 0),
  return showDialog(
      // barrierDismissible: false,
      context: context,
      builder: (ctx) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 25,
                      alignment: Alignment.centerRight,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: ThemeConstants.ultraLightgreyColor,
                        child: Icon(
                          Icons.close,
                          color: ThemeConstants.bluecolor,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      width: 300.0,
                      height: 35.0,
                      child: Center(
                          child: CustomAutoSizeTextMontserrat(
                        text: "Contact Us",
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        textColor: ThemeConstants.bluecolor,
                      ))),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      _launchURL();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: 300,
                      height: 45,
                      decoration: BoxDecoration(
                          color: ThemeConstants.ultraLightgreyColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: ThemeConstants.bluecolor,
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.phone,
                                color: ThemeConstants.whitecolor,
                              )),
                          const SizedBox(
                            width: 20,
                          ),
                          CustomRichTextWidget(
                            text: '(+91 9779046382)',
                            text1: "Call Us ",
                            fontWeight: FontWeight.w600,
                            textColor: ThemeConstants.bluecolor,
                          ),
                          // CustomAutoSizeTextMontserrat(
                          //     text: "Call Us (+91 9779046382)"),
                          Spacer()
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(ReceiveACallBackView.routeNamed);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: 300,
                      height: 45,
                      decoration: BoxDecoration(
                          color: ThemeConstants.ultraLightgreyColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(7),
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: ThemeConstants.bluecolor,
                                shape: BoxShape.circle),
                            child: SvgPicture.asset(
                              'assets/icons/call back icon.svg',
                              color: ThemeConstants.whitecolor,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          CustomAutoSizeTextMontserrat(
                              text: "Receive a call back"),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: ThemeConstants.ultraLightgreyColor,
                        borderRadius: BorderRadius.all(Radius.circular(25.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(7),
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              color: ThemeConstants.bluecolor,
                              shape: BoxShape.circle),
                          child: SvgPicture.asset(
                            'assets/icons/Calender icon.svg',
                            color: ThemeConstants.whitecolor,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        CustomAutoSizeTextMontserrat(
                            text: "Schedule an expert call"),
                        const Spacer(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      _launchURL2();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: 300,
                      height: 45,
                      decoration: BoxDecoration(
                          color: ThemeConstants.ultraLightgreyColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(7),
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: ThemeConstants.bluecolor,
                                shape: BoxShape.circle),
                            child: SvgPicture.asset(
                              'assets/icons/SVO icon.svg',
                              color: ThemeConstants.whitecolor,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          CustomRichTextWidget(
                            text: 'SVO',
                            text1: "Join via ",
                            fontWeight: FontWeight.w600,
                            textColor: ThemeConstants.bluecolor,
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ));
}

_launchURL() async {
  final call = Uri.parse('tel:+91 8394049598');
  if (await canLaunchUrl(call)) {
    launchUrl(call);
  } else {
    throw 'Could not launch $call';
  }
}

_launchURL2() async {
  print('ddddcd');
  // final call = Uri.parse('tel:+91 8394049598');
  // if (await canLaunchUrl(call)) {
  //   launchUrl(call);
  // } else {
  //   throw 'Could not launch $call';
  // }

  const url =
      'https://zoom.us/j/97485138279?pwd=Y1cwcXRHUWZWOFN3aTZOdmhHZm4yQT09';
  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
