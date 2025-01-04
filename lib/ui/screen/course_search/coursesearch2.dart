// ignore_for_file: deprecated_member_use
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
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

import '../../../widgets/TopSnackBar/top_snack_bar.dart';
import '../../../widgets/drawerfilter.dart';
import '../dashboard.dart';
import '../mark_attendance/qrCodeScreen.dart';

enum BestTutorSite { Ascending, Deascending }

class CourseSearch2 extends StatefulWidget {
  const CourseSearch2({Key? key}) : super(key: key);
  static const routeNamed = '/CourseSearch2';

  @override
  State<CourseSearch2> createState() => _CourseSearch2State();
}

class _CourseSearch2State extends State<CourseSearch2> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async{
        return Get.offAllNamed(DashBoard.routeNamed);
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar:  AppBar(
          elevation: 2.5,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Image.network(
              "https://sieceducation.in/assets/assets/images/logo.png",
              width: 130,
              height: 30,
            ),
          ),
          automaticallyImplyLeading: true,
          iconTheme:
          IconThemeData(color: ThemeConstants.blackcolor),
          actions: [
            // if (displayMobileLayout == true)
            //   IconButton(
            //     icon: const Icon(Icons.arrow_back,
            //         color: Colors.black),
            //     onPressed: () => Get.back(),
            //   ),
            // if (displayMobileLayout == false)
            //   Padding(
            //     padding: const EdgeInsets.only(left: 10),
            //     child:  IconButton(
            //       // icon: Image.asset("assets/images/gradlynk lense.png"),
            //       icon: const Icon(Icons.menu, color: Colors.black,),
            //       // icon: const Icon(Icons.menu,color: Colors.black,),
            //       onPressed: () {
            //         // Get.find<BaseController>().profileDataValidator();
            //         _scaffoldKey.currentState!.openDrawer();
            //
            //         DrawerFilter();
            //       },
            //     ),
            //   ),
            // // svgImage("work", Colors.transparent, 32, 32),
            // const Spacer(),
            // Padding(
            //   padding: const EdgeInsets.only(top: 10),
            //   child: Image.network(
            //     "https://sieceducation.in/assets/assets/images/logo.png",
            //     width: 130,
            //     height: 30,
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 10),
            //   child: Row(
            //     children: [
            //     Text("Hi, ", style: GoogleFonts.abhayaLibre(textStyle: const TextStyle(
            //                         fontSize: 24,
            //                         fontWeight: FontWeight.w700,
            //                         color: Colors.black,
            //                       ),)),
            //       Text(
            //             style: GoogleFonts.abhayaLibre(textStyle: const TextStyle(
            //               fontSize: 24,
            //               fontWeight: FontWeight.w700,
            //               color: Colors.black,
            //             ),),
            //           "${firstLetterChaptial(controller.personalModal.enquiryName) ?? firstLetterChaptial(controller.model1.enquiryName)}"
            //         ),
            //     ],
            //   ),
            // ),
            // const Spacer(),
            if (Get.find<BaseController>()
                .meetingZoneStatus
                .qrCodeGenerated ==
                true)
              IconButton(
                icon: svgImage(
                    "qr code", ThemeConstants.IconColor, 25, 25),
                onPressed: () {
                  showAnimatedDialog(
                      animationType: DialogTransitionType.slideFromBottomFade,
                      curve: Curves.easeInOutQuart,
                      context: context,
                      builder: (_) => QRScreen(
                          Url: Get.find<BaseController>()
                              .meetingZoneStatus
                              .qrCodeView!,
                          code: Get.find<BaseController>()
                              .meetingZoneStatus
                              .student_code!));
                },
              ),

            // IconButton(
            //   icon: SvgPicture.asset(
            //     "assets/icons/profile.svg",
            //     height: 30,
            //     color: const Color.fromARGB(255, 99, 99, 99),
            //   ),
            //   onPressed: () {
            //     Get.toNamed(ProfilePage.routeNamed);
            //   },
            // ),

            const SizedBox(
              width: 5,
            )
          ],
          // title: Text(
          //   title,
          //   style: const TextStyle(color: Colors.black),
          // ),
          backgroundColor: Colors.white,
        ),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                      child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 20),
                          //   child: SizedBox(
                          //     width: width,
                          //     child: Row(
                          //       children: [
                          //         Padding(
                          //           padding: const EdgeInsets.only(right: 10),
                          //           child: SizedBox(
                          //             width: 100,
                          //             child: ElevatedButton(
                          //                 style: ButtonStyle(
                          //                     elevation:
                          //                     MaterialStateProperty.all<double>(0),
                          //                     foregroundColor:
                          //                     MaterialStateProperty.all<Color>(
                          //                         Colors.white),
                          //                     backgroundColor:
                          //                     MaterialStateProperty.all<Color>(
                          //                         Colors.white),
                          //                     shape: MaterialStateProperty.all<
                          //                         RoundedRectangleBorder>(
                          //                         RoundedRectangleBorder(
                          //                             borderRadius:
                          //                             BorderRadius.circular(5.0),
                          //                             side: BorderSide(
                          //                                 color: ThemeConstants.TextColor)))),
                          //                 onPressed: () {
                          //                   Get.delete<CourseSearchController>();
                          //                   Get.back();
                          //                   Get.to(const CourseSearch2());
                          //
                          //                   // controller.clearAll();
                          //                 },
                          //                 child: CustomAutoSizeTextMontserrat(
                          //                   text: "Clear",
                          //                   textColor: ThemeConstants.TextColor,
                          //                 )),
                          //           ),
                          //         ),
                          //         Padding(
                          //           padding: const EdgeInsets.only(right: 20),
                          //           child: SizedBox(
                          //             width: 100,
                          //             child: ElevatedButton(
                          //                 style: ElevatedButton.styleFrom(
                          //                   elevation: 0.0,
                          //                   primary:
                          //                   ThemeConstants.bluecolor, // background
                          //                   onPrimary:
                          //                   ThemeConstants.bluecolor, // foreground
                          //                 ),
                          //                 onPressed: () async {
                          //                   if (controller.selectedCountry.id == null) {
                          //                     showTopSnackBar(
                          //                       context,
                          //                       CustomSnackBar.info(message: SnackBarConstants.courseSearchPart1!),
                          //                       showOutAnimationDuration: const Duration(milliseconds: 800),
                          //                       hideOutAnimationDuration: const Duration(milliseconds: 800),
                          //                       displayDuration: const Duration(milliseconds: 1500),
                          //                     );
                          //                     // getToast(
                          //                     //     SnackBarConstants.courseSearchPart1!);
                          //                   } else if (controller.courseLevelSelector ==
                          //                       200) {
                          //                     showTopSnackBar(
                          //                       context,
                          //                       CustomSnackBar.info(message: SnackBarConstants.courseSearchPart6!),
                          //                       showOutAnimationDuration: const Duration(milliseconds: 800),
                          //                       hideOutAnimationDuration: const Duration(milliseconds: 800),
                          //                       displayDuration: const Duration(milliseconds: 1500),
                          //                     );
                          //                     // getToast(
                          //                     //     SnackBarConstants.courseSearchPart6!);
                          //                   } else if ((controller.selectedCountry.id ==
                          //                       9998 ||
                          //                       controller.selectedCountry.id ==
                          //                           9999) &&
                          //                       controller
                          //                           .selectedCountryCodeFromContinent ==
                          //                           null) {
                          //                     showTopSnackBar(
                          //                       context,
                          //                       CustomSnackBar.info(message: SnackBarConstants.courseSearchPart1!),
                          //                       showOutAnimationDuration: const Duration(milliseconds: 800),
                          //                       hideOutAnimationDuration: const Duration(milliseconds: 800),
                          //                       displayDuration: const Duration(milliseconds: 1500),
                          //                     );
                          //                     // getToast(
                          //                     //     SnackBarConstants.courseSearchPart1!);
                          //                   } else if (controller.courseSearchType ==
                          //                       1 &&
                          //                       controller.selectedIndustryName ==
                          //                           'Select Profession') {
                          //                     showTopSnackBar(
                          //                       context,
                          //                       CustomSnackBar.info(message: SnackBarConstants.courseSearchPart4!),
                          //                       showOutAnimationDuration: const Duration(milliseconds: 800),
                          //                       hideOutAnimationDuration: const Duration(milliseconds: 800),
                          //                       displayDuration: const Duration(milliseconds: 1500),
                          //                     );
                          //                     // getToast(
                          //                     //     SnackBarConstants.courseSearchPart4!);
                          //                   } else {
                          //                     Navigator.push(
                          //                         context,
                          //                         MaterialPageRoute(
                          //                             builder:
                          //                                 (context) => CourseSearchList(
                          //                               university_code: controller
                          //                                   .selectedUniversityID ==
                          //                                   null
                          //                                   ? ""
                          //                                   : controller
                          //                                   .selectedUniversityID,
                          //                               showJobIndustry:
                          //                               controller.courseSearchType ==
                          //                                   0
                          //                                   ? false
                          //                                   : true,
                          //                               profession: controller
                          //                                   .selectedIndustryCode,
                          //                               career_outcome: controller
                          //                                   .selectedcareerOutcomeDropDownID,
                          //                               filterRedirect: false,
                          //                               stateCode: controller
                          //                                   .selectStateCode ==
                          //                                   null
                          //                                   ? ""
                          //                                   : controller
                          //                                   .selectStateCode
                          //                                   .toString(),
                          //                               cityCode: controller
                          //                                   .selectCityCode ==
                          //                                   null
                          //                                   ? ""
                          //                                   : controller
                          //                                   .selectCityCode
                          //                                   .toString(),
                          //                               boardFieldCode: controller
                          //                                   .selectCourseBoardFieldCode ==
                          //                                   null
                          //                                   ? ""
                          //                                   : controller
                          //                                   .selectCourseBoardFieldCode
                          //                                   .toString(),
                          //                               countryId: controller
                          //                                   .selectedCountry
                          //                                   .id ==
                          //                                   null
                          //                                   ? ""
                          //                                   : controller.selectedCountry.id ==
                          //                                   9998 ||
                          //                                   controller
                          //                                       .selectedCountry
                          //                                       .id ==
                          //                                       9999
                          //                                   ? controller
                          //                                   .selectedCountryCodeFromContinent
                          //                                   .toString()
                          //                                   : controller
                          //                                   .selectedCountry
                          //                                   .id
                          //                                   .toString(),
                          //                               narrowField: controller
                          //                                   .selectCourseNarrowFieldCode ==
                          //                                   null
                          //                                   ? ""
                          //                                   : controller
                          //                                   .selectCourseNarrowFieldCode
                          //                                   .toString(),
                          //                               courseLevel: controller
                          //                                   .courseLevelSelector ==
                          //                                   null
                          //                                   ? ""
                          //                                   : controller
                          //                                   .courseLevelSelector
                          //                                   .toString(),
                          //                               enq_id: Get.find<
                          //                                   BaseController>()
                          //                                   .model1
                          //                                   .id
                          //                                   .toString(),
                          //                             )));
                          //                     // Get.to(CourseSearchList(
                          //                     //   filterRedirect: false,
                          //                     //   stateCode:
                          //                     //       _.selectStateCode == null
                          //                     //           ? ""
                          //                     //           : _.selectStateCode
                          //                     //               .toString(),
                          //                     //   cityCode:
                          //                     //       _.selectCityCode == null
                          //                     //           ? ""
                          //                     //           : _.selectCityCode
                          //                     //               .toString(),
                          //                     //   boardFieldCode:
                          //                     //       _.selectCourseBoardFieldCode ==
                          //                     //               null
                          //                     //           ? ""
                          //                     //            : _.selectCourseBoardFieldCode
                          //                     //               .toString(),
                          //                     //   countryId:
                          //                     //       _.selectCountryCode ==
                          //                     //               null
                          //                     //           ? ""
                          //                     //           : _.selectCountryCode
                          //                     //               .toString(),
                          //                     //   narrowField:
                          //                     //       _.selectCourseNarrowFieldCode ==
                          //                     //               null
                          //                     //           ? ""
                          //                     //           : _.selectCourseNarrowFieldCode
                          //                     //               .toString(),
                          //                     //   courseLevel:
                          //                     //       _.selectCourseLevelCode ==
                          //                     //               null
                          //                     //           ? ""
                          //                     //           : _.selectCourseLevelCode
                          //                     //               .toString(),
                          //                     //   enq_id:
                          //                     //       Get.find<BaseController>()
                          //                     //           .model1
                          //                     //           .id
                          //                     //           .toString(),
                          //                     // ));
                          //                   }
                          //                 },
                          //                 child: CustomAutoSizeTextMontserrat(
                          //                   text: "Search",
                          //                   textColor: ThemeConstants.whitecolor,
                          //                 )),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: SizedBox(
                              width: width/2.5,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: ThemeConstants.bluecolor, backgroundColor: ThemeConstants.bluecolor, elevation: 0.0, // foreground
                                  ),
                                  onPressed: () async {
                                    if (controller.selectedCountry.id == null) {
                                      showTopSnackBar(
                                        context,
                                        CustomSnackBar.info(message: SnackBarConstants.courseSearchPart1!),
                                        showOutAnimationDuration: const Duration(milliseconds: 800),
                                        hideOutAnimationDuration: const Duration(milliseconds: 800),
                                        displayDuration: const Duration(milliseconds: 1500),
                                      );
                                      // getToast(
                                      //     SnackBarConstants.courseSearchPart1!);
                                    } else if (controller.courseLevelSelector ==
                                        200) {
                                      showTopSnackBar(
                                        context,
                                        CustomSnackBar.info(message: SnackBarConstants.courseSearchPart6!),
                                        showOutAnimationDuration: const Duration(milliseconds: 800),
                                        hideOutAnimationDuration: const Duration(milliseconds: 800),
                                        displayDuration: const Duration(milliseconds: 1500),
                                      );
                                      // getToast(
                                      //     SnackBarConstants.courseSearchPart6!);
                                    } else if ((controller.selectedCountry.id ==
                                        9998 ||
                                        controller.selectedCountry.id ==
                                            9999) &&
                                        controller
                                            .selectedCountryCodeFromContinent ==
                                            null) {
                                      showTopSnackBar(
                                        context,
                                        CustomSnackBar.info(message: SnackBarConstants.courseSearchPart1!),
                                        showOutAnimationDuration: const Duration(milliseconds: 800),
                                        hideOutAnimationDuration: const Duration(milliseconds: 800),
                                        displayDuration: const Duration(milliseconds: 1500),
                                      );
                                      // getToast(
                                      //     SnackBarConstants.courseSearchPart1!);
                                    } else if (controller.courseSearchType ==
                                        1 &&
                                        controller.selectedIndustryName ==
                                            'Select Profession') {
                                      showTopSnackBar(
                                        context,
                                        CustomSnackBar.info(message: SnackBarConstants.courseSearchPart4!),
                                        showOutAnimationDuration: const Duration(milliseconds: 800),
                                        hideOutAnimationDuration: const Duration(milliseconds: 800),
                                        displayDuration: const Duration(milliseconds: 1500),
                                      );
                                      // getToast(
                                      //     SnackBarConstants.courseSearchPart4!);
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder:
                                                  (context) => CourseSearchList(
                                                university_code: controller
                                                    .selectedUniversityID ?? "",
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
                                                    : controller.selectedCountry.id ==
                                                    9998 ||
                                                    controller
                                                        .selectedCountry
                                                        .id ==
                                                        9999
                                                    ? controller
                                                    .selectedCountryCodeFromContinent
                                                    .toString()
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
                                                    .courseLevelSelector == null
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
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.search, color: CupertinoColors.white, size: 15,),
                                      const SizedBox(width: 5,),
                                      CustomAutoSizeTextMontserrat(
                                        text: "Search",
                                        textColor: ThemeConstants.whitecolor,
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: SizedBox(
                              width: width/2.5,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      elevation:
                                      MaterialStateProperty.all<double>(0),
                                      foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          ThemeConstants.lightblueColor2),
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
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.clear, color: Colors.black,size: 18,),
                                      const SizedBox(width: 8,),
                                      CustomAutoSizeTextMontserrat(
                                        text: "Clear all",
                                        textColor: ThemeConstants.TextColor,
                                      ),
                                    ],
                                  )),
                            ),
                          ),

                          // Container(
                          //   height: 36,
                          //   width: 100,
                          //   decoration: BoxDecoration(
                          //       color: ThemeConstants.lightorangeColor,
                          //       border: Border.all(
                          //         color: ThemeConstants.orangeColor,
                          //       ),
                          //       borderRadius:
                          //       BorderRadiusDirectional.circular(
                          //           5.0)),
                          //   child: Center(
                          //     child: Padding(
                          //       padding: const EdgeInsets.only(
                          //           left: 10, right: 10),
                          //       child: Row(
                          //         children: [
                          //           svgImage(
                          //               "filter", ThemeConstants.orangeColor, 14, 14),
                          //           const SizedBox(width: 5,),
                          //           CustomAutoSizeTextMontserrat(
                          //               text: "Filter",
                          //               fontSize: 14,
                          //               fontWeight: FontWeight.w600,
                          //               textColor:
                          //               ThemeConstants.orangeColor),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
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
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      height: 130,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
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
                                      const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                  width: 140,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: ThemeConstants.bluecolor.withOpacity(0.2),
                                          spreadRadius: -2.5,
                                          blurRadius: 3,
                                          offset: const Offset(0, 5.5),
                                        )
                                      ],
                                      color: controller.selectedCountry.id ==
                                              controller
                                                  .countryWithFlagDataList[index]
                                                  .id
                                          ? ThemeConstants.lightblueColor2
                                          : ThemeConstants.whitecolor,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          width: 0.3,
                                          color: ThemeConstants.lightgreycolor)
                                  ),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
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
                                          style:  TextStyle(
                                            // color: controller.selectedCountry.id ==
                                            //     controller
                                            //         .countryWithFlagDataList[index]
                                            //         .id ? ThemeConstants.bluecolor:ThemeConstants.blackcolor,
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
                            fontWeight: FontWeight.w600,
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
                        selectedValue:
                            controller.selectedCountryNameFromContinent,
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
                                  fontWeight: FontWeight.w600,
                                  // fontWeight: FontWeight.bold,,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: CustomDropDownSingle(
                                selectedValue: controller.selectStateName,
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
                                  fontWeight: FontWeight.w600,
                                  // fontWeight: FontWeight.bold,,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: CustomDropDownSingle(
                                selectedValue: controller.selectCityName,
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
                          fontWeight: FontWeight.w600,
                          // fontWeight: FontWeight.bold,,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: CustomDropDownSingle(
                        selectedValue: controller.selectedUniversityName,
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
                                verticalPadding: 10,
                                horizontelPadding: 16,
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
                                verticalPadding: 10,
                                horizontelPadding: 16,
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
                      height: 25,
                    ),

                    if (controller.courseSearchType == 0) ...[
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: CustomAutoSizeTextMontserrat(
                            text: "Course Level",
                            mandatory: true,
                            fontWeight: FontWeight.w600,
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
                                  controller.selectCourseLevelName =
                                      'Kindly select';
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
                              text: "Other Course level",

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
                          selectedValue: controller.selectCourseLevelName,
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
                            fontWeight: FontWeight.w600,
                            // fontWeight: FontWeight.bold,,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 3),
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        height: 130,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
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
                                        horizontal: 10, vertical: 10),
                                    width: 140,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: ThemeConstants.bluecolor.withOpacity(0.2),
                                            spreadRadius: -2.5,
                                            blurRadius: 3,
                                            offset: const Offset(0, 5.5),
                                          )
                                        ],
                                        color: controller
                                                    .selectCourseBoardFieldCode ==
                                                controller
                                                    .AllCourseSearchBroadField[
                                                        index]
                                                    .id
                                            ? ThemeConstants.lightblueColor2
                                            : ThemeConstants.whitecolor,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            width: 1,
                                            color: ThemeConstants.lightgreycolor)),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
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
                            fontWeight: FontWeight.w600,
                            //       // fontWeight: FontWeight.bold,,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomDropDownSingle(
                        selectedValue: controller.selectCourseNarrowFieldName,
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
                        height:25,
                      ),
                    ] else ...[
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: CustomAutoSizeTextMontserrat(
                            text: "Select Profession",
                            // fontWeight: FontWeight.bold,,
                            fontWeight: FontWeight.w600,
                            //       // fontWeight: FontWeight.bold,,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomDropDownSingle(
                        selectedValue: controller.selectedIndustryName,
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
                            fontWeight: FontWeight.w600,
                            //       // fontWeight: FontWeight.bold,,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomDropDownSingle(
                        selectedValue:
                            controller.selectedcareerOutcomeDropDownName,
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

                    // buttons are from here!!
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 20),
                    //   child: SizedBox(
                    //     width: width,
                    //     child: Row(
                    //       children: [
                    //         const Spacer(),
                    //         Padding(
                    //           padding: const EdgeInsets.only(right: 10),
                    //           child: SizedBox(
                    //             width: 100,
                    //             child: ElevatedButton(
                    //                 style: ButtonStyle(
                    //                     elevation:
                    //                         MaterialStateProperty.all<double>(0),
                    //                     foregroundColor:
                    //                         MaterialStateProperty.all<Color>(
                    //                             Colors.white),
                    //                     backgroundColor:
                    //                         MaterialStateProperty.all<Color>(
                    //                             Colors.white),
                    //                     shape: MaterialStateProperty.all<
                    //                             RoundedRectangleBorder>(
                    //                         RoundedRectangleBorder(
                    //                             borderRadius:
                    //                                 BorderRadius.circular(5.0),
                    //                             side: BorderSide(
                    //                                 color: ThemeConstants.TextColor)))),
                    //                 onPressed: () {
                    //                   Get.delete<CourseSearchController>();
                    //                   Get.back();
                    //                   Get.to(const CourseSearch2());
                    //
                    //                   // controller.clearAll();
                    //                 },
                    //                 child: CustomAutoSizeTextMontserrat(
                    //                   text: "Clear",
                    //                   textColor: ThemeConstants.TextColor,
                    //                 )),
                    //           ),
                    //         ),
                    //         Padding(
                    //           padding: const EdgeInsets.only(right: 20),
                    //           child: SizedBox(
                    //             width: 100,
                    //             child: ElevatedButton(
                    //                 style: ElevatedButton.styleFrom(
                    //                   elevation: 0.0,
                    //                   primary:
                    //                       ThemeConstants.bluecolor, // background
                    //                   onPrimary:
                    //                       ThemeConstants.bluecolor, // foreground
                    //                 ),
                    //                 onPressed: () async {
                    //                   if (controller.selectedCountry.id == null) {
                    //                     showTopSnackBar(
                    //                       context,
                    //                       CustomSnackBar.info(message: SnackBarConstants.courseSearchPart1!),
                    //                       showOutAnimationDuration: const Duration(milliseconds: 800),
                    //                       hideOutAnimationDuration: const Duration(milliseconds: 800),
                    //                       displayDuration: const Duration(milliseconds: 1500),
                    //                     );
                    //                     // getToast(
                    //                     //     SnackBarConstants.courseSearchPart1!);
                    //                   } else if (controller.courseLevelSelector ==
                    //                       200) {
                    //                     showTopSnackBar(
                    //                       context,
                    //                       CustomSnackBar.info(message: SnackBarConstants.courseSearchPart6!),
                    //                       showOutAnimationDuration: const Duration(milliseconds: 800),
                    //                       hideOutAnimationDuration: const Duration(milliseconds: 800),
                    //                       displayDuration: const Duration(milliseconds: 1500),
                    //                     );
                    //                     // getToast(
                    //                     //     SnackBarConstants.courseSearchPart6!);
                    //                   } else if ((controller.selectedCountry.id ==
                    //                               9998 ||
                    //                           controller.selectedCountry.id ==
                    //                               9999) &&
                    //                       controller
                    //                               .selectedCountryCodeFromContinent ==
                    //                           null) {
                    //                     showTopSnackBar(
                    //                       context,
                    //                       CustomSnackBar.info(message: SnackBarConstants.courseSearchPart1!),
                    //                       showOutAnimationDuration: const Duration(milliseconds: 800),
                    //                       hideOutAnimationDuration: const Duration(milliseconds: 800),
                    //                       displayDuration: const Duration(milliseconds: 1500),
                    //                     );
                    //                     // getToast(
                    //                     //     SnackBarConstants.courseSearchPart1!);
                    //                   } else if (controller.courseSearchType ==
                    //                           1 &&
                    //                       controller.selectedIndustryName ==
                    //                           'Select Profession') {
                    //                     showTopSnackBar(
                    //                       context,
                    //                       CustomSnackBar.info(message: SnackBarConstants.courseSearchPart4!),
                    //                       showOutAnimationDuration: const Duration(milliseconds: 800),
                    //                       hideOutAnimationDuration: const Duration(milliseconds: 800),
                    //                       displayDuration: const Duration(milliseconds: 1500),
                    //                     );
                    //                     // getToast(
                    //                     //     SnackBarConstants.courseSearchPart4!);
                    //                   } else {
                    //                     Navigator.push(
                    //                         context,
                    //                         MaterialPageRoute(
                    //                             builder:
                    //                                 (context) => CourseSearchList(
                    //                                       university_code: controller
                    //                                                   .selectedUniversityID ==
                    //                                               null
                    //                                           ? ""
                    //                                           : controller
                    //                                               .selectedUniversityID,
                    //                                       showJobIndustry:
                    //                                           controller.courseSearchType ==
                    //                                                   0
                    //                                               ? false
                    //                                               : true,
                    //                                       profession: controller
                    //                                           .selectedIndustryCode,
                    //                                       career_outcome: controller
                    //                                           .selectedcareerOutcomeDropDownID,
                    //                                       filterRedirect: false,
                    //                                       stateCode: controller
                    //                                                   .selectStateCode ==
                    //                                               null
                    //                                           ? ""
                    //                                           : controller
                    //                                               .selectStateCode
                    //                                               .toString(),
                    //                                       cityCode: controller
                    //                                                   .selectCityCode ==
                    //                                               null
                    //                                           ? ""
                    //                                           : controller
                    //                                               .selectCityCode
                    //                                               .toString(),
                    //                                       boardFieldCode: controller
                    //                                                   .selectCourseBoardFieldCode ==
                    //                                               null
                    //                                           ? ""
                    //                                           : controller
                    //                                               .selectCourseBoardFieldCode
                    //                                               .toString(),
                    //                                       countryId: controller
                    //                                                   .selectedCountry
                    //                                                   .id ==
                    //                                               null
                    //                                           ? ""
                    //                                           : controller.selectedCountry.id ==
                    //                                                       9998 ||
                    //                                                   controller
                    //                                                           .selectedCountry
                    //                                                           .id ==
                    //                                                       9999
                    //                                               ? controller
                    //                                                   .selectedCountryCodeFromContinent
                    //                                                   .toString()
                    //                                               : controller
                    //                                                   .selectedCountry
                    //                                                   .id
                    //                                                   .toString(),
                    //                                       narrowField: controller
                    //                                                   .selectCourseNarrowFieldCode ==
                    //                                               null
                    //                                           ? ""
                    //                                           : controller
                    //                                               .selectCourseNarrowFieldCode
                    //                                               .toString(),
                    //                                       courseLevel: controller
                    //                                                   .courseLevelSelector ==
                    //                                               null
                    //                                           ? ""
                    //                                           : controller
                    //                                               .courseLevelSelector
                    //                                               .toString(),
                    //                                       enq_id: Get.find<
                    //                                               BaseController>()
                    //                                           .model1
                    //                                           .id
                    //                                           .toString(),
                    //                                     )));
                    //                     // Get.to(CourseSearchList(
                    //                     //   filterRedirect: false,
                    //                     //   stateCode:
                    //                     //       _.selectStateCode == null
                    //                     //           ? ""
                    //                     //           : _.selectStateCode
                    //                     //               .toString(),
                    //                     //   cityCode:
                    //                     //       _.selectCityCode == null
                    //                     //           ? ""
                    //                     //           : _.selectCityCode
                    //                     //               .toString(),
                    //                     //   boardFieldCode:
                    //                     //       _.selectCourseBoardFieldCode ==
                    //                     //               null
                    //                     //           ? ""
                    //                     //            : _.selectCourseBoardFieldCode
                    //                     //               .toString(),
                    //                     //   countryId:
                    //                     //       _.selectCountryCode ==
                    //                     //               null
                    //                     //           ? ""
                    //                     //           : _.selectCountryCode
                    //                     //               .toString(),
                    //                     //   narrowField:
                    //                     //       _.selectCourseNarrowFieldCode ==
                    //                     //               null
                    //                     //           ? ""
                    //                     //           : _.selectCourseNarrowFieldCode
                    //                     //               .toString(),
                    //                     //   courseLevel:
                    //                     //       _.selectCourseLevelCode ==
                    //                     //               null
                    //                     //           ? ""
                    //                     //           : _.selectCourseLevelCode
                    //                     //               .toString(),
                    //                     //   enq_id:
                    //                     //       Get.find<BaseController>()
                    //                     //           .model1
                    //                     //           .id
                    //                     //           .toString(),
                    //                     // ));
                    //                   }
                    //                 },
                    //                 child: CustomAutoSizeTextMontserrat(
                    //                   text: "Search",
                    //                   textColor: ThemeConstants.whitecolor,
                    //                 )),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            )),
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
      // if (i == 0) {
      //   controller.selectedIndustryName = null;
      //   controller.selectedIndustryCode = null;
      // } else
      // {

      if (controller.industriesList[i] == data) {
        controller.selectedIndustryName = data;
        controller.selectedIndustryCode = controller.industriesCode[i];

        controller.getCareerOutComes();
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
