import 'package:flutter/cupertino.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/fielddetail.dart';

class ApplicantDetail extends StatelessWidget {
  const ApplicantDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10),
            child: CustomAutoSizeTextMontserrat(
              text: "Applicant Details -",
              textColor: ThemeConstants.bluecolor,
              fontWeight: FontWeight.bold,
            ),
          ),
          FieldDetail(
            firstField: "Name",
            secondField: "Nishant",
          ),
          FieldDetail(
            firstField: "Mobile",
            secondField: "8441468431",
          ),
          FieldDetail(
            firstField: "Email",
            secondField: "Developer4@siecindia.com",
          ),
          FieldDetail(
            firstField: "DOB",
            secondField: "2 Dec 2001",
          ),
          FieldDetail(
            firstField: "Branch",
            secondField: "Chandigarh",
          ),
        ],
      ),
    );
  }
}
