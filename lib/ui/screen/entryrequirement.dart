import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:google_fonts/google_fonts.dart';
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
      controller: ScrollController(),
      physics: const BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
          child: Table(
            children: [
              TableRow(
                  decoration: BoxDecoration(
                    color: ThemeConstants.lightgreentColor,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                        color: ThemeConstants.GreenColor, width: 0.5),
                  ),
                  children: [
                    if (completeCourseDetail[0].universityName != null)
                      Container(
                        constraints: const BoxConstraints(minHeight: 50),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: CustomAutoSizeTextMontserrat(
                              text: "Country",
                              maxLines: 2,
                              textColor: ThemeConstants.GreenColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    Container(
                      constraints: const BoxConstraints(minHeight: 50),
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: "completeCourseDetail[0]",
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.w600,
                          maxLines: 5,
                        ),
                      ),
                    ),
                  ]),
              const TableRow(children: [
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
              ]),
              TableRow(
                  decoration: BoxDecoration(
                    color: ThemeConstants.lightblueColor,
                    borderRadius: BorderRadius.circular(10.0),
                    border:
                        Border.all(color: ThemeConstants.bluecolor, width: 0.5),
                  ),
                  children: [
                    Container(
                      constraints: const BoxConstraints(minHeight: 50),
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: CustomAutoSizeTextMontserrat(
                            text: "Level of study",
                            maxLines: 2,
                            textColor: ThemeConstants.bluecolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    if (completeCourseDetail[0].instituteType != null)
                      Container(
                        constraints: const BoxConstraints(minHeight: 50),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: CustomAutoSizeTextMontserrat(
                            text: "completeCourseDetail[0]",
                            fontSize: 14,
                            textColor: ThemeConstants.blackcolor,
                            fontWeight: FontWeight.w600,
                            maxLines: 2,
                          ),
                        ),
                      ),
                  ]),
              const TableRow(children: [
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
              ]),
              TableRow(
                  decoration: BoxDecoration(
                    color: ThemeConstants.lightorangeColor,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                        color: ThemeConstants.orangeColor, width: 0.5),
                  ),
                  children: [
                    if (completeCourseDetail[0].instituteType != null)
                      Container(
                        constraints: const BoxConstraints(minHeight: 50),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: CustomAutoSizeTextMontserrat(
                              text: "Min Percentage",
                              maxLines: 2,
                              textColor: ThemeConstants.orangeColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    Container(
                      constraints: const BoxConstraints(minHeight: 50),
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: completeCourseDetail[0].minPercentage,
                          fontSize: 14,
                          textColor: ThemeConstants.blackcolor,
                          fontWeight: FontWeight.w600,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ]),
              const TableRow(children: [
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
              ]),
              TableRow(
                  decoration: BoxDecoration(
                    color: ThemeConstants.lightVioletColor,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                        color: ThemeConstants.VioletColor, width: 0.5),
                  ),
                  children: [
                    if (completeCourseDetail[0].instituteType != null)
                      Container(
                        constraints: const BoxConstraints(minHeight: 50),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: CustomAutoSizeTextMontserrat(
                              text: "Min. Grade",
                              maxLines: 2,
                              textColor: ThemeConstants.VioletColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    Container(
                      constraints: const BoxConstraints(minHeight: 50),
                      child: Center(
                          child: HtmlWidget(
                        completeCourseDetail[0].minGrade ?? "",
                        textStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: ThemeConstants.blackcolor,
                          fontSize: 14.0,
                        ),
                      )),
                    ),
                  ]),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 15),
          child: CustomAutoSizeTextMontserrat(
            text: "Mandatory Subject ",
            fontWeight: FontWeight.bold,
            textColor: ThemeConstants.bluecolor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 10, top: 10),
          child: Table(
            border: TableBorder.all(),
            children: [
              TableRow(
                  decoration: const BoxDecoration(color: Color(0xFFECF0FB)),
                  children: [
                    TableCell(
                        child: SizedBox(
                      height: 25,
                      child: Center(
                        child: CustomAutoSizeTextMontserrat(
                          text: "Subject",
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    )),
                    TableCell(
                      child: SizedBox(
                        height: 25,
                        child: Center(
                          child: CustomAutoSizeTextMontserrat(
                            text: "Percentage",
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                        child: SizedBox(
                      height: 25,
                      child: Center(
                        child: CustomAutoSizeTextMontserrat(
                          text: "Grade",
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    )),
                  ]),
              TableRow(children: [
                TableCell(
                    child: SizedBox(
                  height: 25,
                  child: Center(
                    child: CustomAutoSizeTextMontserrat(
                      text: completeCourseDetail[0].mandatorySubjectName,
                    ),
                  ),
                )),
                TableCell(
                  child: SizedBox(
                    height: 25,
                    child: Center(
                      child: CustomAutoSizeTextMontserrat(
                        text: completeCourseDetail[0]
                            .minPercentageForMandatorySubject,
                      ),
                    ),
                  ),
                ),
                TableCell(
                    child: SizedBox(
                  height: 25,
                  child: Center(
                    child: CustomAutoSizeTextMontserrat(
                      text: completeCourseDetail[0].minGradeForMandatorySubject,
                    ),
                  ),
                )),
              ]),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 15,
            left: 15,
          ),
          child: CustomAutoSizeTextMontserrat(
            text: "English Test Requirement",
            fontWeight: FontWeight.bold,
            textColor: ThemeConstants.bluecolor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 10, top: 10),
          child: Table(
            border: TableBorder.all(),
            children: [
              TableRow(
                  decoration: const BoxDecoration(color: Color(0xFFECF0FB)),
                  children: [
                    TableCell(
                        child: SizedBox(
                      height: 25,
                      child: Center(
                        child: CustomAutoSizeTextMontserrat(
                          text: "Test Type",
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    )),
                    TableCell(
                      child: SizedBox(
                        height: 25,
                        child: Center(
                          child: CustomAutoSizeTextMontserrat(
                            text: "Listening",
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                        child: SizedBox(
                      height: 25,
                      child: Center(
                        child: CustomAutoSizeTextMontserrat(
                          text: "Reading",
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    )),
                    TableCell(
                        child: SizedBox(
                      height: 25,
                      child: Center(
                        child: CustomAutoSizeTextMontserrat(
                          text: "Writing",
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    )),
                    TableCell(
                        child: SizedBox(
                      height: 25,
                      child: Center(
                        child: CustomAutoSizeTextMontserrat(
                          text: "Speaking",
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    )),
                    TableCell(
                        child: SizedBox(
                      height: 25,
                      child: Center(
                        child: CustomAutoSizeTextMontserrat(
                          text: "Overall",
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    )),
                  ]),
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: CustomAutoSizeTextMontserrat(
                    text: "",
                  ),
                )),
                TableCell(
                  child: Center(
                    child: CustomAutoSizeTextMontserrat(
                      text: "",
                    ),
                  ),
                ),
                TableCell(
                    child: Center(
                  child: CustomAutoSizeTextMontserrat(
                    text: "",
                  ),
                )),
                TableCell(
                    child: Center(
                  child: CustomAutoSizeTextMontserrat(
                    text: "",
                  ),
                )),
                TableCell(
                    child: Center(
                  child: CustomAutoSizeTextMontserrat(
                    text: "",
                  ),
                )),
                TableCell(
                    child: Center(
                  child: CustomAutoSizeTextMontserrat(
                    text: "",
                  ),
                )),
              ]),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 15),
          child: CustomAutoSizeTextMontserrat(
            text: "Others Test Requirement",
            textColor: ThemeConstants.bluecolor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Row(
            children: [
              Center(
                child: Container(
                  height: 35,
                  width: 150,
                  decoration: BoxDecoration(
                      color: ThemeConstants.bluecolor,
                      borderRadius: BorderRadiusDirectional.circular(10)),
                  child: Center(
                    child: CustomAutoSizeTextMontserrat(
                      text: "SAT Components",
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      textColor: ThemeConstants.whitecolor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 15),
          child: Table(
            children: [
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "Math",
                  maxLines: 2,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "Reading + Writing And Language",
                  maxLines: 2,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "0",
                  textColor: ThemeConstants.TextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  maxLines: 2,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "0",
                  textColor: ThemeConstants.TextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  maxLines: 2,
                ),
              ]),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 15),
          child: Table(
            children: [
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "Eassay(Optional)",
                  maxLines: 2,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "Overrall Score",
                  maxLines: 2,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "0",
                  textColor: ThemeConstants.TextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  maxLines: 2,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "0",
                  textColor: ThemeConstants.TextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  maxLines: 2,
                ),
              ]),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: CustomAutoSizeTextMontserrat(
            text: "Special Entry Requirement",
            textColor: ThemeConstants.bluecolor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 15),
          child: Table(
            children: [
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "Flexible ",
                  fontSize: 14,
                  maxLines: 2,
                  fontWeight: FontWeight.bold,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "Baclogs Acceptable",
                  fontSize: 14,
                  maxLines: 2,
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "No",
                  textColor: ThemeConstants.TextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  maxLines: 2,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "Yes",
                  textColor: ThemeConstants.TextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  maxLines: 2,
                ),
              ]),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 15),
          child: Table(
            children: [
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "Number",
                  fontSize: 14,
                  maxLines: 2,
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "4",
                  textColor: ThemeConstants.TextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  maxLines: 2,
                ),
              ]),
            ],
          ),
        ),
      ],
    ));
  }
}
