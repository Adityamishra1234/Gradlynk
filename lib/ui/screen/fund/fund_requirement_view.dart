import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/Custom_icons_text/custom_icon_text_together.dart';
import 'package:studentpanel/widgets/Custom_icons_text/custom_icon_text_together_with_decorator.dart';

import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class Fundrequirement extends StatelessWidget {
  const Fundrequirement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CustomAutoSizeTextMontserrat(
                    text: "Calculate Funds Requirement",
                    fontSize: 18,
                    textColor: ThemeConstants.bluecolor,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: ThemeConstants.lightYellow,
                    border: Border.all(color: ThemeConstants.yellow),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(20.0))),
                child: Column(
                  children: [
                    FundRequirementWidget(
                      iconData: const Icon(Icons.abc),
                      text1: 'University',
                      text2: 'The University of Sydney',
                    ),
                    FundRequirementWidget(
                      iconData: const Icon(Icons.abc),
                      text1: 'Course',
                      text2: 'Master ol speech tonguage pathology',
                    ),
                    FundRequirementWidget(
                      iconData: const Icon(Icons.abc),
                      text1: 'Duration',
                      text2: '2 Year',
                    ),
                    FundRequirementWidget(
                      iconData: const Icon(Icons.abc),
                      text1: 'Annual Tuttion Fees',
                      text2: '6100 AUD',
                    ),
                    FundRequirementWidget(
                      iconData: const Icon(Icons.abc),
                      text1: 'Total Tution Fees',
                      text2: '122000 AUD',
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                CustomAutoSizeTextMontserrat(text: "Marital Status"),
                CustomIconTextTogether(
                  showICOn: false,
                  textSize: 12,
                  text: 'Single',
                  Bgcolor: ThemeConstants.lightgreycolor,
                ),
                CustomIconTextTogether(
                  showICOn: false,
                  textSize: 12,
                  text: 'Married',
                  Bgcolor: ThemeConstants.lightgreycolor,
                ),
              ],
            ),
            Row(
              children: [
                CustomAutoSizeTextMontserrat(
                    text: "Will your spouse accompany your"),
                CustomIconTextTogether(
                  showICOn: false,
                  textSize: 12,
                  text: 'Yes',
                  Bgcolor: ThemeConstants.lightgreycolor,
                ),
                CustomIconTextTogether(
                  showICOn: false,
                  textSize: 12,
                  text: 'No',
                  Bgcolor: ThemeConstants.lightgreycolor,
                ),
              ],
            ),
            Row(
              children: [
                CustomAutoSizeTextMontserrat(
                    text: "Are yoU taking you kids along?"),
                CustomIconTextTogether(
                  showICOn: false,
                  textSize: 12,
                  verticalPadding: 20,
                  text: 'Yes',
                  Bgcolor: ThemeConstants.lightgreycolor,
                ),
                CustomIconTextTogether(
                  showICOn: false,
                  textSize: 12,
                  text: 'No',
                  Bgcolor: ThemeConstants.lightgreycolor,
                ),
              ],
            ),
            Row(
              children: [
                CustomAutoSizeTextMontserrat(
                    text: "how many kids would accompany?"),
                CustomIconTextTogether(
                  showICOn: false,
                  textSize: 12,
                  text: 'Yes',
                  Bgcolor: ThemeConstants.lightgreycolor,
                ),
                CustomIconTextTogether(
                  showICOn: false,
                  textSize: 12,
                  text: 'No',
                  Bgcolor: ThemeConstants.lightgreycolor,
                ),
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  primary: ThemeConstants.bluecolor, // background
                  onPrimary: ThemeConstants.bluecolor, // foreground
                ),
                onPressed: () {},
                child: CustomAutoSizeTextMontserrat(
                  text: "Calculate",
                  textColor: ThemeConstants.whitecolor,
                )),
          ],
        ),
      ),
    );
  }
}

class FundRequirementWidget extends StatelessWidget {
  Icon iconData;
  String text1;
  String text2;

  FundRequirementWidget(
      {Key? key,
      required this.iconData,
      required this.text1,
      required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    {
      return Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Table(
          children: [
            TableRow(children: [
              CustomIconTextTogetherWithDecorator(
                text: text1,
                maxLines: 2,
                fontSize: 14,
                textColor: ThemeConstants.blackcolor,
                iconData: const Icon(Icons.abc),
              ),
              CustomAutoSizeTextMontserrat(
                text: text2,
                maxLines: 2,
                fontSize: 14,
                textColor: ThemeConstants.TextColor,
              ),
            ]),
          ],
        ),
      );
    }
  }
}
