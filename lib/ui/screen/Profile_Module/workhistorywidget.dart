import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/controllers/workhistory.dart';
import 'package:studentpanel/ui/models/workhistoryview.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customDatePicker.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';

class WorkHistoryWidget extends StatelessWidget {
  Function callbackUpdate;
  Function callbackAdded;
  Function callbackIndustry;
  Function callbackEmployementType;
  Function callbackWorkingForm;
  Function callbackWorkingTill;
  bool update;
  int? index;
  WorkHistoryWidget(
      {Key? key,
      this.index,
      required this.callbackUpdate,
      required this.callbackAdded,
      required this.update,
      required this.callbackIndustry,
      required this.callbackWorkingForm,
      required this.callbackWorkingTill,
      required this.callbackEmployementType})
      : super(key: key);
  static final lastOrganisation = TextEditingController();
  static final designation = TextEditingController();
  static final income = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkHistoryController>(builder: (_) {
      if (update == false && _.loadingEdit.value == false) {
        _.loadingEdit.value = true;
        // update = true;
        lastOrganisation.text =
            _.workHistoryViewModelList[index!].organisationName ?? "";
        _.industryNameSelected =
            _.workHistoryViewModelList[index!].jobIndustryName;
        _.industryNameCode = _.workHistoryViewModelList[index!].jobIndustryId;
        _.employementTypeSelected = _.workHistoryViewModelList[index!].jobType;
        _.workingFromSelected =
            _.workHistoryViewModelList[index!].workingFrom ?? "";
        _.workingTillSelected =
            _.workHistoryViewModelList[index!].workingTill ?? "";
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
            child: DatePickerExample(
              enableField: false,
              date: _.workingFromSelected,
              callbackDate: callbackWorkingForm,
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
            child: DatePickerExample(
              enableField: false,
              date: _.workingTillSelected,
              callbackDate: callbackWorkingTill,
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
              keyboardType: TextInputType.number,
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
                            foregroundColor: ThemeConstants.bluecolor,
                            elevation: 0.0,
                            backgroundColor:
                                ThemeConstants.bluecolor, // foreground
                          ),
                          onPressed: () async {
                            //name of organisation, working from, industry, designation,employmenttype,income as per itr
                            if (lastOrganisation.text.isEmpty) {
                              getToast("Please enter last organisation");
                            } else if (_.workingFromSelected == null) {
                              getToast("please select working from");
                            } else if (_.industryNameSelected == null) {
                              getToast("please select industry name");
                            } else if (designation.text.isEmpty) {
                              getToast("please enter designation");
                            } else if (_.employementTypeSelected == null) {
                              getToast("please select employement type");
                            } else if (income.text.isEmpty) {
                              getToast("please select Income as per ITR");
                            } else {
                              _.workHistoryViewModelList
                                  .add(WorkHistoryViewModel(
                                applicantType: _.employementTypeCode,
                                enqId: Get.find<BaseController>().model1.id!,
                                organisationName: lastOrganisation.text,
                                jobType: _.employementTypeSelected,
                                jobRole: designation.text,
                                jobIndustryId: _.industryNameCode,
                                workingFrom: _.workingFromSelected,
                                workingTill: _.workingTillSelected,
                                income: int.parse(income.text),
                                jobIndustryName: _.industryNameSelected,
                              ));
                              callbackAdded(true);
                            }
                          },
                          child: CustomAutoSizeTextMontserrat(
                            text: "Add",
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
                            foregroundColor: ThemeConstants.bluecolor,
                            elevation: 0.0,
                            backgroundColor:
                                ThemeConstants.bluecolor, // foreground
                          ),
                          onPressed: () async {
                            _.workHistoryViewModelList[index!] =
                                WorkHistoryViewModel(
                              applicantType: _.employementTypeCode,
                              enqId: Get.find<BaseController>().model1.id!,
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
                              workingFrom: _.workingFromSelected,
                              workingTill: _.workingTillSelected,
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
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom,
          )
        ],
      );
    });
  }
}
