import 'dart:async';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/controllers/dashboardcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/versioncontroller.dart';
import 'package:studentpanel/ui/screen/My_Application/applicationsummary.dart';
import 'package:studentpanel/ui/screen/Profile_module_2/profile_view.dart';
import 'package:studentpanel/ui/screen/course_search/coursesearch2.dart';
import 'package:studentpanel/ui/screen/dashboard/testimonials.dart';
import 'package:studentpanel/ui/screen/dashboard/youtube_video_section.dart';
import 'package:studentpanel/ui/screen/mark_attendance/qrCodeScreen.dart';
import 'package:studentpanel/ui/screen/test/stage_profilemodule.dart';
import 'package:studentpanel/ui/screen/upload_document/uploaddocument.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customBottomNavbar.dart';
import 'package:studentpanel/widgets/custom_dialog_box.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
import 'package:studentpanel/widgets/dashboardeventSection.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../BlocData/Bloc/field_bloc.dart';
import '../../BlocData/Repositories/field_repo.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({
    Key? key,
  }) : super(key: key);
  static const routeNamed = '/DashBoard';

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  var controller = Get.find<BaseController>();
  var controller1 = Get.put(VersionController(), permanent: true);
  var dashboardController = Get.put(DashboardController());
  final TextStyle _textStyle = GoogleFonts.roboto(
    fontWeight: FontWeight.w800,
    fontSize: 17,
  );
  bool appbar = false;
  bool showcase = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();
  final GlobalKey _four = GlobalKey();
  final GlobalKey _five = GlobalKey();
  final GlobalKey _six = GlobalKey();
  final GlobalKey _seven = GlobalKey();
  final GlobalKey _eight = GlobalKey();
  final GlobalKey _nine = GlobalKey();
  final GlobalKey _ten = GlobalKey();
  final GlobalKey _11 = GlobalKey();
  final GlobalKey _12 = GlobalKey();
  BuildContext? myContext;

  int currentIndex = 0;

  @override
  void initState() {
// "/LoginCopy"
// "/LoginCopy"

    if (Get.previousRoute == '/' || Get.previousRoute == '/LoginCopy') {
      controller.getDataAgain();
    }
    // Get.offAllNamed(DashBoard.routeNamed);
    try {
      //todo
      // if (Get.arguments) {
      if (false) {
        ambiguate(WidgetsBinding.instance)?.addPostFrameCallback(
          (_) => Future.delayed(const Duration(milliseconds: 200), () {
            ShowCaseWidget.of(myContext!).startShowCase([
              _one,
              _two,
              _three,
              _four,
              _five,
              _six,
              _nine,
              _ten,
              _seven,
              _11,
              _eight,
              _12,
            ]);
          }),
        );

        showcase = true;
      } else {
        appbar = true;
      }
    } catch (e) {}
    // Get.find<BaseController>().profiledetail();
    bloc = FieldBloc(context.read<FieldRepo>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CarouselController controller1 = CarouselController();

    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;

    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;

    ScrollController Scrollcontroller = ScrollController();

    return ShowCaseWidget(
        autoPlay: true,
        autoPlayDelay: const Duration(seconds: 5),
        onComplete: (p0, p1) {
          print(p0);
          if (p0 == 8) {
            appbar = true;
            setState(() {});
          }
          if (p0 == 2) {
            Scrollcontroller.jumpTo(Scrollcontroller.position.maxScrollExtent);
          }
        },
        builder: Builder(builder: (context) {
          myContext = context;
          return controller.obx(
              onLoading: Scaffold(
                body: getLoading(context),
              ),
              (state) => Scaffold(
                    drawerScrimColor: const Color.fromARGB(110, 255, 255, 255),
                    backgroundColor: const Color.fromARGB(255, 248, 252, 255),
                    key: _scaffoldKey,
                    appBar: AppBar(
                      elevation: 2.5, centerTitle: true,
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
                        // if (displayMobileLayout == true)
                        //   Padding(
                        //     padding: const EdgeInsets.only(left: 10),
                        //     child: Showcase(
                        //       descTextStyle: TextStyle(
                        //           color: ThemeConstants.whitecolor,
                        //           fontSize: 14),
                        //       tooltipBackgroundColor: ThemeConstants.bluecolor,
                        //       overlayColor: const Color.fromARGB(255, 0, 0, 0),
                        //       overlayOpacity: 0.8,
                        //       key: _nine,
                        //       description:
                        //       "Your Navigation drawer is your easy to access all features zone.",
                        //       child: IconButton(
                        //         // icon: Image.asset("assets/images/gradlynk lense.png"),
                        //         icon: const Icon(
                        //           Icons.menu,
                        //           color: Colors.black,
                        //         ),
                        //         onPressed: () {
                        //           // Get.find<BaseController>().profileDataValidator();
                        //           _scaffoldKey.currentState!.openDrawer();
                        //
                        //           DrawerFilter();
                        //         },
                        //       ),
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
                                  animationType:
                                      DialogTransitionType.slideFromBottomFade,
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
                    drawer: CustomDrawer(
                      index: 0,
                    ),

                    // appbar == true
                    //     ? controller.loadingStudentPanelData1.value == true
                    //         ? CustomAppBar("DashBoard", true)
                    //         : null
                    //     : null,

                    body:
                        // setState(() {});
                        controller.loadingStudentPanelData1.value == true
                            ? Row(
                                children: [
                                  // if (displayMobileLayout == false)
                                  //   CustomDrawer(
                                  //     index: 0,
                                  //   ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    width: displayMobileLayout == true
                                        ? MediaQuery.of(context).size.width -
                                            240
                                        : MediaQuery.of(context).size.width,
                                    child: ListView(
                                      controller: Scrollcontroller,
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        // Padding(
                                        //   padding:
                                        //       const EdgeInsets.only(top: 10,bottom: 5),
                                        //   child: SizedBox(
                                        //     height:50,
                                        //     width: displayMobileLayout == true
                                        //         ? MediaQuery.of(context)
                                        //                 .size
                                        //                 .width -
                                        //             240
                                        //         : MediaQuery.of(context)
                                        //             .size
                                        //             .width,
                                        //     child: Padding(
                                        //       padding: const EdgeInsets.only(top: 10, right: 15, left: 10, bottom: 10),
                                        //       child: Row(
                                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //         children: [
                                        //           Column(
                                        //             crossAxisAlignment: CrossAxisAlignment.start,
                                        //             children: [
                                        //               Row(
                                        //                 children: [
                                        //                   Text("Hi, ",
                                        //                       style: GoogleFonts.abhayaLibre(textStyle: const TextStyle(
                                        //                     fontSize: 24,
                                        //                     fontWeight: FontWeight.w600,
                                        //                     color: Colors.black,
                                        //                   ),)),
                                        //                   Text(
                                        //                       style: GoogleFonts.abhayaLibre(textStyle: const TextStyle(
                                        //                         fontSize: 24,
                                        //                         fontWeight: FontWeight.w600,
                                        //                         color: Colors.black,
                                        //                       ),),
                                        //                     "${firstLetterChaptial(controller.personalModal.enquiryName) ?? firstLetterChaptial(controller.model1.enquiryName)}"
                                        //                   ),
                                        //                 ],
                                        //               ),
                                        //             ],
                                        //           ),
                                        //           Container(
                                        //             decoration: BoxDecoration(
                                        //               color: ThemeConstants.bluecolor,
                                        //               borderRadius: BorderRadius.circular(50),
                                        //             ),
                                        //             width: 30,
                                        //             height: 30,
                                        //             child: ClipRRect(
                                        //               borderRadius: BorderRadius.circular(50),
                                        //               child: Icon(Icons.person_2, color: ThemeConstants.whitecolor,size: 20,),
                                        //             ),
                                        //           )
                                        //       ],),
                                        //     ),
                                        //     // Column(
                                        //     //     mainAxisAlignment: MainAxisAlignment.start,
                                        //     //   children: [
                                        //     //     Padding(
                                        //     //       padding:
                                        //     //           const EdgeInsets.only(
                                        //     //               left: 20),
                                        //     //       child: Align(
                                        //     //         alignment:
                                        //     //             AlignmentDirectional
                                        //     //                 .topStart,
                                        //     //         child: Text(
                                        //     //           "Hi,",
                                        //     //           style: GoogleFonts.roboto(
                                        //     //               fontWeight:
                                        //     //                   FontWeight.bold,
                                        //     //               fontSize: 20,
                                        //     //               textStyle:
                                        //     //                   const TextStyle()),
                                        //     //         ),
                                        //     //       ),
                                        //     //     ),
                                        //     //     Padding(
                                        //     //       padding:
                                        //     //           const EdgeInsets.only(
                                        //     //               left: 20),
                                        //     //       child: Align(
                                        //     //           alignment:
                                        //     //               AlignmentDirectional
                                        //     //                   .topStart,
                                        //     //           child: SizedBox(
                                        //     //             // width: MediaQuery.of(context)
                                        //     //             //         .size
                                        //     //             //         .width /
                                        //     //             //     2,
                                        //     //             child: Showcase
                                        //     //                 .withWidget(
                                        //     //               disableDefaultTargetGestures:
                                        //     //                   true,
                                        //     //               onTargetClick: () {
                                        //     //                 ShowCaseWidget.of(
                                        //     //                         context)
                                        //     //                     .next();
                                        //     //                 Scrollcontroller.jumpTo(
                                        //     //                     Scrollcontroller
                                        //     //                         .position
                                        //     //                         .maxScrollExtent);
                                        //     //               },
                                        //     //               disableMovingAnimation:
                                        //     //                   true,
                                        //     //               // descTextStyle: TextStyle(
                                        //     //               //     color: ThemeConstants
                                        //     //               //         .whitecolor,
                                        //     //               //     fontSize: 18),
                                        //     //               // tooltipBackgroundColor:
                                        //     //               //     ThemeConstants.bluecolor,
                                        //     //               overlayColor:
                                        //     //                   const Color
                                        //     //                       .fromARGB(
                                        //     //                       183,
                                        //     //                       0,
                                        //     //                       0,
                                        //     //                       0),
                                        //     //               overlayOpacity: 0.8,
                                        //     //               // tooltipPadding:
                                        //     //               //     const EdgeInsets.only(
                                        //     //               //         left: 5,
                                        //     //               //         right: 5,
                                        //     //               //         top: 10,
                                        //     //               //         bottom: 10),
                                        //     //               targetShapeBorder:
                                        //     //                   const RoundedRectangleBorder(
                                        //     //                       borderRadius:
                                        //     //                           BorderRadius.all(
                                        //     //                               Radius.circular(20))),
                                        //     //               key: _one,
                                        //     //               // description:
                                        //     //               //     'Hi, Welcome to Gradlynk. Your international Education Partner.',
                                        //     //               container: InkWell(
                                        //     //                 onTap: () {
                                        //     //                   ShowCaseWidget.of(
                                        //     //                           context)
                                        //     //                       .next();
                                        //     //                   Scrollcontroller.jumpTo(
                                        //     //                       Scrollcontroller
                                        //     //                           .position
                                        //     //                           .maxScrollExtent);
                                        //     //                 },
                                        //     //                 child: Padding(
                                        //     //                   padding:
                                        //     //                       const EdgeInsets
                                        //     //                           .only(
                                        //     //                     top: 10,
                                        //     //                   ),
                                        //     //                   child: SizedBox(
                                        //     //                     height: MediaQuery.of(
                                        //     //                                 context)
                                        //     //                             .size
                                        //     //                             .height *
                                        //     //                         0.7,
                                        //     //                     width: MediaQuery.of(
                                        //     //                             context)
                                        //     //                         .size
                                        //     //                         .width,
                                        //     //                     child: Column(
                                        //     //                       children: [
                                        //     //                         Align(
                                        //     //                           alignment:
                                        //     //                               AlignmentDirectional.topStart,
                                        //     //                           child:
                                        //     //                               Container(
                                        //     //                             decoration: BoxDecoration(
                                        //     //                                 color: ThemeConstants.bluecolor,
                                        //     //                                 borderRadius: BorderRadius.circular(8.0)),
                                        //     //                             child:
                                        //     //                                 Padding(
                                        //     //                               padding:
                                        //     //                                   const EdgeInsets.all(10.0),
                                        //     //                               child:
                                        //     //                                   SizedBox(
                                        //     //                                 width: MediaQuery.of(context).size.width * 0.8,
                                        //     //                                 child: CustomAutoSizeTextMontserrat(
                                        //     //                                   text: "Hi, Welcome to Gradlynk. Your international Education Partner.",
                                        //     //                                   textColor: ThemeConstants.whitecolor,
                                        //     //                                 ),
                                        //     //                               ),
                                        //     //                             ),
                                        //     //                           ),
                                        //     //                         ),
                                        //     //                         const Spacer(),
                                        //     //                         InkWell(
                                        //     //                           onTap:
                                        //     //                               () {
                                        //     //                             ShowCaseWidget.of(context)
                                        //     //                                 .dismiss();
                                        //     //                           },
                                        //     //                           child:
                                        //     //                               Padding(
                                        //     //                             padding: const EdgeInsets
                                        //     //                                 .only(
                                        //     //                                 right: 40,
                                        //     //                                 bottom: 60),
                                        //     //                             child: Align(
                                        //     //                                 alignment: AlignmentDirectional.topEnd,
                                        //     //                                 child: Row(
                                        //     //                                   children: [
                                        //     //                                     const Spacer(),
                                        //     //                                     CustomAutoSizeTextMontserrat(
                                        //     //                                       text: "Skip",
                                        //     //                                       textColor: ThemeConstants.whitecolor,
                                        //     //                                       fontSize: 18,
                                        //     //                                       fontWeight: FontWeight.bold,
                                        //     //                                     ),
                                        //     //                                     Icon(
                                        //     //                                       Icons.skip_next,
                                        //     //                                       color: ThemeConstants.whitecolor,
                                        //     //                                     )
                                        //     //                                   ],
                                        //     //                                 )),
                                        //     //                           ),
                                        //     //                         ),
                                        //     //                       ],
                                        //     //                     ),
                                        //     //                   ),
                                        //     //                 ),
                                        //     //               ),
                                        //     //               height:
                                        //     //                   MediaQuery.of(
                                        //     //                           context)
                                        //     //                       .size
                                        //     //                       .height,
                                        //     //               width:
                                        //     //                   MediaQuery.of(
                                        //     //                           context)
                                        //     //                       .size
                                        //     //                       .width,
                                        //     //               child:
                                        //     //                   CustomAutoSizeTextMontserrat(
                                        //     //                 text: firstLetterChaptial(
                                        //     //                         controller
                                        //     //                             .personalModal
                                        //     //                             .enquiryName) ??
                                        //     //                     firstLetterChaptial(
                                        //     //                         controller
                                        //     //                             .model1
                                        //     //                             .enquiryName),
                                        //     //                 maxLines: 2,
                                        //     //                 fontSize: 22,
                                        //     //                 fontWeight:
                                        //     //                     FontWeight
                                        //     //                         .w600,
                                        //     //               ),
                                        //     //             ),
                                        //     //           )),
                                        //     //     ),
                                        //     //     const Divider(
                                        //     //       thickness: 1,
                                        //     //       color: Color(0xFFD6D6D6),
                                        //     //     ),
                                        //     //   ],
                                        //     // ),
                                        //   ),
                                        // ),

                                        Container(
                                          // color: Colors.grey,
                                          padding: const EdgeInsets.only(
                                              bottom: 0,
                                              top: 0,
                                              right: 10,
                                              left: 10),
                                          height: 210,
                                          width: double.infinity,
                                          child: CarouselSlider(
                                            options: CarouselOptions(
                                              autoPlay: true,
                                              aspectRatio: 16 / 9,
                                              viewportFraction: 1,
                                              enlargeCenterPage: false,
                                              onPageChanged: (index, _) {
                                                setState(() {
                                                  currentIndex = index;
                                                });
                                              },
                                              enlargeStrategy:
                                                  CenterPageEnlargeStrategy
                                                      .scale,
                                            ),
                                            items: [...caraouselList()],
                                          ),
                                        ),

                                        const SizedBox(
                                          height: 20,
                                        ),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List.generate(
                                            caraouselList().length,
                                            (index) => buildDot(index, context),
                                          ),
                                        ),

                                        const SizedBox(
                                          height: 10,
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              contactUsDialog(context);
                                            },
                                            child: SizedBox(
                                              height: 70,
                                              // width: MediaQuery.of(context).size.width,
                                              width: displayMobileLayout
                                                  ? MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.91 -
                                                      270
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.91,
                                              child: Stack(
                                                clipBehavior: Clip.none,
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    height: 60,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                        // color: const Color(0xff1477d2),
                                                        color: ThemeConstants
                                                            .bluecolor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12)),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 0.5,
                                                                  horizontal:
                                                                      8),
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  ThemeConstants
                                                                      .GreenColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15)),
                                                          child:
                                                              CustomAutoSizeTextMontserrat(
                                                            text: "Need Help?",
                                                            fontSize: 12,
                                                            textColor:
                                                                Colors.white,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        CustomAutoSizeTextMontserrat(
                                                          text:
                                                              "Contact us Now",
                                                          fontSize: 18,
                                                          textColor:
                                                              Colors.white,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: displayMobileLayout
                                                        ? MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                0.8 -
                                                            270
                                                        : MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.7,
                                                    bottom: 10,
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Showcase(
                                                          targetShapeBorder:
                                                              const CircleBorder(),
                                                          descTextStyle: TextStyle(
                                                              color:
                                                                  ThemeConstants
                                                                      .whitecolor,
                                                              fontSize: 18),
                                                          tooltipBackgroundColor:
                                                              ThemeConstants
                                                                  .bluecolor,
                                                          overlayColor:
                                                              const Color
                                                                  .fromARGB(
                                                                  183, 0, 0, 0),
                                                          overlayOpacity: 0.8,
                                                          tooltipPadding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 5,
                                                                  right: 5,
                                                                  top: 10,
                                                                  bottom: 10),
                                                          key: _six,
                                                          description:
                                                              "Need Assistance? Your Expert is a call away!",
                                                          child: CircleAvatar(
                                                            radius: 32.8,
                                                            backgroundColor:
                                                                ThemeConstants
                                                                    .whitecolor,
                                                          ),
                                                        ),
                                                        CircleAvatar(
                                                          radius: 30,
                                                          backgroundColor:
                                                              ThemeConstants
                                                                  .GreenColor,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10),
                                                            child: svgImage(
                                                                "dialer_icon",
                                                                ThemeConstants
                                                                    .whitecolor,
                                                                30,
                                                                30),
                                                            // SvgPicture.asset(
                                                            //   'assets/icons/dialer_icon.svg',
                                                            //   color:
                                                            //       ThemeConstants
                                                            //           .whitecolor,
                                                            // ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Schedule Expert Call Button And Book an Appointment
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.center,
                                        //   crossAxisAlignment:
                                        //       CrossAxisAlignment.center,
                                        //   children: [
                                        //     GestureDetector(
                                        //       onTap: () {
                                        //         contactUsDialog(context);
                                        //       },
                                        //       child: SizedBox(
                                        //         height: 70,
                                        //         // width: MediaQuery.of(context).size.width,
                                        //         width: displayMobileLayout
                                        //             ? MediaQuery.of(context)
                                        //                         .size
                                        //                         .width *
                                        //                     0.91 -
                                        //                 270
                                        //             : MediaQuery.of(context)
                                        //                     .size
                                        //                     .width *
                                        //                 0.91,
                                        //         child: Stack(
                                        //           clipBehavior: Clip.none,
                                        //           alignment:
                                        //               Alignment.bottomCenter,
                                        //           children: [
                                        //             Container(
                                        //               padding:
                                        //                   const EdgeInsets
                                        //                       .only(left: 20),
                                        //               alignment: Alignment
                                        //                   .centerLeft,
                                        //               height: 60,
                                        //               width: MediaQuery.of(context).size.width,
                                        //               decoration: BoxDecoration(
                                        //                   // color: const Color(0xff1477d2),
                                        //                   color: ThemeConstants.bluecolor,
                                        //                   borderRadius:
                                        //                       BorderRadius
                                        //                           .circular(
                                        //                               12)),
                                        //               child: Column(
                                        //                 mainAxisAlignment:
                                        //                     MainAxisAlignment
                                        //                         .center,
                                        //                 crossAxisAlignment:
                                        //                     CrossAxisAlignment
                                        //                         .start,
                                        //                 children: [
                                        //                   Container(
                                        //                     padding:
                                        //                         const EdgeInsets
                                        //                             .symmetric(
                                        //                             vertical:
                                        //                                 0.5,
                                        //                             horizontal:
                                        //                                 8),
                                        //                     decoration: BoxDecoration(
                                        //                         color: ThemeConstants
                                        //                             .GreenColor,
                                        //                         borderRadius:
                                        //                             BorderRadius
                                        //                                 .circular(
                                        //                                     15)),
                                        //                     child:
                                        //                         CustomAutoSizeTextMontserrat(
                                        //                       text:
                                        //                           "Need Help?",
                                        //                       fontSize: 12,
                                        //                       textColor:
                                        //                           Colors
                                        //                               .white,
                                        //                     ),
                                        //                   ),
                                        //                   const SizedBox(height: 5,),
                                        //                   CustomAutoSizeTextMontserrat(
                                        //                     text:
                                        //                         "Contact us Now",
                                        //                     fontSize: 18,
                                        //                     textColor:
                                        //                         Colors.white,
                                        //                   )
                                        //                 ],
                                        //               ),
                                        //             ),
                                        //             Positioned(
                                        //               left: displayMobileLayout
                                        //                   ? MediaQuery.of(context)
                                        //                               .size
                                        //                               .width *
                                        //                           0.8 -
                                        //                       270
                                        //                   : MediaQuery.of(
                                        //                               context)
                                        //                           .size
                                        //                           .width *
                                        //                       0.7,
                                        //               bottom: 10,
                                        //               child: Stack(
                                        //                 alignment:
                                        //                     Alignment.center,
                                        //                 children: [
                                        //                   Showcase(
                                        //                     targetShapeBorder:
                                        //                         const CircleBorder(),
                                        //                     descTextStyle: TextStyle(
                                        //                         color: ThemeConstants
                                        //                             .whitecolor,
                                        //                         fontSize: 18),
                                        //                     tooltipBackgroundColor:
                                        //                         ThemeConstants
                                        //                             .bluecolor,
                                        //                     overlayColor:
                                        //                         const Color
                                        //                             .fromARGB(
                                        //                             183,
                                        //                             0,
                                        //                             0,
                                        //                             0),
                                        //                     overlayOpacity:
                                        //                         0.8,
                                        //                     tooltipPadding:
                                        //                         const EdgeInsets
                                        //                             .only(
                                        //                             left: 5,
                                        //                             right: 5,
                                        //                             top: 10,
                                        //                             bottom:
                                        //                                 10),
                                        //                     key: _six,
                                        //                     description:
                                        //                         "Need Assistance? Your Expert is a call away!",
                                        //                     child:
                                        //                         CircleAvatar(
                                        //                       radius: 32.8,
                                        //                       backgroundColor:
                                        //                           ThemeConstants
                                        //                               .whitecolor,
                                        //                     ),
                                        //                   ),
                                        //                   CircleAvatar(
                                        //                     radius: 30,
                                        //                     backgroundColor:
                                        //                         ThemeConstants
                                        //                             .GreenColor,
                                        //                     child: Padding(
                                        //                       padding:
                                        //                           const EdgeInsets
                                        //                               .all(
                                        //                               10),
                                        //                       child: svgImage(
                                        //                           "dialer_icon",
                                        //                           ThemeConstants
                                        //                               .whitecolor,
                                        //                           30,
                                        //                           30),
                                        //                       // SvgPicture.asset(
                                        //                       //   'assets/icons/dialer_icon.svg',
                                        //                       //   color:
                                        //                       //       ThemeConstants
                                        //                       //           .whitecolor,
                                        //                       // ),
                                        //                     ),
                                        //                   ),
                                        //                 ],
                                        //               ),
                                        //             )
                                        //           ],
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        if (controller.meetingZoneStatus
                                                    .markAttendance ==
                                                true ||
                                            controller.meetingZoneStatus
                                                    .expressPass ==
                                                true ||
                                            controller.meetingZoneStatus
                                                    .expressPassGenerated ==
                                                true)
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 10),
                                            child: DashboardEventSection(),
                                          ),

                                        const SizedBox(
                                          height: 20,
                                        ),

                                        Container(
                                          height: 120,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: ListView(
                                            scrollDirection: Axis.horizontal,
                                            // alignment: WrapAlignment
                                            //     .center, // Align boxes to the start of the row
                                            // spacing:
                                            //     5, // Set spacing between the boxes
                                            // runSpacing:
                                            //     16, // Set spacing between rows of boxes
                                            // spacing: 30,
                                            // alignment: WrapAlignment.center,
                                            // runAlignment: WrapAlignment.center,
                                            children: [
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              // Create profile
                                              InkWell(
                                                onTap: () async {
                                                  // Get.to(FeedbackPage(
                                                  //   enq_id: '78623',
                                                  //   event_id: '2',
                                                  //   phoneNumber: '8394049598',
                                                  // ));
                                                  Get.toNamed(
                                                      ProfileView.routeNamed);
                                                },
                                                child: Column(
                                                  children: [
                                                    Showcase(
                                                      descTextStyle: TextStyle(
                                                          color: ThemeConstants
                                                              .whitecolor,
                                                          fontSize: 18),
                                                      tooltipBackgroundColor:
                                                          ThemeConstants
                                                              .bluecolor,
                                                      overlayColor:
                                                          const Color.fromARGB(
                                                              183, 0, 0, 0),
                                                      overlayOpacity: 0.8,
                                                      tooltipPadding:
                                                          const EdgeInsets.only(
                                                              left: 5,
                                                              right: 5,
                                                              top: 10,
                                                              bottom: 10),
                                                      targetBorderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                      key: _two,
                                                      description:
                                                          'Feed all your profile details and get started. Your profile shall be your portfolio to search for the best course.',
                                                      child: Container(
                                                          constraints:
                                                              const BoxConstraints(
                                                                  maxHeight: 52,
                                                                  maxWidth: 52),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          decoration:
                                                              const BoxDecoration(
                                                                  // border: Border.all(
                                                                  //     width: 1.2,
                                                                  //     color: ThemeConstants
                                                                  //         .VioletColor),
                                                                  color: Color(
                                                                      0xFFF1F0FF),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              20))),
                                                          child: svgImage(
                                                              "create_profile",
                                                              const Color(
                                                                  0xFF6F61FF),
                                                              80,
                                                              80)),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10),
                                                      child: SizedBox(
                                                        width: 100,
                                                        child:
                                                            CustomAutoSizeTextMontserrat(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 13,
                                                          text:
                                                              "Create your profile",
                                                          textalingCentre: true,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              //Upload Document
                                              InkWell(
                                                onTap: () {
                                                  // todo
                                                  // Get.toNamed(RegisterationMainView
                                                  // .routeNmaed);
                                                  Get.toNamed(UploadDocument
                                                      .routeNamed);
                                                },

                                                // color: Colors.amber,
                                                child: Column(
                                                  children: [
                                                    Showcase(
                                                      targetBorderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                      descTextStyle: TextStyle(
                                                          color: ThemeConstants
                                                              .whitecolor,
                                                          fontSize: 18),
                                                      tooltipBackgroundColor:
                                                          ThemeConstants
                                                              .bluecolor,
                                                      overlayColor:
                                                          const Color.fromARGB(
                                                              183, 0, 0, 0),
                                                      overlayOpacity: 0.8,
                                                      tooltipPadding:
                                                          const EdgeInsets.only(
                                                              left: 5,
                                                              right: 5,
                                                              top: 10,
                                                              bottom: 10),
                                                      targetShapeBorder:
                                                          const RoundedRectangleBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          20))),
                                                      key: _three,
                                                      description:
                                                          "All documents required for your Application to be uploaded here.",
                                                      child: Container(
                                                          constraints:
                                                              const BoxConstraints(
                                                            maxHeight: 52,
                                                            maxWidth: 52,
                                                          ),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          decoration:
                                                              const BoxDecoration(
                                                                  // border:
                                                                  //     Border.all(
                                                                  //   width: 1.2,
                                                                  //   color:
                                                                  //       ThemeConstants
                                                                  //           .yellow,
                                                                  // ),
                                                                  color: Color(
                                                                      0xFFFEF6E6),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              20))),
                                                          child: svgImage(
                                                              "upload_document",
                                                              const Color(
                                                                  0xFFF8A300),
                                                              80,
                                                              80)),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10),
                                                      child: SizedBox(
                                                        width: 100,
                                                        child:
                                                            CustomAutoSizeTextMontserrat(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 13,
                                                          text:
                                                              "Upload document",
                                                          textalingCentre: true,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              //Course Search
                                              if (controller.meetingZoneStatus
                                                      .searchCourse ==
                                                  true)
                                                InkWell(
                                                  onTap: () {
                                                    Get.toNamed(CourseSearch2
                                                        .routeNamed);
                                                  },
                                                  child: Column(
                                                    children: [
                                                      Showcase(
                                                        descTextStyle: TextStyle(
                                                            color:
                                                                ThemeConstants
                                                                    .whitecolor,
                                                            fontSize: 18),
                                                        tooltipBackgroundColor:
                                                            ThemeConstants
                                                                .bluecolor,
                                                        overlayColor:
                                                            const Color
                                                                .fromARGB(
                                                                183, 0, 0, 0),
                                                        overlayOpacity: 0.8,
                                                        tooltipPadding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 5,
                                                                right: 5,
                                                                top: 10,
                                                                bottom: 10),
                                                        targetBorderRadius:
                                                            BorderRadius
                                                                .circular(18.0),
                                                        key: _four,
                                                        description:
                                                            "Search Course assists you in searching your desired course across the globe.",
                                                        child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10),
                                                            constraints:
                                                                const BoxConstraints(
                                                              maxHeight: 52,
                                                              maxWidth: 52,
                                                            ),
                                                            decoration:
                                                                const BoxDecoration(
                                                                    // border: Border.all(
                                                                    //     width: 1.2,
                                                                    //     color: const Color(
                                                                    //         0xFFF16660)),
                                                                    color: Color(
                                                                        0xFFFEF0F0),
                                                                    borderRadius:
                                                                        BorderRadius.all(Radius.circular(
                                                                            20))),
                                                            child: svgImage(
                                                                "course",
                                                                const Color(
                                                                    0xFFF16660),
                                                                80,
                                                                80)),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 10),
                                                        child: SizedBox(
                                                          width: 80,
                                                          child:
                                                              CustomAutoSizeTextMontserrat(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 13,
                                                            text:
                                                                "Search Course",
                                                            textalingCentre:
                                                                true,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              // Track Application
                                              if (controller.meetingZoneStatus
                                                      .trackApplication ==
                                                  true)
                                                InkWell(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        ApplicationSummary
                                                            .routeNamed);
                                                  },
                                                  child: Column(
                                                    children: [
                                                      Showcase(
                                                        descTextStyle: TextStyle(
                                                            color:
                                                                ThemeConstants
                                                                    .whitecolor,
                                                            fontSize: 18),
                                                        tooltipBackgroundColor:
                                                            ThemeConstants
                                                                .bluecolor,
                                                        overlayColor:
                                                            const Color
                                                                .fromARGB(
                                                                183, 0, 0, 0),
                                                        overlayOpacity: 0.8,
                                                        tooltipPadding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 5,
                                                                right: 5,
                                                                top: 10,
                                                                bottom: 10),
                                                        targetBorderRadius:
                                                            BorderRadius
                                                                .circular(18.0),
                                                        key: _five,
                                                        description:
                                                            "You can keep a track on your Application Stage and Status.",
                                                        child: Container(
                                                          constraints:
                                                              const BoxConstraints(
                                                            maxHeight: 52,
                                                            maxWidth: 52,
                                                          ),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(12),
                                                          decoration:
                                                              const BoxDecoration(
                                                                  // border: Border.all(
                                                                  //     width: 1.2,
                                                                  //     color: const Color(
                                                                  //         0xFF05B4D2)),
                                                                  color: Color(
                                                                      0xFFE8FAFD),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              20))),
                                                          child: svgImage(
                                                              "track",
                                                              const Color(
                                                                  0xFF05B4D2),
                                                              80,
                                                              80),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 10),
                                                        child: SizedBox(
                                                          width: 100,
                                                          child:
                                                              CustomAutoSizeTextMontserrat(
                                                            text:
                                                                "Track application",
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 13,
                                                            textalingCentre:
                                                                true,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              // InkWell(
                                              //   onTap: () {
                                              //     Get.to(StageProgress());
                                              //   },
                                              //   child: Column(
                                              //     children: [
                                              //       Container(
                                              //           height: 140,
                                              //           width: 140,
                                              //           decoration: BoxDecoration(
                                              //               border: Border.all(
                                              //                 width: 1.2,
                                              //                 color: ThemeConstants
                                              //                     .yellow,
                                              //               ),
                                              //               color: const Color(
                                              //                   0xFFFEF6E6),
                                              //               borderRadius:
                                              //                   const BorderRadius
                                              //                           .all(
                                              //                       Radius.circular(
                                              //                           20))),
                                              //           child: svgImage(
                                              //               "upload_document",
                                              //               const Color(0xFFF8A300),
                                              //               80,
                                              //               80)),
                                              //       Padding(
                                              //         padding: const EdgeInsets.only(
                                              //             top: 10),
                                              //         child: Text(
                                              //           "Upload document",
                                              //           style: _textStyle,
                                              //         ),
                                              //       ),
                                              //     ],
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        // const SizedBox(
                                        //   height: 15,
                                        // ),
                                        // if (controller.meetingZoneStatus
                                        //             .markAttendance ==
                                        //         true ||
                                        //     controller.meetingZoneStatus
                                        //             .expressPass ==
                                        //         true ||
                                        //     controller.meetingZoneStatus
                                        //             .expressPassGenerated ==
                                        //         true)
                                        //   const Padding(
                                        //     padding: EdgeInsets.symmetric(
                                        //         horizontal: 15, vertical: 10),
                                        //     child: DashboardEventSection(),
                                        //   ),

                                        if (controller.meetingZoneStatus
                                                .journeyItinerary ==
                                            true)
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 10),
                                            child: StageProgress(),
                                          ),

                                        SizedBox(
                                          height: 240,
                                          child: TestiMonial(
                                            testimonialsList:
                                                dashboardController
                                                    .testimonialsList,
                                            isLoading: dashboardController
                                                .testimonialsLoading,
                                          ),
                                        ),

                                        SizedBox(
                                          height: 240,
                                          child: YoutubeVideoSection(
                                            youtubeVideoModel:
                                                dashboardController
                                                    .youtubeVideoModel,
                                            isLoading: dashboardController
                                                .youtubeVideoLoading,
                                          ),
                                        ),
                                        // Upcoming Event
                                        // if (_.loadingUpcomingEvents.value == true)
                                        //   Padding(
                                        //     padding: const EdgeInsets.only(
                                        //       top: 15,
                                        //     ),
                                        //     child: Container(
                                        //         // width: displayMobileLayout == true
                                        //         //     ? MediaQuery.of(context).size.width - 240
                                        //         //     : MediaQuery.of(context).size.width * 0.90,
                                        //         constraints: const BoxConstraints(
                                        //             maxWidth: 300),
                                        //         child: Card(
                                        //           elevation: 0.7,
                                        //           shadowColor:
                                        //               const Color(0xFFE5E1FE),
                                        //           shape: const RoundedRectangleBorder(
                                        //             side: BorderSide(
                                        //                 color: Color(0xFFE5E1FE),
                                        //                 width: 1.0),
                                        //             borderRadius: BorderRadius.all(
                                        //                 Radius.circular(10)),
                                        //           ),
                                        //           child: Column(
                                        //             children: [
                                        //               Padding(
                                        //                 padding:
                                        //                     const EdgeInsets.only(
                                        //                         top: 10, left: 35),
                                        //                 child: Text(
                                        //                   "Upcoming Event",
                                        //                   style: GoogleFonts.roboto(
                                        //                     fontWeight:
                                        //                         FontWeight.bold,
                                        //                     fontSize: 26,
                                        //                   ),
                                        //                 ),
                                        //               ),
                                        //               Row(
                                        //                 children: [
                                        //                   Padding(
                                        //                     padding:
                                        //                         const EdgeInsets.only(
                                        //                             left: 5),
                                        //                     child: SizedBox(
                                        //                         width: 50,
                                        //                         child: svgImage(
                                        //                             "calender",
                                        //                             const Color(
                                        //                                 0xFF6F61FF),
                                        //                             70,
                                        //                             60)),
                                        //                   ),
                                        //                   Padding(
                                        //                     padding:
                                        //                         const EdgeInsets.only(
                                        //                             top: 5),
                                        //                     child: SizedBox(
                                        //                       width: displayMobileLayout == true
                                        //                           ? (MediaQuery.of(
                                        //                                           context)
                                        //                                       .size
                                        //                                       .width -
                                        //                                   240) *
                                        //                               0.70
                                        //                           : MediaQuery.of(
                                        //                                       context)
                                        //                                   .size
                                        //                                   .width *
                                        //                               0.70,
                                        //                       child: Column(
                                        //                         children: [
                                        //                           BulletedList(
                                        //                             crossAxisAlignment:
                                        //                                 CrossAxisAlignment
                                        //                                     .start,
                                        //                             bullet:
                                        //                                 const MyBullet(),
                                        //                             listItems: [
                                        //                               CustomAutoSizeText(
                                        //                                   text: _
                                        //                                       .upcomingModel![
                                        //                                           0]
                                        //                                       .campaignName,
                                        //                                   maxLines:
                                        //                                       3),
                                        //                             ],
                                        //                           ),
                                        //                           SizedBox(
                                        //                             width: MediaQuery.of(
                                        //                                         context)
                                        //                                     .size
                                        //                                     .width *
                                        //                                 0.70,
                                        //                             child: Padding(
                                        //                               padding:
                                        //                                   const EdgeInsets
                                        //                                           .only(
                                        //                                       left:
                                        //                                           38),
                                        //                               child: Text(_
                                        //                                   .upcomingModel![
                                        //                                       0]
                                        //                                   .campaignDate!),
                                        //                             ),
                                        //                           )
                                        //                         ],
                                        //                       ),
                                        //                     ),
                                        //                   )
                                        //                 ],
                                        //               ),
                                        //               TextButton(
                                        //                   onPressed: () {
                                        //                     Navigator.push(
                                        //                         context,
                                        //                         MaterialPageRoute(
                                        //                             builder: (context) =>
                                        //                                 UpcomingEvent(
                                        //                                   model: _
                                        //                                       .upcomingModel,
                                        //                                 )));

                                        //                     // Get.snackbar(
                                        //                     //   "DashBoard",
                                        //                     //   "View All",
                                        //                     //   snackPosition:
                                        //                     //       SnackPosition.BOTTOM,
                                        //                     // );
                                        //                   },
                                        //                   child:
                                        //                       const Text("View all"))
                                        //             ],
                                        //           ),
                                        //         )),
                                        //   ),

                                        const SizedBox(
                                          height: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Center(
                                child: getLoading(context),
                              ),
                    bottomNavigationBar: CustomButtomNavbar(
                      currentIndex: 0,
                      context2: context,
                    ),
                    floatingActionButtonLocation:
                        FloatingActionButtonLocation.miniEndFloat,
                    floatingActionButton: Showcase(
                      descTextStyle: TextStyle(
                          color: ThemeConstants.whitecolor, fontSize: 18),

                      tooltipBackgroundColor: ThemeConstants.bluecolor,
                      overlayColor: const Color.fromARGB(183, 0, 0, 0),
                      overlayOpacity: 0.8,
                      // targetBorderRadius: BorderRadius.circular(25.0),
                      // tooltipPadding: const EdgeInsets.only(0.0)
                      targetShapeBorder: const CircleBorder(),
                      key: _eight,
                      description:
                          "Need Assistance? Join the SIEC Virtual Office and meet your advisor.",

                      child: Container(
                        height: 75.0,
                        width: 75.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          // color: const Color(0xff1a84b8),
                          color: Colors.transparent,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: FittedBox(
                          child: FloatingActionButton(
                            elevation: 12,
                            // backgroundColor: ThemeConstants.GreenColor,
                            // child: Image.asset(
                            //   'assets/icons/ChatAssistantIcon.png',
                            //   color: ThemeConstants.whitecolor,
                            //   scale: 5,
                            // ),

                            //                                  svgImage(
                            // "video-call", ThemeConstants.whitecolor, 40, 30),
                            onPressed: () async {
                              // SVO Join Code
                              await _launchURL();
                              // isExtended: true,
                              // Overlay.of(context).insert(entry);
                            },
                            child: Icon(
                              Icons.add_ic_call_sharp,
                              color: ThemeConstants.whitecolor,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // BottomNavigation()

                    //  BottomAppBar(
                    //   shape: const CircularNotchedRectangle(),
                    //   notchMargin: 6.0,
                    //   child: SizedBox(
                    //     height: 60,
                    //     child: Row(
                    //       mainAxisSize: MainAxisSize.max,
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: <Widget>[
                    //         SizedBox(
                    //           height: 50,
                    //           width: 60,
                    //           child: Column(
                    //             children: [
                    //               Padding(
                    //                 padding: const EdgeInsets.only(left: 25),
                    //                 child: SizedBox(
                    //                   height: 50,
                    //                   width: 60,
                    //                   child: InkWell(
                    //                     splashColor: ThemeConstants.bluecolor,
                    //                     onTap: () {
                    //                       Get.toNamed(DashBoard.routeNamed);
                    //                     },
                    //                     child: Padding(
                    //                       padding: const EdgeInsets.only(bottom: 5),
                    //                       child: Column(
                    //                         mainAxisAlignment: MainAxisAlignment.center,
                    //                         children: <Widget>[
                    //                           svgImage("home", ThemeConstants.bluecolor,
                    //                               30, 30),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           height: 50,
                    //           width: 60,
                    //           child: Column(
                    //             children: [
                    //               Padding(
                    //                 padding: const EdgeInsets.only(left: 20),
                    //                 child: SizedBox(
                    //                   height: 46,
                    //                   width: 60,
                    //                   child: InkWell(
                    //                     splashColor: ThemeConstants.bluecolor,
                    //                     onTap: () {
                    //                       Get.toNamed(TrackyourTickets.routeNamed);
                    //                     },
                    //                     child: Column(
                    //                       mainAxisAlignment: MainAxisAlignment.center,
                    //                       children: <Widget>[
                    //                         Showcase(
                    //                             descTextStyle: TextStyle(
                    //                                 color: ThemeConstants.whitecolor,
                    //                                 fontSize: 18),
                    //                             tooltipBackgroundColor:
                    //                                 ThemeConstants.bluecolor,
                    //                             overlayColor: Color.fromARGB(183, 0, 0, 0),
                    //                             overlayOpacity: 0.8,
                    //                             // targetBorderRadius: BorderRadius.circular(25.0),
                    //                             // tooltipPadding: const EdgeInsets.only(0.0)
                    //                             targetShapeBorder:
                    //                                 const RoundedRectangleBorder(
                    //                                     borderRadius: BorderRadius.all(
                    //                                         Radius.circular(20))),
                    //                             key: _11,
                    //                             description:
                    //                                 "You can track updates on your ticket from this section.",
                    //                             child: Icon(
                    //                               Icons.track_changes_sharp,
                    //                               size: 35,
                    //                               color: ThemeConstants.TextColor,
                    //                             )),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         Center(
                    //             child: Padding(
                    //           padding: const EdgeInsets.only(top: 30, left: 5),
                    //           child: CustomAutoSizeTextMontserrat(
                    //             text: "Join SVO link",
                    //             textColor: ThemeConstants.bluecolor,
                    //             fontSize: 13,
                    //           ),
                    //         )),
                    //         SizedBox(
                    //           height: 50,
                    //           width: 60,
                    //           child: Column(
                    //             children: [
                    //               Padding(
                    //                 padding: const EdgeInsets.only(left: 20),
                    //                 child: SizedBox(
                    //                   height: 46,
                    //                   width: 60,
                    //                   child: InkWell(
                    //                     splashColor: Colors.transparent,
                    //                     onTap: () {
                    //                       Get.toNamed(RaiseYourTicket.routeNamed);
                    //                     },
                    //                     child: Column(
                    //                       mainAxisAlignment: MainAxisAlignment.center,
                    //                       children: <Widget>[
                    //                         Showcase(
                    //                             descTextStyle: TextStyle(
                    //                                 color: ThemeConstants.whitecolor,
                    //                                 fontSize: 18),
                    //                             tooltipBackgroundColor:
                    //                                 ThemeConstants.bluecolor,
                    //                             overlayColor: Color.fromARGB(183, 0, 0, 0),
                    //                             overlayOpacity: 0.8,
                    //                             // targetBorderRadius: BorderRadius.circular(25.0),
                    //                             // tooltipPadding: const EdgeInsets.only(0.0)
                    //                             targetShapeBorder:
                    //                                 const RoundedRectangleBorder(
                    //                                     borderRadius: BorderRadius.all(
                    //                                         Radius.circular(20))),
                    //                             key: _12,
                    //                             description:
                    //                                 "Need a help? Quicky raise a ticket at Gradlynk support and in minimal time, query shall be resolved.",
                    //                             child: Icon(
                    //                               Icons.help_outline_sharp,
                    //                               size: 35,
                    //                               color: ThemeConstants.TextColor,
                    //                             )),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           height: 50,
                    //           width: 60,
                    //           child: Column(
                    //             children: [
                    //               SizedBox(
                    //                 height: 46,
                    //                 width: 50,
                    //                 child: InkWell(
                    //                   splashColor: ThemeConstants.bluecolor,
                    //                   onTap: () {
                    //                     Get.toNamed(ProfilePageCopy1.routeNamed);
                    //                   },
                    //                   child: Padding(
                    //                     padding: const EdgeInsets.only(bottom: 5),
                    //                     child: Column(
                    //                       mainAxisAlignment: MainAxisAlignment.center,
                    //                       children: <Widget>[
                    //                         svgImage("profile-bottom",
                    //                             ThemeConstants.IconColor, 30, 30),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //               const Spacer()
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ) // bottomNavigationBar:
                    //                     //     CustomButtomNavbar(currentIndex: 0, context2: context),

                    // floatingActionButton: Showcase(
                    //   descTextStyle:
                    //       TextStyle(color: ThemeConstants.whitecolor, fontSize: 18),
                    //   tooltipBackgroundColor: ThemeConstants.bluecolor,
                    //   overlayColor: Color.fromARGB(183, 0, 0, 0),
                    //   overlayOpacity: 0.8,
                    //   targetBorderRadius: BorderRadius.circular(25.0),
                    //   tooltipPadding:
                    //       const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                    //   targetShapeBorder: const RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(20))),
                    //   key: _eight,
                    //   description:
                    //       "Need Assistance? Join the SIEC Virtual Office and meet your advisor.",
                    //   child: FloatingActionButton.extended(
                    //     tooltip: "SVO",
                    //     backgroundColor: ThemeConstants.bluecolor,
                    //     onPressed: () async {
                    //       // SVO Join Code
                    //       await _launchURL();
                    //       // isExtended: true,
                    //     },
                    //     icon: svgImage("video-call", ThemeConstants.whitecolor, 40, 30),
                    //     label: CustomAutoSizeTextMontserrat(
                    //       text: "Join SVO",
                    //       textColor: ThemeConstants.whitecolor,
                    //     ),
                    //   ),
                    // ),
                  ));
        }));
  }

  Container buildDot(int index, BuildContext context) {
    bool visited = currentIndex == index;
    return Container(
      height: 8,
      width: 8, //currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: visited ? const Color(0xff1065c0) : const Color(0xffD1D1D6),
      ),
    );
  }

  caraouselList() {
    List<Widget> model = [];
    for (var i = 0; i < controller.carouselList.length; i++) {
      var data = GestureDetector(
        onTap: () {
          _launchBannerL('${controller.carouselList[i].imageLink}');
        },
        child: AspectRatio(
          aspectRatio: 2.19,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(100)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: '${controller.carouselList[i].mobileImage}'),
            ),
          ),
        ),
      );
      model.add(data);
    }

    return model;
  }

  callbackDropDownButton(varTopic) {}

  _launchBannerL(String link) async {
    // final call = Uri.parse('tel:+91 8394049598');
    // if (await canLaunchUrl(call)) {
    //   launchUrl(call);
    // } else {
    //   throw 'Could not launch $call';
    // }

    var url = link;
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL() async {
    // final call = Uri.parse('tel:+91 8394049598');
    // if (await canLaunchUrl(call)) {
    //   launchUrl(call);
    // } else {
    //   throw 'Could not launch $call';
    // }

    const url =
        'https://zoom.us/j/97485138279?pwd=Y1cwcXRHUWZWOFN3aTZOdmhHZm4yQT09';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class MyBullet extends StatelessWidget {
  const MyBullet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      width: 7,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
