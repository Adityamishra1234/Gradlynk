import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/profilepagecontroller.dart';
import 'package:studentpanel/ui/screen/ModificationUi/contactinformation.dart';
import 'package:studentpanel/ui/screen/ModificationUi/courseinformation.dart';
import 'package:studentpanel/ui/screen/ModificationUi/passportdetails.dart';
import 'package:studentpanel/ui/screen/ModificationUi/qualificationdetails.dart';
import 'package:studentpanel/ui/screen/ModificationUi/relativeinformation.dart';
import 'package:studentpanel/ui/screen/ModificationUi/travinghistory.dart';
import 'package:studentpanel/ui/screen/ModificationUi/travinghistoryview.dart';
import 'package:studentpanel/ui/screen/ModificationUi/workhistory.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

class ProfilePageCopy extends StatelessWidget {
  ProfilePageCopy({Key? key}) : super(key: key);
  static const routeNamed = '/ProfilePageCopy';
  ScrollController controller = ScrollController();
  ScrollPhysics scrollPhysics = ScrollPhysics();
  var profilePageController = Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar("title"),
        drawer: CustomDrawer(),
        body: GetBuilder<ProfilePageController>(
          builder: (_) => Container(
              color: ThemeConstants.whitecolor,
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 85,
                    child: Stack(
                      children: [
                        ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 2,
                            controller: controller,
                            itemBuilder: (BuildContext context, int index) {
                              if (index == 0) {
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Stack(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  _.getChooseIndex(0.obs);
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          _.chooseIndex!
                                                                      .value ==
                                                                  0
                                                              ? ThemeConstants
                                                                  .bluecolor
                                                              : ThemeConstants
                                                                  .whitecolor,
                                                      border: Border.all(),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0)),
                                                  child: Row(
                                                    children: [
                                                      const Spacer(),
                                                      CustomAutoSizeTextMontserrat(
                                                        text: "Personal ",
                                                        fontSize: 12,
                                                        textColor: _.chooseIndex!
                                                                    .value ==
                                                                0
                                                            ? ThemeConstants
                                                                .whitecolor
                                                            : ThemeConstants
                                                                .TextColor,
                                                      ),
                                                      // const Icon(Icons.abc_outlined),
                                                      const Spacer(),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  _.getChooseIndex(1.obs);
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          _.chooseIndex!
                                                                      .value ==
                                                                  1
                                                              ? ThemeConstants
                                                                  .bluecolor
                                                              : ThemeConstants
                                                                  .whitecolor,
                                                      border: Border.all(),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0)),
                                                  child: Row(
                                                    children: [
                                                      const Spacer(),
                                                      CustomAutoSizeTextMontserrat(
                                                        text: "Course Info.",
                                                        fontSize: 12,
                                                        textColor: _.chooseIndex!
                                                                    .value ==
                                                                1
                                                            ? ThemeConstants
                                                                .whitecolor
                                                            : ThemeConstants
                                                                .TextColor,
                                                      ),
                                                      // const Icon(
                                                      //     Icons.abc_outlined),
                                                      const Spacer(),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  _.getChooseIndex(2.obs);
                                                },
                                                child: Container(
                                                  width: 110,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          _.chooseIndex!
                                                                      .value ==
                                                                  2
                                                              ? ThemeConstants
                                                                  .bluecolor
                                                              : ThemeConstants
                                                                  .whitecolor,
                                                      border: Border.all(),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0)),
                                                  child: Row(
                                                    children: [
                                                      const Spacer(),
                                                      CustomAutoSizeTextMontserrat(
                                                        text: "Qualification",
                                                        fontSize: 12,
                                                        textColor: _.chooseIndex!
                                                                    .value ==
                                                                2
                                                            ? ThemeConstants
                                                                .whitecolor
                                                            : ThemeConstants
                                                                .TextColor,
                                                      ),
                                                      // const Icon(
                                                      //     Icons.abc_outlined),
                                                      const Spacer(),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              const Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  _.getChooseIndex(3.obs);
                                                },
                                                child: Container(
                                                  width: 110,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          _.chooseIndex!
                                                                      .value ==
                                                                  3
                                                              ? ThemeConstants
                                                                  .bluecolor
                                                              : ThemeConstants
                                                                  .whitecolor,
                                                      border: Border.all(),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0)),
                                                  child: Row(
                                                    children: [
                                                      const Spacer(),
                                                      CustomAutoSizeTextMontserrat(
                                                        text: "Work History",
                                                        fontSize: 12,
                                                        textColor: _.chooseIndex!
                                                                    .value ==
                                                                3
                                                            ? ThemeConstants
                                                                .whitecolor
                                                            : ThemeConstants
                                                                .TextColor,
                                                      ),
                                                      // const Icon(
                                                      //     Icons.abc_outlined),
                                                      const Spacer(),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Container(
                                                width: 110,
                                                height: 35,
                                                decoration: BoxDecoration(
                                                    border: Border.all(),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0)),
                                                child: Row(
                                                  children: [
                                                    const Spacer(),
                                                    CustomAutoSizeTextMontserrat(
                                                      text: "English Test.",
                                                      fontSize: 12,
                                                      textColor: ThemeConstants
                                                          .TextColor,
                                                    ),
                                                    const Icon(
                                                        Icons.abc_outlined),
                                                    const Spacer(),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Container(
                                                width: 110,
                                                height: 35,
                                                decoration: BoxDecoration(
                                                    border: Border.all(),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0)),
                                                child: Row(
                                                  children: [
                                                    const Spacer(),
                                                    CustomAutoSizeTextMontserrat(
                                                      text: "Other Text",
                                                      fontSize: 12,
                                                      textColor: ThemeConstants
                                                          .TextColor,
                                                    ),
                                                    const Icon(
                                                        Icons.abc_outlined),
                                                    const Spacer(),
                                                  ],
                                                ),
                                              ),
                                              const Spacer(),
                                            ],
                                          ),
                                        ],
                                      ),
                                      if (_.iconSwipe.value == false &&
                                          _.iconSwipetrue.value == true)
                                        Positioned(
                                          right: 0,
                                          child: Opacity(
                                            opacity: 0.5,
                                            child: InkWell(
                                              onTap: () {
                                                final position = controller
                                                    .position.maxScrollExtent;
                                                controller.animateTo(
                                                  position,
                                                  duration: const Duration(
                                                      seconds: 1),
                                                  curve: Curves.easeOut,
                                                );
                                                _.setIconSwipeTrue(false);
                                                Future.delayed(
                                                    const Duration(
                                                        milliseconds: 1050),
                                                    () {
                                                  _.setIconSwipe(true);
                                                  _.setIconSwipeTrue(true);
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  // gradient: LinearGradient(
                                                  //   colors: [
                                                  //     Colors.transparent,
                                                  //     ThemeConstants.lightgreycolor,
                                                  //   ],
                                                  // ),
                                                  color:
                                                      ThemeConstants.whitecolor,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(100),
                                                    bottomLeft:
                                                        Radius.circular(100),
                                                  ),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Colors.black,
                                                      blurRadius: 2.0,
                                                      spreadRadius: 0.0,
                                                      offset: Offset(2.0,
                                                          2.0), // shadow direction: bottom right
                                                    )
                                                  ],
                                                ),
                                                height: 80,
                                                width: 35,
                                                child: Center(
                                                  child: SizedBox(
                                                    height: 20,
                                                    width: 20,
                                                    child: RotationTransition(
                                                      turns:
                                                          const AlwaysStoppedAnimation(
                                                              0 / 360),
                                                      child: SvgPicture.asset(
                                                        "assets/icons/nextscreen_arrow.svg",
                                                        color: ThemeConstants
                                                            .blackcolor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              } else if (index == 1) {
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 30),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    _.getChooseIndex(6.obs);
                                                  },
                                                  child: Container(
                                                    width: 100,
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                        color: _
                                                                    .chooseIndex!
                                                                    .value ==
                                                                6
                                                            ? ThemeConstants
                                                                .bluecolor
                                                            : ThemeConstants
                                                                .whitecolor,
                                                        border: Border.all(),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.0)),
                                                    child: Row(
                                                      children: [
                                                        const Spacer(),
                                                        CustomAutoSizeTextMontserrat(
                                                          text: "Passport",
                                                          fontSize: 12,
                                                          textColor:
                                                              _.chooseIndex!
                                                                          .value ==
                                                                      6
                                                                  ? ThemeConstants
                                                                      .whitecolor
                                                                  : ThemeConstants
                                                                      .TextColor,
                                                        ),
                                                        // const Icon(
                                                        //     Icons.abc_outlined),
                                                        const Spacer(),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    _.getChooseIndex(7.obs);
                                                  },
                                                  child: Container(
                                                    width: 120,
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                        color: _
                                                                    .chooseIndex!
                                                                    .value ==
                                                                7
                                                            ? ThemeConstants
                                                                .bluecolor
                                                            : ThemeConstants
                                                                .whitecolor,
                                                        border: Border.all(),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.0)),
                                                    child: Row(
                                                      children: [
                                                        const Spacer(),
                                                        CustomAutoSizeTextMontserrat(
                                                          text:
                                                              "Travel History",
                                                          fontSize: 12,
                                                          textColor:
                                                              _.chooseIndex!
                                                                          .value ==
                                                                      7
                                                                  ? ThemeConstants
                                                                      .whitecolor
                                                                  : ThemeConstants
                                                                      .TextColor,
                                                        ),
                                                        // const Icon(
                                                        //     Icons.abc_outlined),
                                                        const Spacer(),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    _.getChooseIndex(8.obs);
                                                  },
                                                  child: Container(
                                                    width: 110,
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.0)),
                                                    child: Row(
                                                      children: [
                                                        const Spacer(),
                                                        CustomAutoSizeTextMontserrat(
                                                          text:
                                                              "Relative Info.",
                                                          fontSize: 12,
                                                          textColor:
                                                              ThemeConstants
                                                                  .TextColor,
                                                        ),
                                                        const Icon(
                                                            Icons.abc_outlined),
                                                        const Spacer(),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (_.iconSwipe.value == true &&
                                          _.iconSwipetrue.value == true)
                                        Positioned(
                                          left: 0,
                                          child: Opacity(
                                            opacity: 0.5,
                                            child: InkWell(
                                              onTap: () {
                                                final position = controller
                                                    .position.minScrollExtent;
                                                controller.animateTo(
                                                  position,
                                                  duration: const Duration(
                                                      seconds: 1),
                                                  curve: Curves.easeOut,
                                                );
                                                _.setIconSwipeTrue(false);
                                                Future.delayed(
                                                    const Duration(
                                                        milliseconds: 1050),
                                                    () {
                                                  _.setIconSwipe(false);
                                                  _.setIconSwipeTrue(true);
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      ThemeConstants.whitecolor,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(100),
                                                    bottomRight:
                                                        Radius.circular(100),
                                                  ),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Colors.black,
                                                      blurRadius: 2.0,
                                                      spreadRadius: 0.0,
                                                      offset: Offset(2.0,
                                                          2.0), // shadow direction: bottom right
                                                    )
                                                  ],
                                                ),
                                                height: 80,
                                                width: 35,
                                                child: Center(
                                                  child: SizedBox(
                                                    height: 20,
                                                    width: 20,
                                                    child: RotationTransition(
                                                      turns:
                                                          const AlwaysStoppedAnimation(
                                                              180 / 360),
                                                      child: SvgPicture.asset(
                                                        "assets/icons/nextscreen_arrow.svg",
                                                        color: ThemeConstants
                                                            .blackcolor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }),
                      ],
                    ),
                  ),
                  getOption(context, _.chooseIndex!.value)
                ],
              )),
        ));
  }

  getOption(BuildContext context, int index) {
    if (index == 0) {
      return SizedBox(
          height: MediaQuery.of(context).size.height - 175,
          child: const ContactInformationCopy());
    }
    // if (index == 0) {
    //   return SizedBox(
    //       height: MediaQuery.of(context).size.height - 175,
    //       child: const QualificationDetailView());
    // }

    if (index == 1) {
      return SizedBox(
        height: MediaQuery.of(context).size.height - 175,
        child: const CourseInformationCopy(),
      );
    }

    if (index == 2) {
      return SizedBox(
        height: MediaQuery.of(context).size.height - 175,
        child: QualificationDetailsCopy(),
      );
    }

    if (index == 3) {
      return SizedBox(
        height: MediaQuery.of(context).size.height - 175,
        child: const WorkHistoryCopy(),
      );
    }
    if (index == 6) {
      return SizedBox(
        height: MediaQuery.of(context).size.height - 175,
        child: PassportDetails(),
      );
    }
    if (index == 7) {
      return SizedBox(
        height: MediaQuery.of(context).size.height - 175,
        child: TravingHistoryView(),
      );
    }
    if (index == 8) {
      return SizedBox(
        height: MediaQuery.of(context).size.height - 175,
        child: RelativeInformation(),
      );
    }
  }
}
