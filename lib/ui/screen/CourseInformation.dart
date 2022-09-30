import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CourseInformation extends StatelessWidget {
  List<CompleteCourseDetail> completeCourseDetail;
  CourseInformation({Key? key, required this.completeCourseDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: Table(
              children: [
                TableRow(
                    decoration: BoxDecoration(
                      color: ThemeConstants.lightgreentColor,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: ThemeConstants.GreenColor),
                    ),
                    children: [
                      if (completeCourseDetail[0].universityName != null)
                        Container(
                          constraints: const BoxConstraints(minHeight: 50),
                          child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: "Course Name",
                              maxLines: 2,
                              textColor: ThemeConstants.GreenColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      Container(
                        constraints: const BoxConstraints(minHeight: 50),
                        child: Center(
                          child: CustomAutoSizeTextMontserrat(
                            text: completeCourseDetail[0].courseName,
                            textColor: ThemeConstants.TextColor,
                            maxLines: 5,
                          ),
                        ),
                      ),
                    ]),
                const TableRow(children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ]),
                TableRow(
                    decoration: BoxDecoration(
                      color: ThemeConstants.lightblueColor,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: ThemeConstants.bluecolor),
                    ),
                    children: [
                      if (completeCourseDetail[0].instituteType != null)
                        Container(
                          constraints: const BoxConstraints(minHeight: 50),
                          child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: "Course Level",
                              maxLines: 2,
                              textColor: ThemeConstants.bluecolor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      Container(
                        constraints: const BoxConstraints(minHeight: 50),
                        child: Center(
                          child: CustomAutoSizeTextMontserrat(
                            text: completeCourseDetail[0].courseLevel,
                            textColor: ThemeConstants.TextColor,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ]),
                const TableRow(children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ]),
                TableRow(
                    decoration: BoxDecoration(
                      color: ThemeConstants.lightorangeColor,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: ThemeConstants.orangeColor),
                    ),
                    children: [
                      Container(
                        constraints: const BoxConstraints(minHeight: 50),
                        child: Center(
                          child: CustomAutoSizeTextMontserrat(
                            text: "Bachelors",
                            maxLines: 2,
                            textColor: ThemeConstants.orangeColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        constraints: const BoxConstraints(minHeight: 50),
                        child: Center(
                          child: CustomAutoSizeTextMontserrat(
                            text: "completeCourseDetail[0].b",
                            textColor: ThemeConstants.TextColor,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ]),
                const TableRow(children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ]),
                TableRow(
                    decoration: BoxDecoration(
                      color: ThemeConstants.lightVioletColor,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: ThemeConstants.VioletColor),
                    ),
                    children: [
                      if (completeCourseDetail[0].instituteType != null)
                        Container(
                          constraints: const BoxConstraints(minHeight: 50),
                          child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: "Specialization",
                              maxLines: 2,
                              textColor: ThemeConstants.VioletColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      Container(
                        constraints: const BoxConstraints(minHeight: 50),
                        child: Center(
                            child: HtmlWidget(
                          completeCourseDetail[0].specialEntryRequirement ?? "",
                          textStyle: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            color: ThemeConstants.TextColor,
                            fontSize: 16.0,
                          ),
                        )),
                      ),
                    ]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Table(
              children: [
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: "Course Narrow Field",
                    maxLines: 3,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: "Job Industry",
                    maxLines: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ]),
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: completeCourseDetail[0].narrowFieldName,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: completeCourseDetail[0].jobIndustry,
                    maxLines: 3,
                  ),
                ]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Table(
              children: [
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: "Career Outcome",
                    maxLines: 3,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: "Average salary",
                    maxLines: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ]),
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: completeCourseDetail[0].careerOutcome ?? "",
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: completeCourseDetail[0].averageSalary ??
                        "" "(${completeCourseDetail[0].averageSalaryInr ?? ""}INR)",
                    maxLines: 3,
                  ),
                ]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Table(
              children: [
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: "Application TAT(in days)",
                    maxLines: 3,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: "Scholarship",
                    maxLines: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ]),
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: completeCourseDetail[0].applicationTat != null
                        ? completeCourseDetail[0].applicationTat.toString()
                        : "",
                    maxLines: 3,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: completeCourseDetail[0].scholarship ?? "",
                    maxLines: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Table(
              children: [
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: "Scholarship Criteria",
                    maxLines: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ]),
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: completeCourseDetail[0].scholarshipCriteria,
                  ),
                ]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Table(
              children: [
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: "Specialization Descripition",
                    maxLines: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ]),
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: completeCourseDetail[0].specializationDescription,
                  ),
                ]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Table(
              children: [
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: "Course Descripition",
                    maxLines: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ]),
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: completeCourseDetail[0].description,
                  ),
                ]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Table(
              children: [
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: "NACES Evaluation Required",
                    maxLines: 3,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: "CPT",
                    maxLines: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ]),
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: completeCourseDetail[0].naces ?? "",
                    maxLines: 3,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: completeCourseDetail[0].cpt ?? "",
                    maxLines: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Table(
              children: [
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: "15 Years Of Education",
                    maxLines: 3,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: "STEM",
                    maxLines: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ]),
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: completeCourseDetail[0].yearOfEducation,
                    maxLines: 3,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: completeCourseDetail[0].stem ?? "",
                    maxLines: 3,
                  ),
                ]),
              ],
            ),
          ),
          CustomAutoSizeTextMontserrat(
            text: "Intakes",
            fontSize: 18,
            textColor: ThemeConstants.bluecolor,
            fontWeight: FontWeight.bold,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 170,
                  decoration: BoxDecoration(
                    color: ThemeConstants.lightblueColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      const Spacer(),
                      CustomAutoSizeTextMontserrat(
                        text: "Avaliable Intake",
                        maxLines: 2,
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
                const Spacer(),
                Container(
                  height: 80,
                  width: 180,
                  decoration: BoxDecoration(
                    color: ThemeConstants.lightorangeColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      const Spacer(),
                      CustomAutoSizeTextMontserrat(
                        text: "Early Appli. Deadline",
                        maxLines: 2,
                        textColor: ThemeConstants.orangeColor,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomAutoSizeTextMontserrat(
                        text: completeCourseDetail[0].earlyApplicationDeadline,
                        maxLines: 2,
                        fontSize: 14,
                        textColor: ThemeConstants.blackcolor,
                      ),
                      const Spacer()
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 180,
                  decoration: BoxDecoration(
                    color: ThemeConstants.lightblueColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      const Spacer(),
                      CustomAutoSizeTextMontserrat(
                        text: "Regular Appli. Deadline",
                        maxLines: 2,
                        textColor: ThemeConstants.bluecolor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomAutoSizeTextMontserrat(
                        text: "completeCourseDetail![0].",
                        maxLines: 2,
                        fontSize: 14,
                        textColor: ThemeConstants.blackcolor,
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
                    color: ThemeConstants.lightorangeColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      const Spacer(),
                      CustomAutoSizeTextMontserrat(
                        text: "Course Duration",
                        fontWeight: FontWeight.bold,
                        maxLines: 2,
                        fontSize: 14,
                        textColor: ThemeConstants.orangeColor,
                      ),
                      CustomAutoSizeTextMontserrat(
                        text: completeCourseDetail[0].courseDuration,
                        maxLines: 2,
                        textColor: ThemeConstants.blackcolor,
                        fontSize: 12,
                      ),
                      const Spacer()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
