import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/ui/screen/fund/fund_requiremen.dart';
import 'package:studentpanel/ui/screen/mark_attendance/eventdocumentupload.dart';
import 'package:studentpanel/ui/screen/mark_attendance/markAttendanceDocumentStatus.dart';
import 'package:studentpanel/ui/screen/mark_attendance/mark_attendance_controller.dart';
import 'package:studentpanel/ui/screen/mark_attendance/model/mark_attendance_intake.dart';
import 'package:studentpanel/ui/screen/upload_document/uploaddocument.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customRichTextWidget.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/loading_button.dart';

class AfterIntakeScreenView extends StatelessWidget {
  AfterIntakeScreenView({super.key});

  var controller = Get.put(MarkAttendanceController());

  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;
    return Scaffold(
      backgroundColor: ThemeConstants.whitecolor,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                  //  constraints: BoxConstraints( minHeight:  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ThemeConstants.whitecolor,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(29, 0, 0, 0),
                            blurRadius: 2,
                            spreadRadius: 2)
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomAutoSizeTextMontserrat(
                          textalingCentre: true,
                          textColor: ThemeConstants.blackcolor,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          text: "Skip the long Queues and avail for"),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CustomRichTextWidget(
                            firstTextColor: ThemeConstants.blackcolor,
                            customMiddleTextStyle: GoogleFonts.dancingScript(
                                textStyle: const TextStyle()),
                            // text1: '',
                            // text3: 'has been generated in the View Express Pass Section.',
                            textColor: const Color(0xFFebaa2b),
                            fontSize: 25,
                            text:
                                //"${arguments.studentCategory ?? ""}"),
                                "Platinum Express Pass"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomAutoSizeTextMontserrat(
                          textalingCentre: true,
                          textColor: ThemeConstants.blackcolor,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          text: "By Uploading your Documents."),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Get.offAndToNamed(EventDocumentUpload.routeNamed);
                          // Get.to(UploadDocument(is_event: true), arguments: 1);
                        },
                        child: CustomIconTextTogether(
                          text: 'Upload Document',
                          iconBeforetext: true,
                          color: ThemeConstants.red,
                          Bgcolor: ThemeConstants.whitecolor,
                          iconData: Icon(
                            Icons.upload,
                            color: ThemeConstants.red,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomAutoSizeTextMontserrat(
                          textalingCentre: true,
                          textColor: ThemeConstants.blackcolor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          text: "or"),
                      const SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () {
                          getToast(
                              'Your pass will be generated once you submit the document at the event');
                          Get.offAndToNamed(DashBoard.routeNamed);
                        },
                        child: CustomIconTextTogether(
                          text: 'Submit To Siec Desk',
                          iconBeforetext: true,
                          color: ThemeConstants.GreenColor,
                          Bgcolor: ThemeConstants.whitecolor,
                          iconData: Icon(
                            Icons.telegram_outlined,
                            color: ThemeConstants.GreenColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomAutoSizeTextMontserrat(
                          textalingCentre: true,
                          textColor: ThemeConstants.blackcolor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          text: "or"),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomLoadingButton(
                          width: 200,
                          buttonName: "Continue with Gold Pass",
                          onTap: ((p0, p1, p2) async {
                            p0();
                            await controller.documentNotSubmi(arguments);
                            await Get.find<BaseController>().eventZone(
                                Get.find<BaseController>()
                                    .model1
                                    .id
                                    .toString());
                            Get.offAndToNamed(DashBoard.routeNamed);
                            getToast(
                                'Your pass is accessible in View Express Pass Section');
                            p1();
                          })),

                      // InkWell(
                      //   onTap: () async {},
                      //   child: CustomIconTextTogether(
                      //     text: 'Continue with Gold Pass',
                      //     iconBeforetext: true,
                      //     color: ThemeConstants.blackcolor,
                      //     Bgcolor: ThemeConstants.whitecolor,
                      //     iconData: Icon(
                      //       Icons.upload,
                      //       color: ThemeConstants.whitecolor,
                      //     ),
                      //   ),
                      // ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
