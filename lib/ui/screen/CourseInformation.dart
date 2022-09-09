import 'package:flutter/cupertino.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
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
            padding: const EdgeInsets.only(top: 5),
            child: Table(
              children: [
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: "Course Name",
                    maxLines: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ]),
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: completeCourseDetail[0].courseName ?? "",
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
                    text: "Course Level",
                    maxLines: 3,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: "Bachelors",
                    maxLines: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ]),
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: completeCourseDetail[0].courseLevel,
                    maxLines: 3,
                  ),
                  //hard code
                  CustomAutoSizeTextMontserrat(
                    text: "Information technology",
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
                    text: "Course Narrow Field",
                    maxLines: 3,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: "Specialization",
                    maxLines: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ]),
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: completeCourseDetail[0].narrowFieldName,
                    maxLines: 3,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: "",
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
                    text: "Specialization Des",
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
                    text:
                        completeCourseDetail[0].specializationDescription ?? "",
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
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Table(
              children: [
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: "Avaliable Intake",
                    maxLines: 3,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: "Early Appl. Deadline",
                    maxLines: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ]),
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: "Computer Science",
                    maxLines: 3,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text:
                        completeCourseDetail[0].earlyApplicationDeadline ?? "",
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
                    text: "regular Appl. Deadline",
                    maxLines: 3,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: "Course Duration",
                    maxLines: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ]),
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: "",
                    maxLines: 3,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: completeCourseDetail[0].courseDuration ?? "",
                    maxLines: 3,
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
