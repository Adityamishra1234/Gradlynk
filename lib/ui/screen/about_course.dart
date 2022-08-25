import 'package:flutter/material.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
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
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Table(
            children: [
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "Country ",
                  fontWeight: FontWeight.bold,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "Currency Code",
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "completeCourseDetail[0].countryCapital",
                ),
                CustomAutoSizeTextMontserrat(
                  text: completeCourseDetail[0].countryCurrencyCode,
                ),
              ]),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 10),
          child: Table(
            children: [
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "Capital City",
                  fontWeight: FontWeight.bold,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "INR value",
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: completeCourseDetail[0].countryCapital,
                ),
                CustomAutoSizeTextMontserrat(
                  text: completeCourseDetail[0].annualTutionFeesInr.toString(),
                ),
              ]),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 10),
          child: CustomAutoSizeTextMontserrat(
            text: "Language",
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CustomAutoSizeTextMontserrat(
            text: completeCourseDetail[0].countryLanguage,
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
