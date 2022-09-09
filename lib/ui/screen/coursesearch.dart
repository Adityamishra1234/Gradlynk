// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/coursesearchcontroller.dart';
import 'package:studentpanel/ui/screen/ModificationUi/completecoursedetailcopy.dart';
import 'package:studentpanel/ui/screen/compare.dart';
import 'package:studentpanel/ui/screen/coursesearchfulldetail.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/collagelistexpandedwidget.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/multiselectdropdown.dart';

class CourseSearch extends StatefulWidget {
  CourseSearch({Key? key}) : super(key: key);
  static const routeNamed = '/CourseSearch';

  @override
  State<CourseSearch> createState() => _CourseSearchState();
}

class _CourseSearchState extends State<CourseSearch> {
  var controller = Get.put(CourseSearchController());
  // List<int> countryindexvaluelist = [];
  List<int> courseindexvaluelist = [];
  List<int> countryindexvaluelist = [];
  List<int> Stateindexvaluelist = [];
  List<int> courseBoardFieldindexvaluelist = [];
  List<int> courseNarrowFieldIndexvalueList = [];
  GlobalKey<FormState> _abcKey = GlobalKey<FormState>();
  bool size = false;
  bool isApplyCompare = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("title"),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              GetBuilder<CourseSearchController>(
                builder: (controller1) => Expanded(
                  child: Column(
                    children: [
                      if (Get.find<CourseSearchController>()
                              .loadingCourseSearchDetail
                              .value ==
                          true)
                        Row(
                          children: [
                            const Spacer(),
                            RaisedButton(
                              elevation: 0,
                              onPressed: () {},
                              color: ThemeConstants.lightblueColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  CustomAutoSizeTextMontserrat(
                                      text: "Sort By",
                                      textColor: ThemeConstants.bluecolor),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/sort.svg",
                                    height: 15,
                                    color: ThemeConstants.bluecolor,
                                  )
                                ],
                              ),
                            ),
                            const Spacer(),
                            RaisedButton(
                              elevation: 0,
                              onPressed: () {},
                              color: ThemeConstants.lightorangeColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  CustomAutoSizeTextMontserrat(
                                      text: "Filter ",
                                      textColor: ThemeConstants.orangeColor),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/filter.svg",
                                    height: 15,
                                    color: ThemeConstants.orangeColor,
                                  )
                                ],
                              ),
                            ),
                            const Spacer(),
                            RaisedButton(
                              elevation: 0,
                              onPressed: () {
                                if (controller1.compareApply.value == false) {
                                  controller1.setCompare(true.obs);
                                  Navigator.push(context,
                                      MaterialPageRoute<void>(
                                          builder: (context) {
                                    return CourseSearch();
                                  }));
                                } else {
                                  controller1.setCompare(false.obs);
                                  Navigator.push(context,
                                      MaterialPageRoute<void>(
                                          builder: (context) {
                                    return CourseSearch();
                                  }));
                                }
                              },
                              color: ThemeConstants.lightgreentColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  CustomAutoSizeTextMontserrat(
                                      text: "Compare",
                                      textColor: ThemeConstants.GreenColor),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/sort.svg",
                                    height: 15,
                                    color: ThemeConstants.GreenColor,
                                  )
                                ],
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      if (Get.find<CourseSearchController>()
                              .loadingCourseSearchDetail
                              .value ==
                          true)
                        Expanded(
                          child: ListView.builder(
                              itemCount: controller1.courseSearchPages
                                      .courseSearchModel!.length +
                                  1,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    if (controller1.courseSearchPages
                                            .courseSearchModel!.length !=
                                        index)
                                      CollagelistExpandedWidget(
                                        index: index,
                                        callbackCompare: callbackCompare,
                                        iscompare:
                                            controller1.compareApply.value,
                                        currentPage: controller1
                                            .courseSearchPages.currentPage
                                            .toString(),
                                        lastPage: controller1
                                            .courseSearchPages.lastPage
                                            .toString(),
                                        courseSearchModel: controller1
                                            .courseSearchPages
                                            .courseSearchModel![index],
                                        callbackFunction:
                                            callbackCompleteDetailCourse,
                                      ),
                                    if (controller1.courseSearchPages
                                            .courseSearchModel!.length ==
                                        index)
                                      Row(
                                        children: [
                                          const Spacer(),
                                          if (controller1.courseSearchPages
                                                  .currentPage !=
                                              1)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20,
                                                  top: 20,
                                                  bottom: 20),
                                              child: SizedBox(
                                                width: 160,
                                                height: 50,
                                                child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      side: BorderSide(
                                                          color: ThemeConstants
                                                              .bluegreycolor),
                                                      primary: ThemeConstants
                                                          .whitecolor, // background
                                                      onPrimary: ThemeConstants
                                                          .whitecolor, // foreground
                                                    ),
                                                    onPressed: () async {
                                                      print(controller1
                                                          .courseSearchPages
                                                          .currentPage);
                                                      var temp = await controller1.nextpage(
                                                          controller1
                                                              .courseSearchPages
                                                              .endpoint
                                                              .toString(),
                                                          (controller1.courseSearchPages
                                                                      .currentPage! -
                                                                  1)
                                                              .toString());
                                                      if (temp == true) {
                                                        Navigator.push(context,
                                                            MaterialPageRoute<
                                                                    void>(
                                                                builder:
                                                                    (context) {
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
                                                          textColor:
                                                              ThemeConstants
                                                                  .bluegreycolor,
                                                        ),
                                                        const Spacer(),
                                                      ],
                                                    )),
                                              ),
                                            ),
                                          if (controller1.courseSearchPages
                                                  .currentPage !=
                                              controller1
                                                  .courseSearchPages.lastPage)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20,
                                                  top: 20,
                                                  bottom: 20),
                                              child: SizedBox(
                                                width: 160,
                                                height: 50,
                                                child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: ThemeConstants
                                                          .bluecolor, // background
                                                      onPrimary: ThemeConstants
                                                          .bluecolor, // foreground
                                                    ),
                                                    onPressed: () async {
                                                      print(controller1
                                                          .courseSearchPages
                                                          .currentPage);
                                                      var temp = await controller1.nextpage(
                                                          controller1
                                                              .courseSearchPages
                                                              .endpoint
                                                              .toString(),
                                                          (controller1.courseSearchPages
                                                                      .currentPage! +
                                                                  1)
                                                              .toString());
                                                      if (temp == true) {
                                                        Navigator.push(context,
                                                            MaterialPageRoute<
                                                                    void>(
                                                                builder:
                                                                    (context) {
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
                                                              ThemeConstants
                                                                  .whitecolor,
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        SvgPicture.asset(
                                                          "assets/icons/next-icon.svg",
                                                          height: 15,
                                                          color: ThemeConstants
                                                              .whitecolor,
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
                      if (controller1.compareApply.value == true)
                        InkWell(
                          onTap: () {
                            Get.to(
                              Comparing(
                                courseSearchModel1:
                                    Get.find<CourseSearchController>()
                                        .courseSearchModelCompare1,
                                courseSearchModel2:
                                    Get.find<CourseSearchController>()
                                        .courseSearchModelCompare2,
                              ),
                            );
                          },
                          child: Container(
                            height: 80,
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
                      if (controller1.loadingCourseSearchDetail.value == false)
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              //Select Country
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 10, top: 0),
                                child: MultiSelectDropDown(
                                  title: "Select Country",
                                  listdata: controller1.countryList,
                                  callbackFunction: callbackCountry,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 5),
                                child: Divider(
                                  height: 5,
                                  thickness: 1,
                                ),
                              ),

//Select State

                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 10,
                                ),
                                child: MultiSelectDropDown(
                                  title: "Select State",
                                  listdata: controller1.stateList,
                                  callbackFunction: callbackState,
                                ),
                              ),

                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 5),
                                child: Divider(
                                  height: 5,
                                  thickness: 1,
                                ),
                              ),
                              //Select City

                              Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 10,
                                  ),
                                  child: MultiSelectDropDown(
                                    title: "Select City",
                                    listdata: controller1.cityList,
                                    callbackFunction: callback,
                                  )),

                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 5),
                                child: Divider(
                                  height: 5,
                                  thickness: 1,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 10,
                                ),
                                child: MultiSelectDropDown(
                                  title: "Select Course Level",
                                  listdata: controller1.courseLevelList,
                                  callbackFunction: callbackCourse,
                                ),
                              ),

                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 5),
                                child: Divider(
                                  height: 5,
                                  thickness: 1,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 10,
                                ),
                                child: MultiSelectDropDown(
                                  title: "Course Board Field",
                                  listdata: controller1.courseBoardList,
                                  callbackFunction: callbackCourseBoardField,
                                ),
                              ),

                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 5),
                                child: Divider(
                                  height: 5,
                                  thickness: 1,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 10,
                                ),
                                child: MultiSelectDropDown(
                                  title: "Course Narrow Field",
                                  listdata: controller1.courseNarrowList,
                                  callbackFunction: callback,
                                ),
                              ),

                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 5),
                                child: Divider(
                                  height: 5,
                                  thickness: 1,
                                ),
                              ),
                              //Specialization

                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //     left: 20,
                              //     right: 10,
                              //   ),
                              //   child: SizedBox(
                              //     child: Row(
                              //       children: [
                              //         Padding(
                              //           padding: const EdgeInsets.only(top: 10),
                              //           child: CustomAutoSizeTextMontserrat(
                              //             text: "Specialization",
                              //             ,
                              //             textColor: Colors.grey,
                              //           ),
                              //         ),
                              //         const Spacer(),
                              //         SizedBox(
                              //           width: 200,
                              //           // custom Text field
                              //           child: Padding(
                              //               padding: const EdgeInsets.only(),
                              //               child: CustomDropDown(
                              //                 hint: "Specialization",
                              //                 model: const ["1", "2", "3"],
                              //                 callbackFunction: callback,
                              //               )),
                              //         )
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // const Padding(
                              //   padding: EdgeInsets.only(left: 20, right: 20),
                              //   child: Divider(
                              //     height: 5,
                              //     thickness: 1,
                              //   ),
                              // ),

                              // BY Course Name Only

                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //     left: 20,
                              //     right: 10,
                              //   ),
                              //   child: SizedBox(
                              //     child: Row(
                              //       children: [
                              //         Padding(
                              //           padding: const EdgeInsets.only(top: 10),
                              //           child: CustomAutoSizeTextMontserrat(
                              //             text: "By Course Name Only",
                              //             ,
                              //             textColor: Colors.grey,
                              //           ),
                              //         ),
                              //         const Spacer(),
                              //         SizedBox(
                              //           width: 180,
                              //           // custom Text field
                              //           child: Padding(
                              //               padding: const EdgeInsets.only(),
                              //               child: CustomDropDown(
                              //                 hint: "By Course Name Only",
                              //                 model: const ["1", "2", "3"],
                              //                 callbackFunction: callback,
                              //               )),
                              //         )
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // const Padding(
                              //   padding: EdgeInsets.only(left: 20, right: 20),
                              //   child: Divider(
                              //     height: 5,
                              //     thickness: 1,
                              //   ),
                              // ),

                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      const Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: ThemeConstants
                                                  .whitecolor, // background
                                              onPrimary: ThemeConstants
                                                  .whitecolor, // foreground
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              "Clean",
                                              style: TextStyle(
                                                  color: ThemeConstants
                                                      .blackcolor),
                                            )),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: ThemeConstants
                                                  .bluecolor, // background
                                              onPrimary: ThemeConstants
                                                  .bluecolor, // foreground
                                            ),
                                            onPressed: () {
                                              // Api call
                                              controller1.courseSearch(
                                                  controller.selectCountryCode
                                                      .toString(),
                                                  controller.selectCourseCode
                                                      .toString());
                                            },
                                            child: Text(
                                              "Search",
                                              style: TextStyle(
                                                  color: ThemeConstants
                                                      .whitecolor),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

// Function
  callbackCompleteDetailCourse(varTopic) async {
    List<String> endpoint = varTopic.toString().split(',');

    var res = await controller.completeCourseDetailMethod(
        endpoint[0], endpoint[1], endpoint[2]);

    if (res != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return CourseSearchFullDetail(
              completeCourseDetail: res,
            );
          },
        ),
      );
    }
  }

  callbackCompare(varTopic) async {
    // Add To Compare  For Comparing
    if (varTopic.toString().split(",")[0].toString() == true.toString()) {
      if (controller.courseSearchModelCompare1.id == null) {
        controller.courseSearchModelCompare1 = controller.courseSearchPages
            .courseSearchModel![int.parse(varTopic.toString().split(",")[1])];
        controller
            .courseSearchPages
            .courseSearchModel![int.parse(varTopic.toString().split(",")[1])]
            .isSelected = true;
      } else if (controller.courseSearchModelCompare2.id == null) {
        controller.courseSearchModelCompare2 = controller.courseSearchPages
            .courseSearchModel![int.parse(varTopic.toString().split(",")[1])];
        controller
            .courseSearchPages
            .courseSearchModel![int.parse(varTopic.toString().split(",")[1])]
            .isSelected = true;
      } else {
        debugPrint(varTopic);
      }
      // Added Button For Comparing
    } else {}
  }

  callbackCountry(data) {
    for (var i = 0; i < data.length; i++) {
      countryindexvaluelist.add(controller.countryList
          .indexWhere((note) => note.startsWith(data[i])));

      debugPrint(countryindexvaluelist.toString());
    }

    for (var j = 0; j < countryindexvaluelist.length; j++) {
      controller.selectCountryCode
          .add(controller.countryCode[countryindexvaluelist[j]]);

      var temp = Set.of(controller.selectCountryCode).toList();
      controller.selectCountryCode = temp.obs;
    }

    controller.getState(controller.selectCountryCode.toString());
  }

  callbackCourse(data) {
    for (var i = 0; i < data.length; i++) {
      courseindexvaluelist.add(controller.courseLevelList
          .indexWhere((note) => note.startsWith(data[i])));
    }

    for (var j = 0; j < courseindexvaluelist.length; j++) {
      controller.selectCourseCode
          .add(controller.courseLevelCode[courseindexvaluelist[j]]);

      var temp = Set.of(controller.selectCourseCode).toList();
      controller.selectCourseCode = temp.obs;
    }
  }

  callbackState(data) {
    for (var i = 0; i < data.length; i++) {
      Stateindexvaluelist.add(
          controller.stateList.indexWhere((note) => note.startsWith(data[i])));
    }

    for (var j = 0; j < Stateindexvaluelist.length; j++) {
      controller.selectStateCode
          .add(controller.stateCode[Stateindexvaluelist[j]]);

      var temp = Set.of(controller.selectStateCode).toList();
      controller.selectStateCode = temp.obs;
    }
    controller.getCity(controller.selectStateCode.toString());
  }

  callback(varTopic) {
    // controller.setdropdown1(varTopic);
  }

  callbackCourseBoardField(data) {
    for (var i = 0; i < data.length; i++) {
      courseBoardFieldindexvaluelist.add(controller.courseBoardList
          .indexWhere((note) => note.startsWith(data[i])));
    }

    for (var j = 0; j < courseBoardFieldindexvaluelist.length; j++) {
      controller.selectCourseBoardFieldCode
          .add(controller.courseBoardCode[courseBoardFieldindexvaluelist[j]]);

      var temp = Set.of(controller.selectCourseBoardFieldCode).toList();
      controller.selectCourseBoardFieldCode = temp.obs;
    }

    controller
        .getCoursenarrowField(controller.selectCourseBoardFieldCode.toString());
  }

  setCompare(bool data) {
    isApplyCompare = data;
    setState(() {});
  }
}
