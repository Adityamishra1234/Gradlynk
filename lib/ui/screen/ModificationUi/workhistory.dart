import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/workhistory.dart';
import 'package:studentpanel/ui/models/workhistoryview.dart';
import 'package:studentpanel/ui/screen/ModificationUi/workhistoryview.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';

class WorkHistoryCopy extends StatelessWidget {
  WorkHistoryCopy({Key? key}) : super(key: key);
  var controller = Get.put(WorkHistoryController());
  final lastOrganisation = TextEditingController();
  final workingFrom = TextEditingController();
  final workingTill = TextEditingController();
  final designation = TextEditingController();
  final income = TextEditingController();
  String? industryNameSelected, employementTypeSelected;
  int? industryNameCode, employementTypeCode;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkHistoryController>(
      builder: (_) => _.viewDetails.value == true
          ? WorkHistoryView(
              callbackAddWorkHistory: callbackViewDetails,
              model: _.workHistoryViewModelList,
            )
          : ListView(
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
                    textInputAction: TextInputAction.next,
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
                    textInputAction: TextInputAction.next,
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
                    textInputAction: TextInputAction.next,
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
                        ? _.industriesList[0]
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
                    textInputAction: TextInputAction.next,
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
                        ? _.employmentTypeList[0]
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
                    textInputAction: TextInputAction.next,
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
                                onPrimary:
                                    ThemeConstants.bluecolor, // foreground
                              ),
                              onPressed: () async {
                                _.workHistoryViewModelList
                                    .add(WorkHistoryViewModel(
                                  applicantType: employementTypeCode,
                                  enqId: 78623,
                                  organisationName: lastOrganisation.text,
                                  jobType: "part times",
                                  jobRole: designation.text,
                                  jobIndustryId: industryNameCode,
                                  workingFrom: "01-08-2022",
                                  workingTill: "01-10-2022",
                                  income: int.parse(income.text),
                                  jobIndustryName: industryNameSelected,
                                ));
                                controller.updatedWorkHistory();
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
              ],
            ),
    );
  }

  // Funcation
  callback(varTopic) {
    controller.setViewDetails(true);
  }

  callbackIndustry(varTopic) {
    for (var i = 0; i < controller.industriesList.length; i++) {
      if (controller.industriesList[i] == varTopic) {
        industryNameSelected = controller.industriesList[i];
        industryNameCode = int.parse(controller.industriesCode[i]);
      }
    }
  }

  callbackEmployementType(varTopic) {
    for (var i = 0; i < controller.employmentTypeList.length; i++) {
      if (controller.employmentTypeList[i] == varTopic) {
        employementTypeSelected = controller.employmentTypeList[i];
        employementTypeCode = i + 1;
      }
    }
  }

  callbackViewDetails(varTopic) {
    controller.setViewDetails(varTopic);
  }
}
