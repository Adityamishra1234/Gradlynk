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
      physics: BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 10),
          child: Table(
            children: [
              TableRow(
                  decoration: BoxDecoration(
                    color: ThemeConstants.lightgreentColor,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: ThemeConstants.GreenColor),
                  ),
                  children: [
                    if (completeCourseDetail[0].universityName != null)
                      Container(
                        constraints: BoxConstraints(minHeight: 50),
                        child: Center(
                          child: CustomAutoSizeTextMontserrat(
                            text: "Country",
                            maxLines: 2,
                            textColor: ThemeConstants.GreenColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    Container(
                      constraints: BoxConstraints(minHeight: 50),
                      child: Center(
                        child: CustomAutoSizeTextMontserrat(
                          text: "completeCourseDetail[0]",
                          textColor: ThemeConstants.TextColor,
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
                    border: Border.all(color: ThemeConstants.bluecolor),
                  ),
                  children: [
                    Container(
                      constraints: BoxConstraints(minHeight: 50),
                      child: Center(
                        child: CustomAutoSizeTextMontserrat(
                          text: "Level of study",
                          maxLines: 2,
                          textColor: ThemeConstants.bluecolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (completeCourseDetail[0].instituteType != null)
                      Container(
                        constraints: BoxConstraints(minHeight: 50),
                        child: Center(
                          child: CustomAutoSizeTextMontserrat(
                            text: "completeCourseDetail[0]",
                            textColor: ThemeConstants.TextColor,
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
                    border: Border.all(color: ThemeConstants.orangeColor),
                  ),
                  children: [
                    if (completeCourseDetail[0].instituteType != null)
                      Container(
                        constraints: BoxConstraints(minHeight: 50),
                        child: Center(
                          child: CustomAutoSizeTextMontserrat(
                            text: "Min Percentage",
                            maxLines: 2,
                            textColor: ThemeConstants.orangeColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    Container(
                      constraints: BoxConstraints(minHeight: 50),
                      child: Center(
                        child: CustomAutoSizeTextMontserrat(
                          text: completeCourseDetail[0].minPercentage,
                          textColor: ThemeConstants.TextColor,
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
                    border: Border.all(color: ThemeConstants.VioletColor),
                  ),
                  children: [
                    if (completeCourseDetail[0].instituteType != null)
                      Container(
                        constraints: BoxConstraints(minHeight: 50),
                        child: Center(
                          child: CustomAutoSizeTextMontserrat(
                            text: "Min. Grade",
                            maxLines: 2,
                            textColor: ThemeConstants.VioletColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    Container(
                      constraints: BoxConstraints(minHeight: 50),
                      child: Center(
                          child: HtmlWidget(
                        completeCourseDetail[0].minGrade ?? "",
                        textStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: ThemeConstants.TextColor,
                          fontSize: 16.0,
                        ),
                      )),
                    ),
                  ]),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 10),
          child: CustomAutoSizeTextMontserrat(
            text: "Mandatory Subject ",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            textColor: ThemeConstants.bluecolor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Table(
            border: TableBorder.all(),
            children: [
              TableRow(
                  decoration: const BoxDecoration(color: Color(0xFFECF0FB)),
                  children: [
                    TableCell(
                        child: Center(
                      child: CustomAutoSizeTextMontserrat(
                        text: "Subject",
                      ),
                    )),
                    TableCell(
                      child: Center(
                        child: CustomAutoSizeTextMontserrat(
                          text: "Percentage",
                        ),
                      ),
                    ),
                    TableCell(
                        child: Center(
                      child: CustomAutoSizeTextMontserrat(
                        text: "Grade",
                      ),
                    )),
                  ]),
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: CustomAutoSizeTextMontserrat(
                    text: completeCourseDetail[0].mandatorySubjectName,
                  ),
                )),
                TableCell(
                  child: Center(
                    child: CustomAutoSizeTextMontserrat(
                      text: completeCourseDetail[0]
                          .minPercentageForMandatorySubject,
                    ),
                  ),
                ),
                TableCell(
                    child: Center(
                  child: CustomAutoSizeTextMontserrat(
                    text: completeCourseDetail[0].minGradeForMandatorySubject,
                  ),
                )),
              ]),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 10),
          child: CustomAutoSizeTextMontserrat(
            text: "English Test Requirement",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            textColor: ThemeConstants.bluecolor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Table(
            border: TableBorder.all(),
            children: [
              TableRow(
                  decoration: const BoxDecoration(color: Color(0xFFECF0FB)),
                  children: [
                    TableCell(
                        child: Center(
                      child: CustomAutoSizeTextMontserrat(
                        text: "Test Type",
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    )),
                    TableCell(
                      child: Center(
                        child: CustomAutoSizeTextMontserrat(
                          text: "Listening",
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    TableCell(
                        child: Center(
                      child: CustomAutoSizeTextMontserrat(
                        text: "Reading",
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    )),
                    TableCell(
                        child: Center(
                      child: CustomAutoSizeTextMontserrat(
                        text: "Writing",
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    )),
                    TableCell(
                        child: Center(
                      child: CustomAutoSizeTextMontserrat(
                        text: "Speaking",
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    )),
                    TableCell(
                        child: Center(
                      child: CustomAutoSizeTextMontserrat(
                        text: "Overall",
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
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
          padding: const EdgeInsets.only(top: 15, left: 10),
          child: CustomAutoSizeTextMontserrat(
            text: "Others Test Requirement",
            fontSize: 18,
            textColor: ThemeConstants.bluecolor,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ));
  }
}
