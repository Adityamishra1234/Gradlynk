import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class AboutInstitute extends StatelessWidget {
  List<CompleteCourseDetail> completeCourseDetail;
  AboutInstitute({Key? key, required this.completeCourseDetail})
      : super(key: key);
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
                    text: "Institute Name",
                    maxLines: 1,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: "Institute Type",
                    maxLines: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ]),
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: "Valparaiso university",
                    maxLines: 1,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: "University",
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
                    text: "Campus",
                    maxLines: 1,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: "Institute Address",
                    maxLines: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ]),
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: "Indiana",
                    maxLines: 1,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text:
                        "1700 Chapel Dr, Valparaiso, IN 46383, United State phone:+1 219-464-5000",
                    maxLines: 5,
                  ),
                ]),
              ],
            ),
          ),
          Row(
            children: [
              CustomAutoSizeTextMontserrat(
                text: "About Institute",
                maxLines: 1,
                fontWeight: FontWeight.bold,
              ),
              const Spacer(),
            ],
          ),
          CustomAutoSizeTextMontserrat(text: s2, maxLines: 100),
          Row(
            children: [
              CustomAutoSizeTextMontserrat(
                text: "SIEC Represented",
                maxLines: 1,
                fontWeight: FontWeight.bold,
              ),
              const Spacer(),
            ],
          ),
          CustomAutoSizeTextMontserrat(text: "Yes", maxLines: 1),
          CustomAutoSizeTextMontserrat(
            text: "Total Numbers of Student",
            maxLines: 1,
            fontWeight: FontWeight.bold,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Table(
              children: [
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: "No of Internation students",
                    maxLines: 1,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: "No of indian Student",
                    maxLines: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ]),
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: "258",
                    maxLines: 1,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: "144",
                    maxLines: 1,
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
