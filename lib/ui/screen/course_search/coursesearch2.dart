// ignore_for_file: deprecated_member_use
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/controllers/coursesearchcontroller.dart';
import 'package:studentpanel/ui/screen/course_search/courseshortlist.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/Custom_icons_text/custom_icon_text_together.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
import 'package:studentpanel/widgets/Custom%20Dropdown/custom_dropdown.dart';
import 'package:studentpanel/widgets/customtextfield.dart';

enum BestTutorSite { Ascending, Deascending }

class CourseSearch2 extends StatefulWidget {
  const CourseSearch2({Key? key}) : super(key: key);
  static const routeNamed = '/CourseSearch2';

  @override
  State<CourseSearch2> createState() => _CourseSearch2State();
}

class _CourseSearch2State extends State<CourseSearch2> {
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
      width = width;
    }
    return Scaffold(
      appBar: const CustomAppBar("title"),
      drawer: displayMobileLayout == false
          ? CustomDrawer(
              index: 3,
            )
          : null,
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: width,
          child: controller.obx(
            onLoading: getLoading(context),
            (state) => SingleChildScrollView(
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
                        text: "Destination",
                        fontWeight: FontWeight.w500,
                        mandatory: true,
                        // fontWeight: FontWeight.bold,,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    height: 110,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.countryWithFlagDataList.length,
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                controller.selectedCountry =
                                    controller.countryWithFlagDataList[index];
                                controller.update();
                                // controller.getCoursenarrowField(
                                //     controller.selectCourseBoardFieldCode!);

                                if (controller.selectedCountry.id == 9998 ||
                                    controller.selectedCountry.id == 9999) {
                                  controller.getCountryFromContinent(
                                      controller.selectedCountry.id);
                                } else {
                                  controller.showCountryFromContinentDropDown =
                                      false;

                                  controller
                                      .getState(controller.selectedCountry.id!);

                                  controller.getUniversityDropDownData();
                                }
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                width: 140,
                                decoration: BoxDecoration(
                                    color: controller.selectedCountry.id ==
                                            controller
                                                .countryWithFlagDataList[index]
                                                .id
                                        ? ThemeConstants.lightblueColor2
                                        : ThemeConstants.whitecolor,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        width: 1,
                                        color: ThemeConstants.bluecolor)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        child: CachedNetworkImage(
                                          imageUrl: controller
                                              .countryWithFlagDataList[index]
                                              .flag!,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${controller.countryWithFlagDataList[index].country}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ]),
                              ),
                            )),
                  ),
                  if (controller.showCountryFromContinentDropDown == true) ...[
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Select Country",
                          fontWeight: FontWeight.w500,
                          mandatory: true,
                          // fontWeight: FontWeight.bold,,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomDropDownSingle(
                      bgColor: ThemeConstants.ultraLightgreyColor2,
                      model: getDropdownModel(
                          controller.loadingcountryFromContientName,
                          controller.selectedCountryNameFromContinent,
                          controller.countryFromContientName),
                      initialSelectedValue: getSelectedDropDown(
                        controller.loadingcountryFromContientName,
                        controller.selectedCountryNameFromContinent,
                        controller.countryFromContientName,
                      ),
                      choosefieldtype: false,
                      callbackFunction: callbackCountry,
                    ),
                  ],

                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: CustomAutoSizeTextMontserrat(
                                text: "State",
                                fontWeight: FontWeight.w500,
                                // fontWeight: FontWeight.bold,,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: CustomDropDownSingle(
                              bgColor: ThemeConstants.ultraLightgreyColor2,
                              model: getDropdownModel(
                                  controller.loadingState.value,
                                  controller.selectStateName,
                                  controller.stateList),
                              initialSelectedValue: getSelectedDropDown(
                                  controller.loadingState.value,
                                  controller.selectStateName,
                                  controller.stateList),
                              choosefieldtype: false,
                              callbackFunction: callbackState,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: CustomAutoSizeTextMontserrat(
                                text: "City",
                                fontWeight: FontWeight.w500,
                                // fontWeight: FontWeight.bold,,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: CustomDropDownSingle(
                              bgColor: ThemeConstants.ultraLightgreyColor2,
                              model: getDropdownModel(
                                  controller.loadingCity.value,
                                  controller.selectCityName,
                                  controller.cityList),
                              initialSelectedValue: getSelectedDropDown(
                                  controller.loadingCity.value,
                                  controller.selectCityName,
                                  controller.cityList),
                              choosefieldtype: false,
                              callbackFunction: callbackCity,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: CustomAutoSizeTextMontserrat(
                        text: "University",
                        fontWeight: FontWeight.w500,
                        // fontWeight: FontWeight.bold,,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: CustomDropDownSingle(
                      bgColor: ThemeConstants.ultraLightgreyColor2,
                      model: getDropdownModel(
                          controller.universityLoading,
                          controller.selectedUniversityName,
                          controller.universityListName),
                      initialSelectedValue: getSelectedDropDown(
                          controller.universityLoading,
                          controller.selectedUniversityName,
                          controller.universityListName),
                      choosefieldtype: false,
                      callbackFunction: callbackUniversitySelected,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Align(
                  //   alignment: AlignmentDirectional.topStart,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 20.0),
                  //     child: CustomAutoSizeTextMontserrat(
                  //       text: "",
                  //       fontWeight: FontWeight.w500,
                  //       // fontWeight: FontWeight.bold,,
                  //       fontSize: 16,
                  //     ),
                  //   ),
                  // ),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.courseSearchType = 0;
                            controller.update();
                          },
                          child: CustomIconTextTogether(
                              showICOn: true,
                              verticalPadding: 5,
                              horizontelPadding: 15,
                              fontWeight: FontWeight.w400,
                              textSize: 10,
                              Bgcolor: controller.courseSearchType == 0
                                  ? ThemeConstants.bluecolor
                                  : ThemeConstants.whitecolor,
                              color: controller.courseSearchType == 0
                                  ? ThemeConstants.whitecolor
                                  : ThemeConstants.bluecolor,
                              iconData: svgImage(
                                  "Course Selection",
                                  controller.courseSearchType == 0
                                      ? ThemeConstants.whitecolor
                                      : ThemeConstants.bluecolor,
                                  20,
                                  20),
                              text: 'Course Selection'),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          onTap: () {
                            controller.courseSearchType = 1;
                            controller.update();
                          },
                          child: CustomIconTextTogether(
                              verticalPadding: 5,
                              horizontelPadding: 15,
                              showICOn: true,
                              fontWeight: FontWeight.w400,
                              textSize: 10,
                              iconData: svgImage(
                                  "Job Industry",
                                  controller.courseSearchType == 1
                                      ? ThemeConstants.whitecolor
                                      : ThemeConstants.bluecolor,
                                  20,
                                  20),
                              borderColor: controller.courseSearchType == 1
                                  ? ThemeConstants.bluecolor
                                  : ThemeConstants.whitecolor,
                              Bgcolor: controller.courseSearchType == 1
                                  ? ThemeConstants.bluecolor
                                  : ThemeConstants.whitecolor,
                              color: controller.courseSearchType == 1
                                  ? ThemeConstants.whitecolor
                                  : ThemeConstants.bluecolor,
                              text: 'Job Industry'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  if (controller.courseSearchType == 0) ...[
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Course Level",
                          mandatory: true,
                          fontWeight: FontWeight.w500,
                          // fontWeight: FontWeight.bold,,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.courseLevelSelector = 6;
                                controller.update();
                              },
                              child: CustomIconTextTogether(
                                  showICOn: false,
                                  verticalPadding: 8,
                                  horizontelPadding: 15,
                                  fontWeight: FontWeight.w400,
                                  textSize: 10,
                                  Bgcolor: controller.courseLevelSelector == 6
                                      ? ThemeConstants.bluecolor
                                      : ThemeConstants.whitecolor,
                                  color: controller.courseLevelSelector == 6
                                      ? ThemeConstants.whitecolor
                                      : ThemeConstants.bluecolor,
                                  iconData: const Icon(Icons.abc),
                                  text: 'Diploma'),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                controller.courseLevelSelector = 4;
                                controller.update();
                              },
                              child: CustomIconTextTogether(
                                  showICOn: false,
                                  verticalPadding: 8,
                                  horizontelPadding: 15,
                                  fontWeight: FontWeight.w400,
                                  textSize: 10,
                                  Bgcolor: controller.courseLevelSelector == 4
                                      ? ThemeConstants.bluecolor
                                      : ThemeConstants.whitecolor,
                                  color: controller.courseLevelSelector == 4
                                      ? ThemeConstants.whitecolor
                                      : ThemeConstants.bluecolor,
                                  iconData: const Icon(Icons.abc),
                                  text: 'Bachelors'),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                controller.courseLevelSelector = 3;
                                controller.update();
                              },
                              child: CustomIconTextTogether(
                                  showICOn: false,
                                  verticalPadding: 8,
                                  horizontelPadding: 15,
                                  fontWeight: FontWeight.w400,
                                  textSize: 10,
                                  Bgcolor: controller.courseLevelSelector == 3
                                      ? ThemeConstants.bluecolor
                                      : ThemeConstants.whitecolor,
                                  color: controller.courseLevelSelector == 3
                                      ? ThemeConstants.whitecolor
                                      : ThemeConstants.bluecolor,
                                  iconData: const Icon(Icons.abc),
                                  text: 'Master'),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                controller.selectCourseLevelName = '';
                                controller.courseLevelSelector = 200;
                                controller.update();
                              },
                              child: CustomIconTextTogether(
                                  showICOn: false,
                                  verticalPadding: 8,
                                  horizontelPadding: 15,
                                  fontWeight: FontWeight.w400,
                                  textSize: 10,
                                  Bgcolor: controller.courseLevelSelector !=
                                              3 &&
                                          controller.courseLevelSelector != 4 &&
                                          controller.courseLevelSelector != 6
                                      ? ThemeConstants.bluecolor
                                      : ThemeConstants.whitecolor,
                                  color: controller.courseLevelSelector != 3 &&
                                          controller.courseLevelSelector != 4 &&
                                          controller.courseLevelSelector != 6
                                      ? ThemeConstants.whitecolor
                                      : ThemeConstants.bluecolor,
                                  iconData: const Icon(Icons.abc),
                                  text: 'Others'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    if (controller.courseLevelSelector != 3 &&
                        controller.courseLevelSelector != 4 &&
                        controller.courseLevelSelector != 6) ...[
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: CustomAutoSizeTextMontserrat(
                            text: "Other options",

                            // fontWeight: FontWeight.bold,,
                            fontWeight: FontWeight.w500,
                            // fontWeight: FontWeight.bold,,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomDropDownSingle(
                        bgColor: ThemeConstants.ultraLightgreyColor2,
                        model: getDropdownModel(
                            controller.loadingCourseLevel.value,
                            controller.selectCourseLevelName,
                            controller.courseLevelList),
                        initialSelectedValue: getSelectedDropDown(
                            controller.loadingCourseLevel.value,
                            controller.selectCourseLevelName,
                            controller.courseLevelList),
                        choosefieldtype: false,
                        callbackFunction: callbackCourseLevel,
                      ),
                    ],

                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Course Broad Field",

                          // fontWeight: FontWeight.bold,,
                          fontWeight: FontWeight.w500,
                          // fontWeight: FontWeight.bold,,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width * .95,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      height: 110,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              controller.AllCourseSearchBroadField.length,
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  controller.selectCourseBoardFieldCode =
                                      controller
                                          .AllCourseSearchBroadField[index].id;
                                  controller.update();
                                  controller.getCoursenarrowField(
                                      controller.selectCourseBoardFieldCode!);
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  width: 140,
                                  decoration: BoxDecoration(
                                      color: controller
                                                  .selectCourseBoardFieldCode ==
                                              controller
                                                  .AllCourseSearchBroadField[
                                                      index]
                                                  .id
                                          ? ThemeConstants.lightblueColor2
                                          : ThemeConstants.whitecolor,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          width: 1,
                                          color: ThemeConstants.bluecolor)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          child: CachedNetworkImage(
                                            imageUrl: controller
                                                .AllCourseSearchBroadField[
                                                    index]
                                                .imageLink!,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${controller.AllCourseSearchBroadField[index].broadFieldName}',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ]),
                                ),
                              )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // Align(
                    //   alignment: AlignmentDirectional.topStart,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 20.0),
                    //     child: CustomAutoSizeTextMontserrat(
                    //       text: "Course Narrow Field",

                    //       // fontWeight: FontWeight.bold,,
                    //       fontWeight: FontWeight.w500,
                    //       // fontWeight: FontWeight.bold,,
                    //       fontSize: 16,
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // CustomDropDownSingle(
                    //   model: getDropdownModel(
                    //       _.loadingCourseBoardField.value,
                    //       _.selectCourseBoardFieldName,
                    //       _.courseBoardList),
                    //   initialSelectedValue: getSelectedDropDown(
                    //       _.loadingCourseBoardField.value,
                    //       _.selectCourseBoardFieldName,
                    //       _.courseBoardList),
                    //   choosefieldtype: false,
                    //   callbackFunction: callbackCourseBroadField,
                    // ),
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
                          fontWeight: FontWeight.w500,
                          //       // fontWeight: FontWeight.bold,,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomDropDownSingle(
                      bgColor: ThemeConstants.ultraLightgreyColor2,
                      model: getDropdownModel(
                          controller.loadingCourseNarrowField.value,
                          controller.selectCourseNarrowFieldName,
                          controller.courseNarrowList),
                      initialSelectedValue: getSelectedDropDown(
                          controller.loadingCourseNarrowField.value,
                          controller.selectCourseNarrowFieldName,
                          controller.courseNarrowList),
                      choosefieldtype: false,
                      callbackFunction: callbackCoursenarrowField,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ] else ...[
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Select Profession",
                          // fontWeight: FontWeight.bold,,
                          fontWeight: FontWeight.w500,
                          //       // fontWeight: FontWeight.bold,,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomDropDownSingle(
                      bgColor: ThemeConstants.ultraLightgreyColor2,
                      model: getDropdownModel(
                          controller.loadingIndustries,
                          controller.selectedIndustryName,
                          controller.industriesList),
                      initialSelectedValue: getSelectedDropDown(
                          controller.loadingIndustries,
                          controller.selectedIndustryName,
                          controller.industriesList),
                      choosefieldtype: false,
                      callbackFunction: callbackIndustry,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Career Outcomes",
                          // fontWeight: FontWeight.bold,,
                          fontWeight: FontWeight.w500,
                          //       // fontWeight: FontWeight.bold,,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomDropDownSingle(
                      bgColor: ThemeConstants.ultraLightgreyColor2,
                      model: getDropdownModel(
                          controller.careerOutcomeLoading,
                          controller.selectedcareerOutcomeDropDownName,
                          controller.careerOutcomeDropDownName),
                      initialSelectedValue: getSelectedDropDown(
                          controller.careerOutcomeLoading,
                          controller.selectedcareerOutcomeDropDownName,
                          controller.careerOutcomeDropDownName),
                      choosefieldtype: false,
                      callbackFunction: callbackCareerOutcome,
                    ),
                  ],

                  // Align(
                  //   alignment: AlignmentDirectional.topStart,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 20.0),
                  //     child: CustomAutoSizeTextMontserrat(
                  //       text: "Specification",

                  //       // fontWeight: FontWeight.bold,,
                  //       fontWeight: FontWeight.w500,
                  //       // fontWeight: FontWeight.bold,,
                  //       fontSize: 16,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  // CustomDropDownSingle(
                  //   model: getDropdownModel(
                  //       _.loadingCourseBoardField.value,
                  //       _.selectCourseBoardFieldName,
                  //       _.courseBoardList),
                  //   initialSelectedValue: getSelectedDropDown(
                  //       _.loadingCourseBoardField.value,
                  //       _.selectCourseBoardFieldName,
                  //       _.courseBoardList),
                  //   choosefieldtype: false,
                  //   callbackFunction: callbackCourseBroadField,
                  // ),
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
                                      elevation:
                                          MaterialStateProperty.all<double>(0),
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
                                              side: BorderSide(
                                                  color: ThemeConstants.TextColor)))),
                                  onPressed: () {
                                    Get.delete<CourseSearchController>();
                                    Get.back();
                                    Get.to(const CourseSearch2());

                                    // controller.clearAll();
                                  },
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Clear",
                                    textColor: ThemeConstants.TextColor,
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
                                    primary:
                                        ThemeConstants.bluecolor, // background
                                    onPrimary:
                                        ThemeConstants.bluecolor, // foreground
                                  ),
                                  onPressed: () async {
                                    if (controller.selectedCountry.id == null) {
                                      getToast(
                                          SnackBarConstants.courseSearchPart1!);
                                    } else if (controller.courseLevelSelector ==
                                        200) {
                                      getToast(
                                          SnackBarConstants.courseSearchPart6!);
                                    } else if ((controller.selectedCountry.id ==
                                                9998 ||
                                            controller.selectedCountry.id ==
                                                9999) &&
                                        controller
                                                .selectedCountryCodeFromContinent ==
                                            null) {
                                      getToast(
                                          SnackBarConstants.courseSearchPart1!);
                                    } else if (controller.courseSearchType ==
                                            1 &&
                                        controller.selectedIndustryName ==
                                            'Select Profession') {
                                      getToast(
                                          SnackBarConstants.courseSearchPart4!);
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder:
                                                  (context) => CourseSearchList(
                                                        showJobIndustry:
                                                            controller.courseSearchType ==
                                                                    0
                                                                ? false
                                                                : true,
                                                        profession: controller
                                                            .selectedIndustryCode,
                                                        career_outcome: controller
                                                            .selectedcareerOutcomeDropDownID,
                                                        filterRedirect: false,
                                                        stateCode: controller
                                                                    .selectStateCode ==
                                                                null
                                                            ? ""
                                                            : controller
                                                                .selectStateCode
                                                                .toString(),
                                                        cityCode: controller
                                                                    .selectCityCode ==
                                                                null
                                                            ? ""
                                                            : controller
                                                                .selectCityCode
                                                                .toString(),
                                                        boardFieldCode: controller
                                                                    .selectCourseBoardFieldCode ==
                                                                null
                                                            ? ""
                                                            : controller
                                                                .selectCourseBoardFieldCode
                                                                .toString(),
                                                        countryId: controller
                                                                    .selectedCountry
                                                                    .id ==
                                                                null
                                                            ? ""
                                                            : controller
                                                                .selectedCountry
                                                                .id
                                                                .toString(),
                                                        narrowField: controller
                                                                    .selectCourseNarrowFieldCode ==
                                                                null
                                                            ? ""
                                                            : controller
                                                                .selectCourseNarrowFieldCode
                                                                .toString(),
                                                        courseLevel: controller
                                                                    .courseLevelSelector ==
                                                                null
                                                            ? ""
                                                            : controller
                                                                .courseLevelSelector
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
                                      //            : _.selectCourseBoardFieldCode
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
                                    textColor: ThemeConstants.whitecolor,
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
          )),
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
    for (var i = 0; i < controller.countryFromContientId.length; i++) {
      if (i == 0) {
        controller.selectedCountryNameFromContinent = null;
        controller.selectedCountryCodeFromContinent = null;
      } else {
        if (controller.countryFromContientName[i] == data) {
          controller.selectedCountryNameFromContinent = data;
          controller.selectedCountryCodeFromContinent =
              controller.countryFromContientId[i];

          // controller.selectedCountry.id =
          //     int.parse(controller.countryFromContientId[i]);
          // controller.getState(controller.selectCountryCode!);
        }
      }
    }
    controller
        .getState(int.parse(controller.selectedCountryCodeFromContinent!));
    controller.getUniversityDropDownData();
    controller.update();
  }

  callbackUniversitySelected(data) {
    for (var i = 0; i < controller.universityListName.length; i++) {
      if (i == 0) {
        controller.selectedUniversityName = null;
        controller.selectedUniversityID = null;
      } else {
        if (controller.universityListName[i] == data) {
          controller.selectedUniversityName = data;
          controller.selectedUniversityID = controller.universityListID[i];
        }
      }
    }
    // controller.getUniversityDropDownData();
    controller.update();
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
        }
      }
    }
    controller.getUniversityDropDownData();
    controller.update();
  }

  callbackCity(data) {
    for (var i = 0; i < controller.cityList.length; i++) {
      if (i == 0) {
        controller.selectCityName = null;
        controller.selectCityCode = null;
      } else {
        if (controller.cityList[i] == data) {
          controller.selectCityName = data;
          controller.selectCityCode = controller.cityCode[i];
        }
      }
    }
    controller.getUniversityDropDownData();
    controller.update();
  }

  callbackCourseLevel(data) {
    for (var i = 0; i < controller.courseLevelList.length; i++) {
      if (controller.courseLevelList[i] == data) {
        controller.selectCourseLevelName = data;
        controller.selectCourseLevelCode = controller.courseLevelCode[i];
        controller.courseLevelSelector = controller.courseLevelCode[i];
      }
    }
    controller.update();
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
        }
      }
    }
    controller.update();
  }

  callbackCoursenarrowField(data) {
    for (var i = 0; i < controller.courseNarrowList.length; i++) {
      if (i == 0) {
        controller.selectCourseNarrowFieldName = null;
        controller.selectCourseNarrowFieldCode = null;
      } else {
        if (controller.courseNarrowList[i] == data) {
          controller.selectCourseNarrowFieldName = data;
          controller.selectCourseNarrowFieldCode =
              controller.courseNarrowCode[i];
        }
      }
    }
    controller.update();
  }

  callbackIndustry(data) {
    for (var i = 0; i < controller.industriesList.length; i++) {
      if (i == 0) {
        controller.selectedIndustryName = null;
        controller.selectedIndustryCode = null;
      } else {
        if (controller.industriesList[i] == data) {
          controller.selectedIndustryName = data;
          controller.selectedIndustryCode = controller.industriesCode[i];

          controller.getCareerOutComes();
        }
      }
    }
    controller.update();
  }

  callbackCareerOutcome(data) {
    for (var i = 0; i < controller.careerOutcomeDropDownName.length; i++) {
      if (i == 0) {
        controller.selectedcareerOutcomeDropDownName = null;
        controller.selectedcareerOutcomeDropDownID = null;
      } else {
        if (controller.careerOutcomeDropDownName[i] == data) {
          controller.selectedcareerOutcomeDropDownName = data;
          controller.selectedcareerOutcomeDropDownID =
              controller.careerOutcomeDropDownId[i].toString();
        }
      }
    }
    controller.update();
  }
}
