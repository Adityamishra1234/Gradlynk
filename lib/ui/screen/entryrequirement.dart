import 'package:flutter/material.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class EntryRequirement extends StatelessWidget {
  List<CompleteCourseDetail> completeCourseDetail;
  EntryRequirement({Key? key, required this.completeCourseDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      physics: BouncingScrollPhysics(),
      children: [
        CustomAutoSizeTextMontserrat(
          text: "Academic Requirement",
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Table(
            children: [
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "Country",
                  fontWeight: FontWeight.bold,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "Level of study",
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "India",
                ),
                CustomAutoSizeTextMontserrat(
                  text: "class 12",
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
                  text: "Min. Percentage",
                  fontWeight: FontWeight.bold,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "Min. Grade",
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "65.00",
                ),
                CustomAutoSizeTextMontserrat(
                  text: "",
                ),
              ]),
            ],
          ),
        ),
        CustomAutoSizeTextMontserrat(
          text: "Mandatory Subject",
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Table(
            border: TableBorder.all(
              color: Colors.black,
              //style: BorderStyle.solid,
              width: 0.5,
            ),
            children: [
              TableRow(
                  decoration:
                      BoxDecoration(color: ThemeConstants.lightblueColor),
                  children: [
                    CustomAutoSizeTextMontserrat(
                      text: "Subject",
                      fontWeight: FontWeight.bold,
                    ),
                    CustomAutoSizeTextMontserrat(
                      text: "Percentage",
                      fontWeight: FontWeight.bold,
                    ),
                    CustomAutoSizeTextMontserrat(
                      text: "Grade",
                      fontWeight: FontWeight.bold,
                    ),
                  ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "",
                ),
                CustomAutoSizeTextMontserrat(
                  text: "",
                ),
                CustomAutoSizeTextMontserrat(
                  text: "",
                ),
              ]),
            ],
          ),
        ),
        CustomAutoSizeTextMontserrat(
          text: "English proficiency Requirement",
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Table(
            children: [
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "test Type",
                  fontWeight: FontWeight.bold,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "MIN.Grade",
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "TOEFL",
                ),
                CustomAutoSizeTextMontserrat(
                  text: "",
                ),
              ]),
            ],
          ),
        ),
      ],
    ));
  }
}
