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
    List temp = [];
    List examType = [];
    List testTypeList = [];
    List listeningList = [];
    List readingList = [];
    List speakingList = [];
    List overallList = [];
    List writingList = [];

    try {
      testTypeList.addAll(completeCourseDetail[0].testType!.split('|'));
      for (var element in testTypeList) {
          examType.add(element.toString().split("=>")[0]);
          temp.add(element.toString().split("=>")[1].split(","));
        }
      for (var i = 0; i < (temp.length); i++) {
        print(temp[i].length);
        for (var j = 0; j < (temp[i].length); j++) {
          if (j == 0) {
            listeningList.add(temp[i][j].toString().split("Listening :")[1]);
          } else if (j == 1) {
            readingList.add(temp[i][j].toString().split("Reading :")[1]);
          } else if (j == 2) {
            writingList.add(temp[i][j].toString().split("Writing :")[1]);
          } else if (j == 3) {
            speakingList.add(temp[i][j].toString().split("Speaking :")[1]);
          } else if (j == 4) {
            overallList.add(temp[i][j].toString().split("Overall :")[1]);
          }
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return SingleChildScrollView(
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
                    for (var i = 0; i < writingList.length; i++)
                      TableRow(children: [
                        TableCell(
                            child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CustomAutoSizeTextMontserrat(
                              text: examType[i],
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
          // Padding(
          //   padding: const EdgeInsets.only(top: 15, left: 15),
          //   child: Table(
          //     children: [
          //       TableRow(children: [
          //         CustomAutoSizeTextMontserrat(
          //           text: "Number",
          //           fontSize: 14,
          //           maxLines: 2,
          //         ),
          //       ]),
          //       TableRow(children: [
          //         CustomAutoSizeTextMontserrat(
          //           text: "completeCourseDetail[0].",
          //           textColor: ThemeConstants.TextColor,
          //           fontSize: 14,
          //           fontWeight: FontWeight.w600,
          //           maxLines: 2,
          //         ),
          //       ]),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
