import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/viewcourseinformation.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/courseinformationprofile.dart';
import 'package:studentpanel/utils/config/size_config.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/Custom%20Dropdown/custom_dropdown.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CourseInformationWidget extends StatelessWidget {
  Function callbackCourseLevel;
  Function callbackCourseNarrow;
  Function callbackviewDetailsButton;
  Function callbackUpdateButton;
  bool? update;
  int? index;

  CourseInformationWidget(
      {Key? key,
      this.index,
      required this.callbackUpdateButton,
      required this.callbackCourseLevel,
      required this.callbackviewDetailsButton,
      required this.update,
      required this.callbackCourseNarrow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseInformationProfileController>(
        builder: (controller1) => SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomAutoSizeTextMontserrat(
                        text: "Course Level",
                        mandatory: true,
                        //textColor: ThemeConstants.TextColor,
                        fontSize: SizeConfig.fontLabelSize,
                        fontWeight: SizeConfig.fontLabelWeight,
                        textColor: ThemeConstants.TextColor,
                      ),
                    ),
                  ),
                  CustomDropDownSingle(
                    selectedValue: controller1.courseLevelSelected,
                    model: getDropdownModel(
                        controller1.loadingCourseLevel.value,
                        controller1.courseLevelSelected,
                        controller1.courseLevelList),
                    initialSelectedValue: getSelectedDropDown(
                        controller1.loadingCourseLevel.value,
                        controller1.courseLevelSelected,
                        controller1.courseLevelList),
                    choosefieldtype: false,
                    callbackFunction: callbackCourseLevel,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomAutoSizeTextMontserrat(
                        text: "Course Broad Field",
                        mandatory: true,
                        textColor: ThemeConstants.TextColor,

                        //textColor: ThemeConstants.TextColor,
                        fontSize: SizeConfig.fontLabelSize,
                        fontWeight: SizeConfig.fontLabelWeight,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      height: 45,
                      // width: 60,
                      decoration: BoxDecoration(
                          color: ThemeConstants.lightblueColor,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CustomAutoSizeTextMontserrat(
                            text: controller1.courseBroadSelected ??
                                "Broad Field will be autofilled",
                            //textColor: ThemeConstants.TextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomAutoSizeTextMontserrat(
                        text: "Course Narrow Field",

                        mandatory: true,
                        //textColor: ThemeConstants.TextColor,
                        textColor: ThemeConstants.TextColor,

                        //textColor: ThemeConstants.TextColor,
                        fontSize: SizeConfig.fontLabelSize,
                        fontWeight: SizeConfig.fontLabelWeight,
                      ),
                    ),
                  ),
                  CustomDropDownSingle(
                    //Todo
                    selectedValue: controller1.courseNarrowSelected,
                    model: getDropdownModel(
                        controller1.loadingCourseNarrow.value,
                        controller1.courseNarrowSelected,
                        controller1.courseNarrowList),
                    initialSelectedValue: getSelectedDropDown(
                        controller1.loadingCourseNarrow.value,
                        controller1.courseNarrowSelected,
                        controller1.courseNarrowList),
                    choosefieldtype: false,
                    callbackFunction: callbackCourseNarrow,
                  ),
                  if (update == true)
                    Row(
                      children: [
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, right: 20),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: ThemeConstants.whitecolor,
                                elevation: 0.0,
                                backgroundColor: ThemeConstants.whitecolor,
                                side:
                                    BorderSide(color: ThemeConstants.TextColor),
                                // foreground
                              ),
                              onPressed: controller1
                                          .loadingViewCourseInformation.value ==
                                      true
                                  ? () {
                                      callbackviewDetailsButton(true);
                                    }
                                  : null,
                              child: CustomAutoSizeTextMontserrat(
                                text: "View Detail",
                                //textColor: ThemeConstants.TextColor,
                              )),
                        ),
                        if (controller1.loadingCourseBroad.value == true)
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
                                    if (controller1.loadingCourseBroad.value ==
                                        true) {
                                      controller1.viewCourseInformationList.add(
                                          ViewCourseInformation(
                                              courseBroadId: controller1
                                                  .courseBroadSelectedId,
                                              courseNarrowId: controller1
                                                  .courseNarrowSelectedId,
                                              broadFieldName: controller1
                                                  .courseBroadSelected,
                                              narrowFieldName: controller1
                                                  .courseNarrowSelected));
                                      controller1.viewCourseInformationList;
                                      controller1.updateCourseInformation(
                                          Get.find<BaseController>().model1.id!,
                                          controller1.courseLevelSelectedId!,
                                          "added");
                                    } else {
                                      getToast("please wait");
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
                  if (update == false)
                    Row(
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
                                  controller1.viewCourseInformationList[index!]
                                          .courseBroadId =
                                      controller1.courseBroadSelectedId;
                                  controller1.viewCourseInformationList[index!]
                                          .courseNarrowId =
                                      controller1.courseNarrowSelectedId;
                                  controller1.viewCourseInformationList[index!]
                                          .broadFieldName =
                                      controller1.courseBroadSelected;
                                  controller1.viewCourseInformationList[index!]
                                          .narrowFieldName =
                                      controller1.courseNarrowSelected;
                                  controller1.viewCourseInformationList;

                                  controller1.updateCourseInformation(
                                      Get.find<BaseController>().model1.id!,
                                      controller1.courseLevelSelectedId!,
                                      "update");
                                  callbackUpdateButton(true);
                                },
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Update",
                                  textColor: ThemeConstants.whitecolor,
                                )),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ));
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
    if (loading == true) {
      if (selected == null) {
        return model[0].toString();
      } else {
        return selected;
      }
    } else {
      return "No data";
    }
  }
}
