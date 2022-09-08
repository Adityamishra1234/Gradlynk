import 'package:flutter/cupertino.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class StepsToVisa extends StatelessWidget {
  List<CompleteCourseDetail> completeCourseDetail;
  StepsToVisa({Key? key, required this.completeCourseDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      physics: BouncingScrollPhysics(),
      children: [
        CustomAutoSizeTextMontserrat(
          text: "Visa Fee",
        ),
        CustomAutoSizeTextMontserrat(
          text: "160.00 USD (In INR : 11840)",
        ),
        CustomAutoSizeTextMontserrat(
          text: "Steps to Visa",
        ),
      ],
    ));
  }
}
