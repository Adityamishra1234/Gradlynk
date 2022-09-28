import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/reviewshortlistcontroller.dart';
import 'package:studentpanel/ui/controllers/finalshortlistcontroller.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/ui/screen/coursesearch.dart';
import 'package:studentpanel/ui/screen/coursesearchfulldetail.dart';
import 'package:studentpanel/ui/screen/fliter.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/collagelistexpandedwidget.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class FinalShortList extends StatelessWidget {
  FinalShortList({Key? key}) : super(key: key);
  static const routeNamed = '/FinalShortList';

  var controller1 = Get.put(FinalShortListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("title"),
        body: GetBuilder<FinalShortListController>(
          builder: (_) => Column(
            children: [
              if (_.loadingCourseShortList.value == true)
                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        // Get.toNamed(FinalShortList.routeNamed);
                      },
                      child: Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                            color: ThemeConstants.whitecolor,
                            border: Border.all(
                                color: ThemeConstants.bluelightgreycolor),
                            borderRadius:
                                BorderRadiusDirectional.circular(5.0)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: CustomAutoSizeTextMontserrat(
                                text: "Sort",
                                fontSize: 12,
                                textColor: ThemeConstants.bluelightgreycolor),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Filter.routeNamed);
                      },
                      child: Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                            color: ThemeConstants.whitecolor,
                            border: Border.all(
                                color: ThemeConstants.bluelightgreycolor),
                            borderRadius:
                                BorderRadiusDirectional.circular(5.0)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: CustomAutoSizeTextMontserrat(
                                text: "Filter",
                                fontSize: 12,
                                textColor: ThemeConstants.bluelightgreycolor),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        // if (controller1.compareApply.value == false) {
                        //   controller1.setCompare(true.obs);
                        // } else {
                        //   controller1.setCompare(false.obs);
                        // }
                      },
                      child: Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                            color: ThemeConstants.whitecolor,
                            border: Border.all(
                                color: ThemeConstants.bluelightgreycolor),
                            borderRadius:
                                BorderRadiusDirectional.circular(5.0)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: CustomAutoSizeTextMontserrat(
                                text: "Compare",
                                fontSize: 12,
                                textColor: ThemeConstants.bluelightgreycolor),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.snackbar("Review ShortList", "Test",
                            snackPosition: SnackPosition.BOTTOM);
                      },
                      child: Container(
                        height: 30,
                        width: 120,
                        decoration: BoxDecoration(
                            color: ThemeConstants.whitecolor,
                            border: Border.all(
                                color: ThemeConstants.bluelightgreycolor),
                            borderRadius:
                                BorderRadiusDirectional.circular(5.0)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: CustomAutoSizeTextMontserrat(
                                text: "Final Shortlist",
                                fontSize: 12,
                                textColor: ThemeConstants.bluelightgreycolor),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              if (_.loadingCourseShortList.value == true)
                Expanded(
                  child: ListView.builder(
                      itemCount: controller1
                              .courseSearchPages.courseSearchModel!.length +
                          1,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            if (controller1.courseSearchPages.courseSearchModel!
                                    .length !=
                                index)
                              CollagelistExpandedWidget(
                                index: index,
                                callbackCompare: callbackCompare,
                                //done
                                iscompare: controller1!.compareApply.value,
                                currentPage: controller1
                                    .courseSearchPages.currentPage
                                    .toString(),
                                lastPage: controller1.courseSearchPages.lastPage
                                    .toString(),
                                courseSearchModel: controller1.courseSearchPages
                                    .courseSearchModel![index],
                                callbackFunction: callbackCompleteDetailCourse,
                              ),
                            if (controller1.courseSearchPages.courseSearchModel!
                                    .length ==
                                index)
                              Row(
                                children: [
                                  const Spacer(),
                                  if (controller1
                                          .courseSearchPages.currentPage !=
                                      1)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, top: 20, bottom: 20),
                                      child: SizedBox(
                                        width: 160,
                                        height: 50,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              side: BorderSide(
                                                  color: ThemeConstants
                                                      .bluegreycolor),
                                              primary: ThemeConstants
                                                  .whitecolor, // background
                                              onPrimary: ThemeConstants
                                                  .whitecolor, // foreground
                                            ),
                                            onPressed: () async {
                                              var temp = await controller1!.nextpage(
                                                  controller1.courseSearchPages
                                                      .endpoint
                                                      .toString(),
                                                  (controller1.courseSearchPages
                                                              .currentPage! -
                                                          1)
                                                      .toString());
                                              if (temp == true) {
                                                Navigator.push(context,
                                                    MaterialPageRoute<void>(
                                                        builder: (context) {
                                                  return CourseSearch();
                                                }));
                                              }
                                            },
                                            child: Row(
                                              children: [
                                                const Spacer(),
                                                SvgPicture.asset(
                                                  "assets/icons/previous-icon.svg",
                                                  height: 15,
                                                  color: ThemeConstants
                                                      .bluegreycolor,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                CustomAutoSizeTextMontserrat(
                                                  text: "Previous",
                                                  textColor: ThemeConstants
                                                      .bluegreycolor,
                                                ),
                                                const Spacer(),
                                              ],
                                            )),
                                      ),
                                    ),
                                  if (controller1
                                          .courseSearchPages.currentPage !=
                                      controller1.courseSearchPages.lastPage)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, top: 20, bottom: 20),
                                      child: SizedBox(
                                        width: 160,
                                        height: 50,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: ThemeConstants
                                                  .bluecolor, // background
                                              onPrimary: ThemeConstants
                                                  .bluecolor, // foreground
                                            ),
                                            onPressed: () async {
                                              var temp = await controller1!.nextpage(
                                                  controller1.courseSearchPages
                                                      .endpoint
                                                      .toString(),
                                                  (controller1.courseSearchPages
                                                              .currentPage! +
                                                          1)
                                                      .toString());
                                              if (temp == true) {
                                                Navigator.push(context,
                                                    MaterialPageRoute<void>(
                                                        builder: (context) {
                                                  return CourseSearch();
                                                }));
                                              }
                                              // // Api call
                                              // controller1.courseSearch(
                                              //     controller.selectCountryCode
                                              //         .toString(),
                                              //     controller.selectCourseCode
                                              //         .toString());
                                            },
                                            child: Row(
                                              children: [
                                                const Spacer(),
                                                CustomAutoSizeTextMontserrat(
                                                  text: "Next",
                                                  textColor:
                                                      ThemeConstants.whitecolor,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                SvgPicture.asset(
                                                  "assets/icons/next-icon.svg",
                                                  height: 15,
                                                  color:
                                                      ThemeConstants.whitecolor,
                                                ),
                                                const Spacer(),
                                              ],
                                            )),
                                      ),
                                    ),
                                  const Spacer(),
                                ],
                              )
                          ],
                        );
                      }),
                ),
              if (_.loadingCourseShortList.value == false)
                const CircularProgressIndicator()
            ],
          ),
        ));
  }

  // Function
  callbackCompare(varTopic) async {
    // Add To Compare  For Comparing
    if (varTopic.toString().split(",")[0].toString() == true.toString()) {
      if (controller1!.courseSearchModelCompare1.id == null) {
        controller1!.courseSearchModelCompare1 = controller1!.courseSearchPages
            .courseSearchModel![int.parse(varTopic.toString().split(",")[1])];
        controller1!
            .courseSearchPages
            .courseSearchModel![int.parse(varTopic.toString().split(",")[1])]
            .isSelected = true;
      } else if (controller1!.courseSearchModelCompare2.id == null) {
        controller1!.courseSearchModelCompare2 = controller1!.courseSearchPages
            .courseSearchModel![int.parse(varTopic.toString().split(",")[1])];
        controller1!
            .courseSearchPages
            .courseSearchModel![int.parse(varTopic.toString().split(",")[1])]
            .isSelected = true;
      } else {
        debugPrint(varTopic);
      }
      // Added Button For Comparing
    } else {}
  }

  callbackCompleteDetailCourse(varTopic) async {
    List<String> endpoint = varTopic.toString().split(',');

    var res = await controller1!
        .completeCourseDetailMethod(endpoint[0], endpoint[1], endpoint[2]);

    if (res != null) {
      Get.to(CourseSearchFullDetail(
        completeCourseDetail: res,
      ));
    }
  }
}
