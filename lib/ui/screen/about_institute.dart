import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class AboutInstitute extends StatelessWidget {
  List<CompleteCourseDetail> completeCourseDetail;
  AboutInstitute({Key? key, required this.completeCourseDetail})
      : super(key: key);

  final rowSpacer = const TableRow(children: [
    SizedBox(
      height: 5,
    ),
    SizedBox(
      height: 5,
    )
  ]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Table(
                children: [
                  if (getNUllChecker(completeCourseDetail[0].universityName) ==
                      false)
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
                                  text: "Institute Name",
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
                                text: completeCourseDetail[0].universityName,
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
                  if (getNUllChecker(completeCourseDetail[0].instituteType) ==
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
                                  text: "Institute Type",
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
                                  text: completeCourseDetail[0].instituteType,
                                  textColor: ThemeConstants.blackcolor,
                                  fontSize: 14,
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
                  if (getNUllChecker(completeCourseDetail[0].campusName) ==
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
                                  text: "Campus",
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
                                text: completeCourseDetail[0].campusName,
                                textColor: ThemeConstants.blackcolor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
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
                  if (getNUllChecker(completeCourseDetail[0].campusAddress) ==
                      false)
                    TableRow(
                        decoration: BoxDecoration(
                          color: ThemeConstants.lightVioletColor,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: ThemeConstants.VioletColor, width: 0.5),
                        ),
                        children: [
                          Container(
                            constraints: const BoxConstraints(minHeight: 50),
                            child: Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Institute Address",
                                  maxLines: 2,
                                  textColor: ThemeConstants.VioletColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            constraints: const BoxConstraints(minHeight: 50),
                            child: Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: HtmlWidget(
                                  completeCourseDetail[0].campusAddress!,
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
            if (getNUllChecker(completeCourseDetail[0].aboutUniv) == false)
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CustomAutoSizeTextMontserrat(
                    text: "About Institute",
                    textColor: ThemeConstants.bluecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            if (getNUllChecker(completeCourseDetail[0].aboutUniv) == false)
              const SizedBox(
                height: 5,
              ),
            if (getNUllChecker(completeCourseDetail[0].aboutUniv) == false)
              CustomAutoSizeTextMontserrat(
                text: completeCourseDetail[0].aboutUniv,
                fontSize: 14,
                textColor: ThemeConstants.TextColor,
                fontWeight: FontWeight.w500,
              ),
            if (getNUllChecker(completeCourseDetail[0].sIECRepresented) ==
                false)
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CustomAutoSizeTextMontserrat(
                      text: "SIEC Represented",
                      maxLines: 2,
                      textColor: ThemeConstants.GreenColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            if (getNUllChecker(completeCourseDetail[0].sIECRepresented) ==
                false)
              Align(
                alignment: AlignmentDirectional.topStart,
                child: CustomAutoSizeTextMontserrat(
                  text: completeCourseDetail[0].sIECRepresented ?? "",
                  textColor: ThemeConstants.TextColor,
                ),
              ),
            // Todo
            if (getNUllChecker(
                        completeCourseDetail[0].noOfInternationStudent) ==
                    false ||
                getNUllChecker(completeCourseDetail[0].noOfIndianStudent) ==
                    false)
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: CustomAutoSizeTextMontserrat(
                    text: "Total Numbers of Student",
                    maxLines: 2,
                    fontWeight: FontWeight.bold,
                    textColor: ThemeConstants.bluecolor,
                  ),
                ),
              ),

            if (getNUllChecker(
                        completeCourseDetail[0].noOfInternationStudent) ==
                    false ||
                getNUllChecker(completeCourseDetail[0].noOfIndianStudent) ==
                    false)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Table(
                  children: [
                    TableRow(children: [
                      CustomAutoSizeTextMontserrat(
                        text: "No of International students",
                        maxLines: 2,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomAutoSizeTextMontserrat(
                        text: "No of indian Student",
                        maxLines: 2,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ]),
                    rowSpacer,
                    TableRow(children: [
                      CustomAutoSizeTextMontserrat(
                        text: completeCourseDetail[0]
                            .noOfInternationStudent
                            .toString(),
                        textColor: ThemeConstants.TextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        maxLines: 2,
                      ),
                      CustomAutoSizeTextMontserrat(
                        text: completeCourseDetail[0]
                            .noOfIndianStudent
                            .toString(),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        textColor: ThemeConstants.TextColor,
                        maxLines: 2,
                      ),
                    ]),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
