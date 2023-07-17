import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/fund/controller/fundPlanner.dart';
import 'package:studentpanel/ui/screen/fund/fund_parameter.dart';
import 'package:studentpanel/ui/screen/fund/model/fundPlanner.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

import 'fund_requiremen.dart';

class FundStatus extends StatelessWidget {
  FundStatus({super.key});

  var controller = Get.put(FundPlannerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("title"),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: CustomAutoSizeTextMontserrat(
                      text: "Check Fund Status",
                      fontSize: 18,
                      textColor: ThemeConstants.bluecolor,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              ...getlist(controller.fundplanner.uniCalculatedData ?? [])
            ],
          ),
        ),
      ),
    );
  }

  getlist(List<UniCalculatedData> model) {
    List<Widget> list = [];

    for (var i = 0; i < model.length; i++) {
      //           bool? oddEven,
      // String? sponsor_name,
      // String? sponsor_occupation,
      // String? source_income,
      // String? country,
      // String? name_finanical,
      // String? fund_6_month_old,
      // required String? title,
      // String? amount,
      bool conditon_check = false;
      var amount;
      if (double.parse(model[i].convertedTotalFund ?? "") >
          controller.total_fund) {
        amount = double.parse(model[i].convertedTotalFund ?? "") -
            controller.total_fund;
        conditon_check = true;
      } else {
        conditon_check = false;
        amount = double.parse(model[i].convertedTotalFund ?? "") -
            controller.total_fund;
      }
      list.add(FundStatusSubWidget(
        condition_check: conditon_check,
        title: model[i].courseName,
        oddEven: i % 2 == 0,
        model: model[i],
        amount: amount.toString(),
      ));
    }
    return list;
  }
}

class FundStatusSubWidget extends StatelessWidget {
  String? title;
  UniCalculatedData model;
  bool? oddEven;
  bool condition_check;
  String? amount;

  FundStatusSubWidget({
    Key? key,
    this.oddEven,
    this.amount,
    required this.condition_check,
    required this.model,
    required this.title,
  }) : super(key: key);

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
                boxShadow: const [
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
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: ThemeConstants.red,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      child: CustomAutoSizeTextMontserrat(
                          text:
                              "${model.countryName},${model.stateName},${model.cityName}",
                          textColor: ThemeConstants.TextColor,
                          fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    svgImage("University", ThemeConstants.bluecolor, 20, 20),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      child: CustomAutoSizeTextMontserrat(
                          text: model.universityName,
                          textColor: ThemeConstants.TextColor,
                          fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                     svgImage(
                              "building", ThemeConstants.GreenColor, 20, 20),
                    // SvgPicture.asset(
                    //   "assets/icons/building.svg",
                    //   color: ThemeConstants.GreenColor,
                    //   width: 20,
                    //   height: 20,
                    // ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      child: CustomAutoSizeTextMontserrat(
                          text: model.campusName,
                          textColor: ThemeConstants.TextColor,
                          fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: CustomAutoSizeTextMontserrat(
                    text: "Duration: ${(model.courseDuration)} months",
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: CustomAutoSizeTextMontserrat(
                    text:
                        "Annual Tuition Fees: Rs ${(model.convertedTotalFund)}",
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
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
                  text1: "Fund Status",
                  condition_check: condition_check,
                  text2:
                      condition_check == true ? "Sufficient" : "Insufficient",
                ),
                FundParameterWidget(
                  fw: FontWeight.w700,
                  condition_check: condition_check,
                  text1: condition_check == true ? "Additional" : "Balance",
                  text2: amount ?? "",
                ),
              ],
            ),
          ),
          Positioned(

              // top: -20,
              left: 25,
              child: Container(
                width: 280,
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
                  maxLines: 1,
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
  bool condition_check;

  FundParameterWidget(
      {Key? key,
      this.fw,
      required this.condition_check,
      required this.text1,
      required this.text2})
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
                  textColor: condition_check == true
                      ? ThemeConstants.GreenColor
                      : ThemeConstants.red,
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomAutoSizeTextMontserrat(
                  text: text2,
                  fontWeight: fw ?? FontWeight.w500,
                  maxLines: 2,
                  fontSize: 10,
                  textColor: condition_check == true
                      ? ThemeConstants.GreenColor
                      : ThemeConstants.red,
                ),
              ]),
            ],
          ),
        ),
      );
    }
  }
}
