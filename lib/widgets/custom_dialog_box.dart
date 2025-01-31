import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/controllers/dashboardcontroller.dart';
import 'package:studentpanel/ui/screen/dashboard/bookanappointment.dart';
import 'package:studentpanel/ui/screen/dashboard/scheduleExpertCall.dart';
import 'package:studentpanel/ui/screen/fund/check_fund_status.dart';
import 'package:studentpanel/ui/screen/fund/plan_fund.dart';
import 'package:studentpanel/ui/screen/fund/sponsorDetails.dart';
import 'package:studentpanel/ui/screen/gradlynk_support/raise_new_ticket.dart';
import 'package:studentpanel/ui/screen/gradlynk_support/track_your_tickets.dart';
import 'package:studentpanel/ui/screen/mark_attendance/intake_screen.dart';
import 'package:studentpanel/ui/screen/mark_attendance/model/mark_attendance_intake.dart';
import 'package:studentpanel/ui/screen/receiveACallback/ui/recieveACallback_view.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customRichTextWidget.dart';
import 'package:studentpanel/widgets/custom_image_viewer.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/event_desk_list/event_desk_list_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ui/screen/mark_attendance/code_screen.dart';

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
  return showAnimatedDialog(
    barrierDismissible: true,
    animationType: DialogTransitionType.slideFromBottomFade,
    curve: Curves.easeInOutQuart,
    // barrierDismissible: false,
    context: context,
    builder: (ctx) => AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      insetPadding: const EdgeInsets.all(10),
      contentPadding: const EdgeInsets.all(10),
      content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 140,
                    height: 35.0,
                    alignment: Alignment.centerLeft,
                    child: CustomAutoSizeTextMontserrat(
                      text: "Contact Us",
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      textColor: ThemeConstants.bluecolor,
                    )),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 25,
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
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // InkWell(
            //   onTap: () {
            //     _launchURL();
            //   },
            //   child: Container(
            //     padding: EdgeInsets.symmetric(horizontal: 10),
            //     width: 300,
            //     height: 45,
            //     decoration: BoxDecoration(
            //         color: ThemeConstants.ultraLightgreyColor,
            //         borderRadius:
            //             BorderRadius.all(Radius.circular(25.0))),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Container(
            //             height: 35,
            //             width: 35,
            //             decoration: BoxDecoration(
            //                 color: ThemeConstants.bluecolor,
            //                 shape: BoxShape.circle),
            //             child: Icon(
            //               Icons.phone,
            //               color: ThemeConstants.whitecolor,
            //             )),
            //         const SizedBox(
            //           width: 20,
            //         ),
            //         CustomRichTextWidget(
            //           text: '(+91 9779046382)',
            //           text1: "Call Us ",
            //           fontWeight: FontWeight.w600,
            //           textColor: ThemeConstants.bluecolor,
            //         ),
            //         // CustomAutoSizeTextMontserrat(
            //         //     text: "Call Us (+91 9779046382)"),
            //         Spacer()
            //       ],
            //     ),
            //   ),
            // ),
            Material(
              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
              color: ThemeConstants.ultraLightgreyColor,
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                splashColor: ThemeConstants.bluecolor,
                onTap: () async {
                  await Future.delayed(const Duration(milliseconds: 150));
                  _launchURL();
                },
                child: Container(
                  width: 300,
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  // decoration: BoxDecoration(
                  //     borderRadius:
                  //         BorderRadius.all(Radius.circular(25.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: ThemeConstants.bluecolor,
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.phone,
                          color: ThemeConstants.whitecolor,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      CustomRichTextWidget(
                        text: '(+91 9779046382)',
                        text1: "Call Us ",
                        fontWeight: FontWeight.w600,
                        textColor: ThemeConstants.bluecolor,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // InkWell(
            //   onTap: () {
            //     Get.toNamed(ReceiveACallBackView.routeNamed);
            //   },
            //   child: Container(
            //     padding: EdgeInsets.symmetric(horizontal: 10),
            //     width: 300,
            //     height: 45,
            //     decoration: BoxDecoration(
            //         color: ThemeConstants.ultraLightgreyColor,
            //         borderRadius:
            //             BorderRadius.all(Radius.circular(25.0))),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Container(
            //           padding: EdgeInsets.all(7),
            //           height: 35,
            //           width: 35,
            //           decoration: BoxDecoration(
            //               color: ThemeConstants.bluecolor,
            //               shape: BoxShape.circle),
            //           child: SvgPicture.asset(
            //             'assets/icons/call back icon.svg',
            //             color: ThemeConstants.whitecolor,
            //           ),
            //         ),
            //         const SizedBox(
            //           width: 20,
            //         ),
            //         CustomAutoSizeTextMontserrat(
            //             text: "Receive a call back"),
            //         const Spacer(),
            //       ],
            //     ),
            //   ),
            // ),
            Material(
              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
              color: ThemeConstants.ultraLightgreyColor,
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                splashColor: ThemeConstants.bluecolor,
                onTap: () async {
                  await Future.delayed(const Duration(milliseconds: 150));
                  Get.toNamed(ReceiveACallBackView.routeNamed);
                },
                child: Container(
                  width: 300,
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  // decoration: BoxDecoration(
                  //     borderRadius:
                  //         BorderRadius.all(Radius.circular(25.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: ThemeConstants.bluecolor,
                            shape: BoxShape.circle),
                        child: svgImage("call back icon",
                            ThemeConstants.whitecolor, 30, 30),

                        // SvgPicture.asset(
                        //   'assets/icons/call back icon.svg',
                        //   color: ThemeConstants.whitecolor,
                        // ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      CustomRichTextWidget(
                          fontWeight: FontWeight.w600,
                          textColor: ThemeConstants.bluecolor,
                          text: "Receive a call back"),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // InkWell(
            //   onTap: () {
            //     Get.toNamed(ScheduleExpertCall.routeNamed);
            //   },
            //   child: Container(
            //     width: 300,
            //     height: 45,
            //     padding: EdgeInsets.symmetric(horizontal: 10),
            //     decoration: BoxDecoration(
            //         color: ThemeConstants.ultraLightgreyColor,
            //         borderRadius:
            //             BorderRadius.all(Radius.circular(25.0))),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Container(
            //           padding: EdgeInsets.all(7),
            //           height: 35,
            //           width: 35,
            //           decoration: BoxDecoration(
            //               color: ThemeConstants.bluecolor,
            //               shape: BoxShape.circle),
            //           child: SvgPicture.asset(
            //             'assets/icons/Calender icon.svg',
            //             color: ThemeConstants.whitecolor,
            //           ),
            //         ),
            //         const SizedBox(
            //           width: 20,
            //         ),
            //         CustomAutoSizeTextMontserrat(
            //             text: "Schedule an expert call"),
            //         const Spacer(),
            //       ],
            //     ),
            //   ),
            // ),
            Material(
              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
              color: ThemeConstants.ultraLightgreyColor,
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                splashColor: ThemeConstants.bluecolor,
                onTap: () async {
                  await Future.delayed(const Duration(milliseconds: 150));

                  Get.toNamed(ScheduleExpertCall.routeNamed);
                },
                child: Container(
                  width: 300,
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  // decoration: BoxDecoration(
                  //     borderRadius:
                  //         BorderRadius.all(Radius.circular(25.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: ThemeConstants.bluecolor,
                            shape: BoxShape.circle),
                        child: svgImage(
                          "Calender icon",
                          ThemeConstants.whitecolor,
                          30,
                          30,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      CustomRichTextWidget(
                          fontWeight: FontWeight.w600,
                          textColor: ThemeConstants.bluecolor,
                          text: "Schedule an expert call"),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // InkWell(
            //   onTap: () {
            //     _launchURL2();
            //   },
            //   child: Container(
            //     padding: EdgeInsets.symmetric(horizontal: 10),
            //     width: 300,
            //     height: 45,
            //     decoration: BoxDecoration(
            //         color: ThemeConstants.ultraLightgreyColor,
            //         borderRadius:
            //             BorderRadius.all(Radius.circular(25.0))),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Container(
            //           padding: EdgeInsets.all(7),
            //           height: 35,
            //           width: 35,
            //           decoration: BoxDecoration(
            //               color: ThemeConstants.bluecolor,
            //               shape: BoxShape.circle),
            //           child: SvgPicture.asset(
            //             'assets/icons/SVO icon.svg',
            //             color: ThemeConstants.whitecolor,
            //           ),
            //         ),
            //         const SizedBox(
            //           width: 20,
            //         ),
            //         CustomRichTextWidget(
            //           text: 'SVO',
            //           text1: "Join via ",
            //           fontWeight: FontWeight.w600,
            //           textColor: ThemeConstants.bluecolor,
            //         ),
            //         const Spacer(),
            //       ],
            //     ),
            //   ),
            // ),
            Material(
              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
              color: ThemeConstants.ultraLightgreyColor,
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                splashColor: ThemeConstants.bluecolor,
                onTap: () async {
                  await Future.delayed(const Duration(milliseconds: 150));

                  _launchURL2();
                },
                child: Container(
                  width: 300,
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  // decoration: BoxDecoration(
                  //     borderRadius:
                  //         BorderRadius.all(Radius.circular(25.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: ThemeConstants.bluecolor,
                            shape: BoxShape.circle),
                        child: svgImage(
                            "SVO icon", ThemeConstants.whitecolor, 30, 30),

                        //  SvgPicture.asset(
                        //   'assets/icons/SVO icon.svg',
                        //   color: ThemeConstants.whitecolor,
                        // ),
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
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ////todo
            // Material(
            //   borderRadius: BorderRadius.all(Radius.circular(25.0)),
            //   color: ThemeConstants.ultraLightgreyColor,
            //   child: InkWell(
            //     borderRadius: BorderRadius.all(Radius.circular(25.0)),
            //     splashColor: ThemeConstants.bluecolor,
            //     onTap: () async {
            //       Get.back();
            //       await Future.delayed(Duration(milliseconds: 250));

            //       showAnimatedDialog(
            //           barrierDismissible: true,
            //           animationType: DialogTransitionType.slideFromBottomFade,
            //           curve: Curves.easeInOutQuart,
            //           // barrierDismissible: false,
            //           context: context,
            //           builder: (_) {
            //             return StatefulBuilder(builder: (context, setState) {
            //               return BookAnAppointment();
            //             });
            //           });
            //     },
            //     child: Container(
            //       width: 300,
            //       height: 45,
            //       padding: EdgeInsets.symmetric(horizontal: 10),
            //       // decoration: BoxDecoration(
            //       //     borderRadius:
            //       //         BorderRadius.all(Radius.circular(25.0))),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           Container(
            //             padding: const EdgeInsets.all(7),
            //             height: 35,
            //             width: 35,
            //             decoration: BoxDecoration(
            //                 color: ThemeConstants.bluecolor,
            //                 shape: BoxShape.circle),
            //             child: svgImage(
            //                 "Calender icon", ThemeConstants.whitecolor, 30, 30),

            //             //  SvgPicture.asset(
            //             //   'assets/icons/SVO icon.svg',
            //             //   color: ThemeConstants.whitecolor,
            //             // ),
            //           ),
            //           // Container(
            //           //   padding: EdgeInsets.all(7),
            //           //   height: 35,
            //           //   width: 35,
            //           //   decoration: BoxDecoration(
            //           //       color: ThemeConstants.bluecolor,
            //           //       shape: BoxShape.circle),
            //           //   child: SvgPicture.asset(
            //           //     'assets/icons/Calender icon.svg',
            //           //     color: ThemeConstants.whitecolor,
            //           //   ),
            //           // ),
            //           const SizedBox(
            //             width: 20,
            //           ),
            //           CustomRichTextWidget(
            //             text: 'Book an appointment',
            //             // text1: "Join via ",
            //             fontWeight: FontWeight.w600,
            //             // fontSize: 10,
            //             textColor: ThemeConstants.bluecolor,
            //           ),
            //           // CustomAutoSizeTextMontserrat(
            //           //     text: "Book an appointment"),
            //           const Spacer(),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ]),
    ),
  );
}

supportDialog(
  BuildContext context,
) {
  return showAnimatedDialog(
      barrierDismissible: true,
      animationType: DialogTransitionType.slideFromBottomFade,
      curve: Curves.easeInOutQuart,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 200,
                          height: 35.0,
                          alignment: Alignment.centerLeft,
                          child: CustomAutoSizeTextMontserrat(
                            text: "Gradlynk Support",
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            textColor: ThemeConstants.bluecolor,
                          )),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 25,
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
                    ],
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     _launchURL();
                  //   },
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(horizontal: 10),
                  //     width: 300,
                  //     height: 45,
                  //     decoration: BoxDecoration(
                  //         color: ThemeConstants.ultraLightgreyColor,
                  //         borderRadius:
                  //             BorderRadius.all(Radius.circular(25.0))),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         Container(
                  //             height: 35,
                  //             width: 35,
                  //             decoration: BoxDecoration(
                  //                 color: ThemeConstants.bluecolor,
                  //                 shape: BoxShape.circle),
                  //             child: Icon(
                  //               Icons.phone,
                  //               color: ThemeConstants.whitecolor,
                  //             )),
                  //         const SizedBox(
                  //           width: 20,
                  //         ),
                  //         CustomRichTextWidget(
                  //           text: '(+91 9779046382)',
                  //           text1: "Call Us ",
                  //           fontWeight: FontWeight.w600,
                  //           textColor: ThemeConstants.bluecolor,
                  //         ),
                  //         // CustomAutoSizeTextMontserrat(
                  //         //     text: "Call Us (+91 9779046382)"),
                  //         Spacer()
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Material(
                    borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                    color: ThemeConstants.ultraLightgreyColor,
                    child: InkWell(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25.0)),
                      splashColor: ThemeConstants.bluecolor,
                      onTap: () async {
                        await Future.delayed(const Duration(milliseconds: 150));
                        Get.toNamed(RaiseYourTicket.routeNamed);
                      },
                      child: Container(
                        width: 300,
                        height: 45,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        // decoration: BoxDecoration(
                        //     borderRadius:
                        //         BorderRadius.all(Radius.circular(25.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(7),
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: ThemeConstants.bluecolor,
                                  shape: BoxShape.circle),
                              child: svgImage("raise ticket",
                                  ThemeConstants.whitecolor, 20, 20),
                              // SvgPicture.asset(
                              //   'assets/icons/raise ticket.svg',
                              //   color: ThemeConstants.whitecolor,
                              // ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            CustomRichTextWidget(
                              text: '',
                              text1: "Raise New Ticket",
                              fontWeight: FontWeight.w600,
                              textColor: ThemeConstants.bluecolor,
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                    color: ThemeConstants.ultraLightgreyColor,
                    child: InkWell(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25.0)),
                      splashColor: ThemeConstants.bluecolor,
                      onTap: () async {
                        await Future.delayed(const Duration(milliseconds: 150));
                        Get.toNamed(TrackyourTickets.routeNamed);
                      },
                      child: Container(
                        width: 300,
                        height: 45,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        // decoration: BoxDecoration(
                        //     borderRadius:
                        //         BorderRadius.all(Radius.circular(25.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(7),
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: ThemeConstants.bluecolor,
                                  shape: BoxShape.circle),
                              child: svgImage("Track Issue",
                                  ThemeConstants.whitecolor, 20, 20),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            CustomRichTextWidget(
                              text: '',
                              text1: "Track Your Ticket",
                              fontWeight: FontWeight.w600,
                              textColor: ThemeConstants.bluecolor,
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // // InkWell(
                  //   onTap: () {
                  //     Get.toNamed(ReceiveACallBackView.routeNamed);
                  //   },
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(horizontal: 10),
                  //     width: 300,
                  //     height: 45,
                  //     decoration: BoxDecoration(
                  //         color: ThemeConstants.ultraLightgreyColor,
                  //         borderRadius:
                  //             BorderRadius.all(Radius.circular(25.0))),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         Container(
                  //           padding: EdgeInsets.all(7),
                  //           height: 35,
                  //           width: 35,
                  //           decoration: BoxDecoration(
                  //               color: ThemeConstants.bluecolor,
                  //               shape: BoxShape.circle),
                  //           child: SvgPicture.asset(
                  //             'assets/icons/call back icon.svg',
                  //             color: ThemeConstants.whitecolor,
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           width: 20,
                  //         ),
                  //         CustomAutoSizeTextMontserrat(
                  //             text: "Receive a call back"),
                  //         const Spacer(),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Material(
                  //   borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  //   color: ThemeConstants.ultraLightgreyColor,
                  //   child: InkWell(
                  //     borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  //     splashColor: ThemeConstants.bluecolor,
                  //     onTap: () async {
                  //       await Future.delayed(Duration(milliseconds: 150));
                  //       Get.toNamed(Suggestedimprovisation.routeNamed);
                  //     },
                  //     child: Container(
                  //       width: 300,
                  //       height: 45,
                  //       padding: EdgeInsets.symmetric(horizontal: 10),
                  //       // decoration: BoxDecoration(
                  //       //     borderRadius:
                  //       //         BorderRadius.all(Radius.circular(25.0))),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //           Container(
                  //             padding: EdgeInsets.all(7),
                  //             height: 35,
                  //             width: 35,
                  //             decoration: BoxDecoration(
                  //                 color: ThemeConstants.bluecolor,
                  //                 shape: BoxShape.circle),
                  //             child: SvgPicture.asset(
                  //               'assets/icons/feed back.svg',
                  //               color: ThemeConstants.whitecolor,
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             width: 20,
                  //           ),
                  //           CustomAutoSizeTextMontserrat(
                  //               text: "Track feedback"),
                  //           const Spacer(),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     Get.toNamed(ScheduleExpertCall.routeNamed);
                  //   },
                  //   child: Container(
                  //     width: 300,
                  //     height: 45,
                  //     padding: EdgeInsets.symmetric(horizontal: 10),
                  //     decoration: BoxDecoration(
                  //         color: ThemeConstants.ultraLightgreyColor,
                  //         borderRadius:
                  //             BorderRadius.all(Radius.circular(25.0))),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         Container(
                  //           padding: EdgeInsets.all(7),
                  //           height: 35,
                  //           width: 35,
                  //           decoration: BoxDecoration(
                  //               color: ThemeConstants.bluecolor,
                  //               shape: BoxShape.circle),
                  //           child: SvgPicture.asset(
                  //             'assets/icons/Calender icon.svg',
                  //             color: ThemeConstants.whitecolor,
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           width: 20,
                  //         ),
                  //         CustomAutoSizeTextMontserrat(
                  //             text: "Schedule an expert call"),
                  //         const Spacer(),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Material(
                    borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                    color: ThemeConstants.ultraLightgreyColor,
                    child: InkWell(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25.0)),
                      splashColor: ThemeConstants.bluecolor,
                      onTap: () async {
                        await Future.delayed(const Duration(milliseconds: 150));

                        _launchEmailURL();

                        // Get.toNamed(ScheduleExpertCall.routeNamed);
                      },
                      child: Container(
                        width: 300,
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // decoration: BoxDecoration(
                        //     borderRadius:
                        //         BorderRadius.all(Radius.circular(25.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(7),
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: ThemeConstants.bluecolor,
                                  shape: BoxShape.circle),
                              child: svgImage(
                                  "mail", ThemeConstants.whitecolor, 35, 35),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            CustomAutoSizeTextMontserrat(
                                fontWeight: FontWeight.w600,
                                textColor: ThemeConstants.bluecolor,
                                text: "Gradlynksupport\n@siecindia.com"),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     _launchURL2();
                  //   },
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(horizontal: 10),
                  //     width: 300,
                  //     height: 45,
                  //     decoration: BoxDecoration(
                  //         color: ThemeConstants.ultraLightgreyColor,
                  //         borderRadius:
                  //             BorderRadius.all(Radius.circular(25.0))),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         Container(
                  //           padding: EdgeInsets.all(7),
                  //           height: 35,
                  //           width: 35,
                  //           decoration: BoxDecoration(
                  //               color: ThemeConstants.bluecolor,
                  //               shape: BoxShape.circle),
                  //           child: SvgPicture.asset(
                  //             'assets/icons/SVO icon.svg',
                  //             color: ThemeConstants.whitecolor,
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           width: 20,
                  //         ),
                  //         CustomRichTextWidget(
                  //           text: 'SVO',
                  //           text1: "Join via ",
                  //           fontWeight: FontWeight.w600,
                  //           textColor: ThemeConstants.bluecolor,
                  //         ),
                  //         const Spacer(),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  // Material(
                  //   borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  //   color: ThemeConstants.ultraLightgreyColor,
                  //   child: InkWell(
                  //     borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  //     splashColor: ThemeConstants.bluecolor,
                  //     onTap: () async {
                  //       await Future.delayed(Duration(milliseconds: 150));

                  //       Get.toNamed(BookAnAppointment.routeNamed);
                  //     },
                  //     child: Container(
                  //       width: 300,
                  //       height: 45,
                  //       padding: EdgeInsets.symmetric(horizontal: 10),
                  //       // decoration: BoxDecoration(
                  //       //     borderRadius:
                  //       //         BorderRadius.all(Radius.circular(25.0))),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //           Container(
                  //             padding: EdgeInsets.all(7),
                  //             height: 35,
                  //             width: 35,
                  //             decoration: BoxDecoration(
                  //                 color: ThemeConstants.bluecolor,
                  //                 shape: BoxShape.circle),
                  //             child: SvgPicture.asset(
                  //               'assets/icons/Calender icon.svg',
                  //               color: ThemeConstants.whitecolor,
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             width: 20,
                  //           ),
                  //           CustomAutoSizeTextMontserrat(
                  //               text: "Book an appointment"),
                  //           const Spacer(),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ));
}

planYourFundDialog(
  BuildContext context,
) {
  return showAnimatedDialog(
      barrierDismissible: true,
      animationType: DialogTransitionType.slideFromBottomFade,
      curve: Curves.easeInOutQuart,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 200,
                          height: 35.0,
                          alignment: Alignment.centerLeft,
                          child: CustomAutoSizeTextMontserrat(
                            text: "Plan your Funds",
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            textColor: ThemeConstants.bluecolor,
                          )),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 25,
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
                    ],
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  Material(
                    borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                    color: ThemeConstants.ultraLightgreyColor,
                    child: InkWell(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25.0)),
                      splashColor: ThemeConstants.bluecolor,
                      onTap: () async {
                        try {
                          if (Get.find<BaseController>().total_fund != 0.0) {
                            Get.back();
                            Get.to(SponsorDetails());
                          } else {
                            Get.back();
                            Get.to(FundPlan());
                          }
                        } catch (e) {
                          getToast("Please wait a minute");
                        }
                      },
                      child: Container(
                        width: 300,
                        height: 45,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(7),
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: ThemeConstants.bluecolor,
                                  shape: BoxShape.circle),
                              child: svgImage("manage_sponsor",
                                  ThemeConstants.whitecolor, 35, 35),
                              // SvgPicture.asset(
                              //   'assets/icons/manage_sponsor.svg',
                              //   color: ThemeConstants.whitecolor,
                              // ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            CustomRichTextWidget(
                              text: '',
                              text1: "Manage Sponsor",
                              fontWeight: FontWeight.w600,
                              textColor: ThemeConstants.bluecolor,
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                    color: ThemeConstants.ultraLightgreyColor,
                    child: InkWell(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25.0)),
                      splashColor: ThemeConstants.bluecolor,
                      onTap: () async {
                        await Future.delayed(const Duration(milliseconds: 150));
                        // Get.toNamed(TrackyourTickets.routeNamed);
                        Get.to(FundStatus());
                      },
                      child: Container(
                        width: 300,
                        height: 45,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        // decoration: BoxDecoration(
                        //     borderRadius:
                        //         BorderRadius.all(Radius.circular(25.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(7),
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: ThemeConstants.bluecolor,
                                  shape: BoxShape.circle),
                              child: svgImage("fund_status",
                                  ThemeConstants.whitecolor, 35, 35),

                              // SvgPicture.asset(
                              //   'assets/icons/fund_status.svg',
                              //   color: ThemeConstants.whitecolor,
                              // ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            CustomRichTextWidget(
                              text: '',
                              text1: "Funds Status",
                              fontWeight: FontWeight.w600,
                              textColor: ThemeConstants.bluecolor,
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // // InkWell(
                  //   onTap: () {
                  //     Get.toNamed(ReceiveACallBackView.routeNamed);
                  //   },
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(horizontal: 10),
                  //     width: 300,
                  //     height: 45,
                  //     decoration: BoxDecoration(
                  //         color: ThemeConstants.ultraLightgreyColor,
                  //         borderRadius:
                  //             BorderRadius.all(Radius.circular(25.0))),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         Container(
                  //           padding: EdgeInsets.all(7),
                  //           height: 35,
                  //           width: 35,
                  //           decoration: BoxDecoration(
                  //               color: ThemeConstants.bluecolor,
                  //               shape: BoxShape.circle),
                  //           child: SvgPicture.asset(
                  //             'assets/icons/call back icon.svg',
                  //             color: ThemeConstants.whitecolor,
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           width: 20,
                  //         ),
                  //         CustomAutoSizeTextMontserrat(
                  //             text: "Receive a call back"),
                  //         const Spacer(),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Material(
                  //   borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  //   color: ThemeConstants.ultraLightgreyColor,
                  //   child: InkWell(
                  //     borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  //     splashColor: ThemeConstants.bluecolor,
                  //     onTap: () async {
                  //       await Future.delayed(Duration(milliseconds: 150));
                  //       Get.toNamed(Suggestedimprovisation.routeNamed);
                  //     },
                  //     child: Container(
                  //       width: 300,
                  //       height: 45,
                  //       padding: EdgeInsets.symmetric(horizontal: 10),
                  //       // decoration: BoxDecoration(
                  //       //     borderRadius:
                  //       //         BorderRadius.all(Radius.circular(25.0))),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //           Container(
                  //             padding: EdgeInsets.all(7),
                  //             height: 35,
                  //             width: 35,
                  //             decoration: BoxDecoration(
                  //                 color: ThemeConstants.bluecolor,
                  //                 shape: BoxShape.circle),
                  //             child: SvgPicture.asset(
                  //               'assets/icons/feed back.svg',
                  //               color: ThemeConstants.whitecolor,
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             width: 20,
                  //           ),
                  //           CustomAutoSizeTextMontserrat(
                  //               text: "Track feedback"),
                  //           const Spacer(),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     Get.toNamed(ScheduleExpertCall.routeNamed);
                  //   },
                  //   child: Container(
                  //     width: 300,
                  //     height: 45,
                  //     padding: EdgeInsets.symmetric(horizontal: 10),
                  //     decoration: BoxDecoration(
                  //         color: ThemeConstants.ultraLightgreyColor,
                  //         borderRadius:
                  //             BorderRadius.all(Radius.circular(25.0))),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         Container(
                  //           padding: EdgeInsets.all(7),
                  //           height: 35,
                  //           width: 35,
                  //           decoration: BoxDecoration(
                  //               color: ThemeConstants.bluecolor,
                  //               shape: BoxShape.circle),
                  //           child: SvgPicture.asset(
                  //             'assets/icons/Calender icon.svg',
                  //             color: ThemeConstants.whitecolor,
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           width: 20,
                  //         ),
                  //         CustomAutoSizeTextMontserrat(
                  //             text: "Schedule an expert call"),
                  //         const Spacer(),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Material(
                  //   borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                  //   color: ThemeConstants.ultraLightgreyColor,
                  //   child: InkWell(
                  //     borderRadius:
                  //         const BorderRadius.all(Radius.circular(25.0)),
                  //     splashColor: ThemeConstants.bluecolor,
                  //     onTap: () async {
                  //       await Future.delayed(const Duration(milliseconds: 150));

                  //       _launchEmailURL();

                  //       // Get.toNamed(ScheduleExpertCall.routeNamed);
                  //     },
                  //     child: Container(
                  //       width: 300,
                  //       height: 50,
                  //       padding: const EdgeInsets.symmetric(
                  //           horizontal: 10, vertical: 5),
                  //       // decoration: BoxDecoration(
                  //       //     borderRadius:
                  //       //         BorderRadius.all(Radius.circular(25.0))),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //           Container(
                  //             padding: const EdgeInsets.all(7),
                  //             height: 35,
                  //             width: 35,
                  //             decoration: BoxDecoration(
                  //                 color: ThemeConstants.bluecolor,
                  //                 shape: BoxShape.circle),
                  //             child: SvgPicture.asset(
                  //               'assets/icons/mail.svg',
                  //               color: ThemeConstants.whitecolor,
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             width: 20,
                  //           ),
                  //           CustomAutoSizeTextMontserrat(
                  //               text: "Gradlynksupport\n@siecindia.com"),
                  //           const Spacer(),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     _launchURL2();
                  //   },
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(horizontal: 10),
                  //     width: 300,
                  //     height: 45,
                  //     decoration: BoxDecoration(
                  //         color: ThemeConstants.ultraLightgreyColor,
                  //         borderRadius:
                  //             BorderRadius.all(Radius.circular(25.0))),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         Container(
                  //           padding: EdgeInsets.all(7),
                  //           height: 35,
                  //           width: 35,
                  //           decoration: BoxDecoration(
                  //               color: ThemeConstants.bluecolor,
                  //               shape: BoxShape.circle),
                  //           child: SvgPicture.asset(
                  //             'assets/icons/SVO icon.svg',
                  //             color: ThemeConstants.whitecolor,
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           width: 20,
                  //         ),
                  //         CustomRichTextWidget(
                  //           text: 'SVO',
                  //           text1: "Join via ",
                  //           fontWeight: FontWeight.w600,
                  //           textColor: ThemeConstants.bluecolor,
                  //         ),
                  //         const Spacer(),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  // Material(
                  //   borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  //   color: ThemeConstants.ultraLightgreyColor,
                  //   child: InkWell(
                  //     borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  //     splashColor: ThemeConstants.bluecolor,
                  //     onTap: () async {
                  //       await Future.delayed(Duration(milliseconds: 150));

                  //       Get.toNamed(BookAnAppointment.routeNamed);
                  //     },
                  //     child: Container(
                  //       width: 300,
                  //       height: 45,
                  //       padding: EdgeInsets.symmetric(horizontal: 10),
                  //       // decoration: BoxDecoration(
                  //       //     borderRadius:
                  //       //         BorderRadius.all(Radius.circular(25.0))),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //           Container(
                  //             padding: EdgeInsets.all(7),
                  //             height: 35,
                  //             width: 35,
                  //             decoration: BoxDecoration(
                  //                 color: ThemeConstants.bluecolor,
                  //                 shape: BoxShape.circle),
                  //             child: SvgPicture.asset(
                  //               'assets/icons/Calender icon.svg',
                  //               color: ThemeConstants.whitecolor,
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             width: 20,
                  //           ),
                  //           CustomAutoSizeTextMontserrat(
                  //               text: "Book an appointment"),
                  //           const Spacer(),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ));
}

_launchURL() async {
  final call = Uri.parse('tel:+91 9779046382');
  if (await canLaunchUrl(call)) {
    launchUrl(call);
  } else {
    throw 'Could not launch $call';
  }
}

// _launchEmailURL() async {
//   final call = Uri.parse('mailto:gradlynksupport@siecindia.com');
//   if (await canLaunchUrl(call)) {
//     launchUrl(call);
//   } else {
//     throw 'Could not launch $call';
//   }
// }

_launchEmailURL() async {
  if (Platform.isAndroid) {
    final call = Uri.parse('mailto:gradlynksupport@siecindia.com');

    if (await canLaunchUrl(call)) {
      launchUrl(call);
    } else {
      getToast('Error i opening gmail');
    }
  } else {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'gradlynksupport@siecindia.com',
      query: '',
    );

    String url = params.toString();
    if (await canLaunchUrl(params)) {
      await launchUrl(params);
    } else {
      getToast('Error in opening mail');
    }
  }
}

_launchURL2() async {
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

eventZoneDrawerPopUp(
  BuildContext context,
  bool showMarkAttendence,
  bool showApplyForExpreesPass,
  bool showDowmloadExpreesPass,
) {
  return showAnimatedDialog(
      barrierDismissible: true,
      animationType: DialogTransitionType.slideFromBottomFade,
      curve: Curves.easeInOutQuart,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 200,
                          height: 35.0,
                          alignment: Alignment.centerLeft,
                          child: CustomAutoSizeTextMontserrat(
                            text: "Event Zone",
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            textColor: ThemeConstants.bluecolor,
                          )),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 25,
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
                    ],
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     _launchURL();
                  //   },
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(horizontal: 10),
                  //     width: 300,
                  //     height: 45,
                  //     decoration: BoxDecoration(
                  //         color: ThemeConstants.ultraLightgreyColor,
                  //         borderRadius:
                  //             BorderRadius.all(Radius.circular(25.0))),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         Container(
                  //             height: 35,
                  //             width: 35,
                  //             decoration: BoxDecoration(
                  //                 color: ThemeConstants.bluecolor,
                  //                 shape: BoxShape.circle),
                  //             child: Icon(
                  //               Icons.phone,
                  //               color: ThemeConstants.whitecolor,
                  //             )),
                  //         const SizedBox(
                  //           width: 20,
                  //         ),
                  //         CustomRichTextWidget(
                  //           text: '(+91 9779046382)',
                  //           text1: "Call Us ",
                  //           fontWeight: FontWeight.w600,
                  //           textColor: ThemeConstants.bluecolor,
                  //         ),
                  //         // CustomAutoSizeTextMontserrat(
                  //         //     text: "Call Us (+91 9779046382)"),
                  //         Spacer()
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  if (showMarkAttendence == true)
                    Material(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25.0)),
                      color: ThemeConstants.ultraLightgreyColor,
                      child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25.0)),
                        splashColor: ThemeConstants.bluecolor,
                        onTap: () async {
                          Get.to(CodeScreen());
                        },
                        child: Container(
                          width: 300,
                          height: 45,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          // decoration: BoxDecoration(
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(25.0))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(7),
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: ThemeConstants.bluecolor,
                                    shape: BoxShape.circle),
                                child: svgImage("Mark attendence",
                                    ThemeConstants.whitecolor, 35, 35),
                                //  SvgPicture.asset(
                                //   'assets/icons/Mark attendence.svg',
                                //   color: ThemeConstants.whitecolor,
                                // ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomRichTextWidget(
                                text: '',
                                text1: "Mark Attendance",
                                fontWeight: FontWeight.w600,
                                textColor: ThemeConstants.bluecolor,
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),

                  const SizedBox(
                    height: 10,
                  ),

                  if (showApplyForExpreesPass == true)
                    Material(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25.0)),
                      color: ThemeConstants.ultraLightgreyColor,
                      child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25.0)),
                        splashColor: ThemeConstants.bluecolor,
                        onTap: () async {
                          // await Future.delayed(
                          //     const Duration(milliseconds: 150));
                          // Get.toNamed(TrackyourTickets.routeNamed);
                          Get.to(IntakeScreen());
                        },
                        child: Container(
                          width: 300,
                          height: 45,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          // decoration: BoxDecoration(
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(25.0))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(7),
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: ThemeConstants.bluecolor,
                                    shape: BoxShape.circle),
                                child: svgImage("Express entry",
                                    ThemeConstants.whitecolor, 35, 35),
                                // SvgPicture.asset(
                                //   'assets/icons/Express entry.svg',
                                //   color: ThemeConstants.whitecolor,
                                // ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              CustomRichTextWidget(
                                text: '',
                                text1: "Apply for Express Pass",
                                fontWeight: FontWeight.w600,
                                textColor: ThemeConstants.bluecolor,
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // // InkWell(
                  //   onTap: () {
                  //     Get.toNamed(ReceiveACallBackView.routeNamed);
                  //   },
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(horizontal: 10),
                  //     width: 300,
                  //     height: 45,
                  //     decoration: BoxDecoration(
                  //         color: ThemeConstants.ultraLightgreyColor,
                  //         borderRadius:
                  //             BorderRadius.all(Radius.circular(25.0))),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         Container(
                  //           padding: EdgeInsets.all(7),
                  //           height: 35,
                  //           width: 35,
                  //           decoration: BoxDecoration(
                  //               color: ThemeConstants.bluecolor,
                  //               shape: BoxShape.circle),
                  //           child: SvgPicture.asset(
                  //             'assets/icons/call back icon.svg',
                  //             color: ThemeConstants.whitecolor,
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           width: 20,
                  //         ),
                  //         CustomAutoSizeTextMontserrat(
                  //             text: "Receive a call back"),
                  //         const Spacer(),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Material(
                  //   borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  //   color: ThemeConstants.ultraLightgreyColor,
                  //   child: InkWell(
                  //     borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  //     splashColor: ThemeConstants.bluecolor,
                  //     onTap: () async {
                  //       await Future.delayed(Duration(milliseconds: 150));
                  //       Get.toNamed(Suggestedimprovisation.routeNamed);
                  //     },
                  //     child: Container(
                  //       width: 300,
                  //       height: 45,
                  //       padding: EdgeInsets.symmetric(horizontal: 10),
                  //       // decoration: BoxDecoration(
                  //       //     borderRadius:
                  //       //         BorderRadius.all(Radius.circular(25.0))),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //           Container(
                  //             padding: EdgeInsets.all(7),
                  //             height: 35,
                  //             width: 35,
                  //             decoration: BoxDecoration(
                  //                 color: ThemeConstants.bluecolor,
                  //                 shape: BoxShape.circle),
                  //             child: SvgPicture.asset(
                  //               'assets/icons/feed back.svg',
                  //               color: ThemeConstants.whitecolor,
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             width: 20,
                  //           ),
                  //           CustomAutoSizeTextMontserrat(
                  //               text: "Track feedback"),
                  //           const Spacer(),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     Get.toNamed(ScheduleExpertCall.routeNamed);
                  //   },
                  //   child: Container(
                  //     width: 300,
                  //     height: 45,
                  //     padding: EdgeInsets.symmetric(horizontal: 10),
                  //     decoration: BoxDecoration(
                  //         color: ThemeConstants.ultraLightgreyColor,
                  //         borderRadius:
                  //             BorderRadius.all(Radius.circular(25.0))),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         Container(
                  //           padding: EdgeInsets.all(7),
                  //           height: 35,
                  //           width: 35,
                  //           decoration: BoxDecoration(
                  //               color: ThemeConstants.bluecolor,
                  //               shape: BoxShape.circle),
                  //           child: SvgPicture.asset(
                  //             'assets/icons/Calender icon.svg',
                  //             color: ThemeConstants.whitecolor,
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           width: 20,
                  //         ),
                  //         CustomAutoSizeTextMontserrat(
                  //             text: "Schedule an expert call"),
                  //         const Spacer(),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  Material(
                    borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                    color: ThemeConstants.ultraLightgreyColor,
                    child: InkWell(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25.0)),
                      splashColor: ThemeConstants.bluecolor,
                      onTap: () async {
                        Get.back();

                        showAnimatedDialog(
                            animationType:
                                DialogTransitionType.slideFromBottomFade,
                            curve: Curves.easeInOutQuart,
                            context: Get.context!,
                            builder: ((context) {
                              return AlertDialog(
                                contentPadding: const EdgeInsets.all(5),
                                content: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: EventDeskListWidget()),
                              );
                            }));
                      },
                      child: Container(
                        width: 300,
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // decoration: BoxDecoration(
                        //     borderRadius:
                        //         BorderRadius.all(Radius.circular(25.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                padding: const EdgeInsets.all(7),
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: ThemeConstants.bluecolor,
                                    shape: BoxShape.circle),
                                child: svgImage("Check box list",
                                    ThemeConstants.whitecolor, 80, 80)),
                            const SizedBox(
                              width: 20,
                            ),
                            CustomRichTextWidget(
                                fontWeight: FontWeight.w600,
                                textColor: ThemeConstants.bluecolor,
                                text: "Event Visit Sheet"),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  if (showDowmloadExpreesPass == true)
                    Material(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25.0)),
                      color: ThemeConstants.ultraLightgreyColor,
                      child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25.0)),
                        splashColor: ThemeConstants.bluecolor,
                        onTap: () async {
                          // await Future.delayed(
                          //     const Duration(milliseconds: 150));

                          // _launchEmailURL();

                          // Get.toNamed(ScheduleExpertCall.routeNamed);
                          Get.to(CustomImageViewer(
                              url: Get.find<BaseController>()
                                  .meetingZoneStatus
                                  .expressPassView
                                  .toString()));
                        },
                        child: Container(
                          width: 300,
                          height: 50,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          // decoration: BoxDecoration(
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(25.0))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(7),
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: ThemeConstants.bluecolor,
                                      shape: BoxShape.circle),
                                  child: svgImage("create_profile",
                                      ThemeConstants.whitecolor, 80, 80)),
                              const SizedBox(
                                width: 20,
                              ),
                              CustomRichTextWidget(
                                  fontWeight: FontWeight.w600,
                                  textColor: ThemeConstants.bluecolor,
                                  text: "View Express Pass"),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ), // InkWell(
                  //   onTap: () {
                  //     _launchURL2();
                  //   },
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(horizontal: 10),
                  //     width: 300,
                  //     height: 45,
                  //     decoration: BoxDecoration(
                  //         color: ThemeConstants.ultraLightgreyColor,
                  //         borderRadius:
                  //             BorderRadius.all(Radius.circular(25.0))),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         Container(
                  //           padding: EdgeInsets.all(7),
                  //           height: 35,
                  //           width: 35,
                  //           decoration: BoxDecoration(
                  //               color: ThemeConstants.bluecolor,
                  //               shape: BoxShape.circle),
                  //           child: SvgPicture.asset(
                  //             'assets/icons/SVO icon.svg',
                  //             color: ThemeConstants.whitecolor,
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           width: 20,
                  //         ),
                  //         CustomRichTextWidget(
                  //           text: 'SVO',
                  //           text1: "Join via ",
                  //           fontWeight: FontWeight.w600,
                  //           textColor: ThemeConstants.bluecolor,
                  //         ),
                  //         const Spacer(),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  // Material(
                  //   borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  //   color: ThemeConstants.ultraLightgreyColor,
                  //   child: InkWell(
                  //     borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  //     splashColor: ThemeConstants.bluecolor,
                  //     onTap: () async {
                  //       await Future.delayed(Duration(milliseconds: 150));

                  //       Get.toNamed(BookAnAppointment.routeNamed);
                  //     },
                  //     child: Container(
                  //       width: 300,
                  //       height: 45,
                  //       padding: EdgeInsets.symmetric(horizontal: 10),
                  //       // decoration: BoxDecoration(
                  //       //     borderRadius:
                  //       //         BorderRadius.all(Radius.circular(25.0))),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //           Container(
                  //             padding: EdgeInsets.all(7),
                  //             height: 35,
                  //             width: 35,
                  //             decoration: BoxDecoration(
                  //                 color: ThemeConstants.bluecolor,
                  //                 shape: BoxShape.circle),
                  //             child: SvgPicture.asset(
                  //               'assets/icons/Calender icon.svg',
                  //               color: ThemeConstants.whitecolor,
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             width: 20,
                  //           ),
                  //           CustomAutoSizeTextMontserrat(
                  //               text: "Book an appointment"),
                  //           const Spacer(),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ));
}
