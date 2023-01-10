import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/finalshortlistcontroller.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/ui/models/filterModel.dart';
import 'package:studentpanel/ui/screen/compare.dart';
import 'package:studentpanel/ui/screen/coursesearchfulldetail.dart';
import 'package:studentpanel/ui/screen/fliter.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/collagelistexpandedwidget.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

class FinalShortList extends StatefulWidget {
  CourseModelFilter? courseModelFilter = CourseModelFilter();
  FinalShortList({Key? key, this.courseModelFilter}) : super(key: key);
  static const routeNamed = '/FinalShortList';

  @override
  State<FinalShortList> createState() => _FinalShortListState();
}

class _FinalShortListState extends State<FinalShortList> {
  var controller1 = Get.put(FinalShortListController());

  @override
  void initState() {
    if (widget.courseModelFilter == null) {
      controller1.getFinalShortlist("78623");
    } else {
      controller1.courseModelFilter = widget.courseModelFilter!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    return Scaffold(
        appBar: CustomAppBar("title"),
        drawer: displayMobileLayout == false ? CustomDrawer() : null,
        body: GetBuilder<FinalShortListController>(
          builder: (_) => Row(
            children: [
              if (displayMobileLayout == true) CustomDrawer(),
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
                                controller1.courseModelFilter
                                        .previousCourseSearchList =
                                    controller1
                                        .courseModelFilter.courseSearchList;
                                Get.to(Filter(
                                  previousRoute: FinalShortList.routeNamed,
                                  courseModelFilter:
                                      controller1.courseModelFilter,
                                ));
                              },
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    color: ThemeConstants.lightorangeColor,
                                    borderRadius:
                                        BorderRadiusDirectional.circular(5.0)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
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
                            InkWell(
                              onTap: () {
                                Get.snackbar("Start Application", "Test",
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
                                        left: 10, right: 10),
                                    child: CustomAutoSizeTextMontserrat(
                                        text: "Start Application",
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
                            isAlwaysShown: true,
                            controller: ScrollController(
                                keepScrollOffset: true,
                                initialScrollOffset: 2.0),
                            child: ListView.builder(
                                itemCount: controller1.courseModelFilter
                                        .courseSearchList.length +
                                    1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      if (controller1.courseModelFilter
                                              .courseSearchList.length !=
                                          index)
                                        CollagelistExpandedWidget(
                                          previousRoute:
                                              FinalShortList.routeNamed,
                                          index: index,
                                          courseShortListFirst: false,
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
                                      // if (controller1.courseSearchModel!.length == index)
                                      //   Row(
                                      //     children: [
                                      //       const Spacer(),
                                      //       if (controller1.currentPage != 1)
                                      //         Padding(
                                      //           padding: const EdgeInsets.only(
                                      //               right: 20, top: 20, bottom: 20),
                                      //           child: SizedBox(
                                      //             width: 160,
                                      //             height: 50,
                                      //             child: ElevatedButton(
                                      //                 style: ElevatedButton.styleFrom(
                                      //                   side: BorderSide(
                                      //                       color: ThemeConstants
                                      //                           .bluegreycolor),
                                      //                   primary: ThemeConstants
                                      //                       .whitecolor, // background
                                      //                   onPrimary: ThemeConstants
                                      //                       .whitecolor, // foreground
                                      //                 ),
                                      //                 onPressed: () async {
                                      //                   var temp = await controller1
                                      //                       .nextpage(
                                      //                           controller1.endpoint
                                      //                               .toString(),
                                      //                           (controller1.currentPage! -
                                      //                                   1)
                                      //                               .toString());
                                      //                   if (temp == true) {
                                      //                     Navigator.push(context,
                                      //                         MaterialPageRoute<void>(
                                      //                             builder: (context) {
                                      //                       return CourseSearch();
                                      //                     }));
                                      //                   }
                                      //                 },
                                      //                 child: Row(
                                      //                   children: [
                                      //                     const Spacer(),
                                      //                     SvgPicture.asset(
                                      //                       "assets/icons/previous-icon.svg",
                                      //                       height: 15,
                                      //                       color: ThemeConstants
                                      //                           .bluegreycolor,
                                      //                     ),
                                      //                     const SizedBox(
                                      //                       width: 5,
                                      //                     ),
                                      //                     CustomAutoSizeTextMontserrat(
                                      //                       text: "Previous",
                                      //                       textColor: ThemeConstants
                                      //                           .bluegreycolor,
                                      //                     ),
                                      //                     const Spacer(),
                                      //                   ],
                                      //                 )),
                                      //           ),
                                      //         ),
                                      //       // if (controller1
                                      //       //         .currentPage !=
                                      //       //     controller1.lastPage)
                                      //       //   Padding(
                                      //       //     padding: const EdgeInsets.only(
                                      //       //         right: 20, top: 20, bottom: 20),
                                      //       //     child: SizedBox(
                                      //       //       width: 160,
                                      //       //       height: 50,
                                      //       //       child: ElevatedButton(
                                      //       //           style: ElevatedButton.styleFrom(
                                      //       //             primary: ThemeConstants
                                      //       //                 .bluecolor, // background
                                      //       //             onPrimary: ThemeConstants
                                      //       //                 .bluecolor, // foreground
                                      //       //           ),
                                      //       //           onPressed: () async {
                                      //       //             var temp = await controller1.nextpage(
                                      //       //                 controller1.courseSearchPages
                                      //       //                     .endpoint
                                      //       //                     .toString(),
                                      //       //                 (controller1.courseSearchPages
                                      //       //                             .currentPage! +
                                      //       //                         1)
                                      //       //                     .toString());
                                      //       //             if (temp == true) {
                                      //       //               Navigator.push(context,
                                      //       //                   MaterialPageRoute<void>(
                                      //       //                       builder: (context) {
                                      //       //                 return CourseSearch();
                                      //       //               }));
                                      //       //             }
                                      //       //             // // Api call
                                      //       //             // controller1.courseSearch(
                                      //       //             //     controller.selectCountryCode
                                      //       //             //         .toString(),
                                      //       //             //     controller.selectCourseCode
                                      //       //             //         .toString());
                                      //       //           },
                                      //       //           child: Row(
                                      //       //             children: [
                                      //       //               const Spacer(),
                                      //       //               CustomAutoSizeTextMontserrat(
                                      //       //                 text: "Next",
                                      //       //                 textColor:
                                      //       //                     ThemeConstants.whitecolor,
                                      //       //               ),
                                      //       //               const SizedBox(
                                      //       //                 width: 5,
                                      //       //               ),
                                      //       //               SvgPicture.asset(
                                      //       //                 "assets/icons/next-icon.svg",
                                      //       //                 height: 15,
                                      //       //                 color:
                                      //       //                     ThemeConstants.whitecolor,
                                      //       //               ),
                                      //       //               const Spacer(),
                                      //       //             ],
                                      //       //           )),
                                      //       //     ),
                                      //       //   ),

                                      //       // const Spacer(),
                                      //     ],
                                      //   )
                                    ],
                                  );
                                }),
                          ),
                        ),
                      if (controller1.compareApply.value == true)
                        InkWell(
                          onTap: () {
                            Get.to(
                              Comparing(
                                courseSearchModel1:
                                    Get.find<FinalShortListController>()
                                        .courseSearchModelCompare1,
                                courseSearchModel2:
                                    Get.find<FinalShortListController>()
                                        .courseSearchModelCompare2,
                              ),
                            );
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
                      if (_.loadingCourseShortList.value == false)
                        const CircularProgressIndicator()
                    ],
                  ),
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
    controller1.courseFinalShortlist(id, "78623");
  }
}
