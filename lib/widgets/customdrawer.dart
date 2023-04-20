import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nice_loading_button/nice_loading_button.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/screen/Visa/visasummary.dart';
import 'package:studentpanel/ui/screen/Profile_Module/profilepage.dart';
import 'package:studentpanel/ui/screen/My_Application/applicationsummary.dart';
import 'package:studentpanel/ui/screen/countryGuide/countryguide.dart';
import 'package:studentpanel/ui/screen/course_search/coursesearch.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/ui/screen/course_search/finalshortlist.dart';
import 'package:studentpanel/ui/screen/course_search/reviewshortlist.dart';
import 'package:studentpanel/ui/screen/gradlynk_support/raise_new_ticket.dart';
import 'package:studentpanel/ui/screen/gradlynk_support/suggestedimprovisation.dart';
import 'package:studentpanel/ui/screen/gradlynk_support/track_your_tickets.dart';
import 'package:studentpanel/ui/screen/test/stage_profilemodule.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CustomDrawer extends StatelessWidget {
  int? index;
  CustomDrawer({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 240,
        child: Container(
          color: ThemeConstants.whitecolor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView(controller: ScrollController(), children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: 150,
                        height: 50,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70, right: 70),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: CustomAutoSizeTextMontserrat(
                        text: firstLetterChaptial(
                            Get.find<BaseController>().model1.enquiryName),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Center(
                    //     child: Container(
                    //   margin: const EdgeInsets.symmetric(vertical: 5),
                    //   width: 200,
                    //   height: 8,
                    //   child: ClipRRect(
                    //     borderRadius:
                    //         const BorderRadius.all(Radius.circular(10)),
                    //     child: LinearProgressIndicator(
                    //       value: 0.7,
                    //       valueColor:
                    //           AlwaysStoppedAnimation(ThemeConstants.GreenColor),
                    //       backgroundColor: const Color(0xffD6D6D6),
                    //     ),
                    //   ),
                    // )),

                    // Center(
                    //   child: CustomAutoSizeTextMontserrat(
                    //     text: "Profile: 70% complete",
                    //     fontSize: 14,
                    //     textColor: ThemeConstants.TextColor,
                    //     fontWeight: FontWeight.w500,
                    //   ),
                    // ),

                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: InkWell(
                            highlightColor: ThemeConstants.whitecolor,
                            onTap: () {
                              Get.deleteAll();
                              Get.toNamed(DashBoard.routeNamed);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: index == 0
                                        ? ThemeConstants.lightblueColor
                                        : ThemeConstants.whitecolor,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 5),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "My DashBoard",
                                    textColor: index == 0
                                        ? ThemeConstants.bluecolor
                                        : ThemeConstants.blackcolor,
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: InkWell(
                            highlightColor: ThemeConstants.whitecolor,
                            onTap: () {
                              Get.deleteAll();
                              Get.toNamed(ProfilePageCopy.routeNamed);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: index == 1
                                        ? ThemeConstants.lightblueColor
                                        : ThemeConstants.whitecolor,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 5),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Profile",
                                    textColor: index == 1
                                        ? ThemeConstants.bluecolor
                                        : ThemeConstants.blackcolor,
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: InkWell(
                            highlightColor: ThemeConstants.whitecolor,
                            onTap: () {
                              Get.deleteAll();
                              Get.toNamed(ApplicationSummary.routeNamed);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: index == 2
                                        ? ThemeConstants.lightblueColor
                                        : ThemeConstants.whitecolor,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 5),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Track Application",
                                    textColor: index == 2
                                        ? ThemeConstants.bluecolor
                                        : ThemeConstants.blackcolor,
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: InkWell(
                            highlightColor: ThemeConstants.whitecolor,
                            onTap: () {
                              Get.deleteAll();
                              Get.toNamed(CourseSearch.routeNamed);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: index == 3
                                        ? ThemeConstants.lightblueColor
                                        : ThemeConstants.whitecolor,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 5),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Course Search",
                                    textColor: index == 3
                                        ? ThemeConstants.bluecolor
                                        : ThemeConstants.blackcolor,
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: InkWell(
                            highlightColor: ThemeConstants.whitecolor,
                            onTap: () {
                              Get.deleteAll();
                              Get.toNamed(ReviewShortList.routeNamed);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: index == 4
                                        ? ThemeConstants.lightblueColor
                                        : ThemeConstants.whitecolor,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 5),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Review Course",
                                    textColor: index == 4
                                        ? ThemeConstants.bluecolor
                                        : ThemeConstants.blackcolor,
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: InkWell(
                            highlightColor: ThemeConstants.whitecolor,
                            onTap: () {
                              Get.deleteAll();
                              Get.toNamed(FinalShortList.routeNamed);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: index == 5
                                        ? ThemeConstants.lightblueColor
                                        : ThemeConstants.whitecolor,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 5),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Final Course",
                                    textColor: index == 5
                                        ? ThemeConstants.bluecolor
                                        : ThemeConstants.blackcolor,
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 20),
                    //   child: Align(
                    //       alignment: AlignmentDirectional.topStart,
                    //       child: InkWell(
                    //         highlightColor: ThemeConstants.whitecolor,
                    //         onTap: () {
                    //           Get.deleteAll();
                    //           Get.toNamed(VisaSummary.routeNamed);
                    //         },
                    //         child: Padding(
                    //           padding: const EdgeInsets.only(right: 10),
                    //           child: Container(
                    //             height: 30,
                    //             width: MediaQuery.of(context).size.width,
                    //             decoration: BoxDecoration(
                    //                 color: index == 6
                    //                     ? ThemeConstants.lightblueColor
                    //                     : ThemeConstants.whitecolor,
                    //                 borderRadius: BorderRadius.circular(10.0)),
                    //             child: Padding(
                    //               padding:
                    //                   const EdgeInsets.only(left: 10, top: 5),
                    //               child: CustomAutoSizeTextMontserrat(
                    //                 text: "My Visa",
                    //                 textColor: index == 6
                    //                     ? ThemeConstants.bluecolor
                    //                     : ThemeConstants.blackcolor,
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       )),
                    // ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: InkWell(
                            highlightColor: ThemeConstants.whitecolor,
                            onTap: () {
                              Get.deleteAll();
                              Get.toNamed(StageProgress.routeNamed);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: index == 7
                                        ? ThemeConstants.lightblueColor
                                        : ThemeConstants.whitecolor,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 5),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Processes",
                                    textColor: index == 7
                                        ? ThemeConstants.bluecolor
                                        : ThemeConstants.blackcolor,
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: InkWell(
                            highlightColor: ThemeConstants.whitecolor,
                            onTap: () {
                              Get.deleteAll();
                              Get.toNamed(CountryGuide.routeNamed);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: index == 8
                                        ? ThemeConstants.lightblueColor
                                        : ThemeConstants.whitecolor,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 5),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Country Guide",
                                    textColor: index == 8
                                        ? ThemeConstants.bluecolor
                                        : ThemeConstants.blackcolor,
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 20),
                    //   child: Align(
                    //       alignment: AlignmentDirectional.topStart,
                    //       child: InkWell(
                    //         highlightColor: ThemeConstants.whitecolor,
                    //         onTap: () {},
                    //         child: Padding(
                    //           padding: const EdgeInsets.only(right: 10),
                    //           child: Container(
                    //             height: 30,
                    //             width: MediaQuery.of(context).size.width,
                    //             decoration: BoxDecoration(
                    //                 color: index == 9
                    //                     ? ThemeConstants.lightblueColor
                    //                     : ThemeConstants.whitecolor,
                    //                 borderRadius: BorderRadius.circular(10.0)),
                    //             child: Padding(
                    //               padding:
                    //                   const EdgeInsets.only(left: 10, top: 5),
                    //               child: CustomAutoSizeTextMontserrat(
                    //                 text: "Pre Depature Kit",
                    //                 textColor: index == 9
                    //                     ? ThemeConstants.bluecolor
                    //                     : ThemeConstants.blackcolor,
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       )),
                    // ),

                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: ConfigurableExpansionTile(
                          borderColorEnd: Colors.transparent,
                          bottomBorderOn: false,
                          header: SizedBox(
                            width: 220,
                            height: 40,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Gradlynk Support",
                                  ),
                                ),
                                const Spacer(),
                                // const Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: ConfigurableExpansionTile(
                                borderColorEnd: Colors.transparent,
                                bottomBorderOn: false,
                                header: SizedBox(
                                  width: 210,
                                  height: 40,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: CustomAutoSizeTextMontserrat(
                                          text: "Track your ticket",
                                        ),
                                      ),
                                      const Spacer(),
                                      // const Icon(Icons.keyboard_arrow_down),
                                    ],
                                  ),
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: Align(
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        child: InkWell(
                                          highlightColor:
                                              ThemeConstants.whitecolor,
                                          onTap: () {
                                            Get.deleteAll();
                                            Get.toNamed(
                                                TrackyourTickets.routeNamed);
                                          },
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(right: 0),
                                            child: Container(
                                              height: 30,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                  color: index == 10
                                                      ? ThemeConstants
                                                          .lightblueColor
                                                      : ThemeConstants
                                                          .whitecolor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 0, top: 5),
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Track Issue ",
                                                  textColor: index == 10
                                                      ? ThemeConstants.bluecolor
                                                      : ThemeConstants
                                                          .blackcolor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: Align(
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        child: InkWell(
                                          highlightColor:
                                              ThemeConstants.whitecolor,
                                          onTap: () {
                                            Get.deleteAll();
                                            Get.toNamed(Suggestedimprovisation
                                                .routeNamed);
                                          },
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(right: 0),
                                            child: Container(
                                              height: 30,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                  color: index == 11
                                                      ? ThemeConstants
                                                          .lightblueColor
                                                      : ThemeConstants
                                                          .whitecolor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 0, top: 5),
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: "Track Improvisation",
                                                  textColor: index == 11
                                                      ? ThemeConstants.bluecolor
                                                      : ThemeConstants
                                                          .blackcolor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: InkWell(
                                    highlightColor: ThemeConstants.whitecolor,
                                    onTap: () {
                                      Get.deleteAll();
                                      Get.toNamed(RaiseYourTicket.routeNamed);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 00),
                                      child: Container(
                                        height: 30,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: index == 12
                                                ? ThemeConstants.lightblueColor
                                                : ThemeConstants.whitecolor,
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 00, top: 5),
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Raise new ticket",
                                            textColor: index == 12
                                                ? ThemeConstants.bluecolor
                                                : ThemeConstants.blackcolor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 20),
                      child: Center(
                        child: LoadingButton(
                          height: 35,
                          borderRadius: 8,
                          animate: true,
                          color: Colors.indigo,
                          width: 120,
                          loader: Container(
                            padding: const EdgeInsets.all(10),
                            width: 30,
                            height: 30,
                            child: const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ),
                          child: CustomAutoSizeTextMontserrat(
                            text: "Logout",
                            textColor: ThemeConstants.whitecolor,
                          ),
                          onTap:
                              (startLoading, stopLoading, buttonState) async {
                            if (buttonState == ButtonState.idle) {
                              startLoading();
                              // Do something here
                              Get.deleteAll();
                              await Get.find<BaseController>().logout();
                              stopLoading();
                            }
                          },
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}
