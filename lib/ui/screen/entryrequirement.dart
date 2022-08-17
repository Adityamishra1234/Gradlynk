import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class EntryRequirement extends StatelessWidget {
  const EntryRequirement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: [
        CustomAutoSizeTextMontserrat(text: "Academic Requirement", maxLines: 1),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Table(
            children: [
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "Country",
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "Level of study",
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "India",
                  maxLines: 1,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "class 12",
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
                  text: "Min. Percentage",
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "Min. Grade",
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "65.00",
                  maxLines: 1,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "",
                  maxLines: 1,
                ),
              ]),
            ],
          ),
        ),
        CustomAutoSizeTextMontserrat(text: "Mandatory Subject", maxLines: 1),
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
                      maxLines: 1,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomAutoSizeTextMontserrat(
                      text: "Percentage",
                      maxLines: 1,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomAutoSizeTextMontserrat(
                      text: "Grade",
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
                  text: "",
                  maxLines: 1,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "",
                  maxLines: 1,
                ),
              ]),
            ],
          ),
        ),
        CustomAutoSizeTextMontserrat(
            text: "English proficiency Requirement", maxLines: 1),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Table(
            children: [
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "test Type",
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "MIN.Grade",
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "TOEFL",
                  maxLines: 1,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "",
                  maxLines: 1,
                ),
              ]),
            ],
          ),
        ),
      ],
    ));
  }
}
