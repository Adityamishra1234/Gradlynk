import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/fund/controller/fundrequirementcontroller.dart';
import 'package:studentpanel/ui/screen/fund/model/dataneedfundcalculator.dart';
import 'package:studentpanel/ui/screen/fund/plan_fund.dart';
import 'package:studentpanel/utils/conditionals/iconStringFromField.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

import 'fund_requiremen.dart';

class FundParameter extends StatelessWidget {
  FundParameter({
    Key? key,
  }) : super(key: key);

  var controller = Get.put(FundRequirementController());
  static const routeNamed = '/FundParameter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar('title'),
        drawer: CustomDrawer(),
        body: controller.obx(
          onLoading: getLoading(context),
          (state) => SafeArea(
            child: Container(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomAutoSizeTextMontserrat(
                          text: "Fund Parameter",
                          textColor: ThemeConstants.bluecolor,
                          fontSize: 20,
                        ),
                        const Spacer(),
                        InkWell(
                            onTap: () {
                              Get.to(Fundrequirement());
                            },
                            child: CustomAutoSizeTextMontserrat(text: "Edit")),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    ...getlist(controller.dataNeedFundCalulator)
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  getlist(DataNeedFundCalulator model) {
    List<Widget> data = [];

    for (var i = 0; i < model.tableData!.length; i++) {
      data.add(FundparameterSubWidget(
        oddEven: i % 2 == 0,
        title: model.tableData![i].nameOfFiled,
        individual_Expenses: model.tableData![i].expenses,
        partcipants: model.tableData![i].participants,
        total_Expenses: model.tableData![i].total,
        total_Expenses_ind: model.tableData![i].total,
        iconPath:
            getIconStringForFundParameter(model.tableData![i].nameOfFiled!),
      ));
    }

    return data;
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
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  children: [
                    svgImage("$iconPath", ThemeConstants.GreenColor, 20, 20),
                    // SvgPicture.asset(
                    //   '$iconPath',
                    //   width: 30,
                    // ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomAutoSizeTextMontserrat(
                      fontSize: 14,
                      text: title,
                      textColor: ThemeConstants.blackcolor,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
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
