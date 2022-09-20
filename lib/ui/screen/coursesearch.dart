// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/coursesearchcontroller.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/ui/screen/ModificationUi/completecoursedetailcopy.dart';
import 'package:studentpanel/ui/screen/compare.dart';
import 'package:studentpanel/ui/screen/coursesearchfulldetail.dart';
import 'package:studentpanel/ui/screen/reviewshortlist.dart';
import 'package:studentpanel/ui/screen/fliter.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/collagelistexpandedwidget.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/multiselectdropdown.dart';

enum BestTutorSite { Ascending, Deascending }

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
  late BestTutorSite _site = BestTutorSite.Ascending;

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
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Row(
                            children: [
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  Get.bottomSheet(Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 250,
                                    color: ThemeConstants.whitecolor,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 5, left: 5),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              color:
                                                  ThemeConstants.lightblueColor,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                            ),
                                            height: 40,
                                            child: Row(
                                              children: [
                                                const Spacer(),
                                                CustomAutoSizeTextMontserrat(
                                                  text: "Sort By",
                                                  textColor:
                                                      ThemeConstants.bluecolor,
                                                  fontSize: 20,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                SvgPicture.asset(
                                                  "assets/icons/sort.svg",
                                                  height: 20,
                                                  color:
                                                      ThemeConstants.bluecolor,
                                                ),
                                                const Spacer(),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional
                                                              .topStart,
                                                      child: TextButton(
                                                          onPressed: () {},
                                                          child:
                                                              CustomAutoSizeTextMontserrat(
                                                            text: "Budget",
                                                          )),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional
                                                              .topStart,
                                                      child: TextButton(
                                                          onPressed: () {},
                                                          child:
                                                              CustomAutoSizeTextMontserrat(
                                                            text: "%Range",
                                                          )),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional
                                                              .topStart,
                                                      child: TextButton(
                                                          onPressed: () {},
                                                          child:
                                                              CustomAutoSizeTextMontserrat(
                                                            text:
                                                                "Times Ranking",
                                                          )),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional
                                                              .topStart,
                                                      child: TextButton(
                                                          onPressed: () {},
                                                          child:
                                                              CustomAutoSizeTextMontserrat(
                                                            text:
                                                                "QR World Ranking",
                                                          )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 200,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2,
                                                      height: 40,
                                                      child: ListTile(
                                                        title: const Text(
                                                            'Ascending'),
                                                        leading: Radio<
                                                            BestTutorSite>(
                                                          autofocus: true,
                                                          value: BestTutorSite
                                                              .Ascending,
                                                          groupValue: _site,
                                                          onChanged:
                                                              (BestTutorSite?
                                                                  value) {
                                                            setState(() {
                                                              _site = value!;
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2,
                                                      height: 40,
                                                      child: ListTile(
                                                        title: const Text(
                                                            'Deascending'),
                                                        leading: Radio<
                                                            BestTutorSite>(
                                                          value: BestTutorSite
                                                              .Deascending,
                                                          groupValue: _site,
                                                          onChanged:
                                                              (BestTutorSite?
                                                                  value) {
                                                            setState(() {
                                                              _site = value!;
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ));
                                },
                                child: Container(
                                  height: 30,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: ThemeConstants.whitecolor,
                                      border: Border.all(
                                          color: ThemeConstants
                                              .bluelightgreycolor),
                                      borderRadius:
                                          BorderRadiusDirectional.circular(
                                              5.0)),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: CustomAutoSizeTextMontserrat(
                                          text: "Sort",
                                          fontSize: 12,
                                          textColor: ThemeConstants
                                              .bluelightgreycolor),
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
                                          color: ThemeConstants
                                              .bluelightgreycolor),
                                      borderRadius:
                                          BorderRadiusDirectional.circular(
                                              5.0)),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: CustomAutoSizeTextMontserrat(
                                          text: "Filter",
                                          fontSize: 12,
                                          textColor: ThemeConstants
                                              .bluelightgreycolor),
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
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: ThemeConstants.whitecolor,
                                      border: Border.all(
                                          color: ThemeConstants
                                              .bluelightgreycolor),
                                      borderRadius:
                                          BorderRadiusDirectional.circular(
                                              5.0)),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: CustomAutoSizeTextMontserrat(
                                          text: "Compare",
                                          fontSize: 12,
                                          textColor: ThemeConstants
                                              .bluelightgreycolor),
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  Get.to(ReviewShortList(
                                    controller1: controller1,
                                  ));
                                },
                                child: Container(
                                  height: 30,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: ThemeConstants.whitecolor,
                                      border: Border.all(
                                          color: ThemeConstants
                                              .bluelightgreycolor),
                                      borderRadius:
                                          BorderRadiusDirectional.circular(
                                              5.0)),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: CustomAutoSizeTextMontserrat(
                                          text: "Course Shortlist",
                                          fontSize: 12,
                                          textColor: ThemeConstants
                                              .bluelightgreycolor),
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
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
      Get.to(CourseSearchFullDetail(
        completeCourseDetail: res,
      ));
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
