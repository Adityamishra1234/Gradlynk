import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownprofilepage.dart';

class WorkHistoryCopy extends StatefulWidget {
  const WorkHistoryCopy({Key? key}) : super(key: key);
  static const routeNamed = '/WorkHistoryCopy';

  @override
  State<WorkHistoryCopy> createState() => _WorkHistoryCopyState();
}

class _WorkHistoryCopyState extends State<WorkHistoryCopy> {
  bool saveAndEdit = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Row(
                children: [
                  CustomAutoSizeTextMontserrat(
                    text: "Name of Last Organisation",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    textColor: ThemeConstants.TextColor,
                  ),
                  Spacer(),
                  if (saveAndEdit == false)
                    TextButton(
                        onPressed: () {
                          saveAndEdit = true;
                          setState(() {});
                        },
                        child: CustomAutoSizeTextMontserrat(
                          text: "save",
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          textColor: ThemeConstants.bluecolor,
                        )),
                  if (saveAndEdit)
                    TextButton(
                        onPressed: () {
                          saveAndEdit = false;
                          setState(() {});
                        },
                        child: CustomAutoSizeTextMontserrat(
                          text: "edit",
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          textColor: ThemeConstants.bluecolor,
                        ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              textInputAction: TextInputAction.next,
              readOnly: saveAndEdit,
              decoration: InputDecoration(
                hintText: "Enter name of last organisation",
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
                text: "Working From",
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
                hintText: "Enter working from date",
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
                text: "Working Till",
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
                hintText: "Enter working till date",
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
                text: "Industry",
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
                hintText: "Drop down Field",
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
                text: "Designation",
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
                hintText: "Enter your DEsignation",
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
                text: "Employement Type",
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // SizedBox(
          //   height: 60,
          //   child: CustomDropDownProfilePage(
          //     text: "test1",
          //     callbackFunction: callback,
          //     hint: 'Test',
          //     model: ["1", "2", "3"],
          //     choosefieldtype: saveAndEdit,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Income As per ITR",
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
                hintText: "Enter Income",
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
