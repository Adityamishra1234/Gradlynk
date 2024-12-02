import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/controllers/courseshortlist.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/ui/models/filterModel.dart';
import 'package:studentpanel/ui/screen/course_search/compare.dart';
import 'package:studentpanel/ui/screen/complete_course_details/coursesearchfulldetail.dart';
import 'package:studentpanel/ui/screen/course_search/fliter.dart';
import 'package:studentpanel/ui/screen/course_search/reviewshortlist.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/collagelistexpandedwidget.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

import '../../../widgets/drawerfilter.dart';
import '../mark_attendance/qrCodeScreen.dart';

class CourseSearchList extends StatefulWidget {
  static const routeNamed = '/CourseSearchList';
  bool filterRedirect = false;
  bool? showJobIndustry;
  String? stateCode;
  String? cityCode;
  String? boardFieldCode;
  String? narrowField;
  String? countryId;
  String? courseLevel;
  String? enq_id;
  String? profession;
  String? career_outcome;
  String? university_code;
  FilterModel? filterModel;
  CourseModelFilter? courseModelFilter = CourseModelFilter();
  CourseSearchList(
      {Key? key,
      required this.filterRedirect,
      this.showJobIndustry,
      this.filterModel,
      this.stateCode,
      this.cityCode,
      this.boardFieldCode,
      this.narrowField,
      this.countryId,
      this.courseLevel,
      this.courseModelFilter,
      this.profession,
      this.career_outcome,
      this.enq_id,
      this.university_code})
      : super(key: key);

  @override
  State<CourseSearchList> createState() => _CourseSearchListState();
}

class _CourseSearchListState extends State<CourseSearchList> {
  var controller1 = Get.put(CourseShortListController());
  final yourScrollController = ScrollController();

  // String state = "",
  // String city = "",
  // String boarder_ield = "",
  // String narrow_field = "",

  @override
  void didChangeDependencies() {
    print("object");
    controller1 = Get.put(CourseShortListController());
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CourseSearchList oldWidget) {
    print("didUpdateWidget");
    controller1 = Get.put(CourseShortListController());
    // controller1.courseSearch(
    //   widget.showJobIndustry ?? false,
    //   widget.countryId!,
    //   widget.courseLevel!,
    //   widget.enq_id!,
    //   widget.stateCode ?? "",
    //   widget.cityCode ?? "",
    //   widget.boardFieldCode ?? "",
    //   widget.narrowField ?? "",
    //   widget.profession ?? "",
    //   widget.career_outcome ?? "",
    // );

    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   controller1.dispose();
  //   super.dispose();
  // }

  @override
  void initState() {
    if (widget.filterRedirect == false) {
      controller1.courseSearch(
          widget.showJobIndustry ?? false,
          widget.countryId!,
          widget.courseLevel!,
          widget.enq_id!,
          widget.stateCode ?? "",
          widget.cityCode ?? "",
          widget.boardFieldCode ?? "",
          widget.narrowField ?? "",
          widget.profession ?? "",
          widget.career_outcome ?? "",
          widget.university_code ?? '');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    double width;
    if (displayMobileLayout == false) {
      width = MediaQuery.of(context).size.width + 240.00;
    }
    return Scaffold(
        appBar:  AppBar(
          elevation: 2.5,
          automaticallyImplyLeading: false,
          actions: [
            if (displayMobileLayout == true)
              IconButton(
                icon: const Icon(Icons.arrow_back,
                    color: Colors.black),
                onPressed: () => Get.back(),
              ),
            if (displayMobileLayout == false)
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child:  IconButton(
                  // icon: Image.asset("assets/images/gradlynk lense.png"),
                  icon: const Icon(Icons.arrow_back, color: Colors.black,),
                  // icon: const Icon(Icons.menu,color: Colors.black,),
                  onPressed: () {
                    // Get.find<BaseController>().profileDataValidator();
                   Get.back();

                    DrawerFilter();
                  },
                ),
              ),
            // svgImage("work", Colors.transparent, 32, 32),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image.network(
                "https://sieceducation.in/assets/assets/images/logo.png",
                width: 130,
                height: 30,
              ),
            ),
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
            const Spacer(),
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
        body: controller1.obx((State) {
          try {
            if (widget.filterRedirect == false) {
              controller1.courseModelFilter = controller1.courseModelFilter;
            } else {
              controller1.courseModelFilter = widget.courseModelFilter!;
            }
          } catch (e) {
            print(e.toString());
          }

          return Row(
            children: [
              if (displayMobileLayout == true)
                CustomDrawer(
                  index: 3,
                ),
              Flexible(
                child: Container(
                  color: ThemeConstants.whitecolor,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 15),
                          InkWell(
                            onTap: () {
                              if (controller1.courseModelFilter
                                      .previousCourseSearchList.length <=
                                  controller1.courseModelFilter.courseSearchList
                                      .length) {
                                controller1.courseModelFilter
                                        .previousCourseSearchList =
                                    controller1
                                        .courseModelFilter.courseSearchList;
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Filter(
                                            courseModelFilter:
                                                controller1.courseModelFilter,
                                            previousRoute:
                                                CourseSearchList.routeNamed,
                                            filtermodel: widget.filterModel,
                                          )));
                              // Get.to(Filter(
                              //   courseModelFilter:
                              //       controller1.courseModelFilter,
                              //   previousRoute:
                              //       CourseSearchList.routeNamed,
                              //   filtermodel: widget.filterModel,
                              // ));
                            },
                            child: Container(
                              height: 36,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: ThemeConstants.lightorangeColor,
                                  border: Border.all(
                                    color: ThemeConstants.orangeColor,
                                  ),
                                  borderRadius:
                                  BorderRadiusDirectional.circular(
                                      5.0)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Row(
                                    children: [
                                      svgImage(
                                          "filter", ThemeConstants.orangeColor, 14, 14),
                                      const SizedBox(width: 5,),
                                      CustomAutoSizeTextMontserrat(
                                          text: "Filter",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          textColor:
                                          ThemeConstants.orangeColor),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // const Spacer(),
                          const SizedBox(width: 10,),
                          // InkWell(
                          //   onTap: () {
                          //     if (controller1.compareApply.value == false) {
                          //       controller1.setCompare(true.obs);
                          //     } else {
                          //       controller1.setCompare(false.obs);
                          //     }
                          //   },
                          //   child:  Container(
                          //     height: 30,
                          //     decoration: BoxDecoration(
                          //         color: controller1.compareApply == true? ThemeConstants.GreenColor: ThemeConstants.lightgreentColor,
                          //         border: Border.all(
                          //           color: ThemeConstants.GreenColor,
                          //         ),
                          //         borderRadius:
                          //         BorderRadiusDirectional.circular(
                          //             5.0)),
                          //     child: Center(
                          //       child: Padding(
                          //         padding: const EdgeInsets.only(
                          //             left: 10, right: 10),
                          //         child: Row(
                          //           children: [
                          //             Icon(Icons.compare_arrows, color: controller1.compareApply == true? ThemeConstants.whitecolor: ThemeConstants.GreenColor,),
                          //             const SizedBox(width: 5,),
                          //             CustomAutoSizeTextMontserrat(
                          //                 text: "Compare",
                          //                 fontSize: 14,
                          //                 fontWeight: FontWeight.w600,
                          //                 textColor: controller1.compareApply == true? ThemeConstants.whitecolor: ThemeConstants.GreenColor),
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // const Spacer(),
                          InkWell(
                            onTap: () {
                              controller1.courseSearch(
                                  widget.showJobIndustry ?? false,
                                  widget.countryId!,
                                  widget.courseLevel!,
                                  widget.enq_id!,
                                  widget.stateCode ?? "",
                                  widget.cityCode ?? "",
                                  widget.boardFieldCode ?? "",
                                  widget.narrowField ?? "",
                                  widget.profession ?? "",
                                  widget.career_outcome ?? "",
                                  widget.university_code ?? '');

                              Get.toNamed(ReviewShortList.routeNamed,
                                  arguments: [
                                    {"countryId": widget.countryId!},
                                    {"courseLevel": widget.courseLevel!},
                                    {
                                      "enq_id": widget.enq_id!,
                                    },
                                    {
                                      "statecode": widget.stateCode ?? "",
                                    },
                                    {
                                      "cityCode": widget.cityCode ?? "",
                                    },
                                    {
                                      "boardFieldCode":
                                          widget.boardFieldCode ?? "",
                                    },
                                    {"narrowField": widget.narrowField ?? ""},
                                    {"previous_screenCourseSearch": true}
                                  ]);
                            },
                            child: Container(
                              height: 35,
                              decoration: BoxDecoration(
                                  color: ThemeConstants.lightVioletColor,
                                  border: Border.all(
                                    color: ThemeConstants.VioletColor,
                                  ),
                                  borderRadius:
                                      BorderRadiusDirectional.circular(5.0)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.book,color: ThemeConstants.VioletColor,),
                                      const SizedBox(width: 5),
                                      CustomAutoSizeTextMontserrat(
                                          text: "Review Course",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          textColor: ThemeConstants.VioletColor),
                                    ],
                                  ),
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
                      Expanded(
                        child: Scrollbar(
                          thumbVisibility: false,
                          trackVisibility: false,
                          radius: const Radius.circular(2.0),
                          // isAlwaysShown: true,
                          thickness: 3,
                          controller: yourScrollController,
                          child: ListView.builder(
                              controller: yourScrollController,
                              itemCount: controller1
                                  .courseModelFilter.courseSearchList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    // if (controller1.courseSearchModel.length != index)
                                    CollagelistExpandedWidget(
                                      callbackRemoveCourse:
                                          callbackCompareCourseRemove,
                                      courseSearchModelCompare1:
                                          controller1.courseSearchModelCompare1,
                                      courseSearchModelCompare2:
                                          controller1.courseSearchModelCompare2,
                                      previousRoute:
                                          CourseSearchList.routeNamed,
                                      index: index,
                                      courseShortListFirst: true,
                                      courseSearchModelCompare1Id: controller1
                                          .courseSearchModelCompare1.id,
                                      courseSearchModelCompare2Id: controller1
                                          .courseSearchModelCompare2.id,
                                      callbackForModelCompare:
                                          callbackModelCompare,
                                      callbackCompare: callbackCompare,
                                      iscompare: controller1.compareApply.value,
                                      courseSearchModel: controller1
                                          .courseModelFilter
                                          .courseSearchList[index],
                                      callbackFunction:
                                          callbackCompleteDetailCourse,
                                      callbackShortListButton:
                                          CallbackShortListButton,
                                      finalShortListFirst: false,
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ),
                      if (controller1.compareApply.value == true)
                        InkWell(
                          onTap: () {
                            if (controller1.courseSearchModelCompare1.id !=
                                    null &&
                                controller1.courseSearchModelCompare2.id !=
                                    null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Comparing(
                                      courseSearchModel1:
                                          controller1.courseSearchModelCompare1,
                                      courseSearchModel2:
                                          controller1.courseSearchModelCompare2,
                                    ),
                                  ));
                              // Get.to(
                              //   Comparing(
                              //     courseSearchModel1: controller1
                              //         .courseSearchModelCompare1,
                              //     courseSearchModel2: controller1
                              //         .courseSearchModelCompare2,
                              //   ),
                              // );
                            } else {
                              getToast(
                                  SnackBarConstants.courseSearchListPart3!);
                            }
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
                                  svgImage("compare", ThemeConstants.whitecolor,
                                      30, 30),
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
                    ],
                  ),
                ),
              ),
            ],
          );
        }, onLoading: getLoading(context)));
  }

  // Function
  callbackCompare(varTopic) async {
    // Add To Compare  For Comparing
    if (varTopic != false) {
      controller1.compare(varTopic);
    }
  }

  callbackModelCompare(varTopic) async {
    await controller1.callbackModelCompare(varTopic);
  }

  callbackCompleteDetailCourse(varTopic) async {
    controller1.change(null, status: RxStatus.loading());
    List<String> endpoint = varTopic.toString().split(',');
    var res = await controller1.completeCourseDetailMethod(
        endpoint[0], endpoint[1], endpoint[2]);
    if (res != null) {
      Get.to(CourseSearchFullDetail(
        completeCourseDetail: res,
      ));
      controller1.change(null, status: RxStatus.success());
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
    controller1.courseShortList(
        id, Get.find<BaseController>().model1.id.toString());
  }

  callbackCompareCourseRemove(data) {
    if (data.toString() == "1") {
      controller1.courseSearchModelCompare1 = CourseSearchModel();
    } else if (data.toString() == "2") {
      controller1.courseSearchModelCompare2 = CourseSearchModel();
    } else if (data.toString() == "12") {
      controller1.courseSearchModelCompare1 = CourseSearchModel();
      controller1.courseSearchModelCompare2 = CourseSearchModel();
    }
    controller1.update();
  }
}
