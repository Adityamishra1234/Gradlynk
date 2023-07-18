import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/screen/mark_attendance/afterIntakePassView.dart';
import 'package:studentpanel/ui/screen/mark_attendance/intake_screen.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/custom_image_viewer.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import '../ui/screen/mark_attendance/code_screen.dart';

class DashboardEventSection extends StatelessWidget {
  const DashboardEventSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            // padding:
            //     const EdgeInsets.only(left: 20, right: 10, top: 30, bottom: 20),
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: ThemeConstants.whitecolor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 4,
                      spreadRadius: 0,
                      color: Color.fromARGB(20, 0, 0, 0))
                ]),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 130,
                      height: 190,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: Image.asset(
                              'assets/icons/event-zone.gif',
                              gaplessPlayback: false,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      // height: 180,
                      alignment: Alignment.center,
                      // color: ThemeConstants.GreenColor,
                      width: MediaQuery.of(context).size.width - 200,
                      child: Wrap(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runAlignment: WrapAlignment.center,
                        spacing: 10,
                        runSpacing: 20,
                        children: [
                          if (Get.find<BaseController>()
                                  .meetingZoneStatus
                                  .markAttendance ==
                              true)
                            InkWell(
                              onTap: () {
                                Get.to(CodeScreen());
                              },
                              child: Column(
                                children: [
                                  Container(
                                    constraints: const BoxConstraints(
                                        maxHeight: 60, maxWidth: 60),
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFF1F0FF),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: svgImage("Mark attendence",
                                        ThemeConstants.VioletColor, 30, 30),

                                    // SvgPicture.asset(
                                    //   "assets/icons/Mark attendence.svg",
                                    //   color: ThemeConstants.VioletColor,
                                    // )
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: SizedBox(
                                      width: 80,
                                      child: CustomAutoSizeTextMontserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        text: "Mark Attendance",
                                        textalingCentre: true,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),

                          //todo
                          InkWell(
                            onTap: () {
                              Get.to(AfterIntakeScreenView());
                            },
                            child: Column(
                              children: [
                                Container(
                                  constraints: const BoxConstraints(
                                      maxHeight: 60, maxWidth: 60),
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFF1F0FF),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: svgImage("Mark attendence",
                                      ThemeConstants.VioletColor, 30, 30),

                                  // SvgPicture.asset(
                                  //   "assets/icons/Mark attendence.svg",
                                  //   color: ThemeConstants.VioletColor,
                                  // )
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                    width: 80,
                                    child: CustomAutoSizeTextMontserrat(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      text: "Mark Attendance",
                                      textalingCentre: true,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          if (Get.find<BaseController>()
                                  .meetingZoneStatus
                                  .expressPass ==
                              true)
                            InkWell(
                              onTap: () {
                                Get.to(IntakeScreen());
                              },
                              child: Column(
                                children: [
                                  Container(
                                    constraints: const BoxConstraints(
                                        maxHeight: 60, maxWidth: 60),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: ThemeConstants.lightYellow,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    child: svgImage("Express entry",
                                        ThemeConstants.orangeColor, 30, 30),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: SizedBox(
                                      width: 100,
                                      child: CustomAutoSizeTextMontserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        text: "Apply For Express Pass",
                                        textalingCentre: true,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          if (Get.find<BaseController>()
                                  .meetingZoneStatus
                                  .expressPassGenerated ==
                              true)
                            InkWell(
                              onTap: () {
                                try {
                                  Get.to(CustomImageViewer(
                                    url: Get.find<BaseController>()
                                        .meetingZoneStatus
                                        .expressPassView!,
                                  ));
                                } catch (e) {}
                              },
                              child: Column(
                                children: [
                                  Container(
                                      constraints: const BoxConstraints(
                                          maxHeight: 50, maxWidth: 120),
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          // border: Border.all(
                                          //     width: 1.2,
                                          //     color: ThemeConstants
                                          //         .VioletColor),
                                          color: ThemeConstants.lightRed,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20))),
                                      child: svgImage("create_profile",
                                          ThemeConstants.red, 80, 80)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: SizedBox(
                                      width: 100,
                                      child: CustomAutoSizeTextMontserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        text: "View Express Pass",
                                        textalingCentre: true,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                        ],
                      )),
                ]),
          ),
          Positioned(
              top: 0,
              left: 25,
              child: Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                // height: 35,
                decoration: BoxDecoration(
                    color: ThemeConstants.bluecolor,
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(width: 1, color: ThemeConstants.bluecolor)),
                child: CustomAutoSizeTextMontserrat(
                  fontSize: 12,
                  text: 'Event Zone',
                  textColor: ThemeConstants.whitecolor,
                  fontWeight: FontWeight.w600,
                ),
              )),
          Positioned(
            top: 0,
            right: 15,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Image.asset(
                'assets/images/new.png',
                gaplessPlayback: false,
                width: 35,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
    );
  }
}
