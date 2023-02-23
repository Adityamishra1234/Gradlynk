// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/controllers/coursesearchcontroller.dart';
import 'package:studentpanel/ui/screen/course_search/courseshortlist.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
import 'package:studentpanel/widgets/customdropdownsingle.dart';

enum BestTutorSite { Ascending, Deascending }

class CourseSearch extends StatefulWidget {
  const CourseSearch({Key? key}) : super(key: key);
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
  List<int> cityindexvaluelist = [];
  List<int> courseBoardFieldindexvaluelist = [];
  List<int> courseNarrowFieldIndexvalueList = [];
  final GlobalKey<FormState> _abcKey = GlobalKey<FormState>();
  bool size = false;
  bool isApplyCompare = false;
  late final BestTutorSite _site = BestTutorSite.Ascending;

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    double width = MediaQuery.of(context).size.width;
    if (displayMobileLayout == true) {
      width = width - 240;
    }
    return Scaffold(
      appBar: CustomAppBar("title"),
      drawer: displayMobileLayout == false
          ? CustomDrawer(
              index: 3,
            )
          : null,
      body: Row(
        children: [
          if (displayMobileLayout == true)
            CustomDrawer(
              index: 3,
            ),
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: width,
              child: Column(
                children: [
                  GetBuilder<CourseSearchController>(
                    builder: (_) => Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20.0,
                            ),
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Country",
                                  mandatory: true,
                                  // fontWeight: FontWeight.bold,,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              // width: 300,
                              height: 45,
                              child: CustomDropDownSingle(
                                model: getDropdownModel(
                                  _.loadingCountry.value,
                                  _.selectCountryName,
                                  _.countryList,
                                ),
                                initialSelectedValue: getSelectedDropDown(
                                  _.loadingCountry.value,
                                  _.selectCountryName,
                                  _.countryList,
                                ),
                                choosefieldtype: false,
                                callbackFunction: callbackCountry,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: CustomAutoSizeTextMontserrat(
                                  text: "State",
                                  // fontWeight: FontWeight.bold,,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              // width: 300,
                              height: 45,
                              child: CustomDropDownSingle(
                                model: getDropdownModel(_.loadingState.value,
                                    _.selectStateName, _.stateList),
                                initialSelectedValue: getSelectedDropDown(
                                    _.loadingState.value,
                                    _.selectStateName,
                                    _.stateList),
                                choosefieldtype: false,
                                callbackFunction: callbackState,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: CustomAutoSizeTextMontserrat(
                                  text: "City",
                                  // fontWeight: FontWeight.bold,,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              // width: 300,
                              height: 45,
                              child: CustomDropDownSingle(
                                model: getDropdownModel(_.loadingCity.value,
                                    _.selectCityName, _.cityList),
                                initialSelectedValue: getSelectedDropDown(
                                    _.loadingCity.value,
                                    _.selectCityName,
                                    _.cityList),
                                choosefieldtype: false,
                                callbackFunction: callbackCity,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Course Level",
                                  mandatory: true,
                                  // fontWeight: FontWeight.bold,,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              // width: 300,
                              height: 45,
                              child: CustomDropDownSingle(
                                model: getDropdownModel(
                                    _.loadingCourseLevel.value,
                                    _.selectCourseLevelName,
                                    _.courseLevelList),
                                initialSelectedValue: getSelectedDropDown(
                                    _.loadingCourseLevel.value,
                                    _.selectCourseLevelName,
                                    _.courseLevelList),
                                choosefieldtype: false,
                                callbackFunction: callbackCourseLevel,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Course Broad Field",
                                  // fontWeight: FontWeight.bold,,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              // width: 300,
                              height: 45,
                              child: CustomDropDownSingle(
                                model: getDropdownModel(
                                    _.loadingCourseBoardField.value,
                                    _.selectCourseBoardFieldName,
                                    _.courseBoardList),
                                initialSelectedValue: getSelectedDropDown(
                                    _.loadingCourseBoardField.value,
                                    _.selectCourseBoardFieldName,
                                    _.courseBoardList),
                                choosefieldtype: false,
                                callbackFunction: callbackCourseBroadField,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Course Narrow Field",
                                  // fontWeight: FontWeight.bold,,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              // width: 300,
                              height: 45,
                              child: CustomDropDownSingle(
                                model: getDropdownModel(
                                    _.loadingCourseNarrowField.value,
                                    _.selectCourseNarrowFieldName,
                                    _.courseNarrowList),
                                initialSelectedValue: getSelectedDropDown(
                                    _.loadingCourseNarrowField.value,
                                    _.selectCourseNarrowFieldName,
                                    _.courseNarrowList),
                                choosefieldtype: false,
                                callbackFunction: callbackCoursenarrowField,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: SizedBox(
                                width: width,
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: SizedBox(
                                        width: 100,
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
                                            onPressed: () {
                                              // Selected Code
                                              _.selectStateCode = null;
                                              _.selectCityCode = null;
                                              _.selectCourseBoardFieldCode =
                                                  null;
                                              _.selectCountryCode = null;
                                              _.selectCourseNarrowFieldCode =
                                                  null;
                                              _.selectCourseLevelCode = null;
                                              //Selected Name
                                              _.selectCountryName = null;
                                              _.selectStateName = null;
                                              _.selectCityName = null;
                                              _.selectCourseBoardFieldName =
                                                  null;
                                              _.selectCourseNarrowFieldName =
                                                  null;
                                              _.selectCourseLevelName = null;
                                              // Dropdown model
                                              _.stateList = [];
                                              _.stateCode = [];
                                              _.cityList = [];
                                              _.cityCode = [];
                                              _.courseNarrowList = [];
                                              _.courseNarrowCode = [];
                                              //loading
                                              _.loadingState.value = false;
                                              _.loadingCity.value = false;
                                              _.loadingCourseNarrowField.value =
                                                  false;
                                              _.update();
                                            },
                                            child: CustomAutoSizeTextMontserrat(
                                              text: "Clear",
                                              textColor:
                                                  ThemeConstants.TextColor,
                                            )),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: SizedBox(
                                        width: 100,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              elevation: 0.0,
                                              primary: ThemeConstants
                                                  .bluecolor, // background
                                              onPrimary: ThemeConstants
                                                  .bluecolor, // foreground
                                            ),
                                            onPressed: () async {
                                              if (_.selectCountryCode == null) {
                                                getToast(SnackBarConstants
                                                    .courseSearchPart1!);
                                              } else if (_
                                                      .selectCourseLevelCode ==
                                                  null) {
                                                getToast(SnackBarConstants
                                                    .courseSearchPart1!);
                                              } else {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            CourseSearchList(
                                                              filterRedirect:
                                                                  false,
                                                              stateCode: _.selectStateCode ==
                                                                      null
                                                                  ? ""
                                                                  : _.selectStateCode
                                                                      .toString(),
                                                              cityCode: _.selectCityCode ==
                                                                      null
                                                                  ? ""
                                                                  : _.selectCityCode
                                                                      .toString(),
                                                              boardFieldCode: _
                                                                          .selectCourseBoardFieldCode ==
                                                                      null
                                                                  ? ""
                                                                  : _.selectCourseBoardFieldCode
                                                                      .toString(),
                                                              countryId: _.selectCountryCode ==
                                                                      null
                                                                  ? ""
                                                                  : _.selectCountryCode
                                                                      .toString(),
                                                              narrowField: _
                                                                          .selectCourseNarrowFieldCode ==
                                                                      null
                                                                  ? ""
                                                                  : _.selectCourseNarrowFieldCode
                                                                      .toString(),
                                                              courseLevel: _
                                                                          .selectCourseLevelCode ==
                                                                      null
                                                                  ? ""
                                                                  : _.selectCourseLevelCode
                                                                      .toString(),
                                                              enq_id: Get.find<
                                                                      BaseController>()
                                                                  .model1
                                                                  .id
                                                                  .toString(),
                                                            )));
                                                // Get.to(CourseSearchList(
                                                //   filterRedirect: false,
                                                //   stateCode:
                                                //       _.selectStateCode == null
                                                //           ? ""
                                                //           : _.selectStateCode
                                                //               .toString(),
                                                //   cityCode:
                                                //       _.selectCityCode == null
                                                //           ? ""
                                                //           : _.selectCityCode
                                                //               .toString(),
                                                //   boardFieldCode:
                                                //       _.selectCourseBoardFieldCode ==
                                                //               null
                                                //           ? ""
                                                //           : _.selectCourseBoardFieldCode
                                                //               .toString(),
                                                //   countryId:
                                                //       _.selectCountryCode ==
                                                //               null
                                                //           ? ""
                                                //           : _.selectCountryCode
                                                //               .toString(),
                                                //   narrowField:
                                                //       _.selectCourseNarrowFieldCode ==
                                                //               null
                                                //           ? ""
                                                //           : _.selectCourseNarrowFieldCode
                                                //               .toString(),
                                                //   courseLevel:
                                                //       _.selectCourseLevelCode ==
                                                //               null
                                                //           ? ""
                                                //           : _.selectCourseLevelCode
                                                //               .toString(),
                                                //   enq_id:
                                                //       Get.find<BaseController>()
                                                //           .model1
                                                //           .id
                                                //           .toString(),
                                                // ));
                                              }
                                            },
                                            child: CustomAutoSizeTextMontserrat(
                                              text: "Search",
                                              textColor:
                                                  ThemeConstants.whitecolor,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
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

  List getDropdownModel(bool loading, String? selected, List model) {
    if (loading == true) {
      return model;
    } else {
      return ["No data"];
    }
  }

  String getSelectedDropDown(bool loading, String? selected, List model) {
    if (loading == true) {
      if (selected == null) {
        return model[0].toString();
      } else {
        return selected;
      }
    } else {
      return "No data";
    }
  }

  callbackCountry(data) {
    for (var i = 0; i < controller.countryList.length; i++) {
      if (i == 0) {
        controller.selectCountryName = null;
        controller.selectCountryCode = null;
      } else {
        if (controller.countryList[i] == data) {
          controller.selectCountryName = data;
          controller.selectCountryCode = controller.countryCode[i];
          controller.getState(controller.selectCountryCode!);
          controller.update();
        }
      }
    }
  }

  callbackState(data) {
    for (var i = 0; i < controller.stateList.length; i++) {
      if (i == 0) {
        controller.selectStateName = null;
        controller.selectStateCode = null;
      } else {
        if (controller.stateList[i] == data) {
          controller.selectStateName = data;
          controller.selectStateCode = controller.stateCode[i];
          controller.getCity(controller.selectStateCode!);
          controller.update();
        }
      }
    }
  }

  callbackCity(data) {
    for (var i = 0; i < controller.cityList.length; i++) {
      if (i == 0) {
        controller.selectCityName = null;
        controller.selectCityCode = null;
      } else {
        if (controller.cityList[i] == data) {
          controller.selectCityName = data;
          controller.selectCityCode = controller.stateCode[i];
          controller.update();
        }
      }
    }
  }

  callbackCourseLevel(data) {
    for (var i = 0; i < controller.courseLevelList.length; i++) {
      if (i == 0) {
        controller.selectCourseLevelName = null;
        controller.selectCourseLevelCode = null;
      } else {
        if (controller.courseLevelList[i] == data) {
          controller.selectCourseLevelName = data;
          controller.selectCourseLevelCode = controller.courseLevelCode[i];
          controller.update();
        }
      }
    }
  }

  callbackCourseBroadField(data) {
    for (var i = 0; i < controller.courseBoardList.length; i++) {
      if (i == 0) {
        controller.selectCourseBoardFieldName = null;
        controller.selectCourseBoardFieldCode = null;
      } else {
        if (controller.courseBoardList[i] == data) {
          controller.selectCourseBoardFieldName = data;
          controller.selectCourseBoardFieldCode = controller.courseBoardCode[i];
          controller
              .getCoursenarrowField(controller.selectCourseBoardFieldCode!);
          controller.update();
        }
      }
    }
  }

  callbackCoursenarrowField(data) {
    for (var i = 0; i < controller.courseNarrowList.length; i++) {
      if (i == 0) {
        controller.selectCourseBoardFieldName = null;
        controller.selectCourseBoardFieldCode = null;
      } else {
        if (controller.courseBoardList[i] == data) {
          controller.selectCourseBoardFieldName = data;
          controller.selectCourseBoardFieldCode = controller.courseBoardCode[i];
          controller.update();
        }
      }
    }
  }
}
