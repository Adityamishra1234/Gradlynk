import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customexpansionplanelist.dart';

class AboutCourse extends StatelessWidget {
  List<CompleteCourseDetail> completeCourseDetail;
  AboutCourse({Key? key, required this.completeCourseDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeConstants.whitecolor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
              child: Table(
                children: [
                  if (getNUllChecker(completeCourseDetail[0].countryName) ==
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
                                textColor: ThemeConstants.blackcolor,
                                fontSize: 14,
                                maxLines: 5,
                              ),
                            ),
                          ),
                        ]),
                  if (getNUllChecker(completeCourseDetail[0].countryName) ==
                      false)
                    const TableRow(children: [
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ]),
                  if (getNUllChecker(
                          completeCourseDetail[0].countryCurrencyCode) ==
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
                                  text: "Currency Code",
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
                                  text: completeCourseDetail[0]
                                      .countryCurrencyCode,
                                  textColor: ThemeConstants.blackcolor,
                                  fontSize: 14,
                                  maxLines: 2,
                                ),
                              ),
                            ),
                        ]),
                  if (getNUllChecker(
                          completeCourseDetail[0].countryCurrencyCode) ==
                      false)
                    const TableRow(children: [
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ]),
                  if (getNUllChecker(completeCourseDetail[0].countryCapital) ==
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
                                  text: "Capital City",
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
                                text: completeCourseDetail[0].countryCapital,
                                textColor: ThemeConstants.blackcolor,
                                fontSize: 14,
                                maxLines: 2,
                              ),
                            ),
                          ),
                        ]),
                  if (getNUllChecker(completeCourseDetail[0].countryCapital) ==
                      false)
                    const TableRow(children: [
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ]),
                  if (getNUllChecker(completeCourseDetail[0].countryInrValue) ==
                      false)
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
                                    text: "INR value",
                                    maxLines: 2,
                                    textColor: ThemeConstants.VioletColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          //  textColor: ThemeConstants.blackcolor,
                          //     fontSize: 14,
                          //     fontWeight: FontWeight.w600,
                          Container(
                            constraints: const BoxConstraints(minHeight: 50),
                            child: Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: HtmlWidget(
                                  completeCourseDetail[0].countryInrValue !=
                                          null
                                      ? double.parse(completeCourseDetail[0]
                                              .countryInrValue!)
                                          .toStringAsFixed(2)
                                      : "",
                                  textStyle: GoogleFonts.montserrat(
                                    color: ThemeConstants.blackcolor,
                                    fontSize: 14.0,
                                  ),
                                )),
                          ),
                        ]),
                  if (getNUllChecker(completeCourseDetail[0].countryInrValue) ==
                      false)
                    const TableRow(children: [
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ]),
                  if (getNUllChecker(completeCourseDetail[0].countryLanguage) ==
                      false)
                    TableRow(
                        decoration: BoxDecoration(
                          color: ThemeConstants.Lightcian,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: ThemeConstants.cianColor, width: 0.5),
                        ),
                        children: [
                          Container(
                            constraints: const BoxConstraints(minHeight: 50),
                            child: Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Language",
                                  maxLines: 2,
                                  textColor: ThemeConstants.cianColor,
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
                                  completeCourseDetail[0].countryLanguage!,
                                  textStyle: GoogleFonts.montserrat(
                                    color: ThemeConstants.blackcolor,
                                    fontSize: 14.0,
                                  ),
                                )),
                          ),
                        ]),
                ],
              ),
            ),
            if (getNUllChecker(completeCourseDetail[0].aboutCountry) == false)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomExpansionPlanList(
                  titel: "About Country",
                  text: completeCourseDetail[0].aboutCountry,
                ),
              ),
            if (getNUllChecker(completeCourseDetail[0].aboutCountry) == false)
              Divider(
                color: ThemeConstants.TextColor,
              ),
            if (getNUllChecker(completeCourseDetail[0].popularStates) == false)
              CustomExpansionPlanList(
                titel: "Popular State",
                text: completeCourseDetail[0].popularStates,
              ),
            if (getNUllChecker(completeCourseDetail[0].popularStates) == false)
              Divider(
                color: ThemeConstants.TextColor,
              ),
            if (getNUllChecker(completeCourseDetail[0].eduSystem) == false)
              CustomExpansionPlanList(
                titel: "Education System",
                text: completeCourseDetail[0].eduSystem,
              ),
            if (getNUllChecker(completeCourseDetail[0].eduSystem) == false)
              Divider(
                color: ThemeConstants.TextColor,
              ),
            if (getNUllChecker(completeCourseDetail[0].financeAndExpenses) ==
                false)
              CustomExpansionPlanList(
                titel: "Finances And Expenses (Annually)",
                text: completeCourseDetail[0].financeAndExpenses,
              ),
            if (getNUllChecker(completeCourseDetail[0].financeAndExpenses) ==
                false)
              Divider(
                color: ThemeConstants.TextColor,
              ),
            if (getNUllChecker(completeCourseDetail[0].findingWorkAsStudents) ==
                false)
              CustomExpansionPlanList(
                titel: "Finding Work as a Student",
                text: completeCourseDetail[0].findingWorkAsStudents,
              ),
            if (getNUllChecker(completeCourseDetail[0].findingWorkAsStudents) ==
                false)
              Divider(
                color: ThemeConstants.TextColor,
              ),
            if (getNUllChecker(completeCourseDetail[0].postStudyWorkOption) ==
                false)
              CustomExpansionPlanList(
                titel: "Post Study Work Option",
                text: completeCourseDetail[0].postStudyWorkOption,
              ),
            if (getNUllChecker(completeCourseDetail[0].postStudyWorkOption) ==
                false)
              Divider(
                color: ThemeConstants.TextColor,
              ),
            if (getNUllChecker(completeCourseDetail[0].partTimeWorkOption) ==
                false)
              CustomExpansionPlanList(
                titel: "Part Time Work Option",
                text: completeCourseDetail[0].partTimeWorkOption,
              ),
          ],
        ),
      ),
    );
  }
}
