import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:studentpanel/ui/controllers/courseshortlist.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/ui/models/filterModel.dart';
import 'package:studentpanel/ui/screen/compare.dart';
import 'package:studentpanel/ui/screen/coursesearchfulldetail.dart';
import 'package:studentpanel/ui/screen/fliter.dart';
import 'package:studentpanel/ui/screen/reviewshortlist.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/collagelistexpandedwidget.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CourseSearchList extends StatelessWidget {
  static const routeNamed = '/CourseSearchList';
  CourseModelFilter courseModelFilter = CourseModelFilter();
  CourseSearchList({Key? key, required this.courseModelFilter})
      : super(key: key);

  var controller1 = Get.put(CourseShortListController());

  @override
  Widget build(BuildContext context) {
    controller1.courseModelFilter = courseModelFilter;
    return Scaffold(
        appBar: CustomAppBar("title"),
        body: GetBuilder<CourseShortListController>(
          builder: (_) => Container(
            color: ThemeConstants.whitecolor,
            child: Column(
              children: [
                // if (_.loadingCourseShortList.value == true)
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Spacer(),
                    // InkWell(
                    //   onTap: () {
                    //     // Get.toNamed(CourseSearchList.routeNamed);
                    //   },
                    //   child: Container(
                    //     height: 30,
                    //     width: 60,
                    //     decoration: BoxDecoration(
                    //         color: ThemeConstants.whitecolor,
                    //         border: Border.all(
                    //             color: ThemeConstants.bluelightgreycolor),
                    //         borderRadius: BorderRadiusDirectional.circular(5.0)),
                    //     child: Center(
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(left: 5, right: 5),
                    //         child: CustomAutoSizeTextMontserrat(
                    //             text: "Sort",
                    //             fontSize: 12,
                    //             textColor: ThemeConstants.bluelightgreycolor),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(Filter(courseModelFilter: courseModelFilter));
                      },
                      child: Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                            color: ThemeConstants.lightorangeColor,
                            borderRadius:
                                BorderRadiusDirectional.circular(5.0)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 5),
                            child: CustomAutoSizeTextMontserrat(
                                text: "Filter",
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                textColor: ThemeConstants.orangeColor),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        if (controller1.compareApply.value == false) {
                          controller1.setCompare(true.obs);
                        } else {
                          controller1.setCompare(false.obs);
                        }
                      },
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                            color: ThemeConstants.lightgreentColor,
                            borderRadius:
                                BorderRadiusDirectional.circular(5.0)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 5),
                            child: CustomAutoSizeTextMontserrat(
                                text: "Compare",
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                textColor: ThemeConstants.GreenColor),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.toNamed(ReviewShortList.routeNamed);
                        Get.snackbar("Review Course", "Test",
                            snackPosition: SnackPosition.BOTTOM);
                      },
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                            color: ThemeConstants.lightVioletColor,
                            borderRadius:
                                BorderRadiusDirectional.circular(5.0)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 5),
                            child: CustomAutoSizeTextMontserrat(
                                text: "Review Course",
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                textColor: ThemeConstants.VioletColor),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                // if (_.loadingCourseShortList.value == true)
                Expanded(
                  child: ListView.builder(
                      itemCount: courseModelFilter.courseSearchList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            // if (controller1.courseSearchModel.length != index)
                            CollagelistExpandedWidget(
                              previousRoute: CourseSearchList.routeNamed,
                              index: index,
                              courseShortListFirst: true,
                              courseSearchModelCompare1Id:
                                  _.courseSearchModelCompare1.id,
                              courseSearchModelCompare2Id:
                                  _.courseSearchModelCompare2.id,
                              callbackForModelCompare: callbackModelCompare,
                              callbackCompare: callbackCompare,
                              //done
                              iscompare: controller1.compareApply.value,

                              courseSearchModel:
                                  courseModelFilter.courseSearchList[index],
                              callbackFunction: callbackCompleteDetailCourse,
                              callbackShortListButton: CallbackShortListButton,
                              finalShortListFirst: false,
                            ),
                          ],
                        );
                      }),
                ),
                if (controller1.compareApply.value == true)
                  InkWell(
                    onTap: () {
                      Get.to(
                        Comparing(
                          courseSearchModel1:
                              Get.find<CourseShortListController>()
                                  .courseSearchModelCompare1,
                          courseSearchModel2:
                              Get.find<CourseShortListController>()
                                  .courseSearchModelCompare2,
                        ),
                      );
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: ThemeConstants.bluecolor,
                          borderRadius: const BorderRadiusDirectional.only(
                            topStart: Radius.circular(20.0),
                            topEnd: Radius.circular(20.0),
                          )),
                      child: Center(
                        child: Row(
                          children: [
                            const Spacer(),
                            SvgPicture.asset(
                              "assets/icons/compare.svg",
                              height: 30,
                              color: ThemeConstants.whitecolor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            CustomAutoSizeTextMontserrat(
                              text: "Compare",
                              fontSize: 20,
                              textColor: ThemeConstants.whitecolor,
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                // if (_.loadingCourseShortList.value == false)
                // const CircularProgressIndicator()
              ],
            ),
          ),
        ));
  }

  // Function
  callbackCompare(varTopic) async {
    // Add To Compare  For Comparing
    if (varTopic != false) {
      controller1.compare(varTopic);
    }
  }

  callbackModelCompare(varTopic) async {
    print(varTopic);
    await controller1.callbackModelCompare(varTopic);
  }

  callbackCompleteDetailCourse(varTopic) async {
    List<String> endpoint = varTopic.toString().split(',');

    var res = await controller1.completeCourseDetailMethod(
        endpoint[0], endpoint[1], endpoint[2]);

    if (res != null) {
      Get.to(CourseSearchFullDetail(
        completeCourseDetail: res,
      ));
    }
  }

  CallbackShortListButton(data) {
    int? courseIndex;
    String? id;
    courseIndex = int.parse(data.toString().split(",")[0]);
    id = data.toString().split(",")[1];
    if (courseModelFilter.courseSearchList[courseIndex].shortList == "0") {
      courseModelFilter.courseSearchList[courseIndex].shortList == "1";
    } else {
      courseModelFilter.courseSearchList[courseIndex].shortList == "0";
    }
    controller1.courseShortList(id, "78623");
  }
}
