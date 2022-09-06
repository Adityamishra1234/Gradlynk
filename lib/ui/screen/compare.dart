import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class Comparing extends StatelessWidget {
  const Comparing({Key? key}) : super(key: key);
  static const routeNamed = '/Compring';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("title"),
      body: ListView(
        children: [
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder(
                horizontalInside: BorderSide(
                    width: 1,
                    color: ThemeConstants.bluelightgreycolor2,
                    style: BorderStyle.solid),
                verticalInside: BorderSide(
                    width: 1,
                    color: ThemeConstants.bluelightgreycolor2,
                    style: BorderStyle.solid)),
            children: [
              TableRow(
                  decoration: const BoxDecoration(color: Color(0xFFECF0FB)),
                  children: [
                    TableCell(
                        child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 5, right: 5),
                        child: CustomAutoSizeTextMontserrat(
                            text: "University & Campus Name",
                            fontSize: 14,
                            textColor: ThemeConstants.bluecolor,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                    TableCell(
                        child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 5, right: 5),
                        child: CustomAutoSizeTextMontserrat(
                          text:
                              "California State University fresno (Fresno Campus)",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          textColor: ThemeConstants.bluecolor,
                        ),
                      ),
                    )),
                    TableCell(
                        child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 5, right: 5),
                        child: CustomAutoSizeTextMontserrat(
                          text:
                              "California State University fresno (Fresno Campus)",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          textColor: ThemeConstants.bluecolor,
                        ),
                      ),
                    )),
                  ]),
              TableRow(children: [
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                      color: ThemeConstants.lightgreycolor,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 5, right: 5),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Country",
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                        ),
                      ),
                    )),
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, left: 5, right: 5),
                  child: CustomAutoSizeTextMontserrat(
                    text: "USA",
                    fontSize: 14,
                    textColor: ThemeConstants.TextColor,
                  ),
                )),
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: "USA",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                    ),
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                      color: ThemeConstants.lightgreycolor,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 5, right: 5),
                        child: CustomAutoSizeTextMontserrat(
                          text: "State",
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                        ),
                      ),
                    )),
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: "California",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                    ),
                  ),
                )),
                TableCell(
                    child: Center(
                        child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, left: 5, right: 5),
                  child: CustomAutoSizeTextMontserrat(
                    text: "California",
                    fontSize: 14,
                    textColor: ThemeConstants.TextColor,
                  ),
                ))),
              ]),
              TableRow(children: [
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                      color: ThemeConstants.lightgreycolor,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 5, right: 5),
                        child: CustomAutoSizeTextMontserrat(
                          text: "City",
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                        ),
                      ),
                    )),
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: "Fresno",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                    ),
                  ),
                )),
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: "Fresno",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                    ),
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                      color: ThemeConstants.lightgreycolor,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 5, right: 5),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Course Name",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: "Bachelor of Science in Computer Engineering",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                    ),
                  ),
                )),
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: "Bachelor of Science in Computer Engineering",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                    ),
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                      color: ThemeConstants.lightgreycolor,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 5, right: 5),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Course Level",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: "Bachelor",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                    ),
                  ),
                )),
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: "Bachelor",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                    ),
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                      color: ThemeConstants.lightgreycolor,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 5, right: 5),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Course Duration",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: "4 year",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                    ),
                  ),
                )),
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: "4 year",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                    ),
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                      color: ThemeConstants.lightgreycolor,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 5, right: 5),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Scholarship",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: "YES",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                    ),
                  ),
                )),
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: "YES",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                    ),
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                      color: ThemeConstants.lightgreycolor,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 5, right: 5),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Annual Tuition Fees  ",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: "16089 USD [11901586 Inr]",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                    ),
                  ),
                )),
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: "16089 USD [11901586 Inr]",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                    ),
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                      color: ThemeConstants.lightgreycolor,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 5, right: 5),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Total  Fees ",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: " 16089 USD [11901586 Inr] ",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                    ),
                  ),
                )),
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: " 16089 USD [11901586 Inr] ",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                    ),
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                      color: ThemeConstants.lightgreycolor,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 5, right: 5),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Application Fees",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: "16089 USD [11901586 Inr]",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                    ),
                  ),
                )),
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: "16089 USD [11901586 Inr]",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                    ),
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                      color: ThemeConstants.lightgreycolor,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 5, right: 5),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Intake Month and Year-",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: "Aug|Jan|Sep",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                    ),
                  ),
                )),
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: Column(
                      children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Aug|Jan|Sep",
                          fontSize: 14,
                          textColor: ThemeConstants.TextColor,
                        ),
                      ],
                    ),
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                      color: ThemeConstants.lightgreycolor,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 5, right: 5),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Tests Required- ",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: "IELTS-6.0",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                    ),
                  ),
                )),
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: "IELTS-6.0",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                    ),
                  ),
                )),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
