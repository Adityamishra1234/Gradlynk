import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class SponsorDetails extends StatelessWidget {
  const SponsorDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: CustomAutoSizeTextMontserrat(
                    text: "Sponsor Details",
                    fontWeight: FontWeight.bold,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: CustomAutoSizeTextMontserrat(
                  text: "Total Planned Amount = 2973535.90",
                  textColor: ThemeConstants.orangeColor,
                ),
              ),
            ),
            subWidgetSponsorDetails(
              filedName1: "Mother",
              differentColor: true,
            ),
          ],
        ),
      ),
    );
  }
}

class subWidgetSponsorDetails extends StatelessWidget {
  String? filedName1,
      filedName2,
      filedName3,
      filedName4,
      filedName5,
      filedName6,
      filedName7;
  bool differentColor;
  subWidgetSponsorDetails(
      {Key? key,
      required this.differentColor,
      this.filedName1,
      this.filedName2,
      this.filedName3,
      this.filedName4,
      this.filedName5,
      this.filedName6,
      this.filedName7})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: differentColor == true
              ? ThemeConstants.lightblueColor
              : ThemeConstants.lightYellow,
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          border: Border.all(
            color: differentColor == true
                ? ThemeConstants.bluecolor
                : ThemeConstants.yellow,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Singletable(
                text1: "Relationship with Applicant",
                text2: filedName1 ?? "",
              ),
              Singletable(
                text1: "Name of the Sponsor",
                text2: filedName2 ?? "",
              ),
              Singletable(
                text1: "Occupation of Sponsor",
                text2: filedName2 ?? "",
              ),
              Singletable(
                text1: "Source of Income",
                text2: filedName3 ?? "",
              ),
              Singletable(
                text1: "Country of the Financial institution",
                text2: filedName4 ?? "",
              ),
              Singletable(
                text1: "Name of the Financial InSterion",
                text2: filedName5 ?? "",
              ),
              Singletable(
                text1: "Are the funds 6 months old?",
                text2: filedName6 ?? "",
              ),
              const SizedBox(
                height: 5,
              ),
              const DottedLine(),
              Singletable(
                text1: "Amount",
                text2: filedName7 ?? "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Singletable extends StatelessWidget {
  String text1;
  String text2;
  Singletable({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Table(
        children: [
          TableRow(children: [
            CustomAutoSizeTextMontserrat(
              text: text1,
              maxLines: 2,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              width: 15,
            ),
            CustomAutoSizeTextMontserrat(
              text: text2,
              textColor: ThemeConstants.TextColor,
              maxLines: 2,
              fontSize: 14,
            ),
          ]),
        ],
      ),
    );
  }
}
