import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CourseInformation extends StatelessWidget {
  List<CompleteCourseDetail> completeCourseDetail;
  CourseInformation({Key? key, required this.completeCourseDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10),
              child: Table(
                children: [
                  if (getNUllChecker(completeCourseDetail[0].courseName) ==
                      false)
                    TableRow(
                        decoration: BoxDecoration(
                          color: ThemeConstants.lightgreentColor,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: ThemeConstants.GreenColor, width: 0.5),
                        ),
                        children: [
                          Container(
                            constraints: const BoxConstraints(minHeight: 50),
                            child: Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Course Name",
                                  maxLines: 2,
                                  textColor: ThemeConstants.GreenColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            constraints: const BoxConstraints(minHeight: 50),
                            child: Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                child: CustomAutoSizeTextMontserrat(
                                  text: completeCourseDetail[0].courseName,
                                  fontSize: 14,
                                  textColor: ThemeConstants.blackcolor,
                                  fontWeight: FontWeight.w600,
                                  maxLines: 5,
                                ),
                              ),
                            ),
                          ),
                        ]),
                  if (getNUllChecker(completeCourseDetail[0].courseName) ==
                      false)
                    const TableRow(children: [
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ]),
                  if (getNUllChecker(completeCourseDetail[0].courseLevel) ==
                      false)
                    TableRow(
                        decoration: BoxDecoration(
                          color: ThemeConstants.lightblueColor,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: ThemeConstants.bluecolor, width: 0.5),
                        ),
                        children: [
                          Container(
                            constraints: const BoxConstraints(minHeight: 50),
                            child: Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Course Level",
                                  maxLines: 2,
                                  textColor: ThemeConstants.bluecolor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            constraints: const BoxConstraints(minHeight: 50),
                            child: Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: CustomAutoSizeTextMontserrat(
                                text: completeCourseDetail[0].courseLevel,
                                fontSize: 14,
                                textColor: ThemeConstants.blackcolor,
                                fontWeight: FontWeight.w600,
                                maxLines: 2,
                              ),
                            ),
                          ),
                        ]),
                  if (getNUllChecker(completeCourseDetail[0].courseLevel) ==
                      false)
                    const TableRow(children: [
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ]),

                  //TODO
                  // if (getNUllChecker(completeCourseDetail[0].courseLevel) ==
                  //     false)
                  //   TableRow(
                  //       decoration: BoxDecoration(
                  //         color: ThemeConstants.lightorangeColor,
                  //         borderRadius: BorderRadius.circular(10.0),
                  //         border: Border.all(
                  //             color: ThemeConstants.orangeColor, width: 0.5),
                  //       ),
                  //       children: [
                  //         Container(
                  //           constraints: const BoxConstraints(minHeight: 50),
                  //           child: Align(
                  //             alignment: AlignmentDirectional.centerStart,
                  //             child: Padding(
                  //               padding: const EdgeInsets.only(left: 8),
                  //               child: CustomAutoSizeTextMontserrat(
                  //                 text: "Bachelors",
                  //                 maxLines: 2,
                  //                 textColor: ThemeConstants.orangeColor,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         Container(
                  //           constraints: const BoxConstraints(minHeight: 50),
                  //           child: Align(
                  //             alignment: AlignmentDirectional.centerStart,
                  //             child: CustomAutoSizeTextMontserrat(
                  //               text: "completeCourseDetail[0].b",
                  //               fontSize: 14,
                  //               textColor: ThemeConstants.blackcolor,
                  //               fontWeight: FontWeight.w600,
                  //               maxLines: 2,
                  //             ),
                  //           ),
                  //         ),
                  //       ]),

                  const TableRow(children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]),
                  if (getNUllChecker(
                          completeCourseDetail[0].specialEntryRequirement) ==
                      false)
                    TableRow(
                        decoration: BoxDecoration(
                          color: ThemeConstants.lightVioletColor,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: ThemeConstants.VioletColor, width: 0.5),
                        ),
                        children: [
                          if (completeCourseDetail[0].instituteType != null)
                            Container(
                              constraints: const BoxConstraints(minHeight: 50),
                              child: Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Specialization",
                                    maxLines: 2,
                                    textColor: ThemeConstants.VioletColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          Container(
                            constraints: const BoxConstraints(minHeight: 50),
                            child: Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: HtmlWidget(
                                  completeCourseDetail[0]
                                          .specialEntryRequirement ??
                                      "",
                                  textStyle: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    color: ThemeConstants.blackcolor,
                                    fontSize: 14.0,
                                  ),
                                )),
                          ),
                        ]),
                ],
              ),
            ),
            if (getNUllChecker(completeCourseDetail[0].narrowFieldName) ==
                    false ||
                getNUllChecker(completeCourseDetail[0].jobIndustry) == false)
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 10),
                child: Table(
                  children: [
                    TableRow(children: [
                      if (getNUllChecker(
                              completeCourseDetail[0].narrowFieldName) ==
                          false)
                        CustomAutoSizeTextMontserrat(
                          text: "Course Narrow Field",
                          maxLines: 3,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      if (getNUllChecker(completeCourseDetail[0].jobIndustry) ==
                          false)
                        CustomAutoSizeTextMontserrat(
                          text: "Job Industry",
                          maxLines: 3,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                    ]),
                    TableRow(children: [
                      if (getNUllChecker(
                              completeCourseDetail[0].narrowFieldName) ==
                          false)
                        CustomAutoSizeTextMontserrat(
                          text: completeCourseDetail[0].narrowFieldName,
                          textColor: ThemeConstants.TextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      if (getNUllChecker(completeCourseDetail[0].jobIndustry) ==
                          false)
                        CustomAutoSizeTextMontserrat(
                          text: completeCourseDetail[0].jobIndustry,
                          textColor: ThemeConstants.TextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                    ]),
                  ],
                ),
              ),
            const SizedBox(
              height: 10,
            ),
            if (getNUllChecker(completeCourseDetail[0].averageSalary) ==
                    false ||
                getNUllChecker(completeCourseDetail[0].careerOutcome) == false)
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10),
                child: Table(
                  children: [
                    TableRow(children: [
                      if (getNUllChecker(
                              completeCourseDetail[0].careerOutcome) ==
                          false)
                        CustomAutoSizeTextMontserrat(
                          text: "Career Outcome",
                          maxLines: 3,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      if (getNUllChecker(
                              completeCourseDetail[0].averageSalary) ==
                          false)
                        CustomAutoSizeTextMontserrat(
                          text: "Average salary",
                          maxLines: 3,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                    ]),
                    TableRow(children: [
                      if (getNUllChecker(
                              completeCourseDetail[0].careerOutcome) ==
                          false)
                        CustomAutoSizeTextMontserrat(
                          text: completeCourseDetail[0].careerOutcome ?? "",
                          textColor: ThemeConstants.TextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      if (getNUllChecker(
                              completeCourseDetail[0].averageSalary) ==
                          false)
                        CustomAutoSizeTextMontserrat(
                          text: completeCourseDetail[0].averageSalary ??
                              "" "(${completeCourseDetail[0].averageSalaryInr ?? ""}INR)",
                          textColor: ThemeConstants.TextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                    ]),
                  ],
                ),
              ),
            const SizedBox(
              height: 10,
            ),
            if (getNUllChecker(completeCourseDetail[0].applicationTat) ==
                    false ||
                getNUllChecker(completeCourseDetail[0].scholarship) == false)
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10),
                child: Table(
                  children: [
                    TableRow(children: [
                      if (getNUllChecker(
                              completeCourseDetail[0].applicationTat) ==
                          false)
                        CustomAutoSizeTextMontserrat(
                          text: "Application TAT\n(in days)",
                          maxLines: 3,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      if (getNUllChecker(completeCourseDetail[0].scholarship) ==
                          false)
                        CustomAutoSizeTextMontserrat(
                          text: "Scholarship",
                          maxLines: 3,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                    ]),
                    TableRow(children: [
                      if (getNUllChecker(
                              completeCourseDetail[0].applicationTat) ==
                          false)
                        CustomAutoSizeTextMontserrat(
                          text: completeCourseDetail[0].applicationTat != null
                              ? completeCourseDetail[0]
                                  .applicationTat
                                  .toString()
                              : "",
                          textColor: ThemeConstants.TextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      if (getNUllChecker(completeCourseDetail[0].scholarship) ==
                          false)
                        CustomAutoSizeTextMontserrat(
                          text: completeCourseDetail[0].scholarship ?? "",
                          maxLines: 3,
                          textColor: ThemeConstants.TextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                    ]),
                  ],
                ),
              ),
            const SizedBox(
              height: 10,
            ),
            if (getNUllChecker(completeCourseDetail[0].scholarshipCriteria) ==
                false)
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10),
                child: Table(
                  children: [
                    TableRow(children: [
                      CustomAutoSizeTextMontserrat(
                        text: "Scholarship Criteria",
                        maxLines: 3,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ]),
                    TableRow(children: [
                      HtmlWidget(
                        completeCourseDetail[0].scholarshipCriteria,
                        textStyle: TextStyle(
                          color: ThemeConstants.TextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // CustomAutoSizeTextMontserrat(
                      //   text: completeCourseDetail[0].scholarshipCriteria,
                      //   textColor: ThemeConstants.TextColor,
                      //   fontSize: 14,
                      //   fontWeight: FontWeight.w600,
                      // ),
                    ]),
                  ],
                ),
              ),
            if (getNUllChecker(completeCourseDetail[0].scholarshipCriteria) ==
                false)
              const SizedBox(
                height: 10,
              ),
            if (getNUllChecker(
                    completeCourseDetail[0].specializationDescription) ==
                false)
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10),
                child: Table(
                  children: [
                    TableRow(children: [
                      CustomAutoSizeTextMontserrat(
                        text: "Specialization Descripition",
                        maxLines: 3,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ]),
                    TableRow(children: [
                      CustomAutoSizeTextMontserrat(
                        text: completeCourseDetail[0].specializationDescription,
                        textColor: ThemeConstants.TextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ]),
                  ],
                ),
              ),
            if (getNUllChecker(completeCourseDetail[0].description) == false)
              const SizedBox(
                height: 10,
              ),
            if (getNUllChecker(completeCourseDetail[0].description) == false)
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10),
                child: Table(
                  children: [
                    TableRow(children: [
                      CustomAutoSizeTextMontserrat(
                        text: "Course Descripition",
                        maxLines: 3,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ]),
                    TableRow(children: [
                      CustomAutoSizeTextMontserrat(
                        text: completeCourseDetail[0].description,
                        textColor: ThemeConstants.TextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ]),
                  ],
                ),
              ),
            if (getNUllChecker(completeCourseDetail[0].naces) == false ||
                getNUllChecker(completeCourseDetail[0].cpt) == false)
              const SizedBox(
                height: 10,
              ),
            if (getNUllChecker(completeCourseDetail[0].naces) == false ||
                getNUllChecker(completeCourseDetail[0].cpt) == false)
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10),
                child: Table(
                  children: [
                    TableRow(children: [
                      if (getNUllChecker(completeCourseDetail[0].naces))
                        CustomAutoSizeTextMontserrat(
                          text: "NACES Evaluation Required",
                          maxLines: 3,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      if (getNUllChecker(completeCourseDetail[0].cpt))
                        CustomAutoSizeTextMontserrat(
                          text: "CPT",
                          maxLines: 3,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                    ]),
                    TableRow(children: [
                      if (getNUllChecker(completeCourseDetail[0].naces))
                        CustomAutoSizeTextMontserrat(
                          text: completeCourseDetail[0].naces ?? "",
                          textColor: ThemeConstants.TextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          maxLines: 3,
                        ),
                      if (getNUllChecker(completeCourseDetail[0].cpt))
                        CustomAutoSizeTextMontserrat(
                          text: completeCourseDetail[0].cpt ?? "",
                          textColor: ThemeConstants.TextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          maxLines: 3,
                        ),
                    ]),
                  ],
                ),
              ),
            if (getNUllChecker(completeCourseDetail[0].yearOfEducation) ==
                    false ||
                getNUllChecker(completeCourseDetail[0].stem) == false)
              const SizedBox(
                height: 10,
              ),
            if (getNUllChecker(completeCourseDetail[0].yearOfEducation) ==
                    false ||
                getNUllChecker(completeCourseDetail[0].stem) == false)
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10),
                child: Table(
                  children: [
                    TableRow(children: [
                      if (getNUllChecker(
                              completeCourseDetail[0].yearOfEducation) ==
                          false)
                        CustomAutoSizeTextMontserrat(
                          text: "15 Years of Education",
                          maxLines: 3,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      if (getNUllChecker(completeCourseDetail[0].stem) == false)
                        CustomAutoSizeTextMontserrat(
                          text: "STEM",
                          maxLines: 3,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                    ]),
                    TableRow(children: [
                      if (getNUllChecker(
                              completeCourseDetail[0].yearOfEducation) ==
                          false)
                        CustomAutoSizeTextMontserrat(
                          text: completeCourseDetail[0].yearOfEducation,
                          maxLines: 3,
                          textColor: ThemeConstants.TextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      if (getNUllChecker(completeCourseDetail[0].stem) == false)
                        CustomAutoSizeTextMontserrat(
                          text: completeCourseDetail[0].stem ?? "",
                          maxLines: 3,
                          textColor: ThemeConstants.TextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                    ]),
                  ],
                ),
              ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CustomAutoSizeTextMontserrat(
                  text: "Intakes",
                  fontSize: 18,
                  textColor: ThemeConstants.bluecolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  runSpacing: 10.0,
                  spacing: 10.0,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    if (getNUllChecker(
                            completeCourseDetail[0].intakeFromYear) ==
                        false)
                      Container(
                        height: 80,
                        width: 170,
                        decoration: BoxDecoration(
                          color: ThemeConstants.lightblueColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          children: [
                            const Spacer(),
                            CustomAutoSizeTextMontserrat(
                              text: "Avaliable Intake",
                              maxLines: 2,
                              fontSize: 14,
                              textColor: ThemeConstants.bluecolor,
                              fontWeight: FontWeight.bold,
                            ),
                            CustomAutoSizeTextMontserrat(
                              text: completeCourseDetail[0].intakeFromYear,
                              fontSize: 14,
                              maxLines: 2,
                              textColor: ThemeConstants.blackcolor,
                            ),
                            const Spacer()
                          ],
                        ),
                      ),
                    if (getNUllChecker(
                            completeCourseDetail[0].earlyApplicationDeadline) ==
                        false)
                      Container(
                        height: 80,
                        width: 180,
                        decoration: BoxDecoration(
                          color: ThemeConstants.lightorangeColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          children: [
                            const Spacer(),
                            CustomAutoSizeTextMontserrat(
                              text: "Early Appli. Deadline",
                              maxLines: 2,
                              fontSize: 14,
                              textColor: ThemeConstants.orangeColor,
                              fontWeight: FontWeight.bold,
                            ),
                            CustomAutoSizeTextMontserrat(
                              text: completeCourseDetail[0]
                                  .earlyApplicationDeadline,
                              maxLines: 2,
                              fontSize: 14,
                              textColor: ThemeConstants.blackcolor,
                            ),
                            const Spacer()
                          ],
                        ),
                      ),
                    if (getNUllChecker(completeCourseDetail[0]
                            .regularApplicationDeadline) ==
                        false)
                      Container(
                        height: 80,
                        width: 180,
                        decoration: BoxDecoration(
                          color: ThemeConstants.lightgreentColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          children: [
                            const Spacer(),
                            CustomAutoSizeTextMontserrat(
                              text: "Regular Appli. Deadline",
                              maxLines: 2,
                              textColor: ThemeConstants.GreenColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            CustomAutoSizeTextMontserrat(
                              text: completeCourseDetail[0]
                                  .regularApplicationDeadline,
                              maxLines: 2,
                              fontSize: 14,
                              textColor: ThemeConstants.blackcolor,
                            ),
                            const Spacer()
                          ],
                        ),
                      ),
                    if (getNUllChecker(
                            completeCourseDetail[0].courseDuration) ==
                        false)
                      Container(
                        height: 80,
                        width: 170,
                        decoration: BoxDecoration(
                          color: ThemeConstants.lightVioletColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          children: [
                            const Spacer(),
                            CustomAutoSizeTextMontserrat(
                              text: "Course Duration",
                              fontWeight: FontWeight.bold,
                              maxLines: 2,
                              fontSize: 14,
                              textColor: ThemeConstants.VioletColor,
                            ),
                            CustomAutoSizeTextMontserrat(
                              text:
                                  "${completeCourseDetail[0].courseDuration!} month",
                              maxLines: 2,
                              textColor: ThemeConstants.blackcolor,
                              fontSize: 14,
                            ),
                            const Spacer()
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
              child: Row(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
