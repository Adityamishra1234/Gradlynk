import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customexpansionplanelist.dart';

class AboutCourse extends StatelessWidget {
  List<CompleteCourseDetail> completeCourseDetail;
  AboutCourse({Key? key, required this.completeCourseDetail}) : super(key: key);

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
                          text: "completeCourseDetail[0].",
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
                          text: "Currency Code",
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
                            text: completeCourseDetail[0].countryCurrencyCode,
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
                            text: "Capital City",
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
                          text: completeCourseDetail[0].countryCapital,
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
                            text: "INR value",
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
                        completeCourseDetail[0].countryInrValue != null
                            ? double.parse(
                                    completeCourseDetail[0].countryInrValue!)
                                .toStringAsFixed(2)
                            : "",
                        textStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: ThemeConstants.TextColor,
                          fontSize: 16.0,
                        ),
                      )),
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
                    color: ThemeConstants.Lightcian,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: ThemeConstants.cianColor),
                  ),
                  children: [
                    if (completeCourseDetail[0].instituteType != null)
                      Container(
                        constraints: BoxConstraints(minHeight: 50),
                        child: Center(
                          child: CustomAutoSizeTextMontserrat(
                            text: "Language",
                            maxLines: 2,
                            textColor: ThemeConstants.cianColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    Container(
                      constraints: BoxConstraints(minHeight: 50),
                      child: Center(
                          child: HtmlWidget(
                        completeCourseDetail[0].countryLanguage!,
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
          padding: const EdgeInsets.only(top: 5),
          child: CustomExpansionPlanList(
            titel: "About Country",
            text: completeCourseDetail[0].aboutCountry,
          ),
        ),
        CustomExpansionPlanList(
          titel: "Popular State",
          text: completeCourseDetail[0].popularStates,
        ),
        CustomExpansionPlanList(
          titel: "Education System",
          text: completeCourseDetail[0].eduSystem,
        ),
        CustomExpansionPlanList(
          titel: "Finances And Expenses (Annually)",
          text: completeCourseDetail[0].financeAndExpenses,
        ),
        CustomExpansionPlanList(
          titel: "Finding Work as a Student",
          text: completeCourseDetail[0].findingWorkAsStudents,
        ),
        CustomExpansionPlanList(
          titel: "Post Study Work Option",
          text: completeCourseDetail[0].postStudyWorkOption,
        ),
        CustomExpansionPlanList(
          titel: "Part Time Work Option",
          text: completeCourseDetail[0].partTimeWorkOption,
        ),
      ],
    ));
  }
}
