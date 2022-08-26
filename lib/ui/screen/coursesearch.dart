import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/coursesearchcontroller.dart';
import 'package:studentpanel/ui/screen/coursesearchfulldetail.dart';
import 'package:studentpanel/ui/screen/personalinformation%20copy.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/animationshowdown.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/collagelistexpandedwidget.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownbutton.dart';
import 'package:studentpanel/widgets/multiselectdropdown.dart';
import 'package:intl/intl.dart';

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
  callbackCompleteDetailCourse(varTopic) async {
    List<String> endpoint = varTopic.toString().split(',');
    print(endpoint);
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

  callbackCountry(data) {
    for (var i = 0; i < data.length; i++) {
      countryindexvaluelist.add(controller.countryList!
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

  bool size = false;
  GlobalKey<FormState> _abcKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("title"),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 40,
                child: Row(
                  children: [
                    const Spacer(),
                    CustomAutoSizeTextMontserrat(
                      text: "Course Search",
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    Spacer()
                  ],
                ),
              ),
              // if (false)
              //   const Padding(
              //     padding: EdgeInsets.only(left: 20, right: 20),
              //     child: Divider(
              //       height: 5,
              //       thickness: 1,
              //     ),
              //   ),
              // if (false)
              //   SizedBox(
              //       height: MediaQuery.of(context).size.height - 200,
              //       child: ListView.builder(
              //           itemCount: 5,
              //           itemBuilder: (BuildContext context, int index) {
              //             return CollagelistExpandedWidget();
              //           })),
              GetBuilder<CourseSearchController>(
                builder: (controller1) => Expanded(
                  child: Column(
                    children: [
                      if (Get.find<CourseSearchController>()
                              .loadingCourseSearchDetail
                              .value ==
                          true)
                        Expanded(
                          child: ListView.builder(
                              itemCount: controller1
                                  .courseSearchPages.courseSearchModel!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CollagelistExpandedWidget(
                                  courseSearchModel: controller1
                                      .courseSearchPages
                                      .courseSearchModel![index],
                                  callbackFunction:
                                      callbackCompleteDetailCourse,
                                );
                              }),
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
                              if (controller1.loadingState.value == true)
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
                              if (controller1.loadingState.value == true)
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 5),
                                  child: Divider(
                                    height: 5,
                                    thickness: 1,
                                  ),
                                ),
                              //Select City
                              if (controller1.loadingCity.value == true)
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
                              if (controller1.loadingCity.value == true)
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 5),
                                  child: Divider(
                                    height: 5,
                                    thickness: 1,
                                  ),
                                ),
                              if (controller1.loadingCourseLevel.value == true)
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
                              if (controller1.loadingCourseBoardField.value ==
                                  true)
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
                              if (controller1.loadingCourseBoardField.value ==
                                  true)
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 5),
                                  child: Divider(
                                    height: 5,
                                    thickness: 1,
                                  ),
                                ),
                              if (controller1.loadingCourseNarrowField.value ==
                                  true)
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
                              if (controller1.loadingCourseNarrowField.value ==
                                  true)
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
}
