import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/coursesearchfulldetailcontroller.dart';
import 'package:studentpanel/ui/screen/CourseInformation.dart';
import 'package:studentpanel/ui/screen/about_course.dart';
import 'package:studentpanel/ui/screen/about_institute.dart';
import 'package:studentpanel/ui/screen/entryrequirement.dart';
import 'package:studentpanel/ui/screen/steps_admissions.dart';
import 'package:studentpanel/ui/screen/steps_visa.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CourseSearchFullDetail extends StatelessWidget {
  static const routeNamed = '/CourseSearchFullDetail';
  var controller = Get.put(CourseSearchFullDetailController());
  String s2 = """
  The United States is a popular hub for education as having seven of the top 10 universities globally. American colleges and universities are widely known for their teaching and research. The American education system is the most adaptable and versatile for international students.
                                           American college is known for its academic excellence as it provides the world’s most adequate education with excellent programs across all discipline subjects. American colleges have an advanced stage of undergraduate programs that allows opting for multiple specializations.



There are two prominent intakes in the USA, i.e., fall and spring.



- The fall intake begins in August; most of the courses are          available and the most preferred intake among the
international students.
-Spring or Winter Intake starts in January, and it provides a few courses.
However, Universities in the USA also have summer intakes, but it is limited to specific courses.'",
  """;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("title"),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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
                  CustomAutoSizeTextMontserrat(
                    text: "Bachelor of Science in Compluter Science",
                    maxLines: 5,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    textColor: ThemeConstants.bluecolor,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/university.svg",
                        height: 20,
                        width: 20,
                      ),
                      CustomAutoSizeTextMontserrat(
                          text: "Valparaiso University", maxLines: 2)
                    ],
                  ),
                  Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              color: ThemeConstants.lightblueColor,
                              height: 100,
                              child: Column(
                                children: [
                                  Spacer(),
                                  CustomAutoSizeTextMontserrat(
                                    text: "Course Duration",
                                    maxLines: 1,
                                    textColor: ThemeConstants.bluecolor,
                                  ),
                                  CustomAutoSizeTextMontserrat(
                                    text: "4year 0 Month",
                                    maxLines: 1,
                                    textColor: ThemeConstants.blackcolor,
                                  ),
                                  Spacer()
                                ],
                              ),
                            ),
                            Container(
                              color: ThemeConstants.lightorangeColor,
                              height: 100,
                              child: Column(
                                children: [
                                  Spacer(),
                                  CustomAutoSizeTextMontserrat(
                                    text: "Total Tutions Fees",
                                    maxLines: 1,
                                    textColor: ThemeConstants.orangeColor,
                                  ),
                                  CustomAutoSizeTextMontserrat(
                                    text: "347200 USD (INR 2,56,92,800)",
                                    maxLines: 1,
                                    textColor: ThemeConstants.blackcolor,
                                  ),
                                  Spacer()
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              color: ThemeConstants.lightblueColor,
                              height: 100,
                              child: Column(
                                children: [
                                  Spacer(),
                                  CustomAutoSizeTextMontserrat(
                                    text: "Course Level",
                                    maxLines: 1,
                                    textColor: ThemeConstants.bluecolor,
                                  ),
                                  CustomAutoSizeTextMontserrat(
                                    text: "Bachelors",
                                    maxLines: 1,
                                    textColor: ThemeConstants.blackcolor,
                                  ),
                                  Spacer()
                                ],
                              ),
                            ),
                            Container(
                              color: ThemeConstants.lightorangeColor,
                              height: 100,
                              child: Column(
                                children: [
                                  Spacer(),
                                  CustomAutoSizeTextMontserrat(
                                    text: "Avaliable Intake",
                                    maxLines: 1,
                                    textColor: ThemeConstants.orangeColor,
                                  ),
                                  CustomAutoSizeTextMontserrat(
                                    text: "Aug-2022|Jan-2023",
                                    maxLines: 1,
                                    textColor: ThemeConstants.blackcolor,
                                  ),
                                  Spacer()
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/star.svg",
                                height: 20,
                                width: 20,
                              ),
                              CustomAutoSizeTextMontserrat(
                                  text: "Worlds Ranking", maxLines: 1)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              CustomAutoSizeTextMontserrat(
                                  text: "ARWU:0", maxLines: 1),
                              Spacer(),
                              CustomAutoSizeTextMontserrat(
                                  text: "Times:0", maxLines: 1),
                              Spacer(),
                              CustomAutoSizeTextMontserrat(
                                  text: "US News:0", maxLines: 1),
                              Spacer(),
                              CustomAutoSizeTextMontserrat(
                                  text: "QS World:0", maxLines: 1),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ];
          },
          body: GetBuilder<CourseSearchFullDetailController>(
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
                                    color: ThemeConstants.bluecolor,
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
                                      textColor: ThemeConstants.whitecolor,
                                    ),
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                  height: 40,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    color: ThemeConstants.bluecolor,
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
                                      textColor: ThemeConstants.whitecolor,
                                    ),
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                  height: 40,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    color: ThemeConstants.bluecolor,
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
                                      textColor: ThemeConstants.whitecolor,
                                    ),
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                  height: 40,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: ThemeConstants.bluecolor,
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
                                      textColor: ThemeConstants.whitecolor,
                                    ),
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: ThemeConstants.bluecolor,
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
                                      textColor: ThemeConstants.whitecolor,
                                    ),
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: ThemeConstants.bluecolor,
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
                                      textColor: ThemeConstants.whitecolor,
                                    ),
                                  )),
                              const SizedBox(
                                width: 40,
                              )
                            ]),
                      ),
                      if (_.index.value == 0) AboutInstitute(),
                      if (_.index.value == 1) CourseInformation(),
                      if (_.index.value == 2) EntryRequirement(),
                      if (_.index.value == 3) StepsToAdmissions(),
                      if (_.index.value == 4) StepsToVisa(),
                      if (_.index.value == 5) AboutCourse()
                    ],
                  )),
        ));
    // SizedBox(
    //   height: MediaQuery.of(context).size.height,
    //   child: ListView(children: [
    //     SizedBox(
    //       height: MediaQuery.of(context).size.height,
    //       child: GetX<CourseSearchFullDetailController>(
    //           builder: (_) => Column(
    //                 children: [
    //                   if (_.index.value == 0) ABoutInstitute(),
    //                   if (_.index.value == 1) CourseInformation(),
    //                   if (_.index.value == 2) EntryRequirement(),
    //                   if (_.index.value == 3) StepsToAdmissions(),
    //                   if (_.index.value == 4) StepsToVisa(),
    //                   if (_.index.value == 5) AboutCourse()
    //                 ],
    //               )),
    //     ),

    //     // Choose 1

    //     //Choose 2

    //     // Choose 3

    //     //choose 4

    //     // choose 5

    //     //choose 6

    //     // SizedBox(
    //     //   height: MediaQuery.of(context).size.height * 0.4,
    //     //   child: ListView(
    //     //     children: [],
    //     //   ),
    //     // ),
    //   ]),
    // ));
  }

// Function

}
