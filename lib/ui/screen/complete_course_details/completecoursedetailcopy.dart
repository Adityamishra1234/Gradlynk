import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/completedetaildetailcontroller.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/ui/screen/complete_course_details/CourseInformation.dart';
import 'package:studentpanel/ui/screen/complete_course_details/about_institute.dart';
import 'package:studentpanel/ui/screen/complete_course_details/steps_visa2.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/animationshowdown.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

class CourseSearchFullDetailCopy extends StatelessWidget {
  List<CompleteCourseDetail>? completeCourseDetail;
  CourseSearchFullDetailCopy({Key? key, this.completeCourseDetail})
      : super(key: key);

  static const routeNamed = '/CourseSearchFullDetailCopy';
  var controller = Get.put(CompleteCourseDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),
        body: Stack(
          children: [
            //
            Positioned(
                bottom: 40,
                left: MediaQuery.of(context).size.width / 2 + 20,
                child: GetBuilder<CompleteCourseDetailController>(
                  builder: (_) => Column(
                    children: [
                      if (_.showAnimation.value == true ||
                          _.firstTimeAnimation.value == false)
                        AnimationShowDownArror(),
                    ],
                  ),
                )),
            NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                if (notification.direction == ScrollDirection.forward) {
                  controller.getShowAnimation(false.obs);
                } else if (notification.direction == ScrollDirection.reverse) {
                  controller.getShowAnimationTrue(true.obs, true.obs);
                } else {
                  return true;
                }
                return true;
              },
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverList(
                      delegate: SliverChildListDelegate([
                        CustomAppBar("title"),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                          child: Divider(
                            height: 5,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CustomAutoSizeTextMontserrat(
                            text: completeCourseDetail![0].courseName,
                            maxLines: 5,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            textColor: ThemeConstants.bluecolor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              svgImage("university", ThemeConstants.blackcolor,
                                  25, 25),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Column(
                                    children: [
                                      CustomAutoSizeTextMontserrat(
                                          text: completeCourseDetail![0]
                                              .universityName,
                                          maxLines: 2),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                          ),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: ThemeConstants.bluelightgreycolor,
                                  width: 0.5),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Row(
                                    children: [
                                      const Spacer(),
                                      Container(
                                        height: 80,
                                        width: 170,
                                        decoration: BoxDecoration(
                                          color: ThemeConstants.lightblueColor,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Column(
                                          children: [
                                            const Spacer(),
                                            CustomAutoSizeTextMontserrat(
                                              text: "Course Duration",
                                              maxLines: 2,
                                              textColor:
                                                  ThemeConstants.bluecolor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            CustomAutoSizeTextMontserrat(
                                              text:
                                                  "${(int.parse(completeCourseDetail![0].courseDuration!) / 12).toStringAsFixed(1)} Year",
                                              fontSize: 14,
                                              maxLines: 2,
                                              textColor:
                                                  ThemeConstants.blackcolor,
                                            ),
                                            const Spacer()
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 80,
                                        width: 170,
                                        decoration: BoxDecoration(
                                          color:
                                              ThemeConstants.lightorangeColor,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Column(
                                          children: [
                                            const Spacer(),
                                            CustomAutoSizeTextMontserrat(
                                              text: "Total Tutions Fees",
                                              maxLines: 2,
                                              textColor:
                                                  ThemeConstants.orangeColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            CustomAutoSizeTextMontserrat(
                                              text:
                                                  "${completeCourseDetail![0].totalTutionFees}(${completeCourseDetail![0].totalTutionFeesInr}INR)",
                                              // "347200 USD (INR 2,56,92,800)",
                                              maxLines: 2,
                                              fontSize: 14,
                                              textColor:
                                                  ThemeConstants.blackcolor,
                                            ),
                                            const Spacer()
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      const Spacer(),
                                      Container(
                                        height: 80,
                                        width: 170,
                                        decoration: BoxDecoration(
                                          color: ThemeConstants.lightblueColor,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Column(
                                          children: [
                                            const Spacer(),
                                            CustomAutoSizeTextMontserrat(
                                              text: "Course Level",
                                              maxLines: 2,
                                              textColor:
                                                  ThemeConstants.bluecolor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            CustomAutoSizeTextMontserrat(
                                              text: completeCourseDetail![0]
                                                  .courseLevel,
                                              maxLines: 2,
                                              fontSize: 14,
                                              textColor:
                                                  ThemeConstants.blackcolor,
                                            ),
                                            const Spacer()
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 80,
                                        width: 170,
                                        decoration: BoxDecoration(
                                          color:
                                              ThemeConstants.lightorangeColor,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Column(
                                          children: [
                                            const Spacer(),
                                            CustomAutoSizeTextMontserrat(
                                              text: "Avaliable Intake",
                                              fontWeight: FontWeight.bold,
                                              maxLines: 2,
                                              textColor:
                                                  ThemeConstants.orangeColor,
                                            ),
                                            CustomAutoSizeTextMontserrat(
                                              text: "Aug-2022|Jan-2023",
                                              maxLines: 2,
                                              textColor:
                                                  ThemeConstants.blackcolor,
                                              fontSize: 14,
                                            ),
                                            const Spacer()
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      svgImage("star",
                                          ThemeConstants.blackcolor, 25, 25),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: CustomAutoSizeTextMontserrat(
                                          text: "Worlds Ranking",
                                          maxLines: 2,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10, top: 10),
                                  child: Row(
                                    children: [
                                      CustomAutoSizeTextMontserrat(
                                        text:
                                            "ARWU:${completeCourseDetail![0].arwuRank ?? ""}",
                                        maxLines: 2,
                                        fontSize: 14,
                                      ),
                                      const Spacer(),
                                      CustomAutoSizeTextMontserrat(
                                        text:
                                            "Times:${completeCourseDetail![0].timesRank ?? ""}",
                                        maxLines: 2,
                                        fontSize: 14,
                                      ),
                                      const Spacer(),
                                      CustomAutoSizeTextMontserrat(
                                        text:
                                            "US News:${completeCourseDetail![0].usNewsRank ?? ""}",
                                        maxLines: 2,
                                        fontSize: 14,
                                      ),
                                      const Spacer(),
                                      CustomAutoSizeTextMontserrat(
                                        text:
                                            "QS World:${completeCourseDetail![0].qsWorldRank ?? ""}",
                                        maxLines: 2,
                                        fontSize: 14,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ];
                },
                body: ListView(
                  controller: ScrollController(),
                  children: [
                    InkWell(
                      highlightColor: ThemeConstants.whitecolor,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutInstituteCopy(
                                    completeCourseDetail:
                                        completeCourseDetail!)));
                      },
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: "About Institute",
                                fontWeight: FontWeight.bold,
                                textColor: ThemeConstants.bluecolor,
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 30, top: 10),
                              child: svgImage("nextscreen_arrow",
                                  ThemeConstants.bluecolor, 25, 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Divider(
                        height: 5,
                        thickness: 1,
                      ),
                    ),
                    InkWell(
                      highlightColor: ThemeConstants.whitecolor,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CourseInformation(
                                    completeCourseDetail:
                                        completeCourseDetail!)));
                        // Get.to(CourseInformation(
                        //     completeCourseDetail: completeCourseDetail!));
                      },
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Course Information",
                                textColor: ThemeConstants.bluecolor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 30, top: 10),
                              child: svgImage("nextscreen_arrow",
                                  ThemeConstants.bluecolor, 25, 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Divider(
                        height: 5,
                        thickness: 1,
                      ),
                    ),
                    InkWell(
                      highlightColor: ThemeConstants.whitecolor,
                      onTap: () {
                        debugPrint("click");
                      },
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Entry Requirement",
                                textColor: ThemeConstants.bluecolor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 30, top: 10),
                              child: svgImage("nextscreen_arrow",
                                  ThemeConstants.bluecolor, 25, 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Divider(
                        height: 5,
                        thickness: 1,
                      ),
                    ),
                    InkWell(
                      highlightColor: ThemeConstants.whitecolor,
                      onTap: () {
                        debugPrint("click");
                      },
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Steps To Admission",
                                textColor: ThemeConstants.bluecolor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 30, top: 10),
                              child: svgImage("nextscreen_arrow",
                                  ThemeConstants.bluecolor, 25, 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Divider(
                        height: 5,
                        thickness: 1,
                      ),
                    ),
                    InkWell(
                      highlightColor: ThemeConstants.whitecolor,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StepsToVisaCopy(
                                    completeCourseDetail:
                                        completeCourseDetail!)));
                        // Get.to(StepsToVisaCopy(
                        //     completeCourseDetail: completeCourseDetail!));
                      },
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Steps To Visa",
                                textColor: ThemeConstants.bluecolor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 30, top: 10),
                              child: svgImage("nextscreen_arrow",
                                  ThemeConstants.bluecolor, 25, 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Divider(
                        height: 5,
                        thickness: 1,
                      ),
                    ),
                    InkWell(
                      highlightColor: ThemeConstants.whitecolor,
                      hoverColor: ThemeConstants.whitecolor,
                      onTap: () {
                        debugPrint("click");
                      },
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: "About USA",
                                textColor: ThemeConstants.bluecolor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 30, top: 10),
                              child: svgImage("nextscreen_arrow",
                                  ThemeConstants.bluecolor, 25, 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Divider(
                        height: 5,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
