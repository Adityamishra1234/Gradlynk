import 'package:flutter/material.dart';
import 'package:studentpanel/ui/screen/fund/model/dataneedfundcalculator.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class FundParameter extends StatelessWidget {
  DataNeedFundCalulator model = DataNeedFundCalulator();
  FundParameter({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAutoSizeTextMontserrat(
                text: "Fund Parameter",
                textColor: ThemeConstants.bluecolor,
                fontSize: 18,
              ),
              ...getlist(model)
            ],
          ),
        ),
      ),
    );
  }

  getlist(DataNeedFundCalulator model) {
    List<Widget> data = [];

    for (var i = 0; i < model.tableData!.length; i++) {
      data.add(FundparameterSubWidget(
        title: model.tableData![i].nameOfFiled,
        individual_Expenses: model.tableData![i].expenses,
        partcipants: model.tableData![i].participants,
        total_Expenses: model.tableData![i].total,
        total_Expenses_ind: model.tableData![i].total,
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

  String? total_Expenses_ind;

  FundparameterSubWidget(
      {Key? key,
      required this.title,
      this.individual_Expenses,
      this.partcipants,
      this.total_Expenses,
      this.total_Expenses_ind})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: BoxDecoration(
          color: ThemeConstants.lightblueColor,
          border: Border.all(color: ThemeConstants.bluecolor),
          borderRadius: const BorderRadius.all(Radius.circular(15.0))),
      child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: CustomAutoSizeTextMontserrat(
                text: title,
                textColor: ThemeConstants.bluecolor,
                fontWeight: FontWeight.w700,
              )),
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
          FundParameterWidget(
            text1: "Total Expenses(INR)",
            text2: total_Expenses_ind ?? "",
          ),
        ],
      ),
    );
  }
}

class FundParameterWidget extends StatelessWidget {
  String text1;
  String text2;

  FundParameterWidget({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    {
      return Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Table(
          children: [
            TableRow(children: [
              CustomAutoSizeTextMontserrat(
                text: text1,
                maxLines: 2,
                fontSize: 14,
                textColor: ThemeConstants.blackcolor,
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
