import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/dashboardcontroller.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CourseChoose extends StatelessWidget {
  const CourseChoose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (Get.find<DashboardController>().loadingStudentPanelData.value ==
            true)
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10, top: 30),
                child: SizedBox(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Course Level",
                          textColor: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 150,
                        // custom Text field
                        child: CustomAutoSizeTextMontserrat(
                          text: Get.find<DashboardController>()
                                  .studentPanel
                                  .courseChoice![0]
                                  .courseLevel ??
                              "",
                          maxLines: 2,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  height: 5,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
                child: SizedBox(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Course Broad Field",
                          textColor: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 150,
                        // custom Text field
                        child: CustomAutoSizeTextMontserrat(
                          text: Get.find<DashboardController>()
                                  .studentPanel
                                  .courseChoice![0]
                                  .broadFieldName ??
                              "",
                          maxLines: 2,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  height: 5,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
                child: SizedBox(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Course Narrow Field",
                          textColor: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 150,
                        // custom Text field
                        child: CustomAutoSizeTextMontserrat(
                          text: Get.find<DashboardController>()
                                  .studentPanel
                                  .courseChoice![0]
                                  .narrowFieldName ??
                              "",
                          maxLines: 2,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  height: 5,
                  thickness: 1,
                ),
              ),
            ],
          ),
        if (Get.find<DashboardController>().loadingStudentPanelData.value ==
            false)
          const Center(
            child: CircularProgressIndicator(),
          )
      ],
    );
  }
}
