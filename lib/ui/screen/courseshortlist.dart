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
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/collagelistexpandedwidget.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

class CourseSearchList extends StatefulWidget {
  static const routeNamed = '/CourseSearchList';
  bool filterRedirect = false;
  String? stateCode;
  String? cityCode;
  String? boardFieldCode;
  String? narrowField;
  String? countryId;
  String? courseLevel;
  String? enq_id;
  CourseModelFilter? courseModelFilter = CourseModelFilter();
  CourseSearchList(
      {Key? key,
      required this.filterRedirect,
      this.stateCode,
      this.cityCode,
      this.boardFieldCode,
      this.narrowField,
      this.countryId,
      this.courseLevel,
      this.courseModelFilter,
      this.enq_id})
      : super(key: key);

  @override
  State<CourseSearchList> createState() => _CourseSearchListState();
}

class _CourseSearchListState extends State<CourseSearchList> {
  var controller1 = Get.put(CourseShortListController());

  // String state = "",
  // String city = "",
  // String boarder_ield = "",
  // String narrow_field = "",
  @override
  void initState() {
    if (widget.filterRedirect == false) {
      controller1.courseSearch(
          widget.countryId!,
          widget.courseLevel!,
          widget.enq_id!,
          widget.stateCode ?? "[]",
          widget.cityCode ?? "[]",
          widget.boardFieldCode ?? "[]",
          widget.narrowField ?? "[]");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    double width;
    if (displayMobileLayout == false) {
      width = MediaQuery.of(context).size.width + 240.00;
    }
    return Scaffold(
        appBar: CustomAppBar("title"),
        drawer: displayMobileLayout == false ? CustomDrawer() : null,
        body: GetBuilder<CourseShortListController>(builder: (_) {
          if (widget.filterRedirect == false) {
            controller1.courseModelFilter = controller1.courseModelFilter;
          } else {
            controller1.courseModelFilter = widget.courseModelFilter!;
          }
          return _.loadingCourseSearch.value == true
              ? Row(
                  children: [
                    if (displayMobileLayout == true) CustomDrawer(),
                    Flexible(
                      child: Container(
                        color: ThemeConstants.whitecolor,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    controller1.courseModelFilter
                                            .previousCourseSearchList =
                                        controller1
                                            .courseModelFilter.courseSearchList;
                                    Get.to(Filter(
                                      courseModelFilter:
                                          controller1.courseModelFilter,
                                      previousRoute:
                                          CourseSearchList.routeNamed,
                                    ));
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: ThemeConstants.lightorangeColor,
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                5.0)),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10, top: 5),
                                        child: CustomAutoSizeTextMontserrat(
                                            text: "Filter",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            textColor:
                                                ThemeConstants.orangeColor),
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    if (controller1.compareApply.value ==
                                        false) {
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
                                            BorderRadiusDirectional.circular(
                                                5.0)),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10, top: 5),
                                        child: CustomAutoSizeTextMontserrat(
                                            text: "Compare",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            textColor:
                                                ThemeConstants.GreenColor),
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(ReviewShortList.routeNamed);
                                  },
                                  child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: ThemeConstants.lightVioletColor,
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                5.0)),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10, top: 5),
                                        child: CustomAutoSizeTextMontserrat(
                                            text: "Review Course",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            textColor:
                                                ThemeConstants.VioletColor),
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
                            Expanded(
                              child: Scrollbar(
                                isAlwaysShown: true,
                                showTrackOnHover: true,
                                radius: Radius.circular(12.0),
                                controller: ScrollController(),
                                child: ListView.builder(
                                    itemCount: controller1.courseModelFilter
                                        .courseSearchList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          // if (controller1.courseSearchModel.length != index)
                                          CollagelistExpandedWidget(
                                            callbackRemoveCourse:
                                                callbackCompareCourseRemove,
                                            courseSearchModelCompare1:
                                                _.courseSearchModelCompare1,
                                            courseSearchModelCompare2:
                                                _.courseSearchModelCompare2,
                                            previousRoute:
                                                CourseSearchList.routeNamed,
                                            index: index,
                                            courseShortListFirst: true,
                                            courseSearchModelCompare1Id:
                                                _.courseSearchModelCompare1.id,
                                            courseSearchModelCompare2Id:
                                                _.courseSearchModelCompare2.id,
                                            callbackForModelCompare:
                                                callbackModelCompare,
                                            callbackCompare: callbackCompare,
                                            iscompare:
                                                controller1.compareApply.value,
                                            courseSearchModel: controller1
                                                .courseModelFilter
                                                .courseSearchList[index],
                                            callbackFunction:
                                                callbackCompleteDetailCourse,
                                            callbackShortListButton:
                                                CallbackShortListButton,
                                            finalShortListFirst: false,
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                            ),
                            if (controller1.compareApply.value == true)
                              InkWell(
                                onTap: () {
                                  if (controller1
                                              .courseSearchModelCompare1.id !=
                                          null &&
                                      controller1
                                              .courseSearchModelCompare2.id !=
                                          null) {
                                    Get.to(
                                      Comparing(
                                        courseSearchModel1: controller1
                                            .courseSearchModelCompare1,
                                        courseSearchModel2: controller1
                                            .courseSearchModelCompare2,
                                      ),
                                    );
                                  } else {
                                    getToast("Please select course");
                                  }
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
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        }));
  }

  // Function
  callbackCompare(varTopic) async {
    // Add To Compare  For Comparing
    if (varTopic != false) {
      controller1.compare(varTopic);
    }
  }

  callbackModelCompare(varTopic) async {
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
    if (controller1.courseModelFilter.courseSearchList[courseIndex].shortList ==
        "0") {
      controller1.courseModelFilter.courseSearchList[courseIndex].shortList ==
          "1";
    } else {
      controller1.courseModelFilter.courseSearchList[courseIndex].shortList ==
          "0";
    }
    controller1.courseShortList(id, "78623");
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
