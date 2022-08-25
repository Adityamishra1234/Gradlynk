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
                  fontWeight: FontWeight.bold,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "Fee Waiver",
                  fontWeight: FontWeight.bold,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "Offer TAT",
                  fontWeight: FontWeight.bold,
                ),
              ]),
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: "No",
                ),
                CustomAutoSizeTextMontserrat(
                  text: "No",
                ),
                CustomAutoSizeTextMontserrat(
                  text: "28Days",
                ),
              ]),
            ],
          ),
        ),
        CustomAutoSizeTextMontserrat(
          text: "Steps to Application",
        ),
      ],
    ));
  }
}
