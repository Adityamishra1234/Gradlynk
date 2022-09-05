import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class Comparing extends StatelessWidget {
  const Comparing({Key? key}) : super(key: key);
  static const routeNamed = '/Compring';
  final rowSpacer = const TableRow(children: [
    SizedBox(
      height: 8,
    ),
    const SizedBox(
      height: 8,
    )
  ]);

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
                    color: ThemeConstants.lightgreycolor,
                    style: BorderStyle.solid),
                verticalInside: BorderSide(
                    width: 1,
                    color: ThemeConstants.lightgreycolor,
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
                          text:
                              "California State University fresno (Fresno Campus)",
                          fontSize: 14,
                          textColor: ThemeConstants.bluecolor,
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
                          text:
                              "California State University fresno (Fresno Campus)",
                          fontSize: 14,
                          textColor: ThemeConstants.bluecolor,
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
                          text:
                              "California State University fresno (Fresno Campus)",
                          fontSize: 14,
                          textColor: ThemeConstants.bluecolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                  ]),
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5, right: 5, top: 15, bottom: 15),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 5, right: 5),
                      child: CustomAutoSizeTextMontserrat(
                        text: "USA",
                        fontSize: 14,
                        textColor: ThemeConstants.TextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                      text: "USA",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: "California",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
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
                      text: "California",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
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
                    text: "California",
                    fontSize: 14,
                    textColor: ThemeConstants.TextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ))),
              ]),
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: "Fresno",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
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
                      text: "Fresno",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
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
                      text: "Fresno",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
              ]),
              // TableRow(children: [
              //   TableCell(
              //       child: Center(
              //     child: Padding(
              //       padding: const EdgeInsets.only(
              //           top: 15, bottom: 15, left: 5, right: 5),
              //       child: CustomAutoSizeTextMontserrat(
              //         text: "Fresno",
              //         fontSize: 14,
              //         textColor: ThemeConstants.TextColor,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   )),
              //   TableCell(
              //       child: Center(
              //     child: Padding(
              //       padding: const EdgeInsets.only(
              //           top: 15, bottom: 15, left: 5, right: 5),
              //       child: CustomAutoSizeTextMontserrat(
              //         text: "Fresno",
              //         fontSize: 14,
              //         textColor: ThemeConstants.TextColor,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   )),
              //   TableCell(
              //       child: Center(
              //     child: Padding(
              //       padding: const EdgeInsets.only(
              //           top: 15, bottom: 15, left: 5, right: 5),
              //       child: CustomAutoSizeTextMontserrat(
              //         text: "Fresno",
              //         fontSize: 14,
              //         textColor: ThemeConstants.TextColor,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   )),
              // ]),

              TableRow(children: [
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: "Bachelor of Science in Computer Engineering",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: "Bachelor",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: "4 year",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: Column(
                      children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Scholarship - ",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "YES",
                          fontSize: 14,
                          textColor: ThemeConstants.TextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
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
                          text: "Scholarship - ",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "YES",
                          fontSize: 14,
                          textColor: ThemeConstants.TextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
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
                          text: "Scholarship - ",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "YES",
                          fontSize: 14,
                          textColor: ThemeConstants.TextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: Column(
                      children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Annual Tuition Fees - ",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "16089 USD [11901586 Inr]",
                          fontSize: 14,
                          textColor: ThemeConstants.TextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
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
                          text: "Annual Tuition Fees - ",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "16089 USD [11901586 Inr]",
                          fontSize: 14,
                          textColor: ThemeConstants.TextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
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
                          text: "Annual Tuition Fees - ",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "16089 USD [11901586 Inr]",
                          fontSize: 14,
                          textColor: ThemeConstants.TextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: Column(
                      children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Total  Fees ",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: " 16089 USD [11901586 Inr] ",
                          fontSize: 14,
                          textColor: ThemeConstants.TextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
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
                          text: "Total Fees ",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: " 16089 USD [11901586 Inr] ",
                          fontSize: 14,
                          textColor: ThemeConstants.TextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
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
                          text: "Total  Fees ",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: " 16089 USD [11901586 Inr] ",
                          fontSize: 14,
                          textColor: ThemeConstants.TextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: Column(
                      children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Application Fees",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "16089 USD [11901586 Inr]",
                          fontSize: 14,
                          textColor: ThemeConstants.TextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
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
                          text: "Application Fees",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "16089 USD [11901586 Inr]",
                          fontSize: 14,
                          textColor: ThemeConstants.TextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
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
                          text: "Application Fees",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "16089 USD [11901586 Inr]",
                          fontSize: 14,
                          textColor: ThemeConstants.TextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: Column(
                      children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Intake Month and Year-",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Aug|Jan|Sep",
                          fontSize: 14,
                          textColor: ThemeConstants.TextColor,
                        ),
                      ],
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
                          text: "Intake Month and Year-",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Aug|Jan|Sep",
                          fontSize: 14,
                          textColor: ThemeConstants.TextColor,
                        ),
                      ],
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
                          text: "Intake Month and Year-",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
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
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: Column(
                      children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Tests Required- ",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "IELTS-6.0",
                          fontSize: 14,
                          textColor: ThemeConstants.TextColor,
                        ),
                      ],
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
                          text: "Tests Required- ",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "IELTS-6.0",
                          fontSize: 14,
                          textColor: ThemeConstants.TextColor,
                        ),
                      ],
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
                          text: "Tests Required- ",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "IELTS-6.0",
                          fontSize: 14,
                          textColor: ThemeConstants.TextColor,
                        ),
                      ],
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
