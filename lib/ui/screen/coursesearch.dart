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
    return Scaffold(
      appBar: CustomAppBar("title"),
      drawer: CustomDrawer(),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              GetBuilder<CourseSearchController>(
                builder: (controller1) => Expanded(
                  child: Column(
                    children: [
                      // if (Get.find<CourseSearchController>()
                      //         .loadingCourseSearchDetail
                      //         .value ==
                      //     true)
                      //   Padding(
                      //     padding: const EdgeInsets.only(top: 15, bottom: 15),
                      //     child: Row(
                      //       children: [
                      //         const Spacer(),
                      //         InkWell(
                      //           onTap: () {
                      //             Get.bottomSheet(Container(
                      //               width: MediaQuery.of(context).size.width,
                      //               height: 250,
                      //               color: ThemeConstants.whitecolor,
                      //               child: Column(
                      //                 children: [
                      //                   Padding(
                      //                     padding: const EdgeInsets.only(
                      //                         top: 10, right: 5, left: 5),
                      //                     child: Container(
                      //                       width: MediaQuery.of(context)
                      //                           .size
                      //                           .width,
                      //                       decoration: BoxDecoration(
                      //                         color:
                      //                             ThemeConstants.lightblueColor,
                      //                         borderRadius:
                      //                             const BorderRadius.all(
                      //                                 Radius.circular(10)),
                      //                       ),
                      //                       height: 40,
                      //                       child: Row(
                      //                         children: [
                      //                           const Spacer(),
                      //                           CustomAutoSizeTextMontserrat(
                      //                             text: "Sort By",
                      //                             textColor:
                      //                                 ThemeConstants.bluecolor,
                      //                             fontSize: 20,
                      //                           ),
                      //                           const SizedBox(
                      //                             width: 5,
                      //                           ),
                      //                           SvgPicture.asset(
                      //                             "assets/icons/sort.svg",
                      //                             height: 20,
                      //                             color:
                      //                                 ThemeConstants.bluecolor,
                      //                           ),
                      //                           const Spacer(),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   SizedBox(
                      //                     child: Row(
                      //                       children: [
                      //                         Column(
                      //                           children: [
                      //                             SizedBox(
                      //                               width:
                      //                                   MediaQuery.of(context)
                      //                                           .size
                      //                                           .width /
                      //                                       2,
                      //                               child: Align(
                      //                                 alignment:
                      //                                     AlignmentDirectional
                      //                                         .topStart,
                      //                                 child: TextButton(
                      //                                     onPressed: () {},
                      //                                     child:
                      //                                         CustomAutoSizeTextMontserrat(
                      //                                       text: "Budget",
                      //                                     )),
                      //                               ),
                      //                             ),
                      //                             SizedBox(
                      //                               width:
                      //                                   MediaQuery.of(context)
                      //                                           .size
                      //                                           .width /
                      //                                       2,
                      //                               child: Align(
                      //                                 alignment:
                      //                                     AlignmentDirectional
                      //                                         .topStart,
                      //                                 child: TextButton(
                      //                                     onPressed: () {},
                      //                                     child:
                      //                                         CustomAutoSizeTextMontserrat(
                      //                                       text: "%Range",
                      //                                     )),
                      //                               ),
                      //                             ),
                      //                             SizedBox(
                      //                               width:
                      //                                   MediaQuery.of(context)
                      //                                           .size
                      //                                           .width /
                      //                                       2,
                      //                               child: Align(
                      //                                 alignment:
                      //                                     AlignmentDirectional
                      //                                         .topStart,
                      //                                 child: TextButton(
                      //                                     onPressed: () {},
                      //                                     child:
                      //                                         CustomAutoSizeTextMontserrat(
                      //                                       text:
                      //                                           "Times Ranking",
                      //                                     )),
                      //                               ),
                      //                             ),
                      //                             SizedBox(
                      //                               width:
                      //                                   MediaQuery.of(context)
                      //                                           .size
                      //                                           .width /
                      //                                       2,
                      //                               child: Align(
                      //                                 alignment:
                      //                                     AlignmentDirectional
                      //                                         .topStart,
                      //                                 child: TextButton(
                      //                                     onPressed: () {},
                      //                                     child:
                      //                                         CustomAutoSizeTextMontserrat(
                      //                                       text:
                      //                                           "QR World Ranking",
                      //                                     )),
                      //                               ),
                      //                             ),
                      //                           ],
                      //                         ),
                      //                         SizedBox(
                      //                           height: 200,
                      //                           child: Column(
                      //                             children: [
                      //                               SizedBox(
                      //                                 width:
                      //                                     MediaQuery.of(context)
                      //                                             .size
                      //                                             .width /
                      //                                         2,
                      //                                 height: 40,
                      //                                 child: ListTile(
                      //                                   title: const Text(
                      //                                       'Ascending'),
                      //                                   leading: Radio<
                      //                                       BestTutorSite>(
                      //                                     autofocus: true,
                      //                                     value: BestTutorSite
                      //                                         .Ascending,
                      //                                     groupValue: _site,
                      //                                     onChanged:
                      //                                         (BestTutorSite?
                      //                                             value) {
                      //                                       setState(() {
                      //                                         _site = value!;
                      //                                       });
                      //                                     },
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                               SizedBox(
                      //                                 width:
                      //                                     MediaQuery.of(context)
                      //                                             .size
                      //                                             .width /
                      //                                         2,
                      //                                 height: 40,
                      //                                 child: ListTile(
                      //                                   title: const Text(
                      //                                       'Deascending'),
                      //                                   leading: Radio<
                      //                                       BestTutorSite>(
                      //                                     value: BestTutorSite
                      //                                         .Deascending,
                      //                                     groupValue: _site,
                      //                                     onChanged:
                      //                                         (BestTutorSite?
                      //                                             value) {
                      //                                       setState(() {
                      //                                         _site = value!;
                      //                                       });
                      //                                     },
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ],
                      //                           ),
                      //                         )
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ));
                      //           },
                      //           child: Container(
                      //             height: 30,
                      //             width: 60,
                      //             decoration: BoxDecoration(
                      //                 color: ThemeConstants.whitecolor,
                      //                 border: Border.all(
                      //                     color: ThemeConstants
                      //                         .bluelightgreycolor),
                      //                 borderRadius:
                      //                     BorderRadiusDirectional.circular(
                      //                         5.0)),
                      //             child: Center(
                      //               child: Padding(
                      //                 padding: const EdgeInsets.only(
                      //                     left: 5, right: 5),
                      //                 child: CustomAutoSizeTextMontserrat(
                      //                     text: "Sort",
                      //                     fontSize: 12,
                      //                     textColor: ThemeConstants
                      //                         .bluelightgreycolor),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         const Spacer(),
                      //         InkWell(
                      //           onTap: () {
                      //             Get.to(Filter(
                      //               courseModelFilter:
                      //                   controller.courseModelFilter,
                      //             ));
                      //           },
                      //           child: Container(
                      //             height: 30,
                      //             width: 60,
                      //             decoration: BoxDecoration(
                      //                 color: ThemeConstants.whitecolor,
                      //                 border: Border.all(
                      //                     color: ThemeConstants
                      //                         .bluelightgreycolor),
                      //                 borderRadius:
                      //                     BorderRadiusDirectional.circular(
                      //                         5.0)),
                      //             child: Center(
                      //               child: Padding(
                      //                 padding: const EdgeInsets.only(
                      //                     left: 5, right: 5),
                      //                 child: CustomAutoSizeTextMontserrat(
                      //                     text: "Filter",
                      //                     fontSize: 12,
                      //                     textColor: ThemeConstants
                      //                         .bluelightgreycolor),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         const Spacer(),
                      //         InkWell(
                      //           onTap: () {
                      //             if (controller1.compareApply.value == false) {
                      //               controller1.setCompare(true.obs);
                      //             } else {
                      //               controller1.setCompare(false.obs);
                      //             }
                      //           },
                      //           child: Container(
                      //             height: 30,
                      //             width: 70,
                      //             decoration: BoxDecoration(
                      //                 color: ThemeConstants.whitecolor,
                      //                 border: Border.all(
                      //                     color: ThemeConstants
                      //                         .bluelightgreycolor),
                      //                 borderRadius:
                      //                     BorderRadiusDirectional.circular(
                      //                         5.0)),
                      //             child: Center(
                      //               child: Padding(
                      //                 padding: const EdgeInsets.only(
                      //                     left: 5, right: 5),
                      //                 child: CustomAutoSizeTextMontserrat(
                      //                     text: "Compare",
                      //                     fontSize: 12,
                      //                     textColor: ThemeConstants
                      //                         .bluelightgreycolor),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         const Spacer(),
                      //         InkWell(
                      //           onTap: () {
                      //             Get.toNamed(ReviewShortList.routeNamed);
                      //           },
                      //           child: Container(
                      //             height: 30,
                      //             width: 120,
                      //             decoration: BoxDecoration(
                      //                 color: ThemeConstants.whitecolor,
                      //                 border: Border.all(
                      //                     color: ThemeConstants
                      //                         .bluelightgreycolor),
                      //                 borderRadius:
                      //                     BorderRadiusDirectional.circular(
                      //                         5.0)),
                      //             child: Center(
                      //               child: Padding(
                      //                 padding: const EdgeInsets.only(
                      //                     left: 5, right: 5),
                      //                 child: CustomAutoSizeTextMontserrat(
                      //                     text: "Course Shortlist",
                      //                     fontSize: 12,
                      //                     textColor: ThemeConstants
                      //                         .bluelightgreycolor),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         const Spacer(),
                      //       ],
                      //     ),
                      //   ),
                      // if (Get.find<CourseSearchController>()
                      //         .loadingCourseSearchDetail
                      //         .value ==
                      //     true)
                      //   Expanded(
                      //     child: ListView.builder(
                      //         itemCount: controller1.courseSearchModel.length,
                      //         itemBuilder: (BuildContext context, int index) {
                      //           return CollagelistExpandedWidget(
                      //             index: index,
                      //             courseSearchModelCompare1Id:
                      //                 controller1.courseSearchModelCompare1.id,
                      //             courseSearchModelCompare2Id:
                      //                 controller1.courseSearchModelCompare2.id,
                      //             callbackForModelCompare: callbackModelCompare,
                      //             callbackCompare: callbackCompare,
                      //             callbackShortListButton:
                      //                 CallbackShortListButton,
                      //             callbackFinalShortListButton:
                      //                 CallbackFinalShortListButton,
                      //             iscompare: controller1.compareApply.value,
                      //             courseSearchModel:
                      //                 controller1.courseSearchModel[index],
                      //             callbackFunction:
                      //                 callbackCompleteDetailCourse,
                      //           );
                      //         }),
                      //   ),
                      // if (controller1.compareApply.value == true)
                      //   InkWell(
                      //     onTap: () {
                      //       Get.to(
                      //         Comparing(
                      //           courseSearchModel1:
                      //               Get.find<CourseSearchController>()
                      //                   .courseSearchModelCompare1,
                      //           courseSearchModel2:
                      //               Get.find<CourseSearchController>()
                      //                   .courseSearchModelCompare2,
                      //         ),
                      //       );
                      //     },
                      //     child: Container(
                      //       height: 60,
                      //       width: MediaQuery.of(context).size.width,
                      //       decoration: BoxDecoration(
                      //           color: ThemeConstants.bluecolor,
                      //           borderRadius:
                      //               const BorderRadiusDirectional.only(
                      //             topStart: Radius.circular(20.0),
                      //             topEnd: Radius.circular(20.0),
                      //           )),
                      //       child: Center(
                      //         child: Row(
                      //           children: [
                      //             const Spacer(),
                      //             SvgPicture.asset(
                      //               "assets/icons/compare.svg",
                      //               height: 30,
                      //               color: ThemeConstants.whitecolor,
                      //             ),
                      //             const SizedBox(
                      //               width: 5,
                      //             ),
                      //             CustomAutoSizeTextMontserrat(
                      //               text: "Compare",
                      //               fontSize: 20,
                      //               textColor: ThemeConstants.whitecolor,
                      //             ),
                      //             const Spacer(),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // if (controller1.loadingCourseSearchDetail.value == false)

                      SingleChildScrollView(
                        child: Column(
                          children: [
                            //Select Country
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 10, top: 20),
                              child: MultiSelectDropDown(
                                title: "Select Country",
                                listdata: controller1.countryList,
                                callbackFunction: callbackCountry,
                              ),
                            ),
                            const Padding(
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 5),
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
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 5),
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
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 5),
                              child: Divider(
                                height: 5,
                                thickness: 1,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 10, top: 15),
                              child: MultiSelectDropDown(
                                title: "Select Course Level",
                                listdata: controller1.courseLevelList,
                                callbackFunction: callbackCourse,
                              ),
                            ),

                            const Padding(
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 5),
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
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 5),
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
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 5),
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
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
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
                                                      borderRadius:
                                                          BorderRadius.circular(5.0),
                                                      side: BorderSide(color: ThemeConstants.TextColor)))),
                                          onPressed: () {},
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Clear",
                                            textColor: ThemeConstants.TextColor,
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
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
                                            var response =
                                                await controller1.courseSearch(
                                                    controller.selectCountryCode
                                                        .toString(),
                                                    controller.selectCourseCode
                                                        .toString(),
                                                    "78623");
                                            if (response != null &&
                                                response != "") {
                                              CourseModelFilter
                                                  courseModelFilter2 =
                                                  CourseModelFilter();
                                              courseModelFilter2 = response;
                                              Get.to(CourseSearchList(
                                                  courseModelFilter:
                                                      courseModelFilter2));
                                            }
                                          },
                                          child: CustomAutoSizeTextMontserrat(
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
