import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/courseinformationprofile.dart';
import 'package:studentpanel/ui/models/viewcourseinformation.dart';
import 'package:studentpanel/ui/screen/ModificationUi/courseinformationview.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';

class CourseInformationCopy extends StatefulWidget {
  const CourseInformationCopy({Key? key}) : super(key: key);
  static const routeNamed = '/CourseInformationCopy';

  @override
  State<CourseInformationCopy> createState() => _CourseInformationCopyState();
}

class _CourseInformationCopyState extends State<CourseInformationCopy> {
  bool viewDetails = false;
  bool saveAndEdit = true;
  var controller = Get.put(CourseInformationProfileController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseInformationProfileController>(
        builder: (controller1) => controller1.loadingCourseNarrow.value == true
            ? viewDetails
                ? CourseInformationView(
                    callbackFunction: callbackViewDetails,
                    model: controller1.viewCourseInformationList)
                : ListView(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 10),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: CustomAutoSizeTextMontserrat(
                            text: "Course Level",
                            mandatory: true,
                            textColor: ThemeConstants.TextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (controller1.loadingCourseLevel.value == true)
                        SizedBox(
                          height: 50,
                          child: CustomDropDownSingle(
                            model: controller1.courseLevelList,
                            initialSelectedValue:
                                controller1.courseLevelList[0],
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
                            textColor: ThemeConstants.TextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          height: 45,
                          width: 60,
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
                                textColor: ThemeConstants.TextColor,
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
                            textColor: ThemeConstants.TextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: CustomDropDownSingle(
                          model: controller1.courseNarrowList,
                          initialSelectedValue: controller1.courseNarrowList[0],
                          choosefieldtype: false,
                          callbackFunction: callbackCourseNarrow,
                        ),
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, right: 20),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0.0,
                                  side: BorderSide(
                                      color: ThemeConstants.TextColor),
                                  primary:
                                      ThemeConstants.whitecolor, // background
                                  onPrimary: ThemeConstants.whitecolor,
                                  // foreground
                                ),
                                onPressed: controller1
                                            .loadingViewCourseInformation
                                            .value ==
                                        true
                                    ? () {
                                        viewDetails = true;
                                        setState(() {});
                                      }
                                    : null,
                                child: CustomAutoSizeTextMontserrat(
                                  text: "View Detail",
                                  textColor: ThemeConstants.TextColor,
                                )),
                          ),
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
                                    controller1.viewCourseInformationList.add(
                                        ViewCourseInformation(
                                            courseBroadId: controller1
                                                .courseBroadSelectedId,
                                            courseNarrowId: controller1
                                                .courseNarrowSelectedId,
                                            broadFieldName:
                                                controller1.courseBroadSelected,
                                            narrowFieldName: controller1
                                                .courseNarrowSelected));
                                    controller1.viewCourseInformationList;
                                    controller1.updateCourseInformation(78623,
                                        controller1.courseLevelSelectedId!);
                                  },
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Add",
                                    textColor: ThemeConstants.whitecolor,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
            : const Center(child: CircularProgressIndicator()));
  }

  // Funcation
  callback(varTopic) {}
  callbackViewDetails(varTopic) {
    viewDetails = false;
    setState(() {});
  }

  callbackCourseLevel(data) {
    controller.callbackCourseLevel(data);
  }

  callbackCourseNarrow(data) {
    controller.callbackCourseNarrow(data);
    setState(() {});
  }
}
