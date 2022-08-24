import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class StepsToAdmissions extends StatelessWidget {
  List<CompleteCourseDetail> completeCourseDetail;
  StepsToAdmissions({Key? key, required this.completeCourseDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Table(
            children: [
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "Is Application Fee",
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "Fee Waiver",
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "Offer TAT",
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "No",
                  maxLines: 1,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "No",
                  maxLines: 1,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "28Days",
                  maxLines: 1,
                ),
              ]),
            ],
          ),
        ),
        CustomAutoSizeTextMontserrat(text: "Steps to Application", maxLines: 1),
      ],
    ));
  }
}
