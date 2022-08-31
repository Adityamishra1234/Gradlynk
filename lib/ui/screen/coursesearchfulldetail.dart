import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/completedetaildetailcontroller.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/ui/screen/CourseInformation.dart';
import 'package:studentpanel/ui/screen/about_course.dart';
import 'package:studentpanel/ui/screen/about_institute.dart';
import 'package:studentpanel/ui/screen/entryrequirement.dart';

import 'package:studentpanel/ui/screen/steps_admissions.dart';
import 'package:studentpanel/ui/screen/steps_visa.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/animationshowdown.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CourseSearchFullDetail extends StatelessWidget {
  List<CompleteCourseDetail>? completeCourseDetail;
  CourseSearchFullDetail({Key? key, this.completeCourseDetail})
      : super(key: key);

  static const routeNamed = '/CourseSearchFullDetail';
  var controller = Get.put(CompleteCourseDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("title"),
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
                              SvgPicture.asset(
                                "assets/icons/university.svg",
                                height: 20,
                                width: 20,
                              ),
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
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
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
                                      Spacer(),
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
                                            Spacer(),
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
                                            Spacer()
                                          ],
                                        ),
                                      ),
                                      Spacer(),
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
                                            Spacer(),
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
                                            Spacer()
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: Row(
                                    children: [
                                      Spacer(),
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
                                            Spacer(),
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
                                            Spacer()
                                          ],
                                        ),
                                      ),
                                      Spacer(),
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
                                            Spacer(),
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
                                            Spacer()
                                          ],
                                        ),
                                      ),
                                      Spacer(),
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
                                      SvgPicture.asset(
                                        "assets/icons/star.svg",
                                        height: 20,
                                        width: 20,
                                      ),
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
                                      left: 10, right: 10, bottom: 25, top: 10),
                                  child: Row(
                                    children: [
                                      CustomAutoSizeTextMontserrat(
                                        text:
                                            "ARWU:${completeCourseDetail![0].arwuRank ?? ""}",
                                        maxLines: 2,
                                        fontSize: 14,
                                      ),
                                      Spacer(),
                                      CustomAutoSizeTextMontserrat(
                                        text:
                                            "Times:${completeCourseDetail![0].timesRank ?? ""}",
                                        maxLines: 2,
                                        fontSize: 14,
                                      ),
                                      Spacer(),
                                      CustomAutoSizeTextMontserrat(
                                        text:
                                            "US News:${completeCourseDetail![0].usNewsRank ?? ""}",
                                        maxLines: 2,
                                        fontSize: 14,
                                      ),
                                      Spacer(),
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
                body: GetBuilder<CompleteCourseDetailController>(
                    builder: (_) => Column(
                          children: [
                            SizedBox(
                              height: 40,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        height: 40,
                                        width: 170,
                                        decoration: BoxDecoration(
                                          color: _.index == 0
                                              ? ThemeConstants.bluecolor
                                              : ThemeConstants.whitecolor,
                                          border: Border.all(
                                              color: _.index == 0
                                                  ? ThemeConstants.bluecolor
                                                  : ThemeConstants.TextColor),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            controller.setIndex(0);
                                          },
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "About Institute",
                                            maxLines: 1,
                                            textColor: _.index == 0
                                                ? ThemeConstants.whitecolor
                                                : ThemeConstants.TextColor,
                                          ),
                                        )),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        height: 40,
                                        width: 170,
                                        decoration: BoxDecoration(
                                          color: _.index == 1
                                              ? ThemeConstants.bluecolor
                                              : ThemeConstants.whitecolor,
                                          border: Border.all(
                                              color: _.index == 1
                                                  ? ThemeConstants.bluecolor
                                                  : ThemeConstants.TextColor),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            controller.setIndex(1);
                                          },
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Course Information",
                                            maxLines: 1,
                                            textColor: _.index == 1
                                                ? ThemeConstants.whitecolor
                                                : ThemeConstants.TextColor,
                                          ),
                                        )),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        height: 40,
                                        width: 170,
                                        decoration: BoxDecoration(
                                          color: _.index == 2
                                              ? ThemeConstants.bluecolor
                                              : ThemeConstants.whitecolor,
                                          border: Border.all(
                                              color: _.index == 2
                                                  ? ThemeConstants.bluecolor
                                                  : ThemeConstants.TextColor),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            controller.setIndex(2);
                                          },
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Entry Requirement",
                                            maxLines: 1,
                                            textColor: _.index == 2
                                                ? ThemeConstants.whitecolor
                                                : ThemeConstants.TextColor,
                                          ),
                                        )),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        height: 40,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          color: _.index == 3
                                              ? ThemeConstants.bluecolor
                                              : ThemeConstants.whitecolor,
                                          border: Border.all(
                                              color: _.index == 3
                                                  ? ThemeConstants.bluecolor
                                                  : ThemeConstants.TextColor),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            controller.setIndex(3);
                                          },
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Steps To Admissions",
                                            maxLines: 1,
                                            textColor: _.index == 3
                                                ? ThemeConstants.whitecolor
                                                : ThemeConstants.TextColor,
                                          ),
                                        )),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        height: 40,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          color: _.index == 4
                                              ? ThemeConstants.bluecolor
                                              : ThemeConstants.whitecolor,
                                          border: Border.all(
                                              color: _.index == 4
                                                  ? ThemeConstants.bluecolor
                                                  : ThemeConstants.TextColor),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            controller.setIndex(4);
                                          },
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Steps To Visa",
                                            maxLines: 1,
                                            textColor: _.index == 4
                                                ? ThemeConstants.whitecolor
                                                : ThemeConstants.TextColor,
                                          ),
                                        )),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        height: 40,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: _.index == 5
                                              ? ThemeConstants.bluecolor
                                              : ThemeConstants.whitecolor,
                                          border: Border.all(
                                              color: _.index == 5
                                                  ? ThemeConstants.bluecolor
                                                  : ThemeConstants.TextColor),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            controller.setIndex(5);
                                          },
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "About USA",
                                            maxLines: 1,
                                            textColor: _.index == 5
                                                ? ThemeConstants.whitecolor
                                                : ThemeConstants.TextColor,
                                          ),
                                        )),
                                    const SizedBox(
                                      width: 40,
                                    )
                                  ]),
                            ),
                            if (_.index.value == 0)
                              AboutInstitute(
                                  completeCourseDetail: completeCourseDetail!),
                            if (_.index.value == 1)
                              CourseInformation(
                                  completeCourseDetail: completeCourseDetail!),
                            if (_.index.value == 2)
                              EntryRequirement(
                                  completeCourseDetail: completeCourseDetail!),
                            if (_.index.value == 3)
                              StepsToAdmissions(
                                  completeCourseDetail: completeCourseDetail!),
                            if (_.index.value == 4)
                              StepsToVisa(
                                  completeCourseDetail: completeCourseDetail!),
                            if (_.index.value == 5)
                              AboutCourse(
                                  completeCourseDetail: completeCourseDetail!)
                          ],
                        )),
              ),
            )
          ],
        ));
  }
}
