import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownprofilepage.dart';

class QualificationDetailsCopy extends StatefulWidget {
  const QualificationDetailsCopy({Key? key}) : super(key: key);
  static const routeNamed = '/QualificationDetailsCopy';

  @override
  State<QualificationDetailsCopy> createState() =>
      _QualificationDetailsCopyState();
}

class _QualificationDetailsCopyState extends State<QualificationDetailsCopy> {
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
                text: "Qualification Details",
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
                text: "Highest Qualification",
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
                text: "Stream",
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
                text: "Education Status",
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
                text: "Year of Passing",
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
                text: "Percentage",
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              textInputAction: TextInputAction.next,
              readOnly: saveAndEdit,
              decoration: InputDecoration(
                hintText: "Enter your Percentage",
                filled: true,
                fillColor: ThemeConstants.lightblueColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              style: ThemeConstants.montserrattextstyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Country of Education",
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
                text: "State",
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
                text: "City",
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
                text: "Affiliation",
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
                text: "name of the Institution",
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
                text: "Re-appear/Backlog",
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
