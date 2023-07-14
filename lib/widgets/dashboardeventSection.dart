import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/mark_attendance/intake_screen.dart';
import 'package:studentpanel/utils/theme.dart';
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
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 150,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 15),
                          //   child: CustomAutoSizeTextMontserrat(
                          //     text: '22 July',
                          //     textColor: ThemeConstants.bluecolor,
                          //     fontSize: 30,
                          //   ),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 15),
                          //   child: CustomAutoSizeTextMontserrat(
                          //     text: '2023',
                          //     textColor: ThemeConstants.bluecolor,
                          //     fontSize: 25,
                          //   ),
                          // ),
                          // const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Image.asset(
                              'assets/images/calender.png',
                            ),
                          ),
                        ],
                      )),
                  Container(
                      // height: 180,
                      alignment: Alignment.center,
                      // color: ThemeConstants.GreenColor,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        runAlignment: WrapAlignment.center,
                        spacing: 5,
                        runSpacing: 10,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(CodeScreen());
                            },
                            child: Column(
                              children: [
                                Container(
                                    constraints: const BoxConstraints(
                                        maxHeight: 70, maxWidth: 70),
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFF1F0FF),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: SvgPicture.asset(
                                      "assets/icons/Mark attendence.svg",
                                      color: ThemeConstants.VioletColor,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                    width: 100,
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

                          InkWell(
                            onTap: () {
                              Get.to(IntakeScreen());
                            },
                            child: Column(
                              children: [
                                Container(
                                    constraints: const BoxConstraints(
                                        maxHeight: 70, maxWidth: 70),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: ThemeConstants.lightYellow,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    child: SvgPicture.asset(
                                      "assets/icons/Express entry.svg",
                                      color: ThemeConstants.yellow,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                    width: 100,
                                    child: CustomAutoSizeTextMontserrat(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      text: "Express Pass",
                                      textalingCentre: true,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(CodeScreen());
                            },
                            child: Column(
                              children: [
                                Container(
                                    constraints: const BoxConstraints(
                                        maxHeight: 70, maxWidth: 70),
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFF1F0FF),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: SvgPicture.asset(
                                      "assets/icons/Mark attendence.svg",
                                      color: ThemeConstants.VioletColor,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                    width: 100,
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
                          // Column(
                          //   children: [
                          //     Container(
                          //         constraints: const BoxConstraints(
                          //             maxHeight: 70, maxWidth: 70),
                          //         padding: const EdgeInsets.all(10),
                          //         decoration: const BoxDecoration(
                          //             // border: Border.all(
                          //             //     width: 1.2,
                          //             //     color: ThemeConstants
                          //             //         .VioletColor),
                          //             color: Color(0xFFF1F0FF),
                          //             borderRadius: BorderRadius.all(
                          //                 Radius.circular(20))),
                          //         child: svgImage("create_profile",
                          //             const Color(0xFF6F61FF), 80, 80)),
                          //     Padding(
                          //       padding: const EdgeInsets.only(top: 10),
                          //       child: SizedBox(
                          //         width: 100,
                          //         child: CustomAutoSizeTextMontserrat(
                          //           fontWeight: FontWeight.w500,
                          //           fontSize: 13,
                          //           text: "Create your profile",
                          //           textalingCentre: true,
                          //         ),
                          //       ),
                          //     )
                          //   ],
                          // ),
                          // Column(
                          //   children: [
                          //     Container(
                          //         constraints: const BoxConstraints(
                          //             maxHeight: 70, maxWidth: 70),
                          //         padding: const EdgeInsets.all(10),
                          //         decoration: const BoxDecoration(
                          //             // border: Border.all(
                          //             //     width: 1.2,
                          //             //     color: ThemeConstants
                          //             //         .VioletColor),
                          //             color: Color(0xFFF1F0FF),
                          //             borderRadius: BorderRadius.all(
                          //                 Radius.circular(20))),
                          //         child: svgImage("create_profile",
                          //             const Color(0xFF6F61FF), 80, 80)),
                          //     Padding(
                          //       padding: const EdgeInsets.only(top: 10),
                          //       child: SizedBox(
                          //         width: 100,
                          //         child: CustomAutoSizeTextMontserrat(
                          //           fontWeight: FontWeight.w500,
                          //           fontSize: 13,
                          //           text: "Create your profile",
                          //           textalingCentre: true,
                          //         ),
                          //       ),
                          //     )
                          //   ],
                          // ),
                          // // Container(
                          //   constraints: BoxConstraints(maxHeight: 70, maxWidth: 70),
                          //   padding: const EdgeInsets.all(12),
                          //   decoration: const BoxDecoration(
                          //       // border: Border.all(
                          //       //     width: 1.2,
                          //       //     color: const Color(
                          //       //         0xFF05B4D2)),
                          //       color: Color(0xFFE8FAFD),
                          //       borderRadius: BorderRadius.all(Radius.circular(20))),
                          //   child: svgImage("track", const Color(0xFF05B4D2), 80, 80),
                          // ),
                          // Container(
                          //   constraints: BoxConstraints(maxHeight: 70, maxWidth: 70),
                          //   padding: const EdgeInsets.all(12),
                          //   decoration: const BoxDecoration(
                          //       // border: Border.all(
                          //       //     width: 1.2,
                          //       //     color: const Color(
                          //       //         0xFF05B4D2)),
                          //       color: Color(0xFFE8FAFD),
                          //       borderRadius: BorderRadius.all(Radius.circular(20))),
                          //   child: svgImage("track", const Color(0xFF05B4D2), 80, 80),
                          // ),
                          // Container(
                          //   constraints: BoxConstraints(maxHeight: 70, maxWidth: 70),
                          //   padding: const EdgeInsets.all(12),
                          //   decoration: const BoxDecoration(
                          //       // border: Border.all(
                          //       //     width: 1.2,
                          //       //     color: const Color(
                          //       //         0xFF05B4D2)),
                          //       color: Color(0xFFE8FAFD),
                          //       borderRadius: BorderRadius.all(Radius.circular(20))),
                          //   child: svgImage("track", const Color(0xFF05B4D2), 80, 80),
                          // ),
                          // Container(
                          //   constraints: BoxConstraints(maxHeight: 70, maxWidth: 70),
                          //   padding: const EdgeInsets.all(12),
                          //   decoration: const BoxDecoration(
                          //       // border: Border.all(
                          //       //     width: 1.2,
                          //       //     color: const Color(
                          //       //         0xFF05B4D2)),
                          //       color: Color(0xFFE8FAFD),
                          //       borderRadius: BorderRadius.all(Radius.circular(20))),
                          //   child: svgImage("track", const Color(0xFF05B4D2), 80, 80),
                          // ),
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
        ],
      ),
    );
  }
}
