import 'package:flutter/cupertino.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class StepsToAdmissions extends StatelessWidget {
  List<CompleteCourseDetail> completeCourseDetail;
  StepsToAdmissions({Key? key, required this.completeCourseDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      controller: ScrollController(),
      physics: BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
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
                        constraints: BoxConstraints(minHeight: 50),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: CustomAutoSizeTextMontserrat(
                              text: "Is Application Fee",
                              maxLines: 2,
                              textColor: ThemeConstants.GreenColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    Container(
                      constraints: BoxConstraints(minHeight: 50),
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: completeCourseDetail[0].applicationFee,
                          textColor: ThemeConstants.blackcolor,
                          fontSize: 14,
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
                    if (completeCourseDetail[0].instituteType != null)
                      SizedBox(
                        height: 50,
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: CustomAutoSizeTextMontserrat(
                              text: "Fee Waiver",
                              maxLines: 2,
                              textColor: ThemeConstants.bluecolor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    if (completeCourseDetail[0].instituteType != null)
                      SizedBox(
                        height: 50,
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: CustomAutoSizeTextMontserrat(
                            text: completeCourseDetail[0].feeWaiver,
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
              TableRow(
                  decoration: BoxDecoration(
                    color: ThemeConstants.lightorangeColor,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                        color: ThemeConstants.orangeColor, width: 0.5),
                  ),
                  children: [
                    if (completeCourseDetail[0].instituteType != null)
                      SizedBox(
                        height: 50,
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: CustomAutoSizeTextMontserrat(
                              text: "Offer TAT",
                              maxLines: 2,
                              textColor: ThemeConstants.orangeColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 50,
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: CustomAutoSizeTextMontserrat(
                          text: completeCourseDetail[0].offerTat,
                          textColor: ThemeConstants.blackcolor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ]),
            ],
          ),
        ),
      ],
    ));
  }
}
