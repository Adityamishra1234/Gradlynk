import 'package:flutter/cupertino.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/fielddetail.dart';

class CourseDetail extends StatelessWidget {
  const CourseDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        controller: ScrollController(),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 15),
            child: CustomAutoSizeTextMontserrat(
              text: "Course Details -",
              fontWeight: FontWeight.bold,
              textColor: ThemeConstants.bluecolor,
            ),
          ),
          FieldDetail(
            firstField: "Course Name",
            secondField: "Bachelor of Business (Sport Management)",
          ),
          FieldDetail(
            firstField: "University",
            secondField: "Deakin University",
          ),
          FieldDetail(
            firstField: "Campus",
            secondField: "Melbourne Burwood Campus",
          ),
          FieldDetail(
            firstField: "Course Duration",
            secondField: "3 Year",
          ),
          FieldDetail(
            firstField: "Course Board Field",
            secondField: "Management and Commerce",
          ),
          FieldDetail(
            firstField: "Course Narrow Field",
            secondField: "Business and Management",
          ),
          FieldDetail(
            firstField: "Course Narrow Field",
            secondField: "Business and Management",
          ),
        ],
      ),
    );
  }
}
