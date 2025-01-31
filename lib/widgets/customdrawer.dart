import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nice_loading_button/nice_loading_button.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:studentpanel/presentation/features/event_history/event_history_view.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/screen/Profile_module_2/profile_view.dart';
import 'package:studentpanel/ui/screen/My_Application/applicationsummary.dart';
import 'package:studentpanel/ui/screen/course_search/coursesearch2.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/ui/screen/course_search/finalshortlist.dart';
import 'package:studentpanel/ui/screen/course_search/reviewshortlist.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/custom_dialog_box.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

import '../BlocData/Bloc/field_bloc.dart';
import '../main.dart';

class CustomDrawer extends StatefulWidget {
  int? index;

  CustomDrawer({Key? key, this.index}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  // var controller = Get.put(DrawerGetXController());
  var controller = Get.find<BaseController>();
 @override
  void initState() {
   if(profileValidationModel==null) {
     bloc.getProfileValidation(bloc.baseController.model1.id);
   }
   if (profileDataModel == null) {
     bloc.getLoginData();
   }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    VersionUtil.fetchAppVersion();
    return Drawer(
      // elevation: 10,
      backgroundColor: Colors.white,
      // shadowColor: Color.fromARGB(255, 0, 0, 0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(35), bottomRight: Radius.circular(35))),

      width: 240,
      child: SingleChildScrollView(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        // padding: EdgeInsets.symmetric(
        //     vertical: MediaQuery.of(context).size.height * 0.005),
        // decoration: BoxDecoration(
        //     color: ThemeConstants.blackcolor,
        //     borderRadius: BorderRadius.only(
        //         topRight: Radius.circular(200),
        //         bottomRight: Radius.circular(200))),
        child: SafeArea(
          child: controller.obx(
              (state) => SingleChildScrollView(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        ValueListenableBuilder(
                          valueListenable: bloc.loadingProfileValidation,
                          builder: (BuildContext context, bool value, Widget? child) { if(value == false &&
                              profileValidationModel != null){
                            return ValueListenableBuilder(
                              valueListenable: bloc.loginLoading,
                              builder: (BuildContext context, bool value1,
                                  Widget? _) {
                                if (value1 == false &&
                                    profileDataModel != null) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: ThemeConstants.lightblueColor,
                                      borderRadius: BorderRadius.circular(15),
                                      // border: Border.all(
                                      //     width: 0.5, color: ThemeConstants.bluecolor),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                          ThemeConstants.bluecolor.withOpacity(0.5),
                                          spreadRadius: -2.5,
                                          blurRadius: 5,
                                          offset: const Offset(0, 4.5),
                                        )
                                      ],
                                    ),
                                    width: double.infinity,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    padding: const EdgeInsets.all(10),
                                    height: 80,
                                    child: Row(children: [
                                      CircleAvatar(
                                        onBackgroundImageError: (exception, stackTrace) {
                                          print(exception);
                                          print(stackTrace.toString());
                                        },
                                        // onForegroundImageError: (exception, stackTrace) {
                                        //   print(exception);
                                        //   print(stackTrace.toString());
                                        // },
                                        radius: 20.0,
                                        backgroundImage: const NetworkImage(
                                            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                                        backgroundColor: Colors.transparent,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      if (controller.loadinValidatorDataForDashboard ==
                                          false) ...[
                                        SizedBox(
                                          height: 200,
                                          child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("Hi, ",
                                                        maxLines: 2,
                                                        style: GoogleFonts.lato(
                                                          textStyle: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                            color: Color(0xff414040),
                                                          ),
                                                        )),
                                                    Text(
                                                        "${firstLetterChaptial(profileDataModel?.enquiryName)}",
                                                        maxLines: 2,
                                                        style: GoogleFonts.lato(
                                                          textStyle: const TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.w500,
                                                            color: Color(0xff414040),
                                                          ),
                                                        )),
                                                  ],
                                                ),

                                                // CustomAutoSizeTextMontserrat(
                                                //   text:
                                                //       "Hi, ${firstLetterChaptial(Get.find<BaseController>().model1.enquiryName)}",
                                                //   fontSize: 14,
                                                //   fontWeight: FontWeight.w500,
                                                // ),
                                                const SizedBox(
                                                  height: 2.5,
                                                ),
                                                const SizedBox(
                                                  height: 2.5,
                                                ),
                                                Stack(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: ThemeConstants
                                                              .lightgreycolor,
                                                          borderRadius:
                                                          BorderRadius.circular(20)),
                                                      width: 120,
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: const Color.fromARGB(
                                                              255, 16, 32, 255),
                                                          borderRadius:
                                                          BorderRadius.circular(20)),
                                                      width: profileValidationModel!.totalPercentageComplete!.toDouble() *
                                                          1.2,
                                                      height: 5,
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    "${profileValidationModel?.totalPercentageComplete}% completed",
                                                    style: GoogleFonts.lato(
                                                      textStyle: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w500,
                                                          color:
                                                          ThemeConstants.TextColor),
                                                    ))
                                              ]),
                                        )
                                      ] else ...[
                                        const Spacer(),
                                        SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: CircularProgressIndicator(
                                            color: ThemeConstants.bluecolor,
                                          ),
                                        ),
                                        const Spacer(),
                                      ]
                                    ]),
                                  );
                                }
                                else {
                                  return getLoading(context,
                                      height: 140.0, width: 300.0);
                                }
                              }
                            );
                          }
                          else{
                            return getLoading(context,
                                height: 60.0, width: 300.0);
                          }
    },
                        ),

                        // Container(
                        //   margin: EdgeInsets.all(10),
                        //   padding: EdgeInsets.all(10),
                        //   width: double.infinity,
                        //   decoration: BoxDecoration(
                        //     color: ThemeConstants.lightblueColor,
                        //     borderRadius: BorderRadius.circular(10.0),
                        //     border: Border.all(
                        //         color: ThemeConstants.bluecolor, width: 1),
                        //   ),
                        //   child: Row(
                        //     children: [
                        //       CircleAvatar(
                        //         onBackgroundImageError: (exception, stackTrace) {
                        //           print(exception);
                        //           print(stackTrace.toString());
                        //         },
                        //         // onForegroundImageError: (exception, stackTrace) {
                        //         //   print(exception);
                        //         //   print(stackTrace.toString());
                        //         // },
                        //         radius: 30.0,
                        //         backgroundImage: const NetworkImage(
                        //             "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250"),
                        //         backgroundColor: Colors.transparent,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // Center(
                        //   child: CustomAutoSizeTextMontserrat(
                        //     text: firstLetterChaptial(
                        //         Get.find<BaseController>().model1.enquiryName),
                        //     fontSize: 18,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Container(
                        //   alignment: Alignment.center,
                        //   child: Stack(
                        //     children: [
                        //       Container(
                        //         decoration: BoxDecoration(
                        //             color: ThemeConstants.lightgreycolor,
                        //             borderRadius: BorderRadius.circular(20)),
                        //         width: 150,
                        //         height: 6,
                        //       ),
                        //       Container(
                        //         decoration: BoxDecoration(
                        //             color: ThemeConstants.GreenColor,
                        //             borderRadius: BorderRadius.circular(20)),
                        //         width: controller
                        //                 .data.value.totalPercentageComplete!
                        //                 .toDouble() *
                        //             1.5,
                        //         height: 4,
                        //       ),
                        //       Container(
                        //         decoration: BoxDecoration(
                        //             color: ThemeConstants.GreenColor,
                        //             borderRadius: BorderRadius.circular(20)),
                        //         width: controller
                        //                 .data.value.totalPercentageComplete!
                        //                 .toDouble() *
                        //             1.5,
                        //         height: 4,
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Center(
                        //   child: CustomAutoSizeTextMontserrat(
                        //     text:
                        //         "${controller.data.value.totalPercentageComplete}% Profile Completed",
                        //     fontSize: 5,
                        //   ),
                        // ),
                        // Center(
                        //     child: Container(
                        //   margin: const EdgeInsets.symmetric(vertical: 5),
                        //   width: 200,
                        //   height: 8,
                        //   child: ClipRRect(
                        //     borderRadius:
                        //         const BorderRadius.all(Radius.circular(10)),
                        //     child: LinearProgressIndicator(
                        //       value: 0.7,
                        //       valueColor:
                        //           AlwaysStoppedAnimation(ThemeConstants.GreenColor),
                        //       backgroundColor: const Color(0xffD6D6D6),
                        //     ),
                        //   ),
                        // )),

                        // Center(
                        //   child: CustomAutoSizeTextMontserrat(
                        //     text: "Profile: 70% complete",
                        //     fontSize: 14,
                        //     textColor: ThemeConstants.TextColor,
                        //     fontWeight: FontWeight.w500,
                        //   ),
                        // ),

                        SizedBox(
                          height: MediaQuery.sizeOf(context).height - 400,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: InkWell(
                                        highlightColor:
                                            ThemeConstants.whitecolor,
                                        onTap: () {
                                          Get.deleteAll();
                                          Get.toNamed(DashBoard.routeNamed);
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: [
                                              svgImage(
                                                  "Dashboard",
                                                  widget.index == 0
                                                      ? ThemeConstants.bluecolor
                                                      : ThemeConstants
                                                          .blackcolor,
                                                  20,
                                                  20),
                                              // SvgPicture.asset(
                                              //   'assets/icons/.svg',
                                              //   color:
                                              //   width: 20,
                                              // ),
                                              Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, top: 5),
                                                  child:
                                                      CustomAutoSizeTextMontserrat(
                                                    text: "My DashBoard",
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    textColor: widget.index == 0
                                                        ? ThemeConstants
                                                            .bluecolor
                                                        : ThemeConstants
                                                            .blackcolor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: InkWell(
                                        highlightColor:
                                            ThemeConstants.whitecolor,
                                        onTap: () {
                                          Get.deleteAll();
                                          Get.toNamed(ProfileView.routeNamed);
                                        },
                                        child: Row(
                                          children: [
                                            // svgImage('track', ThemeConstants.IconColor, 20, 20),
                                            svgImage(
                                                "Profile",
                                                widget.index == 1
                                                    ? ThemeConstants.bluecolor
                                                    : const Color.fromARGB(
                                                        255, 31, 31, 31),
                                                20,
                                                20),

// SvgPicture.asset(
//                                               'assets/icons/Profile.svg',
//                                               color: index == 1
//                                                   ? ThemeConstants.bluecolor
//                                                   : const Color.fromARGB(
//                                                       255, 31, 31, 31),
//                                               width: 20,
//                                             ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, top: 5),
                                                  child:
                                                      CustomAutoSizeTextMontserrat(
                                                    text: "Profile",
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    textColor: widget.index == 1
                                                        ? ThemeConstants
                                                            .bluecolor
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                if (Get.find<BaseController>()
                                        .meetingZoneStatus
                                        .trackApplication ==
                                    true)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Align(
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        child: InkWell(
                                          highlightColor:
                                              ThemeConstants.whitecolor,
                                          onTap: () {
                                            Get.deleteAll();
                                            Get.toNamed(
                                                ApplicationSummary.routeNamed);
                                          },
                                          child: Row(
                                            children: [
                                              svgImage(
                                                  "Track appli",
                                                  widget.index == 2
                                                      ? ThemeConstants.bluecolor
                                                      : const Color.fromARGB(
                                                          255, 31, 31, 31),
                                                  20,
                                                  20),
                                              // SvgPicture.asset(
                                              //   'assets/icons/Track appli.svg',
                                              //   color: index == 2
                                              //       ? ThemeConstants.bluecolor
                                              //       : const Color.fromARGB(
                                              //           255, 31, 31, 31),
                                              //   width: 20,
                                              // ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                child: Container(
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                      // color: index == 2
                                                      //     ? ThemeConstants.lightblueColor
                                                      //     : ThemeConstants.whitecolor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10, top: 5),
                                                    child:
                                                        CustomAutoSizeTextMontserrat(
                                                      text: "Track Application",
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      textColor: widget.index == 2
                                                          ? ThemeConstants
                                                              .bluecolor
                                                          : ThemeConstants
                                                              .blackcolor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                if (Get.find<BaseController>()
                                        .meetingZoneStatus
                                        .searchCourse ==
                                    true)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Align(
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        child: InkWell(
                                          highlightColor:
                                              ThemeConstants.whitecolor,
                                          onTap: () {
                                            Get.deleteAll();
                                            Get.toNamed(
                                                CourseSearch2.routeNamed);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Row(
                                              children: [
                                                svgImage(
                                                    "Course search",
                                                    widget.index == 3
                                                        ? ThemeConstants
                                                            .bluecolor
                                                        : const Color.fromARGB(
                                                            255, 31, 31, 31),
                                                    20,
                                                    20),
                                                // SvgPicture.asset(
                                                //   'assets/icons/Course search.svg',
                                                //   color: index == 3
                                                //       ? ThemeConstants.bluecolor
                                                //       : const Color.fromARGB(
                                                //           255, 31, 31, 31),
                                                //   width: 20,
                                                // ),
                                                Container(
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                      // color: index == 3
                                                      //     ? ThemeConstants.lightblueColor
                                                      //     : ThemeConstants.whitecolor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10, top: 5),
                                                    child:
                                                        CustomAutoSizeTextMontserrat(
                                                      text: "Search Course",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15,
                                                      textColor: widget.index == 3
                                                          ? ThemeConstants
                                                              .bluecolor
                                                          : ThemeConstants
                                                              .blackcolor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ),
                                if (Get.find<BaseController>()
                                        .meetingZoneStatus
                                        .searchCourse ==
                                    true)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Align(
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        child: InkWell(
                                          highlightColor:
                                              ThemeConstants.whitecolor,
                                          onTap: () {
                                            Get.deleteAll();
                                            Get.toNamed(
                                                ReviewShortList.routeNamed);
                                          },
                                          child: Row(
                                            children: [
                                              svgImage(
                                                  "Review Course",
                                                  widget.index == 4
                                                      ? ThemeConstants.bluecolor
                                                      : const Color.fromARGB(
                                                          255, 31, 31, 31),
                                                  20,
                                                  20),
                                              // SvgPicture.asset(
                                              //   'assets/icons/Review Course.svg',
                                              //   color: index == 4
                                              //       ? ThemeConstants.bluecolor
                                              //       : const Color.fromARGB(
                                              //           255, 31, 31, 31),
                                              //   width: 20,
                                              // ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                child: Container(
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                      // color: index == 4
                                                      //     ? ThemeConstants.lightblueColor
                                                      //     : ThemeConstants.whitecolor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10, top: 5),
                                                    child:
                                                        CustomAutoSizeTextMontserrat(
                                                      text: "Review Course",
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      textColor: widget.index == 4
                                                          ? ThemeConstants
                                                              .bluecolor
                                                          : ThemeConstants
                                                              .blackcolor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                if (Get.find<BaseController>()
                                        .meetingZoneStatus
                                        .searchCourse ==
                                    true)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Align(
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        child: InkWell(
                                          highlightColor:
                                              ThemeConstants.whitecolor,
                                          onTap: () {
                                            Get.deleteAll();
                                            Get.toNamed(
                                                FinalShortList.routeNamed);
                                          },
                                          child: Row(
                                            children: [
                                              svgImage(
                                                  "Shortlist",
                                                  widget.index == 5
                                                      ? ThemeConstants.bluecolor
                                                      : const Color.fromARGB(
                                                          255, 31, 31, 31),
                                                  20,
                                                  20),
                                              // SvgPicture.asset(
                                              //   'assets/icons/Shortlist.svg',
                                              //   color: index == 5
                                              //       ? ThemeConstants.bluecolor
                                              //       : const Color.fromARGB(
                                              //           255, 31, 31, 31),
                                              //   width: 20,
                                              // ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                child: Container(
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                      // color: index == 5
                                                      //     ? ThemeConstants.lightblueColor
                                                      //     : ThemeConstants.whitecolor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10, top: 5),
                                                    child:
                                                        CustomAutoSizeTextMontserrat(
                                                      text:
                                                          "Application Shortlist",
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      textColor: widget.index == 5
                                                          ? ThemeConstants
                                                              .bluecolor
                                                          : ThemeConstants
                                                              .blackcolor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: InkWell(
                                        highlightColor:
                                            ThemeConstants.whitecolor,
                                        onTap: () {
                                          Get.back();
                                          planYourFundDialog(context);
                                        },
                                        child: Row(
                                          children: [
                                            svgImage(
                                                "totalFees",
                                                widget.index == 7
                                                    ? ThemeConstants.bluecolor
                                                    : const Color.fromARGB(
                                                        255, 31, 31, 31),
                                                20,
                                                20),
                                            // SvgPicture.asset(
                                            //   'assets/icons/totalFees.svg',
                                            //   color: index == 7
                                            //       ? ThemeConstants.bluecolor
                                            //       : const Color.fromARGB(
                                            //           255, 31, 31, 31), index == 7
                                            //       ? ThemeConstants.bluecolor
                                            //       : const Color.fromARGB(
                                            //           255, 31, 31, 31),
                                            //   width: 20,
                                            // ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    // color: index == 5
                                                    //     ? ThemeConstants.lightblueColor
                                                    //     : ThemeConstants.whitecolor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, top: 5),
                                                  child:
                                                      CustomAutoSizeTextMontserrat(
                                                    text: "Plan your funds",
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    textColor: widget.index == 7
                                                        ? ThemeConstants
                                                            .bluecolor
                                                        : ThemeConstants
                                                            .blackcolor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                if (controller
                                            .meetingZoneStatus.markAttendance ==
                                        true ||
                                    controller.meetingZoneStatus.expressPass ==
                                        true ||
                                    controller.meetingZoneStatus
                                            .expressPassGenerated ==
                                        true)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Align(
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        child: InkWell(
                                          highlightColor:
                                              ThemeConstants.whitecolor,
                                          onTap: () async{
                                            Get.back();
                                            eventZoneDrawerPopUp(
                                                context,
                                                Get.find<BaseController>()
                                                        .meetingZoneStatus
                                                        .markAttendance ??
                                                    false,
                                                Get.find<BaseController>()
                                                        .meetingZoneStatus
                                                        .expressPass ??
                                                    false,
                                                Get.find<BaseController>()
                                                        .meetingZoneStatus
                                                        .expressPassGenerated ??
                                                    false);
                                          },

                                        )),
                                  ),
                                // InkWell(
                                //   onTap: () {
                                //     Get.back();
                                //     planYourFundDialog(context);
                                //   },
                                //   child: Padding(
                                //     padding: const EdgeInsets.only(left: 20.0),
                                //     child: Row(
                                //       children: [
                                //         SvgPicture.asset(
                                //           'assets/icons/totalFees.svg',
                                //           color: index == 7
                                //               ? ThemeConstants.bluecolor
                                //               : const Color.fromARGB(
                                //                   255, 31, 31, 31),
                                //           width: 20,
                                //         ),
                                //         Padding(
                                //           padding: const EdgeInsets.only(
                                //               left: 10, top: 5),
                                //           child: CustomAutoSizeTextMontserrat(
                                //             text: "Plan your funds",
                                //             fontSize: 15,
                                //             fontWeight: FontWeight.w500,
                                //             textColor: index == 7
                                //                 ? ThemeConstants.bluecolor
                                //                 : ThemeConstants.blackcolor,
                                //           ),
                                //         ),
                                //         const Spacer(),
                                //         // const Icon(Icons.keyboard_arrow_down),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                // InkWell(
                                //   onTap: () {
                                //     Get.back();
                                //     supportDialog(context);
                                //   },
                                //   child: Padding(
                                //     padding: const EdgeInsets.only(left: 20.0),
                                //     child: Row(
                                //       children: [
                                //         SvgPicture.asset(
                                //           'assets/icons/Calender icon.svg',
                                //           color: index == 6
                                //               ? ThemeConstants.bluecolor
                                //               : const Color.fromARGB(
                                //                   255, 31, 31, 31),
                                //           width: 20,
                                //         ),
                                //         Padding(
                                //           padding: const EdgeInsets.only(
                                //               left: 10, top: 5),
                                //           child: Row(
                                //             children: [
                                //               CustomAutoSizeTextMontserrat(
                                //                 text: "Event Zone",
                                //                 fontSize: 15,
                                //                 fontWeight: FontWeight.w500,
                                //               ),
                                //               const SizedBox(
                                //                 width: 10,
                                //               ),
                                //               Container(
                                //                 decoration: BoxDecoration(
                                //                     color: ThemeConstants.red,
                                //                     borderRadius:
                                //                         const BorderRadius.all(
                                //                             Radius.circular(
                                //                                 5.0))),
                                //                 child: Padding(
                                //                   padding: const EdgeInsets
                                //                           .symmetric(
                                //                       horizontal: 5,
                                //                       vertical: 2),
                                //                   child:
                                //                       CustomAutoSizeTextMontserrat(
                                //                     text: "New",
                                //                     fontSize: 10,
                                //                     textColor: ThemeConstants
                                //                         .whitecolor,
                                //                   ),
                                //                 ),
                                //               )
                                //             ],
                                //           ),
                                //         ),

                                //         // const Icon(Icons.keyboard_arrow_down),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: InkWell(
                                        highlightColor:
                                            ThemeConstants.whitecolor,
                                        onTap: () {
                                          Get.deleteAll();
                                          Get.back();
                                          Get.toNamed(
                                              EventHistoryView.routeName);
                                        },
                                        child: Row(
                                          children: [
                                            svgImage(
                                                "Mark attendence",
                                                widget.index == 9
                                                    ? ThemeConstants.bluecolor
                                                    : const Color.fromARGB(
                                                        255, 31, 31, 31),
                                                20,
                                                20),
                                            // SvgPicture.asset(
                                            //   'assets/icons/Review Course.svg',
                                            //   color: index == 4
                                            //       ? ThemeConstants.bluecolor
                                            //       : const Color.fromARGB(
                                            //           255, 31, 31, 31),
                                            //   width: 20,
                                            // ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    // color: index == 4
                                                    //     ? ThemeConstants.lightblueColor
                                                    //     : ThemeConstants.whitecolor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, top: 5),
                                                  child:
                                                      CustomAutoSizeTextMontserrat(
                                                    text: "Event History",
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    textColor: widget.index == 9
                                                        ? ThemeConstants
                                                            .bluecolor
                                                        : ThemeConstants
                                                            .blackcolor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),

                                InkWell(
                                  onTap: () {
                                    Get.back();
                                    supportDialog(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Row(
                                      children: [
                                        svgImage(
                                            "Support",
                                            widget.index == 6
                                                ? ThemeConstants.bluecolor
                                                : const Color.fromARGB(
                                                    255, 31, 31, 31),
                                            20,
                                            20),
                                        // SvgPicture.asset(
                                        //   'assets/icons/Support.svg',
                                        //   color: index == 6
                                        //       ? ThemeConstants.bluecolor
                                        //       : const Color.fromARGB(
                                        //           255, 31, 31, 31),
                                        //   width: 20,
                                        // ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 5),
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Gradlynk Support",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            textColor: widget.index == 6
                                                ? ThemeConstants.bluecolor
                                                : ThemeConstants.blackcolor,
                                          ),
                                        ),
                                        const Spacer(),
                                        // const Icon(Icons.keyboard_arrow_down),
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                        ),

                        // Padding(
                        //   padding: const EdgeInsets.only(left: 20),
                        //   child: Align(
                        //       alignment: AlignmentDirectional.topStart,
                        //       child: InkWell(
                        //         highlightColor: ThemeConstants.whitecolor,
                        //         onTap: () {
                        //           Get.deleteAll();
                        //           Get.toNamed(VisaSummary.routeNamed);
                        //         },
                        //         child: Padding(
                        //           padding: const EdgeInsets.only(right: 10),
                        //           child: Container(
                        //             height: 30,
                        //             width: MediaQuery.of(context).size.width,
                        //             decoration: BoxDecoration(
                        //                 color: index == 6
                        //                     ? ThemeConstants.lightblueColor
                        //                     : ThemeConstants.whitecolor,
                        //                 borderRadius: BorderRadius.circular(10.0)),
                        //             child: Padding(
                        //               padding:
                        //                   const EdgeInsets.only(left: 10, top: 5),
                        //               child: CustomAutoSizeTextMontserrat(
                        //                 text: "My Visa",
                        //                 textColor: index == 6
                        //                     ? ThemeConstants.bluecolor
                        //                     : ThemeConstants.blackcolor,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       )),
                        // ),
                        // const SizedBox(
                        //   height: 5,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 20),
                        //   child: Align(
                        //       alignment: AlignmentDirectional.topStart,
                        //       child: InkWell(
                        //         highlightColor: ThemeConstants.whitecolor,
                        //         onTap: () {
                        //           Get.deleteAll();
                        //           Get.toNamed(StageProgress.routeNamed);
                        //         },
                        //         child: Padding(
                        //           padding: const EdgeInsets.only(right: 10),
                        //           child: Container(
                        //             height: 30,
                        //             width: MediaQuery.of(context).size.width,
                        //             decoration: BoxDecoration(
                        //                 color: index == 7
                        //                     ? ThemeConstants.lightblueColor
                        //                     : ThemeConstants.whitecolor,
                        //                 borderRadius: BorderRadius.circular(10.0)),
                        //             child: Padding(
                        //               padding:
                        //                   const EdgeInsets.only(left: 10, top: 5),
                        //               child: CustomAutoSizeTextMontserrat(
                        //                 text: "Processes",
                        //                 textColor: index == 7
                        //                     ? ThemeConstants.bluecolor
                        //                     : ThemeConstants.blackcolor,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       )),
                        // ),
                        // const SizedBox(
                        //   height: 5,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 20),
                        //   child: Align(
                        //       alignment: AlignmentDirectional.topStart,
                        //       child: InkWell(
                        //         highlightColor: ThemeConstants.whitecolor,
                        //         onTap: () {
                        //           Get.deleteAll();
                        //           Get.toNamed(CountryGuide.routeNamed);
                        //         },
                        //         child: Padding(
                        //           padding: const EdgeInsets.only(right: 10),
                        //           child: Container(
                        //             height: 30,
                        //             width: MediaQuery.of(context).size.width,
                        //             decoration: BoxDecoration(
                        //                 color: index == 8
                        //                     ? ThemeConstants.lightblueColor
                        //                     : ThemeConstants.whitecolor,
                        //                 borderRadius: BorderRadius.circular(10.0)),
                        //             child: Padding(
                        //               padding:
                        //                   const EdgeInsets.only(left: 10, top: 5),
                        //               child: CustomAutoSizeTextMontserrat(
                        //                 text: "Country Guide",
                        //                 textColor: index == 8
                        //                     ? ThemeConstants.bluecolor
                        //                     : ThemeConstants.blackcolor,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       )),
                        // ),
                        // const SizedBox(
                        //   height: 5,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 20),
                        //   child: Align(
                        //       alignment: AlignmentDirectional.topStart,
                        //       child: InkWell(
                        //         highlightColor: ThemeConstants.whitecolor,
                        //         onTap: () {},
                        //         child: Padding(
                        //           padding: const EdgeInsets.only(right: 10),
                        //           child: Container(
                        //             height: 30,
                        //             width: MediaQuery.of(context).size.width,
                        //             decoration: BoxDecoration(
                        //                 color: index == 9
                        //                     ? ThemeConstants.lightblueColor
                        //                     : ThemeConstants.whitecolor,
                        //                 borderRadius: BorderRadius.circular(10.0)),
                        //             child: Padding(
                        //               padding:
                        //                   const EdgeInsets.only(left: 10, top: 5),
                        //               child: CustomAutoSizeTextMontserrat(
                        //                 text: "Pre Depature Kit",
                        //                 textColor: index == 9
                        //                     ? ThemeConstants.bluecolor
                        //                     : ThemeConstants.blackcolor,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       )),
                        // ),

                        const Divider(
                          indent: 20,
                          endIndent: 20,
                          thickness: 1,
                          color: Color(0xFFD6D6D6),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 8, top: 10),
                          child: Center(
                            child: LoadingButton(
                                height: 35,
                                borderRadius: 8,
                                animate: true,
                                color: ThemeConstants.bluecolor,
                                width: 120,
                                loader: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: 30,
                                  height: 30,
                                  child: const CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ),
                                ),
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Logout",
                                  textColor: ThemeConstants.whitecolor,
                                ),
                                onTap: (startLoading, stopLoading,
                                    buttonState) async {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text("Logout"),
                                          content: const Text(
                                              "Are you sure you want to Logout?"),
                                          actions: [
                                            TextButton(
                                              onPressed: () async {
                                                if (buttonState ==
                                                    ButtonState.idle) {
                                                  startLoading();

                                                  Get.deleteAll();
                                                  await Get.find<
                                                          BaseController>()
                                                      .logout();
                                                  stopLoading();
                                                }
                                              },
                                              child: const Text(
                                                "Yes",
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(false);
                                              },
                                              child: const Text(
                                                "No",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      });
                                }

                                // (startLoading, stopLoading,
                                //                                   buttonState) async {
                                //                                 if (buttonState == ButtonState.idle) {
                                //                                   startLoading();
                                //                                   // Do something here
                                //                                   Get.deleteAll();
                                //                                   await Get.find<BaseController>().logout();
                                //                                   stopLoading();
                                //                                 }
                                //                               },
                                ),
                          ),
                        ),
                        CustomAutoSizeTextMontserrat(
                          text: "Version ${VersionUtil.getAppVersion()}",
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),

                        // const SizedBox(),
                        // const SizedBox(),
                        // const SizedBox(),

                        const SizedBox(),
                        SizedBox(
                          width: 200,
                          child: svgImage(
                              "navBottomImg",
                              const Color.fromARGB(176, 158, 158, 158),
                              200,
                              200),

                          //  SvgPicture.asset(
                          //     'assets/icons/navBottomImg.svg',
                          //     color: const Color.fromARGB(176, 158, 158, 158)),
                        ),
                      ],
                    ),
                  ),
              onLoading: getLoading(context)),
        ),
      )),
    );
  }
}

class VersionUtil {
  static String? _cachedVersion;

  static Future<void> fetchAppVersion() async {
    if (_cachedVersion == null) {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      _cachedVersion = packageInfo.version;
    }
  }

  static String getAppVersion() {
    return _cachedVersion ?? 'Unknown';
  }
}
