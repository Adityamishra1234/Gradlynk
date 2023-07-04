import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/fund/controller/fundPlanner.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customtextfield.dart';

class FundPlan extends StatelessWidget {
  FundPlan({super.key});

  var controller = Get.put(FundPlannerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
          onLoading: getLoading(context),
          (state) => SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: CustomAutoSizeTextMontserrat(
                            text: "Plan your Funds",
                            textColor: ThemeConstants.bluecolor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CustomAutoSizeTextMontserrat(
                              text: "Sponsor Details",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          CustomAutoSizeTextMontserrat(
                            text: "view Details",
                            fontWeight: FontWeight.bold,
                            textColor: ThemeConstants.bluecolor,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CustomAutoSizeTextMontserrat(
                            text: "Relationship with Applicant",
                            textColor: ThemeConstants.TextColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: MediaQuery.sizeOf(context).width - 20,
                        child: customDropDownPlanFund(
                          model: controller.relationShip,
                          callback: (value) {
                            print(value);
                          },
                          selectedValue: "Business",
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CustomAutoSizeTextMontserrat(
                                text: "Name of the Sponsor"),
                          )),
                      CustomTextField(
                          hint: "enter yout name",
                          controller: TextEditingController()),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CustomAutoSizeTextMontserrat(
                                text: "Occupation of Sponsor"),
                          )),
                      CustomTextField(
                          hint: "enter occupation of Sponsor",
                          controller: TextEditingController()),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CustomAutoSizeTextMontserrat(
                            text: "Source of Incomes",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: MediaQuery.sizeOf(context).width - 20,
                        child: customDropDownPlanFund(
                          model: controller.sourceIncomeName,
                          callback: (value) {
                            print(value);
                          },
                          selectedValue: "Business",
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CustomAutoSizeTextMontserrat(
                              text: "Country of the Financial institution"),
                        ),
                      ),
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
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CustomAutoSizeTextMontserrat(
                                text: "Type of Funds"),
                          )),
                      SizedBox(
                        height: 30,
                        width: MediaQuery.sizeOf(context).width - 20,
                        child: customDropDownPlanFund(
                          model: controller.fundTypeName,
                          callback: (value) {
                            print(value);
                          },
                          selectedValue: "Business",
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomAutoSizeTextMontserrat(
                          text: "Are the funds 6 months old?"),
                      CustomTextField(
                          hint: "Amount", controller: TextEditingController()),
                      CustomAutoSizeTextMontserrat(
                          text: "Please enter your amount"),
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
                ),
              )),
    );
  }
}

class customDropDownPlanFund extends StatelessWidget {
  Function callback;
  List model;
  String? selectedValue;
  customDropDownPlanFund({
    Key? key,
    required this.model,
    required this.callback,
    this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[...getlist(model)],
    );
  }

  getlist(List model) {
    List<Widget> data = [];
    for (var i = 0; i < model.length; i++) {
      if (selectedValue == model[i]) {
        data.add(
          InkWell(
            onTap: () {
              callback(i);
            },
            child: VerticalListForDropdown(
              text: model[i],
              selected: true,
            ),
          ),
        );
      } else {
        data.add(
          InkWell(
            onTap: () {
              callback(i);
            },
            child: VerticalListForDropdown(
              text: model[i],
              selected: false,
            ),
          ),
        );
      }
    }

    return data;
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
