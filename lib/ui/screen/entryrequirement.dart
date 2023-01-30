import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class EntryRequirement extends StatelessWidget {
  List<CompleteCourseDetail> completeCourseDetail;
  EntryRequirement({Key? key, required this.completeCourseDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List testTypeList = [];
    List listeningList = [];
    List readingList = [];
    List speakingList = [];
    List overallList = [];
    List writingList = [];

    try {
      testTypeList = completeCourseDetail[0].testType!.split('|');
      writingList = completeCourseDetail[0].writing!.split('|');
      listeningList = completeCourseDetail[0].listening!.split('|');
      readingList = completeCourseDetail[0].reading!.split('|');
      speakingList = completeCourseDetail[0].speaking!.split('|');
      overallList = completeCourseDetail[0].overall!.split('|');
    } catch (e) {
      debugPrint(e.toString());
    }

    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
            child: Table(
              children: [
                if (getNUllChecker(
                    completeCourseDetail[0].academicRequirementCountry))
                  TableRow(
                      decoration: BoxDecoration(
                        color: ThemeConstants.lightgreentColor,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            color: ThemeConstants.GreenColor, width: 0.5),
                      ),
                      children: [
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
                              text: completeCourseDetail[0]
                                  .academicRequirementCountry,
                              fontSize: 14,
                              textColor: ThemeConstants.blackcolor,
                              fontWeight: FontWeight.w600,
                              maxLines: 5,
                            ),
                          ),
                        ),
                      ]),
                if (getNUllChecker(
                        completeCourseDetail[0].academicRequirementCountry) ==
                    false)
                  const TableRow(children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]),
                if (getNUllChecker(completeCourseDetail[0]
                        .academicRequirementCourseLevel) ==
                    false)
                  TableRow(
                      decoration: BoxDecoration(
                        color: ThemeConstants.lightblueColor,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            color: ThemeConstants.bluecolor, width: 0.5),
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
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(minHeight: 50),
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: CustomAutoSizeTextMontserrat(
                              text: completeCourseDetail[0]
                                  .academicRequirementCourseLevel,
                              fontSize: 14,
                              textColor: ThemeConstants.blackcolor,
                              fontWeight: FontWeight.w600,
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ]),
                if (getNUllChecker(completeCourseDetail[0]
                        .academicRequirementCourseLevel) ==
                    false)
                  const TableRow(children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]),
                if (getNUllChecker(completeCourseDetail[0].minPercentage) ==
                    false)
                  TableRow(
                      decoration: BoxDecoration(
                        color: ThemeConstants.lightorangeColor,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            color: ThemeConstants.orangeColor, width: 0.5),
                      ),
                      children: [
                        Container(
                          constraints: const BoxConstraints(minHeight: 50),
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Min. Percentage",
                                maxLines: 2,
                                textColor: ThemeConstants.orangeColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
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
                if (getNUllChecker(completeCourseDetail[0]
                        .academicRequirementCourseLevel) ==
                    false)
                  const TableRow(children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]),
                if (getNUllChecker(completeCourseDetail[0].minGrade) == false)
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
          if (getNUllChecker(completeCourseDetail[0].mandatorySubjectName) ==
                  false ||
              getNUllChecker(completeCourseDetail[0]
                      .minPercentageForMandatorySubject) ==
                  false ||
              getNUllChecker(
                      completeCourseDetail[0].minGradeForMandatorySubject) ==
                  false)
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15),
                child: CustomAutoSizeTextMontserrat(
                  text: "Mandatory Subject ",
                  fontWeight: FontWeight.bold,
                  textColor: ThemeConstants.bluecolor,
                ),
              ),
            ),
          if (getNUllChecker(completeCourseDetail[0].mandatorySubjectName) ==
                  false ||
              getNUllChecker(completeCourseDetail[0]
                      .minPercentageForMandatorySubject) ==
                  false ||
              getNUllChecker(
                      completeCourseDetail[0].minGradeForMandatorySubject) ==
                  false)
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
                          text: completeCourseDetail[0]
                              .minGradeForMandatorySubject,
                        ),
                      ),
                    )),
                  ]),
                ],
              ),
            ),
          if (testTypeList.isNotEmpty)
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
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
            ),
          if (testTypeList.isNotEmpty)
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
                              text: "Test",
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          ),
                        )),
                        TableCell(
                          child: SizedBox(
                            height: 25,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 5, left: 1, right: 1),
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Listening",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                ),
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
                              fontSize: 10,
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
                              fontSize: 10,
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
                              fontSize: 10,
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
                              fontSize: 10,
                            ),
                          ),
                        )),
                      ]),
                  if (getNUllChecker(completeCourseDetail[0].testType) == false)
                    for (var i = 0; i < testTypeList.length; i++)
                      TableRow(children: [
                        TableCell(
                            child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CustomAutoSizeTextMontserrat(
                              text: testTypeList[i],
                              fontSize: 12,
                              textColor: ThemeConstants.TextColor,
                            ),
                          ),
                        )),
                        TableCell(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: CustomAutoSizeTextMontserrat(
                                text: listeningList[i],
                                fontSize: 12,
                                textColor: ThemeConstants.TextColor,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                            child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CustomAutoSizeTextMontserrat(
                              text: readingList[i],
                              fontSize: 12,
                              textColor: ThemeConstants.TextColor,
                            ),
                          ),
                        )),
                        TableCell(
                            child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CustomAutoSizeTextMontserrat(
                              text: writingList[i],
                              fontSize: 12,
                              textColor: ThemeConstants.TextColor,
                            ),
                          ),
                        )),
                        TableCell(
                            child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CustomAutoSizeTextMontserrat(
                              text: speakingList[i],
                              fontSize: 12,
                              textColor: ThemeConstants.TextColor,
                            ),
                          ),
                        )),
                        TableCell(
                            child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CustomAutoSizeTextMontserrat(
                              text:
                                  overallList.isNotEmpty ? overallList[i] : "",
                              fontSize: 12,
                            ),
                          ),
                        )),
                      ]),
                ],
              ),
            ),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 15),
              child: CustomAutoSizeTextMontserrat(
                text: "Others Test Requirement",
                textColor: ThemeConstants.bluecolor,
                fontWeight: FontWeight.bold,
              ),
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
                        color: ThemeConstants.lightblueColor,
                        borderRadius: BorderRadiusDirectional.circular(10),
                        border: Border.all(
                            color: ThemeConstants.bluecolor, width: 0.5)),
                    child: Center(
                      child: CustomAutoSizeTextMontserrat(
                        text: "SAT Components",
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        textColor: ThemeConstants.blackcolor,
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
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: "Reading + Writing And Language",
                    maxLines: 2,
                    fontSize: 14,
                  ),
                ]),
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: "hard code",
                    textColor: ThemeConstants.TextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    maxLines: 2,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: "hard code",
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
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: "Overrall Score",
                    maxLines: 2,
                    fontSize: 14,
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
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: CustomAutoSizeTextMontserrat(
                text: "Special Entry Requirement",
                textColor: ThemeConstants.bluecolor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (getNUllChecker(completeCourseDetail[0].flexible) == false ||
              getNUllChecker(completeCourseDetail[0].backlogsAcceptable) ==
                  false)
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15),
              child: Table(
                children: [
                  TableRow(children: [
                    if (getNUllChecker(completeCourseDetail[0].flexible) ==
                        false)
                      CustomAutoSizeTextMontserrat(
                        text: "Flexible ",
                        fontSize: 14,
                        maxLines: 2,
                      ),
                    if (getNUllChecker(
                            completeCourseDetail[0].backlogsAcceptable) ==
                        false)
                      CustomAutoSizeTextMontserrat(
                        text: "Baclogs Acceptable",
                        fontSize: 14,
                        maxLines: 2,
                      ),
                  ]),
                  TableRow(children: [
                    if (getNUllChecker(completeCourseDetail[0].flexible) ==
                        false)
                      CustomAutoSizeTextMontserrat(
                        text: completeCourseDetail[0].flexible,
                        textColor: ThemeConstants.TextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        maxLines: 2,
                      ),
                    if (getNUllChecker(
                            completeCourseDetail[0].backlogsAcceptable) ==
                        false)
                      CustomAutoSizeTextMontserrat(
                        text: completeCourseDetail[0].backlogsAcceptable,
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
                  ),
                ]),
                TableRow(children: [
                  CustomAutoSizeTextMontserrat(
                    text: "completeCourseDetail[0].",
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
      ),
    ));
  }
}
