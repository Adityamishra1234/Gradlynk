import 'package:flutter/material.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class StepsToVisaCopy extends StatelessWidget {
  List<CompleteCourseDetail> completeCourseDetail;
  StepsToVisaCopy({Key? key, required this.completeCourseDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          controller: ScrollController(),
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CustomAutoSizeTextMontserrat(
                text: "Steps To Visa",
                fontSize: 18,
                textColor: ThemeConstants.bluecolor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
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
                                text: "Visa Fee",
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
                              text:
                                  "${completeCourseDetail[0].visaFees!}${completeCourseDetail[0].countryCurrencyCode!}\n${double.parse(completeCourseDetail[0].visaFeesInr!).toStringAsFixed(2)}INR",
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
                        if (completeCourseDetail[0].instituteType != null)
                          SizedBox(
                            height: 50,
                            child: Center(
                              child: CustomAutoSizeTextMontserrat(
                                text: "Visa TAT",
                                maxLines: 2,
                                textColor: ThemeConstants.bluecolor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        if (completeCourseDetail[0].instituteType != null)
                          SizedBox(
                            height: 50,
                            child: Center(
                              child: CustomAutoSizeTextMontserrat(
                                text: "${completeCourseDetail[0].visaTat!}Days",
                                textColor: ThemeConstants.TextColor,
                                maxLines: 2,
                              ),
                            ),
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
