import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/fund/controller/fundPlanner.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
import 'package:studentpanel/widgets/customtextfield.dart';

class FundPlan extends StatelessWidget {
  FundPlan({super.key});

  var controller = Get.put(FundPlannerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('title'),
      drawer: CustomDrawer(),
      body: controller.obx(
          onLoading: getLoading(context),
          (state) => SafeArea(
                child: Container(
                  padding:
                      EdgeInsets.only(top: 10, right: 10, left: 15, bottom: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: CustomAutoSizeTextMontserrat(
                              text: "Plan your Funds",
                              textColor: ThemeConstants.bluecolor,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            CustomAutoSizeTextMontserrat(
                                text: "Sponsor Details",
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            const Spacer(),
                            CustomAutoSizeTextMontserrat(
                              text: "View Details",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              textColor: ThemeConstants.bluecolor,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: CustomAutoSizeTextMontserrat(
                              text: "Relationship with Applicant",
                              fontSize: 14,
                              textColor: ThemeConstants.blackcolor,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 30,
                          width: MediaQuery.sizeOf(context).width - 20,
                          child: customDropDownPlanFund(
                            model: controller.relationShip,
                            callback: (value) {
                              controller.selectedRelationship =
                                  controller.relationShip[value];
                              controller.update();
                            },
                            selectedValue: controller.selectedRelationship,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: CustomAutoSizeTextMontserrat(
                                fontSize: 14,
                                textColor: ThemeConstants.blackcolor,
                                fontWeight: FontWeight.w400,
                                text: "Name of the Sponsor")),
                        SizedBox(height: 10),
                        CustomTextField(
                            hint: "", controller: TextEditingController()),
                        const SizedBox(
                          height: 15,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: CustomAutoSizeTextMontserrat(
                                fontSize: 14,
                                textColor: ThemeConstants.blackcolor,
                                fontWeight: FontWeight.w400,
                                text: "Occupation of Sponsor")),
                        SizedBox(height: 5),
                        CustomTextField(
                            hint: "enter occupation of Sponsor",
                            controller: TextEditingController()),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: CustomAutoSizeTextMontserrat(
                            fontSize: 14,
                            textColor: ThemeConstants.blackcolor,
                            fontWeight: FontWeight.w400,
                            text: "Source of Incomes",
                          ),
                        ),
                        SizedBox(height: 10),
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
                        SizedBox(height: 15),
                        Align(
                          alignment: Alignment.topLeft,
                          child: CustomAutoSizeTextMontserrat(
                              fontSize: 14,
                              textColor: ThemeConstants.blackcolor,
                              fontWeight: FontWeight.w400,
                              text: "Country of the Financial institution"),
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                            hint: "enter Country of the Financial institution",
                            controller: TextEditingController()),
                        SizedBox(height: 15),
                        // CustomAutoSizeTextMontserrat(
                        //     fontSize: 14,
                        //     textColor: ThemeConstants.blackcolor,
                        //     fontWeight: FontWeight.w400,
                        //     text: "Country of the Financial institution"),
                        // SizedBox(height: 10),
                        // CustomTextField(
                        //     hint: "enter Country of the Financial institution",
                        //     controller: TextEditingController()),
                        // CustomAutoSizeTextMontserrat(
                        //     fontSize: 14,
                        //     textColor: ThemeConstants.blackcolor,
                        //     fontWeight: FontWeight.w400,
                        //     text: "Name of the Financial Institution"),
                        // SizedBox(height: 10),
                        // CustomTextField(
                        //     hint: "enter Name of the Financial Institution",
                        //     controller: TextEditingController()),
                        CustomAutoSizeTextMontserrat(
                            fontSize: 14,
                            textColor: ThemeConstants.blackcolor,
                            fontWeight: FontWeight.w400,
                            text: "Name of the Financial Institution"),
                        SizedBox(height: 10),
                        CustomTextField(
                            hint: "enter Name of the Financial Institution",
                            controller: TextEditingController()),
                        SizedBox(height: 10),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: CustomAutoSizeTextMontserrat(
                                fontSize: 14,
                                textColor: ThemeConstants.blackcolor,
                                fontWeight: FontWeight.w400,
                                text: "Type of Funds")),
                        SizedBox(
                          height: 10,
                        ),
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
                          height: 15,
                        ),
                        CustomAutoSizeTextMontserrat(
                            fontSize: 14,
                            textColor: ThemeConstants.blackcolor,
                            fontWeight: FontWeight.w400,
                            text: "Are the funds 6 months old?"),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                            hint: "Amount",
                            controller: TextEditingController()),
                        CustomAutoSizeTextMontserrat(
                            fontSize: 14,
                            textColor: ThemeConstants.blackcolor,
                            fontWeight: FontWeight.w400,
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
              : ThemeConstants.ultraLightgreyColor2,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: CustomAutoSizeTextMontserrat(
          text: text,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          textColor: selected == true
              ? ThemeConstants.whitecolor
              : ThemeConstants.blackcolor,
        )),
      ),
    );
  }
}
