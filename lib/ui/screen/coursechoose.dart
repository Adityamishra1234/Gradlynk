import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/dashboardcontroller.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownbutton.dart';

class CourseChoose extends StatelessWidget {
  const CourseChoose({Key? key}) : super(key: key);

  callback(varTopic) {
    print("mandatory" + varTopic);

    // dashboardcontroller.setdropdown1(varTopic);
  }

//Aman
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        builder: (dashboardcontroller) => Column(
              children: [
                if (dashboardcontroller.loadingStudentPanelData.value == true)
                  Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 10, top: 30),
                        child: SizedBox(
                          height: 40,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Course Level",
                                  maxLines: 1,
                                  textColor: Colors.grey,
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: 150,
                                // custom Text field
                                child: CustomAutoSizeTextMontserrat(
                                  text: dashboardcontroller.studentPanel
                                          .courseChoice![0].courseLevel ??
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
                        padding:
                            const EdgeInsets.only(left: 20, right: 10, top: 10),
                        child: SizedBox(
                          height: 40,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Course Broad Field",
                                  maxLines: 1,
                                  textColor: Colors.grey,
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: 150,
                                // custom Text field
                                child: CustomAutoSizeTextMontserrat(
                                  text: dashboardcontroller.studentPanel
                                          .courseChoice![0].broadFieldName ??
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
                        padding:
                            const EdgeInsets.only(left: 20, right: 10, top: 10),
                        child: SizedBox(
                          height: 40,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Course Narrow Field",
                                  maxLines: 1,
                                  textColor: Colors.grey,
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: 150,
                                // custom Text field
                                child: CustomAutoSizeTextMontserrat(
                                  text: dashboardcontroller.studentPanel
                                          .courseChoice![0].narrowFieldName ??
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
                if (dashboardcontroller.loadingStudentPanelData.value == false)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ));
  }
}
