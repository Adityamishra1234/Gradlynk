import 'dart:async';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/controllers/dashboardcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/versioncontroller.dart';
import 'package:studentpanel/ui/models/commonuploaddocument.dart';
import 'package:studentpanel/ui/screen/My_Application/applicationsummary.dart';
import 'package:studentpanel/ui/screen/Profile_module_2/profile_view.dart';
import 'package:studentpanel/ui/screen/course_search/coursesearch.dart';
import 'package:studentpanel/ui/screen/course_search/coursesearch2.dart';
import 'package:studentpanel/ui/screen/dashboard/bookanappointment.dart';
import 'package:studentpanel/ui/screen/dashboard/notification.dart';
import 'package:studentpanel/ui/screen/dashboard/testimonials.dart';
import 'package:studentpanel/ui/screen/dashboard/youtube_video_section.dart';
import 'package:studentpanel/ui/screen/fund/fund_requiremen.dart';
import 'package:studentpanel/ui/screen/fund/plan_fund.dart';
import 'package:studentpanel/ui/screen/mark_attendance/code_screen.dart';
import 'package:studentpanel/ui/screen/letsGetStarted/letsGetStartedMainVIew.dart';
import 'package:studentpanel/ui/screen/mark_attendance/intake_screen.dart';
import 'package:studentpanel/ui/screen/registeration/registeration_main_view.dart';
import 'package:studentpanel/ui/screen/test/stage_profilemodule.dart';
import 'package:studentpanel/ui/screen/upload_document/uploaddocument.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customBottomNavbar.dart';
import 'package:studentpanel/widgets/custom_dialog_box.dart';

import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
import 'package:studentpanel/widgets/dashboardeventSection.dart';
import 'package:studentpanel/widgets/drawerfilter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'fund/sponsorDetails.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({
    Key? key,
  }) : super(key: key);
  static const routeNamed = '/DashBoard';

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  var controller = Get.put(BaseController(), permanent: true);
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

  final _currentIndex = 0;

  @override
  void initState() {
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
    Get.find<BaseController>().profiledetail();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CarouselController controller = CarouselController();

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
          return GetBuilder<BaseController>(builder: (_) {
            return Scaffold(
              drawerScrimColor: const Color.fromARGB(110, 255, 255, 255),
              backgroundColor: const Color.fromARGB(255, 248, 252, 255),
              key: _scaffoldKey,
              appBar: AppBar(
                elevation: 0,
                actions: [
                  if (displayMobileLayout == true)
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Get.back(),
                    ),
                  if (displayMobileLayout == false)
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Showcase(
                        descTextStyle: TextStyle(
                            color: ThemeConstants.whitecolor, fontSize: 18),
                        tooltipBackgroundColor: ThemeConstants.bluecolor,
                        overlayColor: const Color.fromARGB(255, 0, 0, 0),
                        overlayOpacity: 0.8,
                        key: _nine,
                        description:
                            "Your Navigation drawer is your easy to access all features zone.",
                        child: IconButton(
                          icon: svgImage(
                              "menu", ThemeConstants.IconColor, 35, 35),
                          onPressed: () {
                            _scaffoldKey.currentState!.openDrawer();

                            DrawerFilter();
                          },
                        ),
                      ),
                    ),
                  svgImage("work", Colors.transparent, 32, 32),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Image.network(
                      "https://sieceducation.in/assets/assets/images/logo.png",
                      width: 150,
                      height: 50,
                    ),
                  ),
                  const Spacer(),
                  Showcase(
                    descTextStyle: TextStyle(
                        color: ThemeConstants.whitecolor, fontSize: 18),
                    tooltipBackgroundColor: ThemeConstants.bluecolor,
                    overlayColor: const Color.fromARGB(178, 0, 0, 0),
                    overlayOpacity: 0.8,
                    key: _ten,
                    description:
                        "The bell rings with an updated notification at your doors.",
                    child: IconButton(
                      icon: svgImage(
                          "notification", ThemeConstants.IconColor, 30, 30),
                      onPressed: () {
                        //TODO
                        Get.to(const NotificationScreen());
                      },
                    ),
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

              // appbar == true
              //     ? controller.loadingStudentPanelData1.value == true
              //         ? CustomAppBar("DashBoard", true)
              //         : null
              //     : null,
              drawer: displayMobileLayout == false
                  ? CustomDrawer(
                      index: 0,
                    )
                  : null,
              body:
                  // setState(() {});
                  _.loadingStudentPanelData1.value == true
                      ? Row(
                          children: [
                            if (displayMobileLayout == true)
                              CustomDrawer(
                                index: 0,
                              ),
                            Container(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: displayMobileLayout == true
                                    ? MediaQuery.of(context).size.width - 240
                                    : MediaQuery.of(context).size.width,
                                child: ListView(
                                  controller: Scrollcontroller,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: SizedBox(
                                        height: 95,
                                        width: displayMobileLayout == true
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                240
                                            : MediaQuery.of(context).size.width,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Align(
                                                alignment: AlignmentDirectional
                                                    .topStart,
                                                child: Text(
                                                  "Hi,",
                                                  style: GoogleFonts.roboto(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 30,
                                                      textStyle:
                                                          const TextStyle()),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Align(
                                                  alignment:
                                                      AlignmentDirectional
                                                          .topStart,
                                                  child: SizedBox(
                                                    // width: MediaQuery.of(context)
                                                    //         .size
                                                    //         .width /
                                                    //     2,
                                                    child: Showcase.withWidget(
                                                      disableDefaultTargetGestures:
                                                          true,
                                                      onTargetClick: () {
                                                        ShowCaseWidget.of(
                                                                context)
                                                            .next();
                                                        Scrollcontroller.jumpTo(
                                                            Scrollcontroller
                                                                .position
                                                                .maxScrollExtent);
                                                      },
                                                      disableMovingAnimation:
                                                          true,
                                                      // descTextStyle: TextStyle(
                                                      //     color: ThemeConstants
                                                      //         .whitecolor,
                                                      //     fontSize: 18),
                                                      // tooltipBackgroundColor:
                                                      //     ThemeConstants.bluecolor,
                                                      overlayColor:
                                                          const Color.fromARGB(
                                                              183, 0, 0, 0),
                                                      overlayOpacity: 0.8,
                                                      // tooltipPadding:
                                                      //     const EdgeInsets.only(
                                                      //         left: 5,
                                                      //         right: 5,
                                                      //         top: 10,
                                                      //         bottom: 10),
                                                      targetShapeBorder:
                                                          const RoundedRectangleBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          20))),
                                                      key: _one,
                                                      // description:
                                                      //     'Hi, Welcome to Gradlynk. Your international Education Partner.',
                                                      container: InkWell(
                                                        onTap: () {
                                                          ShowCaseWidget.of(
                                                                  context)
                                                              .next();
                                                          Scrollcontroller.jumpTo(
                                                              Scrollcontroller
                                                                  .position
                                                                  .maxScrollExtent);
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            top: 10,
                                                          ),
                                                          child: SizedBox(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.7,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            child: Column(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional
                                                                          .topStart,
                                                                  child:
                                                                      Container(
                                                                    decoration: BoxDecoration(
                                                                        color: ThemeConstants
                                                                            .bluecolor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0)),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .all(
                                                                          10.0),
                                                                      child:
                                                                          SizedBox(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.8,
                                                                        child:
                                                                            CustomAutoSizeTextMontserrat(
                                                                          text:
                                                                              "Hi, Welcome to Gradlynk. Your international Education Partner.",
                                                                          textColor:
                                                                              ThemeConstants.whitecolor,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                const Spacer(),
                                                                InkWell(
                                                                  onTap: () {
                                                                    ShowCaseWidget.of(
                                                                            context)
                                                                        .dismiss();
                                                                  },
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            40,
                                                                        bottom:
                                                                            60),
                                                                    child: Align(
                                                                        alignment: AlignmentDirectional.topEnd,
                                                                        child: Row(
                                                                          children: [
                                                                            const Spacer(),
                                                                            CustomAutoSizeTextMontserrat(
                                                                              text: "Skip",
                                                                              textColor: ThemeConstants.whitecolor,
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                            Icon(
                                                                              Icons.skip_next,
                                                                              color: ThemeConstants.whitecolor,
                                                                            )
                                                                          ],
                                                                        )),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      height:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .height,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child:
                                                          CustomAutoSizeTextMontserrat(
                                                        text: firstLetterChaptial(_
                                                                .personalModal
                                                                .enquiryName) ??
                                                            firstLetterChaptial(_
                                                                .model1
                                                                .enquiryName),
                                                        maxLines: 2,
                                                        fontSize: 35,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                            const Divider(
                                              thickness: 1,
                                              indent: 30,
                                              endIndent: 30,
                                              color: Color(0xFFD6D6D6),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    Container(
                                      padding: const EdgeInsets.only(
                                          bottom: 10, top: 1),
                                      height: 200,
                                      child: CarouselSlider(
                                        options: CarouselOptions(
                                          autoPlay: true,
                                          aspectRatio: 16 / 9,
                                          viewportFraction: 1,
                                          enlargeCenterPage: false,
                                          enlargeStrategy:
                                              CenterPageEnlargeStrategy.height,
                                        ),
                                        items: [...caraouselList()],
                                      ),
                                    ),

                                    SizedBox(
                                      height: 10,
                                    ),
                                    // Schedule Expert Call Button And Book an Appointment
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // const SizedBox(
                                        //   width: 20,
                                        // ),

                                        GestureDetector(
                                          onTap: () {
                                            print('dddd');
                                            // contactUsDialog(context);
                                            contactUsDialog(context);
                                          },
                                          child: SizedBox(
                                            height: 70,
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
                                              alignment: Alignment.bottomCenter,
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  height: 60,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      color: ThemeConstants
                                                          .bluecolor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              17)),
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
                                                                horizontal: 8),
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
                                                          fontSize: 5,
                                                          textColor:
                                                              Colors.white,
                                                        ),
                                                      ),
                                                      CustomAutoSizeTextMontserrat(
                                                        text: "Contact us Now",
                                                        fontSize: 20,
                                                        textColor: Colors.white,
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
                                                    alignment: Alignment.center,
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
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/icons/dialer_icon.svg',
                                                            color:
                                                                ThemeConstants
                                                                    .whitecolor,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),

                                    Container(
                                      height: 120,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      width: MediaQuery.of(context).size.width,
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
                                              // showAnimatedDialog(
                                              //     animationType:
                                              //         DialogTransitionType
                                              //             .slideFromBottomFade,
                                              //     curve: Curves.easeInOutQuart,
                                              //     context: context,
                                              //     builder: (_) =>
                                              //         BookAnAppointment());
                                              // getBookAnAppointment(context);
                                              // getDailogForAgree(context);
                                              Get.to(CodeScreen());
                                              // Get.to(LetsGetStartedMainView());
                                              // Get.toNamed(
                                              //     ProfileView.routeNamed);
                                            },
                                            child: Column(
                                              children: [
                                                Showcase(
                                                  descTextStyle: TextStyle(
                                                      color: ThemeConstants
                                                          .whitecolor,
                                                      fontSize: 18),
                                                  tooltipBackgroundColor:
                                                      ThemeConstants.bluecolor,
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
                                                          BoxConstraints(
                                                              maxHeight: 70,
                                                              maxWidth: 70),
                                                      padding: const EdgeInsets
                                                          .all(10),
                                                      decoration:
                                                          const BoxDecoration(
                                                              // border: Border.all(
                                                              //     width: 1.2,
                                                              //     color: ThemeConstants
                                                              //         .VioletColor),
                                                              color: Color(
                                                                  0xFFF1F0FF),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
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
                                              Get.toNamed(
                                                  UploadDocument.routeNamed);
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
                                                      ThemeConstants.bluecolor,
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
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                  key: _three,
                                                  description:
                                                      "All documents required for your Application to be uploaded here.",
                                                  child: Container(
                                                      constraints:
                                                          const BoxConstraints(
                                                              maxHeight: 70,
                                                              maxWidth: 70),
                                                      padding: const EdgeInsets
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
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
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
                                                      text: "Upload document",
                                                      textalingCentre: true,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          //Course Search
                                          InkWell(
                                            onTap: () {
                                              Get.toNamed(
                                                  CourseSearch2.routeNamed);
                                            },
                                            child: Column(
                                              children: [
                                                Showcase(
                                                  descTextStyle: TextStyle(
                                                      color: ThemeConstants
                                                          .whitecolor,
                                                      fontSize: 18),
                                                  tooltipBackgroundColor:
                                                      ThemeConstants.bluecolor,
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
                                                  key: _four,
                                                  description:
                                                      "Course Search assists you in searching your desired course across the globe.",
                                                  child: Container(
                                                      padding: const EdgeInsets
                                                          .all(10),
                                                      constraints:
                                                          const BoxConstraints(
                                                              maxHeight: 70,
                                                              maxWidth: 70),
                                                      decoration:
                                                          const BoxDecoration(
                                                              // border: Border.all(
                                                              //     width: 1.2,
                                                              //     color: const Color(
                                                              //         0xFFF16660)),
                                                              color: Color(
                                                                  0xFFFEF0F0),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
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
                                                      const EdgeInsets.only(
                                                          top: 10),
                                                  child: SizedBox(
                                                    width: 80,
                                                    child:
                                                        CustomAutoSizeTextMontserrat(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      text: "Course Search",
                                                      textalingCentre: true,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          // Track Application
                                          InkWell(
                                            onTap: () {
                                              Get.toNamed(ApplicationSummary
                                                  .routeNamed);
                                            },
                                            child: Column(
                                              children: [
                                                Showcase(
                                                  descTextStyle: TextStyle(
                                                      color: ThemeConstants
                                                          .whitecolor,
                                                      fontSize: 18),
                                                  tooltipBackgroundColor:
                                                      ThemeConstants.bluecolor,
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
                                                  key: _five,
                                                  description:
                                                      "You can keep a track on your Application Stage and Status.",
                                                  child: Container(
                                                    constraints: BoxConstraints(
                                                        maxHeight: 70,
                                                        maxWidth: 70),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12),
                                                    decoration:
                                                        const BoxDecoration(
                                                            // border: Border.all(
                                                            //     width: 1.2,
                                                            //     color: const Color(
                                                            //         0xFF05B4D2)),
                                                            color: Color(
                                                                0xFFE8FAFD),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20))),
                                                    child: svgImage(
                                                        "track",
                                                        const Color(0xFF05B4D2),
                                                        80,
                                                        80),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10),
                                                  child: SizedBox(
                                                    width: 100,
                                                    child:
                                                        CustomAutoSizeTextMontserrat(
                                                      text: "Track application",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      textalingCentre: true,
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
                                    SizedBox(
                                      height: 15,
                                    ),

                                    // Padding(
                                    //   padding: const EdgeInsets.symmetric(
                                    //       horizontal: 15, vertical: 10),
                                    //   child: DashboardEventSection(),
                                    // ),

                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      child: StageProgress(),
                                    ),

                                    TestiMonial(
                                      testimonialsList:
                                          dashboardController.testimonialsList,
                                    ),

                                    YoutubeVideoSection(
                                        link: dashboardController
                                            .youtubeVideoLink),
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
                            ),
                          ],
                        )
                      : Center(
                          child: getLoading(context),
                        ),
              // floatingActionButtonLocation:
              //     FloatingActionButtonLocation.centerDocked,
              // floatingActionButton: Showcase(
              //   descTextStyle:
              //       TextStyle(color: ThemeConstants.whitecolor, fontSize: 18),
              //   tooltipBackgroundColor: ThemeConstants.bluecolor,
              //   overlayColor: Color.fromARGB(183, 0, 0, 0),
              //   overlayOpacity: 0.8,
              //   // targetBorderRadius: BorderRadius.circular(25.0),
              //   // tooltipPadding: const EdgeInsets.only(0.0)
              //   targetShapeBorder: const CircleBorder(),
              //   key: _eight,
              //   description:
              //       "Need Assistance? Join the SIEC Virtual Office and meet your advisor.",

              //   child: Container(
              //     height: 75.0,
              //     width: 75.0,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(80),
              //       color: ThemeConstants.bluecolor,
              //     ),
              //     padding: EdgeInsets.all(15),
              //     child: FittedBox(
              //       child: FloatingActionButton(
              //         backgroundColor: ThemeConstants.bluecolor,
              //         child: SvgPicture.asset(
              //           'assets/icons/chatbot icon.svg',
              //           color: ThemeConstants.whitecolor,
              //         ),

              //         //                                  svgImage(
              //         // "video-call", ThemeConstants.whitecolor, 40, 30),
              //         onPressed: () async {
              //           // SVO Join Code
              //           await _launchURL();
              //           // isExtended: true,
              //           // Overlay.of(context).insert(entry);
              //         },
              //       ),
              //     ),
              //   ),
              // ),

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
              // )

              bottomNavigationBar:
                  CustomButtomNavbar(currentIndex: 0, context2: context),

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
            );
          });
        }));
  }

  caraouselList() {
    List<Widget> model = [];
    for (var i = 0; i < controller.carouselList.length; i++) {
      var data = GestureDetector(
        onTap: () {
          _launchBannerL('${controller.carouselList[i].imageLink}');
        },
        child: AspectRatio(
          aspectRatio: 16 / 8.5,
          child: Container(
            // width: double.infinity,
            // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(100)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                  fit: BoxFit.cover,
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
