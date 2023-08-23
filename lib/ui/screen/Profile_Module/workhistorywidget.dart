import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';

import 'package:studentpanel/ui/models/workhistoryview.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/workhistory.dart';
import 'package:studentpanel/utils/config/size_config.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/Custom_time_widgets.dart/custom_timer_widget.dart';
import 'package:studentpanel/widgets/customDatePicker.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/Custom%20Dropdown/custom_dropdown.dart';

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

  var controller = Get.put(WorkHistoryController());

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      // if (update == false && controller.loadingEdit.value == false) {
      //   controller.loadingEdit.value = true;
      //   // update = true;
      //   lastOrganisation.text =
      //       controller.workHistoryViewModelList[index!].organisationName ?? "";
      //   controller.industryNameSelected =
      //       controller.workHistoryViewModelList[index!].jobIndustryName;
      //   controller.industryNameCode = controller.workHistoryViewModelList[index!].jobIndustryId;
      //   controller.employementTypeSelected = controller.workHistoryViewModelList[index!].jobType;
      //   controller.workingFromSelected =
      //       controller.workHistoryViewModelList[index!].workingFrom ?? "";
      //   controller.workingTillSelected =
      //       controller.workHistoryViewModelList[index!].workingTill ?? "";
      //   designation.text = controller.workHistoryViewModelList[index!].jobRole ?? "";
      //   income.text = getNUllChecker(
      //               controller.workHistoryViewModelList[index!].income.toString()) ==
      //           false
      //       ? controller.workHistoryViewModelList[index!].income!.toString()
      //       : "";
      // }
      return ListView(
        padding: EdgeInsets.all(0),
        controller: ScrollController(),
        children: [
          Container(
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: CustomAutoSizeTextMontserrat(
                      text: "Name of Last Organisation",
                      mandatory: true,
                      textColor: ThemeConstants.TextColor,
                      fontSize: SizeConfig.fontLabelSize,
                      fontWeight: SizeConfig.fontLabelWeight,
                    ),
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                //   child: InkWell(
                //       onTap: () {
                //         // if (controller.loadingViewQualification.value == true) {
                //         controller.setViewDetails(true);
                //         // }
                //       },
                //       child: Container(
                //           child: Text(
                //         "View Details",
                //         style: TextStyle(
                //             fontSize: 12, color: ThemeConstants.orangeColor),
                //       ))),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 10),
                //   child: Align(
                //     alignment: AlignmentDirectional.bottomEnd,
                //     child: TextButton(
                //         onPressed: () {},
                //         child: CustomAutoSizeTextMontserrat(
                //           text: "View Details",
                //           fontSize: 14,
                //           textColor: ThemeConstants.orangeColor,
                //         )),
                //   ),
                // ),
              ],
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: WorkHistoryController.lastOrganisation.value,
                scrollPadding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).viewInsets.bottom + 30),
                style: ThemeConstants.montserrattextstyleForFilledText,
                decoration: InputDecoration(
                    hintText: "Enter name of last organisation",
                    filled: true,
                    fillColor: ThemeConstants.lightblueColor,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    hintStyle:
                        ThemeConstants.montserrattextstyleForPlaceHolder),
              ),
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
                fontSize: SizeConfig.fontLabelSize,
                fontWeight: SizeConfig.fontLabelWeight,
              ),
            ),
          ),
          Container(
            height: 45,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: CustomTimerWidget(
                isBlank: true,
                // enableField: false,
                initialTime: controller.workingFromSelected,
                callback: (value) {
                  callbackWorkingForm(value);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Working Till",
                textColor: ThemeConstants.TextColor,
                fontSize: SizeConfig.fontLabelSize,
                fontWeight: SizeConfig.fontLabelWeight,
              ),
            ),
          ),
          Container(
            height: 45,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: CustomTimerWidget(
                isBlank: true,

                initialTime: controller.workingTillSelected,
                // enableField: false,
                // date: controller.workingFromSelected,
                callback: (value) {
                  callbackWorkingTill(value);
                },
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 10, right: 10),
          //   child: DatePickerExample(
          //     enableField: false,
          //     date: controller.workingTillSelected,
          //     callbackDate: callbackWorkingTill,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Industry",
                mandatory: true,
                textColor: ThemeConstants.TextColor,
                fontSize: SizeConfig.fontLabelSize,
                fontWeight: SizeConfig.fontLabelWeight,
              ),
            ),
          ),
          CustomDropDownSingle(
            model: getDropdownModel(controller.loadingIndustries.value,
                controller.industryNameSelected, controller.industriesList),
            // controller.loadingIndustries.value == true
            // ? controller.industriesList
            // : ["No data"],
            initialSelectedValue: getSelectedDropDown(
                controller.loadingIndustries.value,
                controller.industryNameSelected,
                controller.industriesList),
            // ? update == false
            //     ? controller
            //         .workHistoryViewModelList[index!].jobIndustryName
            //     : controller.industriesList[0]
            // : "No data",
            choosefieldtype: false,
            callbackFunction: callbackIndustry,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Designation",
                mandatory: true,
                textColor: ThemeConstants.TextColor,
                fontSize: SizeConfig.fontLabelSize,
                fontWeight: SizeConfig.fontLabelWeight,
              ),
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: WorkHistoryController.designation.value,
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
                    hintStyle:
                        ThemeConstants.montserrattextstyleForPlaceHolder),
                style: ThemeConstants.montserrattextstyleForFilledText,
              ),
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
                fontSize: SizeConfig.fontLabelSize,
                fontWeight: SizeConfig.fontLabelWeight,
              ),
            ),
          ),
          CustomDropDownSingle(
            model: getDropdownModel(
                controller.loadingEmploymentType.value,
                controller.employementTypeSelected,
                controller.employmentTypeList),
            //  controller.loadingEmploymentType.value == true
            //     ? controller.employmentTypeList
            //     : ["No Data"],
            initialSelectedValue: getSelectedDropDown(
                controller.loadingEmploymentType.value,
                controller.employementTypeSelected,
                controller.employmentTypeList),
            choosefieldtype: false,
            callbackFunction: callbackEmployementType,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomAutoSizeTextMontserrat(
                text: "Income as per ITR",
                mandatory: true,
                textColor: ThemeConstants.TextColor,
                fontSize: SizeConfig.fontLabelSize,
                fontWeight: SizeConfig.fontLabelWeight,
              ),
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: WorkHistoryController.income.value,
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
                    hintStyle:
                        ThemeConstants.montserrattextstyleForPlaceHolder),
                style: ThemeConstants.montserrattextstyleForFilledText,
              ),
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
                            if (WorkHistoryController
                                .lastOrganisation.value.text.isEmpty) {
                              getToast(SnackBarConstants.lastOrg!);
                            } else if (controller.workingFromSelected == null) {
                              getToast(SnackBarConstants.workingFromSelect!);
                            } else if (controller.industryNameSelected ==
                                null) {
                              getToast(SnackBarConstants.industryNameSelect!);
                            } else if (WorkHistoryController
                                .designation.value.text.isEmpty) {
                              getToast(SnackBarConstants.designation!);
                            } else if (controller.employementTypeSelected ==
                                null) {
                              getToast(
                                  SnackBarConstants.employementTypeSelect!);
                            } else if (WorkHistoryController
                                .income.value.text.isEmpty) {
                              getToast(SnackBarConstants.income!);
                            } else {
                              controller.workHistoryViewModelList
                                  .add(WorkHistoryViewModel(
                                applicantType: controller.employementTypeCode,
                                enqId: Get.find<BaseController>().model1.id!,
                                organisationName: WorkHistoryController
                                    .lastOrganisation.value.text,
                                jobType: controller.employementTypeSelected,
                                jobRole: WorkHistoryController
                                    .designation.value.text,
                                jobIndustryId: controller.industryNameCode,
                                workingFrom: controller.workingFromSelected,
                                workingTill: controller.workingTillSelected,
                                income: int.parse(
                                    WorkHistoryController.income.value.text),
                                jobIndustryName:
                                    controller.industryNameSelected,
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
                            WorkHistoryViewModel model = WorkHistoryViewModel();

                            model = WorkHistoryViewModel(
                              applicantType: controller.employementTypeCode,
                              enqId: Get.find<BaseController>().model1.id!,
                              organisationName: WorkHistoryController
                                  .lastOrganisation.value.text,
                              jobType: controller.employementTypeSelected,
                              jobRole:
                                  WorkHistoryController.designation.value.text,
                              jobIndustryId: getNUllChecker(
                                      controller.industryNameCode.toString())
                                  ? controller.industryNameCode
                                  : controller.workHistoryViewModelList[index!]
                                      .jobIndustryId,
                              workingFrom: controller.workingFromSelected,
                              workingTill: controller.workingTillSelected,
                              income: int.parse(
                                  WorkHistoryController.income.value.text),
                              jobIndustryName: getNUllChecker(controller
                                      .industryNameSelected
                                      .toString())
                                  ? controller.industryNameSelected
                                  : controller.workHistoryViewModelList[index!]
                                      .jobIndustryName,
                            );
                            controller.workHistoryViewModelList[index!] = model;
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
    }, onLoading: getLoading(context));
  }

  //Function
  List getDropdownModel(bool loading, String? selected, List model) {
    if (loading == true) {
      return model;
    } else {
      return ["No data"];
    }
  }

  String getSelectedDropDown(bool loading, String? selected, List model) {
    if (loading == true && model.isNotEmpty) {
      if (selected == null) {
        return 'Kindly Select one';
      } else {
        return selected;
      }
    } else {
      return "No data";
    }
  }
}
