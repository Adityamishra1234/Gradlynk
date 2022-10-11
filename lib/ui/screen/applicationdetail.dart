import 'package:flutter/cupertino.dart';
import 'package:studentpanel/ui/models/applicationdetailmodel.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/fielddetail.dart';

class ApplicationDetail extends StatelessWidget {
  ApplicationDetail({
    Key? key,
  }) : super(key: key);
  static const routeNamed = '/ApplicationDetail';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10),
            child: CustomAutoSizeTextMontserrat(
              text: "Application Detail -",
              textColor: ThemeConstants.bluecolor,
              fontWeight: FontWeight.bold,
            ),
          ),
          FieldDetail(firstField: "Application TAT", secondField: "0"),
          FieldDetail(
              firstField: "Fee Waiver(If applicable)", secondField: "No"),
          FieldDetail(firstField: "Modified By", secondField: "Nirmal"),
          FieldDetail(firstField: "Created By", secondField: "Nirmal"),
          FieldDetail(
              firstField: "Application Type",
              secondField: "Application for full offer"),
          FieldDetail(
              firstField: "Early Application Deadline", secondField: ""),
          FieldDetail(
              firstField: "Application Creation Date",
              secondField: "Sat 27th Feb 2021  03:28 PM"),
          FieldDetail(
              firstField: "Application Status", secondField: "Complete"),
        ],
      ),
    );
  }
}
