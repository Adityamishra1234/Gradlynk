import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/controllers/finalshortlistcontroller.dart';
import 'package:studentpanel/ui/controllers/reviewshortlistcontroller.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/ui/models/filterModel.dart';
import 'package:studentpanel/ui/screen/course_search/compare.dart';
import 'package:studentpanel/ui/screen/complete_course_details/coursesearchfulldetail.dart';
import 'package:studentpanel/ui/screen/course_search/fliter.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/collagelistexpandedwidget.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

class FinalShortList extends StatefulWidget {
  CourseModelFilter? courseModelFilter = CourseModelFilter();
  FilterModel? filterModel = FilterModel();
  bool? filterRedirect = false;
  FinalShortList(
      {Key? key, this.courseModelFilter, this.filterModel, this.filterRedirect})
      : super(key: key);
  static const routeNamed = '/FinalShortList';

  @override
  State<FinalShortList> createState() => _FinalShortListState();
}

class _FinalShortListState extends State<FinalShortList> {
  var controller1 = Get.put(FinalShortListController());
  final yourScrollController = ScrollController();

  @override
  void initState() {
    if (widget.courseModelFilter == null) {
      controller1
          .getFinalShortlist(Get.find<BaseController>().model1.id.toString());
    } else {
      controller1.courseModelFilter = widget.courseModelFilter!;
    }
    super.initState();
  }

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
    return WillPopScope(
      onWillPop: () async {
        try {
          await Get.find<ReviewShortListController>().GetCourseShortList(
              Get.find<BaseController>().model1.id.toString());
          Get.find<ReviewShortListController>().update();
        } catch (e) {
          print("object");
        }
        Get.back();
        return true;
      },
      child: Scaffold(
          appBar: const CustomAppBar("title"),
          drawer: displayMobileLayout == false
              ? CustomDrawer(
                  index: 5,
                )
              : null,
          body: GetBuilder<FinalShortListController>(
            builder: (_) => Row(
              children: [
                if (displayMobileLayout == true)
                  CustomDrawer(
                    index: 5,
                  ),
                Flexible(
                  child: Container(
                    color: ThemeConstants.whitecolor,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        if (_.loadingCourseShortList.value == true)
                          Row(
                            children: [
                              const Spacer(),
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
                                                previousRoute:
                                                    FinalShortList.routeNamed,
                                                courseModelFilter: controller1
                                                    .courseModelFilter,
                                                filtermodel: widget.filterModel,
                                              )));
                                  // Get.to(Filter(
                                  //   previousRoute: FinalShortList.routeNamed,
                                  //   courseModelFilter:
                                  //       controller1.courseModelFilter,
                                  //   filtermodel: widget.filterModel,
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
                                          BorderRadiusDirectional.circular(
                                              5.0)),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: CustomAutoSizeTextMontserrat(
                                          text: "Filter",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          textColor:
                                              ThemeConstants.orangeColor),
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
                                      border: Border.all(
                                        color: ThemeConstants.GreenColor,
                                      ),
                                      borderRadius:
                                          BorderRadiusDirectional.circular(
                                              5.0)),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
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
                              // InkWell(
                              //   onTap: () {
                              //     Get.snackbar("Start Application", "Test",
                              //         snackPosition: SnackPosition.BOTTOM);
                              //   },
                              //   child: Container(
                              //     height: 30,
                              //     decoration: BoxDecoration(
                              //         color: ThemeConstants.lightVioletColor,
                              //         borderRadius:
                              //             BorderRadiusDirectional.circular(
                              //                 5.0)),
                              //     child: Center(
                              //       child: Padding(
                              //         padding: const EdgeInsets.only(
                              //             left: 10, right: 10),
                              //         child: CustomAutoSizeTextMontserrat(
                              //             text: "Start Application",
                              //             fontSize: 14,
                              //             fontWeight: FontWeight.w600,
                              //             textColor:
                              //                 ThemeConstants.VioletColor),
                              //       ),
                              //     ),
                              //   ),
                              // ),
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
                              thickness: 10,
                              controller: yourScrollController,
                              child: ListView.builder(
                                  controller: yourScrollController,
                                  itemCount: controller1.courseModelFilter
                                          .courseSearchList.length +
                                      1,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        if (controller1.courseModelFilter
                                                .courseSearchList.length !=
                                            index)
                                          CollagelistExpandedWidget(
                                            callbackRemoveCourse:
                                                callbackCompareCourseRemove,
                                            courseSearchModelCompare1:
                                                _.courseSearchModelCompare1,
                                            courseSearchModelCompare2:
                                                _.courseSearchModelCompare2,
                                            previousRoute:
                                                FinalShortList.routeNamed,
                                            index: index,
                                            courseShortListFirst: false,
                                            courseSearchModelCompare1Id:
                                                controller1
                                                    .courseSearchModelCompare1
                                                    .id,
                                            courseSearchModelCompare2Id:
                                                controller1
                                                    .courseSearchModelCompare2
                                                    .id,
                                            callbackForModelCompare:
                                                callbackModelCompare,
                                            callbackCompare: callbackCompare,
                                            //done
                                            iscompare:
                                                controller1.compareApply.value,
                                            // currentPage: controller1
                                            //     .currentPage
                                            //     .toString(),
                                            // lastPage: controller1.lastPage
                                            //     .toString(),
                                            courseSearchModel: controller1
                                                .courseModelFilter
                                                .courseSearchList[index],
                                            callbackFunction:
                                                callbackCompleteDetailCourse,
                                            finalShortListFirst: true,
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
                                        courseSearchModel1: controller1
                                            .courseSearchModelCompare1,
                                        courseSearchModel2: controller1
                                            .courseSearchModelCompare2,
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
                              //         Get.find<FinalShortListController>()
                              //             .courseSearchModelCompare1,
                              //     courseSearchModel2:
                              //         Get.find<FinalShortListController>()
                              //             .courseSearchModelCompare2,
                              //   ),
                              // );
                            },
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: ThemeConstants.bluecolor,
                                  borderRadius:
                                      const BorderRadiusDirectional.only(
                                    topStart: Radius.circular(20.0),
                                    topEnd: Radius.circular(20.0),
                                  )),
                              child: Center(
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    svgImage("compare",
                                        ThemeConstants.whitecolor, 30, 30),
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
                          getLoading(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  // Function
  callbackCompare(varTopic) async {
    // Add To Compare  For Comparing
    if (varTopic != false) {
      controller1.compare(varTopic);
    }
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
