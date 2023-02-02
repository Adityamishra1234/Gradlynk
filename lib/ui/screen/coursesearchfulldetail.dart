import 'package:flutter/material.dart';
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
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

class CourseSearchFullDetail extends StatelessWidget {
  List<CompleteCourseDetail>? completeCourseDetail;
  CourseSearchFullDetail({Key? key, this.completeCourseDetail})
      : super(key: key);

  static const routeNamed = '/CourseSearchFullDetail';
  var controller = Get.put(CompleteCourseDetailController());

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    double width = MediaQuery.of(context).size.width;
    if (displayMobileLayout == true) {
      width = MediaQuery.of(context).size.width - 240;
    }

    return Scaffold(
        // appBar: ,
        drawer: displayMobileLayout == false ? const CustomDrawer() : null,
        body: Row(
          children: [
            if (displayMobileLayout == true) const CustomDrawer(),
            Flexible(
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
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: CustomAutoSizeTextMontserrat(
                            text: completeCourseDetail![0].courseName,
                            maxLines: 5,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            textColor: ThemeConstants.bluecolor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 8),
                          child: Row(
                            children: [
                              svgImage("university",
                                  ThemeConstants.bluegreycolor, 20, 20),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Column(
                                    children: [
                                      CustomAutoSizeTextMontserrat(
                                          text: completeCourseDetail![0]
                                              .universityName,
                                          textColor:
                                              ThemeConstants.bluegreycolor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
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
                            elevation: 2,
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
                                              text: getNUllChecker(
                                                          completeCourseDetail![
                                                                  0]
                                                              .courseDuration) ==
                                                      false
                                                  ? "${(int.parse(completeCourseDetail![0].courseDuration!) / 12).toStringAsFixed(1)} Year"
                                                  : "",
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
                                              ThemeConstants.lightgreentColor,
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
                                                  ThemeConstants.GreenColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            CustomAutoSizeTextMontserrat(
                                              text:
                                                  "${completeCourseDetail![0].totalTutionFees}${completeCourseDetail![0].countryCurrencyCode} (${completeCourseDetail![0].totalTutionFeesInr}INR)",
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
                                          color:
                                              ThemeConstants.lightorangeColor,
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
                                                  ThemeConstants.orangeColor,
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
                                              ThemeConstants.lightVioletColor,
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
                                                  ThemeConstants.VioletColor,
                                            ),
                                            CustomAutoSizeTextMontserrat(
                                              text: completeCourseDetail![0]
                                                  .intakeFromYear,
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
                                if (getNUllChecker(completeCourseDetail![0]
                                            .arwuRank) ==
                                        false ||
                                    getNUllChecker(completeCourseDetail![0]
                                            .timesRank) ==
                                        false ||
                                    getNUllChecker(completeCourseDetail![0]
                                            .usNewsRank) ==
                                        false ||
                                    getNUllChecker(completeCourseDetail![0]
                                            .qsWorldRank) ==
                                        false)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                      top: 10,
                                    ),
                                    child: Row(
                                      children: [
                                        svgImage("star",
                                            ThemeConstants.orangeColor, 20, 20),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Worlds Ranking",
                                            maxLines: 2,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 10, bottom: 15, top: 10),
                                  child: Row(
                                    children: [
                                      if (getNUllChecker(
                                              completeCourseDetail![0]
                                                  .arwuRank) ==
                                          false)
                                        CustomAutoSizeTextMontserrat(
                                          text:
                                              "ARWU:${completeCourseDetail![0].arwuRank ?? ""}",
                                          maxLines: 2,
                                          fontSize: 12,
                                          textColor:
                                              ThemeConstants.bluegreycolor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      const Spacer(),
                                      if (getNUllChecker(
                                              completeCourseDetail![0]
                                                  .timesRank) ==
                                          false)
                                        CustomAutoSizeTextMontserrat(
                                          text:
                                              "Times:${completeCourseDetail![0].timesRank ?? ""}",
                                          maxLines: 2,
                                          fontSize: 12,
                                          textColor:
                                              ThemeConstants.bluegreycolor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      const Spacer(),
                                      if (getNUllChecker(
                                              completeCourseDetail![0]
                                                  .usNewsRank) ==
                                          false)
                                        CustomAutoSizeTextMontserrat(
                                          text:
                                              "US News:${completeCourseDetail![0].usNewsRank ?? ""}",
                                          maxLines: 2,
                                          textColor:
                                              ThemeConstants.bluegreycolor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ),
                                      const Spacer(),
                                      if (getNUllChecker(
                                              completeCourseDetail![0]
                                                  .qsWorldRank) ==
                                          false)
                                        CustomAutoSizeTextMontserrat(
                                          text:
                                              "QS World:${completeCourseDetail![0].qsWorldRank ?? ""}",
                                          maxLines: 2,
                                          textColor:
                                              ThemeConstants.bluegreycolor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
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
                            SafeArea(
                              bottom: false,
                              child: Align(
                                alignment: AlignmentDirectional.topStart,
                                child: Center(
                                  child: Wrap(
                                      spacing: 10.0,
                                      runSpacing: 10.0,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      alignment: WrapAlignment.center,
                                      runAlignment: WrapAlignment.center,
                                      children: [
                                        Container(
                                            height: 40,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              color: _.index.value == 0
                                                  ? ThemeConstants.bluecolor
                                                  : ThemeConstants.whitecolor,
                                              border: Border.all(
                                                  color: _.index.value == 0
                                                      ? ThemeConstants.bluecolor
                                                      : ThemeConstants
                                                          .TextColor),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                controller.setIndex(0);
                                              },
                                              child:
                                                  CustomAutoSizeTextMontserrat(
                                                text: "About Institute",
                                                maxLines: 1,
                                                fontSize: 12,
                                                textColor: _.index.value == 0
                                                    ? ThemeConstants.whitecolor
                                                    : ThemeConstants.TextColor,
                                              ),
                                            )),
                                        Container(
                                            height: 40,
                                            width: 110,
                                            decoration: BoxDecoration(
                                              color: _.index.value == 1
                                                  ? ThemeConstants.bluecolor
                                                  : ThemeConstants.whitecolor,
                                              border: Border.all(
                                                  color: _.index.value == 1
                                                      ? ThemeConstants.bluecolor
                                                      : ThemeConstants
                                                          .TextColor),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                controller.setIndex(1);
                                              },
                                              child:
                                                  CustomAutoSizeTextMontserrat(
                                                text: "Course Inf.",
                                                maxLines: 1,
                                                fontSize: 12,
                                                textColor: _.index.value == 1
                                                    ? ThemeConstants.whitecolor
                                                    : ThemeConstants.TextColor,
                                              ),
                                            )),
                                        Container(
                                            height: 40,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: _.index.value == 4
                                                  ? ThemeConstants.bluecolor
                                                  : ThemeConstants.whitecolor,
                                              border: Border.all(
                                                  color: _.index.value == 4
                                                      ? ThemeConstants.bluecolor
                                                      : ThemeConstants
                                                          .TextColor),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                controller.setIndex(4);
                                              },
                                              child:
                                                  CustomAutoSizeTextMontserrat(
                                                text: "Step To Visa",
                                                maxLines: 1,
                                                textColor: _.index.value == 4
                                                    ? ThemeConstants.whitecolor
                                                    : ThemeConstants.TextColor,
                                              ),
                                            )),
                                        Container(
                                            height: 40,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: _.index.value == 2
                                                  ? ThemeConstants.bluecolor
                                                  : ThemeConstants.whitecolor,
                                              border: Border.all(
                                                  color: _.index.value == 2
                                                      ? ThemeConstants.bluecolor
                                                      : ThemeConstants
                                                          .TextColor),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                controller.setIndex(2);
                                              },
                                              child:
                                                  CustomAutoSizeTextMontserrat(
                                                text: "Requirement",
                                                maxLines: 1,
                                                fontSize: 12,
                                                textColor: _.index.value == 2
                                                    ? ThemeConstants.whitecolor
                                                    : ThemeConstants.TextColor,
                                              ),
                                            )),
                                        Container(
                                            height: 40,
                                            width: 110,
                                            decoration: BoxDecoration(
                                              color: _.index.value == 3
                                                  ? ThemeConstants.bluecolor
                                                  : ThemeConstants.whitecolor,
                                              border: Border.all(
                                                  color: _.index.value == 3
                                                      ? ThemeConstants.bluecolor
                                                      : ThemeConstants
                                                          .TextColor),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                controller.setIndex(3);
                                              },
                                              child:
                                                  CustomAutoSizeTextMontserrat(
                                                text: "Admissions",
                                                fontSize: 12,
                                                maxLines: 1,
                                                textColor: _.index.value == 3
                                                    ? ThemeConstants.whitecolor
                                                    : ThemeConstants.TextColor,
                                              ),
                                            )),
                                        Container(
                                            height: 40,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              color: _.index.value == 5
                                                  ? ThemeConstants.bluecolor
                                                  : ThemeConstants.whitecolor,
                                              border: Border.all(
                                                  color: _.index.value == 5
                                                      ? ThemeConstants.bluecolor
                                                      : ThemeConstants
                                                          .TextColor),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                controller.setIndex(5);
                                              },
                                              child:
                                                  CustomAutoSizeTextMontserrat(
                                                text: "About",
                                                maxLines: 1,
                                                textColor: _.index.value == 5
                                                    ? ThemeConstants.whitecolor
                                                    : ThemeConstants.TextColor,
                                              ),
                                            )),
                                      ]),
                                ),
                              ),
                            ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // SizedBox(
                            //   height: 40,
                            //   child: Row(
                            //     children: [],
                            //   ),
                            // ),
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
            ),
          ],
        ));
  }
}
