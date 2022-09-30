import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownprofilepage.dart';

class CourseInformationCopy extends StatefulWidget {
  const CourseInformationCopy({Key? key}) : super(key: key);
  static const routeNamed = '/CourseInformationCopy';

  @override
  State<CourseInformationCopy> createState() => _CourseInformationCopyState();
}

class _CourseInformationCopyState extends State<CourseInformationCopy> {
  bool saveAndEdit = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("title"),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Course Information",
                textColor: ThemeConstants.bluecolor,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Course Level",
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: CustomDropDownProfilePage(
              text: "test1",
              callbackFunction: callback,
              hint: 'Test',
              model: ["1", "2", "3"],
              choosefieldtype: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Course Broad Field",
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: CustomDropDownProfilePage(
              text: "test1",
              callbackFunction: callback,
              hint: 'Test',
              model: ["1", "2", "3"],
              choosefieldtype: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Course Narrow Field",
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: CustomDropDownProfilePage(
              text: "test1",
              callbackFunction: callback,
              hint: 'Test',
              model: ["1", "2", "3"],
              choosefieldtype: false,
            ),
          ),
        ],
      ),
    );
  }

  // Funcation
  callback(varTopic) {
    // controller.setLoadingHighestQualification(true);

    // dashboardcontroller.setdropdown1(varTopic);
  }
}
