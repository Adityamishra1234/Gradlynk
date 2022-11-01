import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:studentpanel/ui/screen/ModificationUi/contactinformation.dart';
import 'package:studentpanel/ui/screen/ModificationUi/courseinformation.dart';
import 'package:studentpanel/ui/screen/ModificationUi/qualificationdetails.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class ProfilePageCopy extends StatelessWidget {
  ProfilePageCopy({Key? key}) : super(key: key);
  static const routeNamed = '/ProfilePageCopy';
  ScrollController controller = ScrollController();
  ScrollPhysics scrollPhysics = ScrollPhysics();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar("title"),
      body: Container(
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
                                          Container(
                                            width: 100,
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
                                                  text: "Personal ",
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                ),
                                                const Icon(Icons.abc_outlined),
                                                const Spacer(),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Container(
                                            width: 100,
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
                                                  text: "Course Info.",
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                ),
                                                const Icon(Icons.abc_outlined),
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
                                                  text: "Qualification",
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                ),
                                                const Icon(Icons.abc_outlined),
                                                const Spacer(),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
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
                                                  text: "Work History",
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                ),
                                                const Icon(Icons.abc_outlined),
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
                                                  text: "English Test.",
                                                  fontSize: 12,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                ),
                                                const Icon(Icons.abc_outlined),
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
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                ),
                                                const Icon(Icons.abc_outlined),
                                                const Spacer(),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
                                            duration:
                                                const Duration(seconds: 1),
                                            curve: Curves.easeOut,
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            // gradient: LinearGradient(
                                            //   colors: [
                                            //     Colors.transparent,
                                            //     ThemeConstants.lightgreycolor,
                                            //   ],
                                            // ),
                                            color: ThemeConstants.whitecolor,
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(100),
                                              bottomLeft: Radius.circular(100),
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
                                                  color:
                                                      ThemeConstants.blackcolor,
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
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 100,
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
                                                    text: "Personal",
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
                                              width: 100,
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
                                                    text: "Course Info.",
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
                                                    text: "Qualification",
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
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
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
                                                    text: "Work History",
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
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
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
                                            duration:
                                                const Duration(seconds: 1),
                                            curve: Curves.easeOut,
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: ThemeConstants.whitecolor,
                                            borderRadius:
                                                const BorderRadius.only(
                                              topRight: Radius.circular(100),
                                              bottomRight: Radius.circular(100),
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
                                          height: 85,
                                          width: 35,
                                          child: Center(
                                            child: SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: SvgPicture.asset(
                                                "assets/icons/nextscreen_arrow.svg",
                                                color:
                                                    ThemeConstants.blackcolor,
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

              SizedBox(
                  height: MediaQuery.of(context).size.height - 175,
                  child: const ContactInformationCopy()),

              // SizedBox(
              //   height: MediaQuery.of(context).size.height - 175,
              //   child: const CourseInformationCopy(),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height - 175,
              //   child: const QualificationDetailsCopy(),
              // ),
            ],
          )),
    );
  }
}
