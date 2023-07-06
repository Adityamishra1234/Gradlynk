import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentpanel/ui/screen/fund/fund_parameter.dart';
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
            FundparameterSubWidget(
              title: "",
            ),
          ],
        ),
      ),
    );
  }
}

class FundparameterSubWidget extends StatelessWidget {
  String? title;
  String? individual_Expenses;
  String? partcipants;
  String? total_Expenses;
  String? iconPath;
  bool? oddEven;

  String? total_Expenses_ind;

  FundparameterSubWidget(
      {Key? key,
      this.oddEven,
      this.iconPath,
      required this.title,
      this.individual_Expenses,
      this.partcipants,
      this.total_Expenses,
      this.total_Expenses_ind})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Stack(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 20, right: 10, top: 30, bottom: 20),
            margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2,
                      spreadRadius: 0.1,
                      color: Color.fromARGB(97, 0, 0, 0))
                ],
                color: ThemeConstants.whitecolor,

                // color: ThemeConstants.lightblueColor,
                border: Border.all(
                    color: oddEven == true
                        ? ThemeConstants.bluecolor
                        : ThemeConstants.yellow),
                borderRadius: const BorderRadius.all(Radius.circular(15.0))),
            child: Column(
              children: [
                FundParameterWidget(
                  text1: "Individual Expenses(AUD)",
                  text2: individual_Expenses ?? "",
                ),
                FundParameterWidget(
                  text1: "Partcipants",
                  text2: partcipants ?? "",
                ),
                FundParameterWidget(
                  text1: "Total Expenses(AUD)",
                  text2: total_Expenses ?? "",
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 15, top: 15, bottom: 10),
                  child: DottedLine(
                    dashColor: ThemeConstants.blackcolor,
                    lineThickness: 0.5,
                    dashLength: 10,
                    dashGapLength: 5,
                  ),
                ),
                FundParameterWidget(
                  fw: FontWeight.w700,
                  text1: "Total Expenses(INR)",
                  text2: total_Expenses_ind ?? "",
                ),
              ],
            ),
          ),
          Positioned(
              // top: -20,
              left: 25,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                height: 35,
                decoration: BoxDecoration(
                    color: oddEven == true
                        ? ThemeConstants.lightblueColor
                        : ThemeConstants.lightYellow,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: 1,
                        color: oddEven == true
                            ? ThemeConstants.bluecolor
                            : ThemeConstants.yellow)),
                child: CustomAutoSizeTextMontserrat(
                  fontSize: 14,
                  text: title,
                  textColor: ThemeConstants.blackcolor,
                  fontWeight: FontWeight.w600,
                ),
              )),
        ],
      ),
    );
  }
}

class FundParameterWidget extends StatelessWidget {
  String text1;
  String text2;
  FontWeight? fw;

  FundParameterWidget(
      {Key? key, this.fw, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Table(
            children: [
              TableRow(children: [
                CustomAutoSizeTextMontserrat(
                  text: text1,
                  maxLines: 2,
                  fontSize: 10,
                  fontWeight: fw ?? FontWeight.w500,
                  textColor: ThemeConstants.blackcolor,
                ),
                SizedBox(
                  width: 10,
                ),
                CustomAutoSizeTextMontserrat(
                  text: text2,
                  fontWeight: fw ?? FontWeight.w500,
                  maxLines: 2,
                  fontSize: 10,
                  textColor: ThemeConstants.TextColor,
                ),
              ]),
            ],
          ),
        ),
      );
    }
  }
}
