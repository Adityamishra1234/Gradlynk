import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/fund/controller/fundPlanner.dart';
import 'package:studentpanel/ui/screen/fund/model/fundPlanner.dart';
import 'package:studentpanel/ui/screen/fund/plan_fund.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/custombutton.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

class SponsorDetails extends StatelessWidget {
  SponsorDetails({super.key});

  var controller = Get.put(FundPlannerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("title"),
      drawer: CustomDrawer(
        index: 7,
      ),
      body: controller.obx(
        onLoading: getLoading(context),
        (state) => SafeArea(
          child: SingleChildScrollView(
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
                InkWell(
                  onTap: () {
                    Get.to(FundPlan());
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomAutoSizeTextMontserrat(
                        text: "Added Sponsor",
                        textColor: ThemeConstants.bluecolor,
                      ),
                    ),
                  ),
                ),
                ...getlist(controller.fundplanner.fundPlannersData ?? [])
              ],
            ),
          ),
        ),
      ),
    );
  }

  getlist(List<FundPlannersData> model) {
    List<Widget> list = [];

    for (var i = 0; i < model.length; i++) {
      list.add(FundparameterSubWidget(
          title: model[i].sponsorName,
          index: i,
          id: model[i].id,
          oddEven: i % 2 == 0,
          sponsor_name: model[i].sponsorName,
          sponsor_occupation: model[i].occupationName,
          source_income: model[i].sourceOfIncomeName,
          country: model[i].countryName,
          name_finanical: model[i].fundTypeName,
          fund_6_month_old: model[i].sixMonthOldFund == 1 ? "true" : "false",
          amount: model[i].amount,
          relationApplicant: model[i].relationApplicant,
          url: model[i].fundDocumentName));
    }
    return list;
  }
}

class FundparameterSubWidget extends StatelessWidget {
  int? index, id;
  String? title;
  String? relationApplicant,
      sponsor_name,
      sponsor_occupation,
      source_income,
      country,
      name_finanical,
      fund_6_month_old;
  bool? oddEven;
  String? url;

  String? amount;

  FundparameterSubWidget(
      {Key? key,
      this.id,
      required this.index,
      this.url,
      this.oddEven,
      this.relationApplicant,
      this.sponsor_name,
      this.sponsor_occupation,
      this.source_income,
      this.country,
      this.name_finanical,
      this.fund_6_month_old,
      required this.title,
      this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
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
                FundParameterWidget(
                  text1: "Relationship with Applicant",
                  text2: relationApplicant ?? "",
                ),
                FundParameterWidget(
                  text1: "Name of the Sponsor",
                  text2: sponsor_name ?? "",
                ),
                FundParameterWidget(
                  text1: "Occupation of Sponsor",
                  text2: sponsor_occupation ?? "",
                ),
                FundParameterWidget(
                  text1: "Source of income",
                  text2: source_income ?? "",
                ),
                FundParameterWidget(
                  text1: " Country of the Financial institution",
                  text2: country ?? "",
                ),
                FundParameterWidget(
                  text1: "Name of the Financial Institution",
                  text2: name_finanical ?? "",
                ),
                FundParameterWidget(
                  text1: "Are the funds 6 months old?",
                  text2: fund_6_month_old ?? "",
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
                  text1: "Amount",
                  text2: amount ?? "",
                ),
                Row(
                  children: [
                    const Spacer(),
                    CustomButton(
                      text: "View Document",
                      onPressed: () {
                        Get.find<FundPlannerController>()
                            .getViewDocument(url ?? "");
                      },
                      backgroundColor: ThemeConstants.GreenColor,
                    ),
                    CustomButton(
                      text: "Delete",
                      onPressed: () {
                        Get.find<FundPlannerController>()
                            .getDeleteFund(id.toString());
                      },
                      backgroundColor: ThemeConstants.orangeColor,
                    ),
                    CustomButton(
                      text: "Edit",
                      onPressed: () {
                        Get.find<FundPlannerController>()
                            .editButton(index ?? 0);
                      },
                      backgroundColor: ThemeConstants.bluecolor,
                    ),
                  ],
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
                const SizedBox(
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
