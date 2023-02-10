import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/controllers/reviewshortlistcontroller.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/ui/models/filterModel.dart';
import 'package:studentpanel/ui/screen/course_search/compare.dart';
import 'package:studentpanel/ui/screen/complete_course_details/coursesearchfulldetail.dart';
import 'package:studentpanel/ui/screen/course_search/finalshortlist.dart';
import 'package:studentpanel/ui/screen/course_search/fliter.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/collagelistexpandedwidget.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

class ReviewShortList extends StatefulWidget {
  CourseModelFilter? courseModelFilter = CourseModelFilter();
  FilterModel? filtermodel = FilterModel();
  bool? filterRedirect = false;
  ReviewShortList(
      {Key? key, this.courseModelFilter, this.filtermodel, this.filterRedirect})
      : super(key: key);
  static const routeNamed = '/ReviewShortlist';

  @override
  State<ReviewShortList> createState() => _ReviewShortListState();
}

class _ReviewShortListState extends State<ReviewShortList> {
  var controller1 = Get.put(ReviewShortListController());

  @override
  void initState() {
    super.initState();
    if (widget.courseModelFilter == null) {
      controller1.GetCourseShortList(
          Get.find<BaseController>().model1.id.toString());
    } else {
      controller1.courseModelFilter = widget.courseModelFilter!;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.filterRedirect == false) {
      controller1.courseModelFilter = controller1.courseModelFilter;
    } else {
      if (widget.courseModelFilter != null) {
        controller1.courseModelFilter = widget.courseModelFilter!;
      }
    }

    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    return Scaffold(
        appBar: CustomAppBar("title"),
        drawer: displayMobileLayout == false ? const CustomDrawer() : null,
        body: GetBuilder<ReviewShortListController>(
          builder: (_) => Row(
            children: [
              if (displayMobileLayout == true) const CustomDrawer(),
              Flexible(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    if (_.loadingCourseShortList.value == true)
                      Row(
                        children: [
                          // const Spacer(),
                          // InkWell(
                          //   onTap: () {
                          //     // Get.toNamed(ReviewShortList.routeNamed);
                          //   },
                          //   child: Container(
                          //     height: 30,
                          //     width: 60,
                          //     decoration: BoxDecoration(
                          //         color: ThemeConstants.whitecolor,
                          //         border: Border.all(
                          //             color: ThemeConstants.bluelightgreycolor),
                          //         borderRadius:
                          //             BorderRadiusDirectional.circular(5.0)),
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

                          const Spacer(),
                          InkWell(
                            onTap: () {
                              if (controller1.courseModelFilter
                                      .previousCourseSearchList.length <=
                                  controller1.courseModelFilter.courseSearchList
                                      .length) {
                                controller1.courseModelFilter
                                        .previousCourseSearchList =
                                    controller1
                                        .courseModelFilter.courseSearchList;
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Filter(
                                            courseModelFilter:
                                                controller1.courseModelFilter,
                                            previousRoute:
                                                ReviewShortList.routeNamed,
                                            filtermodel: widget.filtermodel,
                                          )));
                              // Get.to(Filter(
                              //   courseModelFilter:
                              //       controller1.courseModelFilter,
                              //   previousRoute: ReviewShortList.routeNamed,
                              //   filtermodel: widget.filtermodel,
                              // ));
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  color: ThemeConstants.lightorangeColor,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(5.0)),
                              child: Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: CustomAutoSizeTextMontserrat(
                                      text: "Filter",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
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
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: CustomAutoSizeTextMontserrat(
                                      text: "Compare",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      textColor: ThemeConstants.GreenColor),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              Get.toNamed(FinalShortList.routeNamed);
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  color: ThemeConstants.lightVioletColor,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(5.0)),
                              child: Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: CustomAutoSizeTextMontserrat(
                                      text: "Final Shortlist",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
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
                    if (_.loadingCourseShortList.value == true)
                      Expanded(
                        child: Scrollbar(
                          thumbVisibility: true,
                          controller: ScrollController(
                              keepScrollOffset: true, initialScrollOffset: 2.0),
                          child: ListView.builder(
                              controller: ScrollController(),
                              itemCount: widget.courseModelFilter == null
                                  ? (controller1.courseSearchModel.length + 1)
                                  : widget.courseModelFilter!.courseSearchList
                                      .length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    //  CollagelistExpandedWidget(
                                    //         callbackRemoveCourse:
                                    //             callbackCompareCourseRemove,
                                    //         courseSearchModelCompare1:
                                    //             _.courseSearchModelCompare1,
                                    //         courseSearchModelCompare2:
                                    //             _.courseSearchModelCompare2,
                                    //         previousRoute:
                                    //             CourseSearchList.routeNamed,
                                    //         index: index,
                                    //         courseShortListFirst: true,
                                    //         courseSearchModelCompare1Id:
                                    //             _.courseSearchModelCompare1.id,
                                    //         courseSearchModelCompare2Id:
                                    //             _.courseSearchModelCompare2.id,
                                    //         callbackForModelCompare:
                                    //             callbackModelCompare,
                                    //         callbackCompare: callbackCompare,
                                    //         iscompare:
                                    //             controller1.compareApply.value,
                                    //         courseSearchModel: controller1
                                    //             .courseModelFilter
                                    //             .courseSearchList[index],
                                    //         callbackFunction:
                                    //             callbackCompleteDetailCourse,
                                    //         callbackShortListButton:
                                    //             CallbackShortListButton,
                                    //         finalShortListFirst: false,
                                    //       ),
                                    if (controller1.courseSearchModel.length !=
                                        index)
                                      CollagelistExpandedWidget(
                                        callbackRemoveCourse:
                                            callbackCompareCourseRemove,
                                        courseSearchModelCompare1:
                                            _.courseSearchModelCompare1,
                                        courseSearchModelCompare2:
                                            _.courseSearchModelCompare2,
                                        previousRoute:
                                            ReviewShortList.routeNamed,
                                        index: index,
                                        courseShortListFirst: true,
                                        courseSearchModelCompare1Id: controller1
                                            .courseSearchModelCompare1.id,
                                        courseSearchModelCompare2Id: controller1
                                            .courseSearchModelCompare2.id,
                                        callbackForModelCompare:
                                            callbackModelCompare,
                                        callbackCompare: callbackCompare,
                                        //done
                                        iscompare:
                                            controller1.compareApply.value,
                                        courseSearchModel: controller1
                                            .courseSearchModel[index],
                                        callbackFunction:
                                            callbackCompleteDetailCourse,
                                        finalShortListFirst: true,
                                        callbackShortListButton:
                                            CallbackShortListButton,
                                        callbackFinalShortListButton:
                                            CallbackFinalShortList,
                                      ),
                                  ],
                                );
                              }),
                        ),
                      ),
                    if (controller1.compareApply.value == true)
                      InkWell(
                        onTap: () {
                          if (controller1.courseSearchModelCompare1.id !=
                                  null &&
                              controller1.courseSearchModelCompare2.id !=
                                  null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Comparing(
                                    courseSearchModel1:
                                        controller1.courseSearchModelCompare1,
                                    courseSearchModel2:
                                        controller1.courseSearchModelCompare2,
                                  ),
                                ));
                            // Get.to(
                            //   Comparing(
                            //     courseSearchModel1:
                            //         controller1.courseSearchModelCompare1,
                            //     courseSearchModel2:
                            //         controller1.courseSearchModelCompare2,
                            //   ),
                            // );
                          } else {
                            getToast(SnackBarConstants.courseSearchListPart3!);
                          }

                          // Get.to(
                          //   Comparing(
                          //     courseSearchModel1:
                          //         Get.find<ReviewShortListController>()
                          //             .courseSearchModelCompare1,
                          //     courseSearchModel2:
                          //         Get.find<ReviewShortListController>()
                          //             .courseSearchModelCompare2,
                          //   ),
                          // );
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
                                svgImage("compare", ThemeConstants.whitecolor,
                                    30, 30),
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
                    if (_.loadingCourseShortList.value == false)
                      const CircularProgressIndicator()
                  ],
                ),
              ),
            ],
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

  // callbackCompare(varTopic) async {
  //   // Add To Compare  For Comparing
  //   if (varTopic.toString().split(",")[0].toString() == true.toString()) {
  //     if (controller1.courseSearchModelCompare1.id == null) {
  //       controller1.courseSearchModelCompare1 = controller1
  //           .courseSearchModel[int.parse(varTopic.toString().split(",")[1])];
  //       controller1
  //           .courseSearchModel[int.parse(varTopic.toString().split(",")[1])]
  //           .isSelected = true;
  //     } else if (controller1.courseSearchModelCompare2.id == null) {
  //       controller1.courseSearchModelCompare2 = controller1
  //           .courseSearchModel[int.parse(varTopic.toString().split(",")[1])];
  //       controller1
  //           .courseSearchModel[int.parse(varTopic.toString().split(",")[1])]
  //           .isSelected = true;
  //     } else {
  //       debugPrint(varTopic);
  //     }
  //     // Added Button For Comparing
  //   } else {}
  // }

  callbackCompleteDetailCourse(varTopic) async {
    List<String> endpoint = varTopic.toString().split(',');

    var res = await controller1.completeCourseDetailMethod(
        endpoint[0], endpoint[1], endpoint[2]);

    if (res != null) {
      //TODO
      Get.to(CourseSearchFullDetail(
        completeCourseDetail: res,
      ));
    }
  }

  callbackModelCompare(varTopic) {
    if (varTopic == "Model1") {
      controller1.courseSearchModelCompare1 = CourseSearchModel();
    } else {
      controller1.courseSearchModelCompare2 = CourseSearchModel();
    }
    controller1.update();
  }

  CallbackShortListButton(data) {
    int? courseIndex;
    String? id;
    courseIndex = int.parse(data.toString().split(",")[0]);
    id = data.toString().split(",")[1];

    if (controller1.courseModelFilter.courseSearchList[courseIndex].shortList ==
        "0") {
      controller1.courseModelFilter.courseSearchList[courseIndex].shortList ==
          "1";
    } else {
      controller1.courseModelFilter.courseSearchList[courseIndex].shortList ==
          "0";
    }
    controller1.courseShortList(
        id, Get.find<BaseController>().model1.id.toString());
  }

  CallbackFinalShortList(data) {
    int? courseIndex;
    String? id;
    courseIndex = int.parse(data.toString().split(",")[0]);
    id = data.toString().split(",")[1];

    if (controller1.courseModelFilter.courseSearchList[courseIndex].finalList ==
        "") {
      controller1.courseModelFilter.courseSearchList[courseIndex].finalList ==
          "Final";
    } else {
      controller1.courseModelFilter.courseSearchList[courseIndex].finalList ==
          "";
    }
    controller1.courseFinalShortlist(
        id, Get.find<BaseController>().model1.id.toString());
  }

  callbackCompareCourseRemove(data) {
    if (data.toString() == "1") {
      controller1.courseSearchModelCompare1 = CourseSearchModel();
    } else if (data.toString() == "2") {
      controller1.courseSearchModelCompare2 = CourseSearchModel();
    } else if (data.toString() == "12") {
      controller1.courseSearchModelCompare1 = CourseSearchModel();
      controller1.courseSearchModelCompare2 = CourseSearchModel();
    }
    controller1.update();
  }
}
