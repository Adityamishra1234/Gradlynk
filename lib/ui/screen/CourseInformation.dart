import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CourseInformation extends StatelessWidget {
  CourseInformation({Key? key}) : super(key: key);
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
    return Expanded(
        child: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Table(
            children: [
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "Course Name",
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "Bachelor of Science in Computer Science",
                  maxLines: 1,
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
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "Bachelors",
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "Bachelors",
                  maxLines: 1,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "Information technology",
                  maxLines: 1,
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
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "Specialization",
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "Computer Science",
                  maxLines: 1,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "",
                  maxLines: 1,
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
                  text: "Specialization Das",
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "Job Industry",
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "",
                  maxLines: 1,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "Information technology",
                  maxLines: 1,
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
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "Average salary",
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text:
                      "Computer Engineers | Data Security Specialists |Systems Analysts | Tech Support Specialists ",
                  maxLines: 10,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "USD(in INR :0)",
                  maxLines: 1,
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
                  text: "Application TAT9in days)",
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "Scholarship",
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "0",
                  maxLines: 1,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "Yes",
                  maxLines: 1,
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
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: s2,
                  maxLines: 100,
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
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "CPT",
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "No",
                  maxLines: 1,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "No",
                  maxLines: 1,
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
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "STEM",
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "No",
                  maxLines: 1,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "No",
                  maxLines: 1,
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
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "Specialization",
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "Computer Science",
                  maxLines: 1,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "",
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
              ]),
            ],
          ),
        ),
      ],
    ));
  }
}
