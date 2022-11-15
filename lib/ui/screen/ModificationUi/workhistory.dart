import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownprofilepage.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';

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
        controller: ScrollController(),
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: TextButton(
                  onPressed: () {},
                  child: CustomAutoSizeTextMontserrat(
                    text: "View Details",
                    fontSize: 14,
                    textColor: ThemeConstants.orangeColor,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Name of Last Organisation",
                fontSize: 14,
                fontWeight: FontWeight.bold,
                textColor: ThemeConstants.TextColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              textInputAction: TextInputAction.next,
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
          SizedBox(
            height: 50,
            child: CustomDropDownSingle(
              model: ["1", "2", "3"],
              initialSelectedValue: "1",
              choosefieldtype: false,
              callbackFunction: callback,
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
          SizedBox(
            height: 50,
            child: CustomDropDownSingle(
              model: ["1", "2", "3"],
              initialSelectedValue: "1",
              choosefieldtype: false,
              callbackFunction: callback,
            ),
          ),
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
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20),
                  child: SizedBox(
                    width: 90,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          primary: ThemeConstants.bluecolor, // background
                          onPrimary: ThemeConstants.bluecolor, // foreground
                        ),
                        onPressed: () async {
                          // Api call
                        },
                        child: CustomAutoSizeTextMontserrat(
                          text: "Added",
                          textColor: ThemeConstants.whitecolor,
                        )),
                  ),
                ),
              ],
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
