import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/fund/controller/fundrequirementcontroller.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/button/enableButton.dart';

import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customtextfield.dart';

class Fundrequirement extends StatelessWidget {
  Fundrequirement({super.key});

  static const routenamed = '/Fundrequirement';

  var controller = Get.put(FundRequirementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: controller.obx(
          onLoading: getLoading(context),
          (state) => SingleChildScrollView(
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
                        color: ThemeConstants.ultraLightYellow,
                        border: Border.all(color: ThemeConstants.yellow),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0))),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        FundRequirementWidget(
                          iconData: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: SvgPicture.asset(
                              "assets/icons/Country.svg",
                              width: 20,
                              height: 20,
                            ),
                          ),
                          text1: 'Country',
                          text2: controller.model.country ?? "",
                        ),
                        FundRequirementWidget(
                          iconData: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: SvgPicture.asset(
                              "assets/icons/University.svg",
                              width: 20,
                              height: 20,
                            ),
                          ),
                          text1: 'University',
                          text2: controller.model.university ?? "",
                        ),
                        FundRequirementWidget(
                          iconData: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: SvgPicture.asset(
                              "assets/icons/Course.svg",
                              width: 20,
                              height: 20,
                            ),
                          ),
                          text1: 'Course',
                          text2: controller.model.courseName ?? "",
                        ),
                        FundRequirementWidget(
                          iconData: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: SvgPicture.asset(
                              "assets/icons/Duration.svg",
                              width: 20,
                              height: 20,
                            ),
                          ),
                          text1: 'Duration',
                          text2: controller.model.courseDuration ?? "",
                        ),
                        FundRequirementWidget(
                          iconData: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: SvgPicture.asset(
                              "assets/icons/Annual Tuition Fees.svg",
                              width: 20,
                              height: 20,
                            ),
                          ),
                          text1: 'Annual Tuttion Fees',
                          text2: controller.model.atf ?? "",
                        ),
                        FundRequirementWidget(
                          iconData: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: SvgPicture.asset(
                              "assets/icons/totalFees.svg",
                              width: 20,
                              height: 20,
                            ),
                          ),
                          text1: 'Total Tution Fees',
                          text2: controller.model.ttf ?? "",
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CustomAutoSizeTextMontserrat(text: "Marital Status"),
                      const Spacer(),
                      EnableButton(
                          text: controller.model.maritalStatus ?? "",
                          enabled: true)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CustomAutoSizeTextMontserrat(
                        text: "Will your spouse \naccompany your",
                        mandatory: true,
                      ),
                      const Spacer(),
                      InkWell(
                          onTap: () {
                            controller.spouse_accompany = true.obs;
                            controller.update();
                          },
                          child: EnableButton(
                            enabled: controller.spouse_accompany.value,
                            text: 'Yes',
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            controller.spouse_accompany = false.obs;
                            controller.update();
                          },
                          child: EnableButton(
                            enabled: controller.spouse_accompany == true.obs
                                ? false
                                : true,
                            text: 'No',
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CustomAutoSizeTextMontserrat(
                        text: "Are you taking you \nkids along?",
                        mandatory: true,
                      ),
                      const Spacer(),
                      InkWell(
                          onTap: () {
                            controller.kids = true;
                            controller.update();
                          },
                          child: EnableButton(
                            enabled: controller.kids,
                            text: 'Yes',
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            controller.kids = false;
                            controller.update();
                          },
                          child: EnableButton(
                            enabled: controller.kids == true ? false : true,
                            text: 'No',
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                if (controller.kids == true)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CustomAutoSizeTextMontserrat(
                            text: "how many kids \nwould accompany?"),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            if (controller.manay_kids != 0) {
                              controller.manay_kids =
                                  controller.manay_kids! - 1;
                              controller.update();
                            } else {
                              getToast(SnackBarConstants.minChildCount);
                            }
                          },
                          child: CustomAutoSizeTextMontserrat(
                            text: "-",
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 2),
                          ),
                          child: Center(
                            child: Text(controller.manay_kids.toString()),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            if (controller.manay_kids != 4) {
                              controller.manay_kids =
                                  controller.manay_kids! + 1;
                              controller.update();
                            } else {
                              getToast(SnackBarConstants.maxChildCount);
                            }
                          },
                          child: CustomAutoSizeTextMontserrat(
                            text: "+",
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (controller.kids == true)
                  if (controller.manay_kids! >= 1)
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child:
                              CustomAutoSizeTextMontserrat(text: "Child 1 age"),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 150,
                          child: CustomTextField(
                              keybord: TextInputType.number,
                              hint: "enter the age",
                              controller: controller.child1),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                if (controller.kids == true)
                  if (controller.manay_kids! >= 2)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CustomAutoSizeTextMontserrat(
                                text: "Child 2 age"),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 150,
                            child: CustomTextField(
                                keybord: TextInputType.number,
                                hint: "enter the age",
                                controller: controller.child2),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                if (controller.kids == true)
                  if (controller.manay_kids! >= 3)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CustomAutoSizeTextMontserrat(
                                text: "Child 3 age"),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 150,
                            child: CustomTextField(
                                keybord: TextInputType.number,
                                hint: "enter the age",
                                controller: controller.child3),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                if (controller.kids == true)
                  if (controller.manay_kids! >= 4)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CustomAutoSizeTextMontserrat(
                                text: "Child 4 age"),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 150,
                            child: CustomTextField(
                                keybord: TextInputType.number,
                                hint: "enter the age",
                                controller: controller.child4),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25, right: 15),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          primary: ThemeConstants.bluecolor, // background
                          onPrimary: ThemeConstants.bluecolor, // foreground
                        ),
                        onPressed: () {
                          controller.getCalculated(1215);
                        },
                        child: CustomAutoSizeTextMontserrat(
                          text: "Calculate",
                          textColor: ThemeConstants.whitecolor,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FundRequirementWidget extends StatelessWidget {
  Widget iconData;
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
                iconData: iconData,
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

class CustomIconTextTogetherWithDecorator extends StatelessWidget {
  Widget iconData;
  final String text;
  bool? textalingCentre = false;
  bool? underline;
  bool? mandatory;
  int? maxLines;
  double? fontSize;
  FontWeight? fontWeight;
  Color? textColor;

  CustomIconTextTogetherWithDecorator(
      {Key? key,
      required this.iconData,
      this.textalingCentre,
      required this.text,
      this.maxLines,
      this.mandatory,
      this.fontSize,
      this.textColor,
      this.fontWeight,
      this.underline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        iconData,
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width / 2 - 40,
          child: CustomAutoSizeTextMontserrat(
            text: text,
            fontSize: fontSize,
            fontWeight: fontWeight,
            mandatory: mandatory,
            maxLines: maxLines,
            textColor: textColor,
          ),
        ),
      ],
    );
  }
}

class CustomIconTextTogether extends StatelessWidget {
  Icon? iconData;
  String text;
  Color? color;
  Color? Bgcolor;
  double? textSize;

  FontWeight? fontWeight;

  CustomIconTextTogether(
      {super.key,
      this.fontWeight,
      this.textSize,
      this.Bgcolor,
      this.iconData,
      this.color,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 0.2, color: ThemeConstants.blackcolor),
          ],
          color: Bgcolor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: color ?? Colors.transparent)),
      child: Row(
        children: [
          iconData ?? const SizedBox.shrink(),
          const SizedBox(
            width: 5,
          ),
          CustomAutoSizeTextMontserrat(
            text: '$text',
            textColor: color,
            fontSize: textSize ?? 14.00,
            fontWeight: fontWeight,
          ),
        ],
      ),
    );
  }
}
