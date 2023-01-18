import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/courseinformationprofile.dart';
import 'package:studentpanel/ui/models/viewcourseinformation.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';

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
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    // width: 300,
                    height: 50,
                    child: CustomDropDownSingle(
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
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomAutoSizeTextMontserrat(
                        text: "Course Broad Field",
                        mandatory: true,
                        //textColor: ThemeConstants.TextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
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
                                "Broad Field Automatically selected",
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
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: CustomDropDownSingle(
                      //Todo
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
                  ),
                  if (update == true)
                    Row(
                      children: [
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, right: 20),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                side:
                                    BorderSide(color: ThemeConstants.TextColor),
                                primary:
                                    ThemeConstants.whitecolor, // background
                                onPrimary: ThemeConstants.whitecolor,
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
                                    elevation: 0.0,
                                    primary:
                                        ThemeConstants.bluecolor, // background
                                    onPrimary:
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
                                      controller1.updateCourseInformation(78623,
                                          controller1.courseLevelSelectedId!);
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Please Wait",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor:
                                              ThemeConstants.whitecolor,
                                          textColor: ThemeConstants.blackcolor,
                                          fontSize: 16.0);
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
                                  elevation: 0.0,
                                  primary:
                                      ThemeConstants.bluecolor, // background
                                  onPrimary:
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

                                  controller1.updateCourseInformation(78623,
                                      controller1.courseLevelSelectedId!);
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
