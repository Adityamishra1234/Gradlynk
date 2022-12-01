import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/workhistory.dart';
import 'package:studentpanel/ui/models/workhistoryview.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';

class WorkHistoryWidget extends StatelessWidget {
  Function callbackUpdate;
  Function callbackAdded;
  Function callbackIndustry;
  Function callbackEmployementType;
  bool update;
  int? index;
  WorkHistoryWidget(
      {Key? key,
      this.index,
      required this.callbackUpdate,
      required this.callbackAdded,
      required this.update,
      required this.callbackIndustry,
      required this.callbackEmployementType})
      : super(key: key);
  final lastOrganisation = TextEditingController();
  final workingFrom = TextEditingController();
  final workingTill = TextEditingController();
  final designation = TextEditingController();
  final income = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkHistoryController>(builder: (_) {
      if (update == false) {
        lastOrganisation.text =
            _.workHistoryViewModelList[index!].organisationName ?? "";
        workingFrom.text = _.workHistoryViewModelList[index!].workingFrom ?? "";
        workingTill.text = _.workHistoryViewModelList[index!].workingTill ?? "";
        designation.text = _.workHistoryViewModelList[index!].jobRole ?? "";
        income.text = getNUllChecker(
                    _.workHistoryViewModelList[index!].income.toString()) ==
                false
            ? _.workHistoryViewModelList[index!].income!.toString()
            : "";
      }
      return ListView(
        controller: ScrollController(),
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: TextButton(
                  onPressed: () {
                    _.setViewDetails(true);
                  },
                  child: CustomAutoSizeTextMontserrat(
                    text: "View Details",
                    fontSize: 14,
                    textColor: ThemeConstants.orangeColor,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Name of Last Organisation",
                mandatory: true,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                textColor: ThemeConstants.TextColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              controller: lastOrganisation,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
              decoration: InputDecoration(
                hintText: "Enter name of last organisation",
                filled: true,
                fillColor: ThemeConstants.lightblueColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              style: ThemeConstants.montserrattextstyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Working From",
                mandatory: true,
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              controller: workingFrom,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
              decoration: InputDecoration(
                hintText: "Enter working from date",
                filled: true,
                fillColor: ThemeConstants.lightblueColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              style: ThemeConstants.montserrattextstyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Working Till",
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              controller: workingTill,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
              decoration: InputDecoration(
                hintText: "Enter working till date",
                filled: true,
                fillColor: ThemeConstants.lightblueColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              style: ThemeConstants.montserrattextstyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Industry",
                mandatory: true,
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: CustomDropDownSingle(
              model: _.loadingIndustries.value == true
                  ? _.industriesList
                  : ["No data"],
              initialSelectedValue: _.loadingIndustries.value == true
                  ? update == false
                      ? _.workHistoryViewModelList[index!].jobIndustryName
                      : _.industriesList[0]
                  : "No data",
              choosefieldtype: false,
              callbackFunction: callbackIndustry,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Designation",
                mandatory: true,
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              controller: designation,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
              decoration: InputDecoration(
                hintText: "Enter your Designation",
                filled: true,
                fillColor: ThemeConstants.lightblueColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              style: ThemeConstants.montserrattextstyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Employement Type",
                mandatory: true,
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: CustomDropDownSingle(
              model: _.loadingEmploymentType.value == true
                  ? _.employmentTypeList
                  : ["No Data"],
              initialSelectedValue: _.loadingEmploymentType.value == true
                  ? update == false
                      ? _.workHistoryViewModelList[index!].jobType
                      : _.employmentTypeList[0]
                  : "No Data",
              choosefieldtype: false,
              callbackFunction: callbackEmployementType,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Income As per ITR",
                mandatory: true,
                textColor: ThemeConstants.TextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              controller: income,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom + 30),
              decoration: InputDecoration(
                hintText: "Enter Income",
                filled: true,
                fillColor: ThemeConstants.lightblueColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              style: ThemeConstants.montserrattextstyle,
            ),
          ),
          if (update == true)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 20),
                    child: SizedBox(
                      width: 90,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            primary: ThemeConstants.bluecolor, // background
                            onPrimary: ThemeConstants.bluecolor, // foreground
                          ),
                          onPressed: () async {
                            _.workHistoryViewModelList.add(WorkHistoryViewModel(
                              applicantType: _.employementTypeCode,
                              enqId: 78623,
                              organisationName: lastOrganisation.text,
                              jobType: _.employementTypeSelected,
                              jobRole: designation.text,
                              jobIndustryId: _.industryNameCode,
                              workingFrom: workingFrom.text,
                              workingTill: workingTill.text,
                              income: int.parse(income.text),
                              jobIndustryName: _.industryNameSelected,
                            ));
                            print("aman");

                            callbackAdded(true);
                          },
                          child: CustomAutoSizeTextMontserrat(
                            text: "Added",
                            textColor: ThemeConstants.whitecolor,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          if (update == false)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 20),
                    child: SizedBox(
                      width: 110,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            primary: ThemeConstants.bluecolor, // background
                            onPrimary: ThemeConstants.bluecolor, // foreground
                          ),
                          onPressed: () async {
                            _.workHistoryViewModelList[index!] =
                                WorkHistoryViewModel(
                              applicantType: _.employementTypeCode,
                              enqId: 78623,
                              organisationName: lastOrganisation.text,
                              jobType: _.employementTypeSelected,
                              jobRole:
                                  getNUllChecker(designation.text.toString())
                                      ? designation.text
                                      : _.workHistoryViewModelList[index!]
                                          .jobRole,
                              jobIndustryId:
                                  getNUllChecker(_.industryNameCode.toString())
                                      ? _.industryNameCode
                                      : _.workHistoryViewModelList[index!]
                                          .jobIndustryId,
                              workingFrom: workingFrom.text,
                              workingTill: workingTill.text,
                              income: int.parse(income.text),
                              jobIndustryName: getNUllChecker(
                                      _.industryNameSelected.toString())
                                  ? _.industryNameSelected
                                  : _.workHistoryViewModelList[index!]
                                      .jobIndustryName,
                            );
                            callbackUpdate(true);
                          },
                          child: CustomAutoSizeTextMontserrat(
                            text: "Update",
                            textColor: ThemeConstants.whitecolor,
                          )),
                    ),
                  ),
                ],
              ),
            ),
        ],
      );
    });
  }
}
