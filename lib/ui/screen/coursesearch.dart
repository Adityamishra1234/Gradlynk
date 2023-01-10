// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/coursesearchcontroller.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/ui/models/filterModel.dart';
import 'package:studentpanel/ui/screen/coursesearchfulldetail.dart';
import 'package:studentpanel/ui/screen/courseshortlist.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
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
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    double width = MediaQuery.of(context).size.width;
    if (displayMobileLayout == true) {
      width = width - 240;
    }
    return Scaffold(
      appBar: CustomAppBar("title"),
      drawer: displayMobileLayout == false ? CustomDrawer() : null,
      body: Row(
        children: [
          if (displayMobileLayout == true) CustomDrawer(),
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: width,
              child: Column(
                children: [
                  GetBuilder<CourseSearchController>(
                    builder: (controller1) => Expanded(
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                //Select Country
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 10, top: 20),
                                  child: MultiSelectDropDown(
                                    title: "Select Country*",
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
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 10, top: 15),
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
                                        left: 20, right: 10, top: 10),
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
                                      left: 20, right: 10, top: 15),
                                  child: MultiSelectDropDown(
                                    title: "Select Course Level*",
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
                                      left: 20, right: 10, top: 15),
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
                                      left: 20, right: 10, top: 15),
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

// Search Part
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: SizedBox(
                                    width: width,
                                    child: Row(
                                      children: [
                                        const Spacer(),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 20),
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                  elevation: MaterialStateProperty
                                                      .all<double>(0),
                                                  foregroundColor:
                                                      MaterialStateProperty.all<Color>(
                                                          Colors.white),
                                                  backgroundColor:
                                                      MaterialStateProperty.all<Color>(
                                                          Colors.white),
                                                  shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(5.0),
                                                          side: BorderSide(color: ThemeConstants.TextColor)))),
                                              onPressed: () {},
                                              child: CustomAutoSizeTextMontserrat(
                                                text: "Clear",
                                                textColor:
                                                    ThemeConstants.TextColor,
                                              )),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 20),
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                elevation: 0.0,
                                                primary: ThemeConstants
                                                    .bluecolor, // background
                                                onPrimary: ThemeConstants
                                                    .bluecolor, // foreground
                                              ),
                                              onPressed: () async {
                                                // Api call
                                                // var response =
                                                //     await controller1.courseSearch(
                                                //         controller.selectCountryCode
                                                //             .toString(),
                                                //         controller.selectCourseCode
                                                //             .toString(),
                                                //         "78623");

                                                // CourseModelFilter
                                                //     courseModelFilter2 =
                                                //     CourseModelFilter();
                                                // courseModelFilter2 = response;
                                                Get.to(CourseSearchList(
                                                  filterRedirect: false,
                                                  countryId: controller
                                                      .selectCountryCode
                                                      .toString(),
                                                  courseLevel: controller
                                                      .selectCourseCode
                                                      .toString(),
                                                  enq_id: "78623",
                                                ));
                                              },
                                              child:
                                                  CustomAutoSizeTextMontserrat(
                                                text: "Search",
                                                textColor:
                                                    ThemeConstants.whitecolor,
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
        ],
      ),
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
        controller.courseSearchModelCompare1 = controller
            .courseSearchModel[int.parse(varTopic.toString().split(",")[1])];
        controller
            .courseSearchModel[int.parse(varTopic.toString().split(",")[1])]
            .isSelected = true;
      } else if (controller.courseSearchModelCompare2.id == null) {
        controller.courseSearchModelCompare2 = controller
            .courseSearchModel[int.parse(varTopic.toString().split(",")[1])];
        controller
            .courseSearchModel[int.parse(varTopic.toString().split(",")[1])]
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
  callbackModelCompare(varTopic) {
    if (varTopic == "Model1") {
      controller.courseSearchModelCompare1 = CourseSearchModel();
    } else {
      controller.courseSearchModelCompare2 = CourseSearchModel();
    }
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

  CallbackFinalShortListButton(id) {
    controller.courseFinalShortlist(id, "78623");
    // courseShortList(id, "78623");
  }
}
