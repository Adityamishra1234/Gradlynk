import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/controllers/courseshortlist.dart';
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
  bool? previewScreenCourseSearch = false;
  CourseModelFilter? courseModelFilter = CourseModelFilter();
  FilterModel? filtermodel = FilterModel();
  bool? filterRedirect = false;
  ReviewShortList(
      {Key? key,
      this.courseModelFilter,
      this.filtermodel,
      this.filterRedirect,
      this.previewScreenCourseSearch})
      : super(key: key);
  static const routeNamed = '/ReviewShortlist';

  @override
  State<ReviewShortList> createState() => _ReviewShortListState();
}

class _ReviewShortListState extends State<ReviewShortList> {
  var controller1 = Get.put(ReviewShortListController());
  final yourScrollController = ScrollController();

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

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   print("object");
  //   super.didChangeDependencies();
  // }

  // @override
  // void didUpdateWidget(covariant ReviewShortList oldWidget) {
  //   // TODO: implement didUpdateWidget
  //   print("didUpdateWidget");
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    controller1.dispose();
    super.dispose();
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
        appBar: const CustomAppBar("title"),
        drawer: displayMobileLayout == false
            ? CustomDrawer(
                index: 4,
              )
            : null,
        body: WillPopScope(
          onWillPop: () async {
            // print(Get.arguments[7]["previous_screenCourseSearch"]);
            if (Get.arguments[7]["previous_screenCourseSearch"].toString() ==
                "true") {
              Get.find<CourseShortListController>().courseSearch(
                  false,
                  Get.arguments[0]["countryId"].toString(),
                  Get.arguments[1]["courseLevel"].toString(),
                  Get.find<BaseController>().model1.id.toString(),
                  Get.arguments[3]["statecode"].toString(),
                  Get.arguments[4]["cityCode"].toString(),
                  Get.arguments[5]["boardFieldCode"].toString(),
                  Get.arguments[6]["narrowField"].toString(),
                  Get.arguments[6]["narrowField"].toString(),
                  Get.arguments[6]["narrowField"].toString());

              ///todo
              Get.find<CourseShortListController>().update();
            } else {
              Get.back();
            }

            return true;
          },
          child: GetBuilder<ReviewShortListController>(
            builder: (_) => Row(
              children: [
                if (displayMobileLayout == true)
                  CustomDrawer(
                    index: 4,
                  ),
                Flexible(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      if (_.loadingCourseShortList.value == true)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                if (controller1.courseModelFilter
                                        .previousCourseSearchList.length <=
                                    controller1.courseModelFilter
                                        .courseSearchList.length) {
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
                                    border: Border.all(
                                      color: ThemeConstants.orangeColor,
                                    ),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(5.0)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: CustomAutoSizeTextMontserrat(
                                        text: "Filter",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        textColor: ThemeConstants.orangeColor),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
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
                                    border: Border.all(
                                      color: ThemeConstants.GreenColor,
                                    ),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(5.0)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: CustomAutoSizeTextMontserrat(
                                        text: "Compare",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        textColor: ThemeConstants.GreenColor),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                controller1.loadingCourseShortList.value =
                                    false;
                                controller1.update();
                                Get.toNamed(FinalShortList.routeNamed,
                                    arguments: true);
                              },
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    color: ThemeConstants.lightVioletColor,
                                    border: Border.all(
                                        color: ThemeConstants.VioletColor),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(5.0)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
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
                            thickness: 5,
                            radius: Radius.circular(20),
                            controller: yourScrollController,
                            child: ListView.builder(
                                controller: yourScrollController,
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
                                      if (controller1
                                              .courseSearchModel.length !=
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
                                          courseSearchModelCompare1Id:
                                              controller1
                                                  .courseSearchModelCompare1.id,
                                          courseSearchModelCompare2Id:
                                              controller1
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
                              getToast(
                                  SnackBarConstants.courseSearchListPart3!);
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
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: ThemeConstants.bluecolor,
                                borderRadius:
                                    const BorderRadiusDirectional.only(
                                  topStart: Radius.circular(20.0),
                                  topEnd: Radius.circular(20.0),
                                )),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // svgImage("compare", ThemeConstants.whitecolor,
                                  //     30, 30),
                                  CustomAutoSizeTextMontserrat(
                                    text: "Compare",
                                    fontSize: 20,
                                    textColor: ThemeConstants.whitecolor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (_.loadingCourseShortList.value == false)
                        getLoading(context)
                    ],
                  ),
                ),
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
