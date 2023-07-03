import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customtextfield.dart';

class FundPlan extends StatelessWidget {
  const FundPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAutoSizeTextMontserrat(
              text: "Plan your Funds",
              textColor: ThemeConstants.bluecolor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
          Row(
            children: [
              CustomAutoSizeTextMontserrat(
                text: "Sponsor Details",
                fontWeight: FontWeight.bold,
              ),
              const Spacer(),
              CustomAutoSizeTextMontserrat(
                text: "view Details",
                fontWeight: FontWeight.bold,
                textColor: ThemeConstants.bluecolor,
              ),
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: CustomAutoSizeTextMontserrat(
              text: "Relationship with Applicant",
              textColor: ThemeConstants.TextColor,
            ),
          ),
          SizedBox(
            height: 30,
            width: MediaQuery.sizeOf(context).width - 20,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                VerticalListForDropdown(
                  text: "Father",
                  selected: true,
                ),
                VerticalListForDropdown(
                  text: "Mother",
                  selected: false,
                ),
              ],
            ),
          ),
          CustomAutoSizeTextMontserrat(text: "Name of the Sponsor"),
          CustomTextField(
              hint: "enter yout name", controller: TextEditingController()),
          CustomAutoSizeTextMontserrat(text: "Occupation of Sponsor"),
          CustomTextField(
              hint: "enter occupation of Sponsor",
              controller: TextEditingController()),
          Align(
            alignment: Alignment.topLeft,
            child: CustomAutoSizeTextMontserrat(
              text: "Source of Incomes",
              textColor: ThemeConstants.TextColor,
            ),
          ),
          SizedBox(
            height: 30,
            width: MediaQuery.sizeOf(context).width - 20,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                VerticalListForDropdown(
                  text: "Father",
                  selected: true,
                ),
                VerticalListForDropdown(
                  text: "Mother",
                  selected: false,
                ),
              ],
            ),
          ),
          CustomAutoSizeTextMontserrat(
              text: "Country of the Financial institution"),
          CustomTextField(
              hint: "enter Country of the Financial institution",
              controller: TextEditingController()),
          CustomAutoSizeTextMontserrat(
              text: "Country of the Financial institution"),
          CustomTextField(
              hint: "enter Country of the Financial institution",
              controller: TextEditingController()),
          CustomAutoSizeTextMontserrat(
              text: "Name of the Financial Institution"),
          CustomTextField(
              hint: "enter Name of the Financial Institution",
              controller: TextEditingController()),
          CustomAutoSizeTextMontserrat(
              text: "Name of the Financial Institution"),
          CustomTextField(
              hint: "enter Name of the Financial Institution",
              controller: TextEditingController()),
          CustomAutoSizeTextMontserrat(text: "Type of Funds"),
          CustomTextField(
              hint: "enter type of Funds", controller: TextEditingController()),
          CustomAutoSizeTextMontserrat(text: "Are the funds 6 months old?"),
          CustomTextField(hint: "Amount", controller: TextEditingController()),
          CustomAutoSizeTextMontserrat(text: "Please enter your amount"),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                primary: ThemeConstants.bluecolor, // background
                onPrimary: ThemeConstants.bluecolor, // foreground
              ),
              onPressed: () {},
              child: CustomAutoSizeTextMontserrat(
                text: "Submit",
                textColor: ThemeConstants.whitecolor,
              )),
        ],
      ),
    );
  }
}

class VerticalListForDropdown extends StatelessWidget {
  String text;
  bool selected;

  VerticalListForDropdown(
      {Key? key, required this.text, required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        height: 25,
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: selected == true
              ? ThemeConstants.bluecolor
              : ThemeConstants.lightgreycolor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
            child: CustomAutoSizeTextMontserrat(
          text: text,
          textColor: selected == true
              ? ThemeConstants.whitecolor
              : ThemeConstants.blackcolor,
        )),
      ),
    );
  }
}
