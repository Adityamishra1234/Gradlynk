// import 'dart:async';
// import 'dart:math' as math;
// import 'package:cached_network_svg_image/cached_network_svg_image.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:showcaseview/showcaseview.dart';
// import 'package:bulleted_list/bulleted_list.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:studentpanel/ui/controllers/basecontroller.dart';
// import 'package:studentpanel/ui/controllers/dashboardcontroller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:studentpanel/ui/controllers/versioncontroller.dart';
// import 'package:studentpanel/ui/models/upcomingevent.dart';
// import 'package:studentpanel/ui/screen/My_Application/applicationsummary.dart';
// import 'package:studentpanel/ui/screen/Profile_Module/profile_page_copy.dart';
// import 'package:studentpanel/ui/screen/Profile_Module/profilepage.dart';
// import 'package:studentpanel/ui/screen/course_search/coursesearch.dart';
// import 'package:studentpanel/ui/screen/dashboard/bookanappointment.dart';
// import 'package:studentpanel/ui/screen/dashboard/notification.dart';
// import 'package:studentpanel/ui/screen/dashboard/scheduleExpertCall.dart';
// import 'package:studentpanel/ui/screen/dashboard/upcomingevent.dart';
// import 'package:studentpanel/ui/screen/gradlynk_support/raise_new_ticket.dart';
// import 'package:studentpanel/ui/screen/gradlynk_support/track_your_tickets.dart';
// import 'package:studentpanel/ui/screen/test/downloadtestfile.dart';
// import 'package:studentpanel/ui/screen/test/uploadfile.dart';
// import 'package:studentpanel/ui/screen/track_application/trackapllication.dart';
// import 'package:studentpanel/ui/screen/updatedialog.dart';
// import 'package:studentpanel/ui/screen/upload_document/uploaddocument.dart';
// import 'package:studentpanel/utils/constants.dart';
// import 'package:studentpanel/utils/theme.dart';
// import 'package:studentpanel/widgets/appbar.dart';
// import 'package:studentpanel/widgets/bottomnavigation.dart';
// import 'package:studentpanel/widgets/customBottomNavbar.dart';
// import 'package:studentpanel/widgets/custom_dialog_box.dart';
// import 'package:studentpanel/widgets/customautosizetext.dart';
// import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
// import 'package:studentpanel/widgets/customdrawer.dart';
// import 'package:studentpanel/widgets/drawerfilter.dart';
// import 'package:studentpanel/widgets/file_download.dart';
// import 'package:studentpanel/widgets/test.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:cached_network_image/cached_network_image.dart';

// import 'package:carousel_slider/carousel_slider.dart';

// class DashBoard2 extends StatefulWidget {
//   const DashBoard2({
//     Key? key,
//   }) : super(key: key);
//   static const routeNamed = '/DashBoard';

//   @override
//   State<DashBoard2> createState() => _DashBoard2State();
// }

// class _DashBoard2State extends State<DashBoard2> {
//   var controller = Get.put(BaseController(), permanent: true);
//   var controller1 = Get.put(VersionController(), permanent: true);
//   var dashboardController = Get.put(DashboardController());
//   final TextStyle _textStyle = GoogleFonts.roboto(
//     fontWeight: FontWeight.w800,
//     fontSize: 17,
//   );
//   bool appbar = false;
//   bool showcase = false;
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

//   final GlobalKey _one = GlobalKey();
//   final GlobalKey _two = GlobalKey();
//   final GlobalKey _three = GlobalKey();
//   final GlobalKey _four = GlobalKey();
//   final GlobalKey _five = GlobalKey();
//   final GlobalKey _six = GlobalKey();
//   final GlobalKey _seven = GlobalKey();
//   final GlobalKey _eight = GlobalKey();
//   final GlobalKey _nine = GlobalKey();
//   final GlobalKey _ten = GlobalKey();
//   final GlobalKey _11 = GlobalKey();
//   final GlobalKey _12 = GlobalKey();
//   BuildContext? myContext;

//   var _currentIndex = 0;

//   @override
//   void initState() {
//     try {
//       if (Get.arguments) {
//         ambiguate(WidgetsBinding.instance)?.addPostFrameCallback(
//           (_) => Future.delayed(const Duration(milliseconds: 200), () {
//             ShowCaseWidget.of(myContext!).startShowCase([
//               _one,
//               _two,
//               _three,
//               _four,
//               _five,
//               _six,
//               _seven,
//               _11,
//               _eight,
//               _12,
//               _nine,
//               _ten
//             ]);
//           }),
//         );
//         showcase = true;
//       } else {
//         appbar = true;
//       }
//     } catch (e) {}
//     // Get.find<BaseController>().profiledetail();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;

//     final CarouselController _controller = CarouselController();

//     final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;

//     final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;

//     return ShowCaseWidget(onComplete: (p0, p1) {
//       print(p0);
//       if (p0 == 5) {
//         appbar = true;
//         setState(() {});
//       }
//     }, builder: Builder(builder: (context) {
//       myContext = context;
//       return GetBuilder<BaseController>(builder: (_) {
//         return Scaffold(
//           key: _scaffoldKey,
//           appBar: AppBar(
//             elevation: 0,
//             actions: [
//               if (displayMobileLayout == true)
//                 IconButton(
//                   icon: const Icon(Icons.arrow_back, color: Colors.black),
//                   onPressed: () => Get.back(),
//                 ),
//               if (displayMobileLayout == false)
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10),
//                   child: Showcase(
//                     descTextStyle: TextStyle(
//                         color: ThemeConstants.whitecolor, fontSize: 18),
//                     tooltipBackgroundColor: ThemeConstants.bluecolor,
//                     overlayColor: Colors.black54,
//                     overlayOpacity: 0.40,
//                     key: _nine,
//                     description:
//                         "Need a help? Quicky raise a ticket at Gradlynk support and in minimal time, query shall be resolved.",
//                     child: IconButton(
//                       icon: svgImage("menu", ThemeConstants.IconColor, 35, 35),
//                       onPressed: () {
//                         _scaffoldKey.currentState!.openDrawer();

//                         DrawerFilter();
//                       },
//                     ),
//                   ),
//                 ),
//               svgImage("work", Colors.transparent, 32, 32),
//               const Spacer(),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: Image.network(
//                   "https://sieceducation.in/assets/assets/images/logo.png",
//                   width: 150,
//                   height: 50,
//                 ),
//               ),
//               const Spacer(),
//               Showcase(
//                 descTextStyle:
//                     TextStyle(color: ThemeConstants.whitecolor, fontSize: 18),
//                 tooltipBackgroundColor: ThemeConstants.bluecolor,
//                 overlayColor: Colors.black54,
//                 overlayOpacity: 0.40,
//                 key: _ten,
//                 description:
//                     "The bell rings with an updated notification at your doors.",
//                 child: IconButton(
//                   icon: svgImage(
//                       "notification", ThemeConstants.IconColor, 30, 30),
//                   onPressed: () {
//                     Get.to(const NotificationScreen());
//                   },
//                 ),
//               ),
//               // IconButton(
//               //   icon: SvgPicture.asset(
//               //     "assets/icons/profile.svg",
//               //     height: 30,
//               //     color: const Color.fromARGB(255, 99, 99, 99),
//               //   ),
//               //   onPressed: () {
//               //     Get.toNamed(ProfilePage.routeNamed);
//               //   },
//               // ),

//               const SizedBox(
//                 width: 5,
//               )
//             ],
//             // title: Text(
//             //   title,
//             //   style: const TextStyle(color: Colors.black),
//             // ),
//             backgroundColor: Colors.white,
//           ),

//           // appbar == true
//           //     ? controller.loadingStudentPanelData1.value == true
//           //         ? CustomAppBar("DashBoard", true)
//           //         : null
//           //     : null,
//           drawer: displayMobileLayout == false
//               ? CustomDrawer(
//                   index: 0,
//                 )
//               : null,
//           body:
//               // setState(() {});
//               _.loadingStudentPanelData1.value == true
//                   ? Row(
//                       children: [
//                         if (displayMobileLayout == true)
//                           CustomDrawer(
//                             index: 0,
//                           ),
//                         Container(
//                           color: Colors.white,
//                           child: SizedBox(
//                             height: MediaQuery.of(context).size.height,
//                             width: displayMobileLayout == true
//                                 ? MediaQuery.of(context).size.width - 240
//                                 : MediaQuery.of(context).size.width,
//                             child: ListView(
//                               controller: ScrollController(),
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 10),
//                                   child: SizedBox(
//                                     height: height * 0.12,
//                                     width: displayMobileLayout == true
//                                         ? MediaQuery.of(context).size.width -
//                                             240
//                                         : MediaQuery.of(context).size.width,
//                                     child: Column(
//                                       children: [
//                                         Padding(
//                                           padding:
//                                               const EdgeInsets.only(left: 20),
//                                           child: Align(
//                                             alignment:
//                                                 AlignmentDirectional.topStart,
//                                             child: Text(
//                                               "Hi,",
//                                               style: GoogleFonts.roboto(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: height * 0.03,
//                                                   textStyle: const TextStyle()),
//                                             ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               const EdgeInsets.only(left: 20),
//                                           child: Align(
//                                               alignment:
//                                                   AlignmentDirectional.topStart,
//                                               child: SizedBox(
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width /
//                                                     2,
//                                                 height: 50,
//                                                 child: Showcase.withWidget(
//                                                   disableDefaultTargetGestures:
//                                                       true,
//                                                   onTargetClick: () {
//                                                     ShowCaseWidget.of(context)
//                                                         .next();
//                                                   },
//                                                   disableMovingAnimation: true,
//                                                   // descTextStyle: TextStyle(
//                                                   //     color: ThemeConstants
//                                                   //         .whitecolor,
//                                                   //     fontSize: 18),
//                                                   // tooltipBackgroundColor:
//                                                   //     ThemeConstants.bluecolor,
//                                                   overlayColor: Colors.black54,
//                                                   overlayOpacity: 0.40,
//                                                   // tooltipPadding:
//                                                   //     const EdgeInsets.only(
//                                                   //         left: 5,
//                                                   //         right: 5,
//                                                   //         top: 10,
//                                                   //         bottom: 10),
//                                                   targetShapeBorder:
//                                                       const RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius.all(
//                                                                   Radius
//                                                                       .circular(
//                                                                           20))),
//                                                   key: _one,
//                                                   // description:
//                                                   //     'Hi, Welcome to Gradlynk. Your international Education Partner.',
//                                                   container: InkWell(
//                                                     onTap: () {
//                                                       ShowCaseWidget.of(context)
//                                                           .next();
//                                                     },
//                                                     child: Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               top: 10),
//                                                       child: Container(
//                                                         height: MediaQuery.of(
//                                                                     context)
//                                                                 .size
//                                                                 .height *
//                                                             0.7,
//                                                         width: MediaQuery.of(
//                                                                 context)
//                                                             .size
//                                                             .width,
//                                                         child: Column(
//                                                           children: [
//                                                             Align(
//                                                               alignment:
//                                                                   AlignmentDirectional
//                                                                       .topStart,
//                                                               child: Container(
//                                                                 decoration: BoxDecoration(
//                                                                     color: ThemeConstants
//                                                                         .bluecolor,
//                                                                     borderRadius:
//                                                                         BorderRadius.circular(
//                                                                             8.0)),
//                                                                 child: Padding(
//                                                                   padding:
//                                                                       const EdgeInsets
//                                                                               .all(
//                                                                           10.0),
//                                                                   child:
//                                                                       SizedBox(
//                                                                     width: MediaQuery.of(context)
//                                                                             .size
//                                                                             .width *
//                                                                         0.8,
//                                                                     child:
//                                                                         CustomAutoSizeTextMontserrat(
//                                                                       text:
//                                                                           "Hi, Welcome to Gradlynk. Your international Education Partner.",
//                                                                       textColor:
//                                                                           ThemeConstants
//                                                                               .whitecolor,
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             const Spacer(),
//                                                             InkWell(
//                                                               onTap: () {
//                                                                 ShowCaseWidget.of(
//                                                                         context)
//                                                                     .dismiss();
//                                                               },
//                                                               child: Padding(
//                                                                 padding:
//                                                                     const EdgeInsets
//                                                                             .only(
//                                                                         right:
//                                                                             40,
//                                                                         bottom:
//                                                                             60),
//                                                                 child: Align(
//                                                                     alignment:
//                                                                         AlignmentDirectional
//                                                                             .topEnd,
//                                                                     child: Row(
//                                                                       children: [
//                                                                         const Spacer(),
//                                                                         CustomAutoSizeTextMontserrat(
//                                                                           text:
//                                                                               "Skip",
//                                                                           textColor:
//                                                                               ThemeConstants.whitecolor,
//                                                                           fontSize:
//                                                                               18,
//                                                                           fontWeight:
//                                                                               FontWeight.bold,
//                                                                         ),
//                                                                         Icon(
//                                                                           Icons
//                                                                               .skip_next,
//                                                                           color:
//                                                                               ThemeConstants.whitecolor,
//                                                                         )
//                                                                       ],
//                                                                     )),
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   height: MediaQuery.of(context)
//                                                       .size
//                                                       .height,
//                                                   width: MediaQuery.of(context)
//                                                       .size
//                                                       .width,
//                                                   child:
//                                                       CustomAutoSizeTextMontserrat(
//                                                     text: firstLetterChaptial(_
//                                                             .personalModal
//                                                             .enquiryName) ??
//                                                         firstLetterChaptial(_
//                                                             .model1
//                                                             .enquiryName),
//                                                     maxLines: 2,
//                                                     fontSize: height * 0.045,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               )),
//                                         ),
//                                         const Divider(
//                                           thickness: 1,
//                                           indent: 30,
//                                           endIndent: 30,
//                                           color: Color(0xFFD6D6D6),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),

//                                 Container(
//                                   padding: EdgeInsets.only(bottom: 10, top: 0),
//                                   height: height * 0.20,
//                                   child: CarouselSlider(
//                                     options: CarouselOptions(
//                                       autoPlay: true,
//                                       aspectRatio: 1,
//                                       viewportFraction: 1,
//                                       enlargeCenterPage: false,
//                                       enlargeStrategy:
//                                           CenterPageEnlargeStrategy.height,
//                                     ),
//                                     items: [
//                                       Container(
//                                         width: double.infinity,
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 20, vertical: 5),
//                                         decoration: BoxDecoration(
//                                             color: Colors.transparent,
//                                             borderRadius:
//                                                 BorderRadius.circular(100)),
//                                         child: ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(15),
//                                           child: CachedNetworkImage(
//                                               fit: BoxFit.cover,
//                                               imageUrl:
//                                                   'https://i.ibb.co/d7DZHHy/Microsoft-Teams-image-8.jpg'),
//                                         ),
//                                       ),
//                                       Container(
//                                         width: double.infinity,
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 20, vertical: 5),
//                                         decoration: BoxDecoration(
//                                             color: Colors.transparent,
//                                             borderRadius:
//                                                 BorderRadius.circular(100)),
//                                         child: ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(15),
//                                           child: CachedNetworkImage(
//                                               fit: BoxFit.cover,
//                                               imageUrl:
//                                                   'https://www.siecindia.com/images/join-svo-image.png'),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),

//                                 // Schedule Expert Call Button And Book an Appointment
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     // const SizedBox(
//                                     //   width: 20,
//                                     // ),

//                                     Showcase(
//                                       descTextStyle: TextStyle(
//                                           color: ThemeConstants.whitecolor,
//                                           fontSize: 18),
//                                       tooltipBackgroundColor:
//                                           ThemeConstants.bluecolor,
//                                       overlayColor: Colors.black54,
//                                       overlayOpacity: 0.40,
//                                       tooltipPadding: const EdgeInsets.only(
//                                           left: 5,
//                                           right: 5,
//                                           top: 10,
//                                           bottom: 10),
//                                       key: _six,
//                                       description:
//                                           "Your Expert is a call away. Schedule the call with your best available slot.",
//                                       child: GestureDetector(
//                                         onTap: () {
//                                           print('dddd');
//                                           contactUsDialog(context);
//                                         },
//                                         child: Container(
//                                           height: 70,
//                                           width: displayMobileLayout
//                                               ? MediaQuery.of(context)
//                                                           .size
//                                                           .width *
//                                                       0.91 -
//                                                   270
//                                               : MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   0.91,

//                                           child: Stack(
//                                             clipBehavior: Clip.none,
//                                             alignment: Alignment.bottomCenter,
//                                             children: [
//                                               Container(
//                                                 padding:
//                                                     EdgeInsets.only(left: 20),
//                                                 alignment: Alignment.centerLeft,
//                                                 height: 60,
//                                                 width: double.infinity,
//                                                 decoration: BoxDecoration(
//                                                     color: ThemeConstants
//                                                         .bluecolor,
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             17)),
//                                                 child: Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.center,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     Container(
//                                                       padding:
//                                                           EdgeInsets.symmetric(
//                                                               vertical: 0.5,
//                                                               horizontal: 8),
//                                                       decoration: BoxDecoration(
//                                                           color: ThemeConstants
//                                                               .GreenColor,
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       15)),
//                                                       child:
//                                                           CustomAutoSizeTextMontserrat(
//                                                         text: "Need Help?",
//                                                         fontSize: 5,
//                                                         textColor: Colors.white,
//                                                       ),
//                                                     ),
//                                                     CustomAutoSizeTextMontserrat(
//                                                       text: "Contact us Now",
//                                                       fontSize: 20,
//                                                       textColor: Colors.white,
//                                                     )
//                                                   ],
//                                                 ),
//                                               ),
//                                               Positioned(
//                                                 left: displayMobileLayout
//                                                     ? MediaQuery.of(context)
//                                                                 .size
//                                                                 .width *
//                                                             0.8 -
//                                                         270
//                                                     : MediaQuery.of(context)
//                                                             .size
//                                                             .width *
//                                                         0.7,
//                                                 bottom: 10,
//                                                 child: Stack(
//                                                   alignment: Alignment.center,
//                                                   children: [
//                                                     CircleAvatar(
//                                                       radius: 32.8,
//                                                       backgroundColor:
//                                                           ThemeConstants
//                                                               .whitecolor,
//                                                     ),
//                                                     CircleAvatar(
//                                                       radius: 30,
//                                                       backgroundColor:
//                                                           ThemeConstants
//                                                               .GreenColor,
//                                                       child: Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .all(10),
//                                                         child: SvgPicture.asset(
//                                                           'assets/icons/dialer_icon.svg',
//                                                           color: ThemeConstants
//                                                               .whitecolor,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               )
//                                             ],
//                                           ),

//                                           // child: ElevatedButton(
//                                           //   style: ElevatedButton.styleFrom(
//                                           //     foregroundColor:
//                                           //         ThemeConstants.whitecolor,
//                                           //     elevation: 0,

//                                           //     backgroundColor:
//                                           //         ThemeConstants.whitecolor,
//                                           //     shadowColor:
//                                           //         ThemeConstants.lightblueColor,
//                                           //     side: BorderSide(
//                                           //         color: ThemeConstants
//                                           //             .bluecolor), // foreground
//                                           //   ),
//                                           //   onPressed: () {
//                                           //     Get.toNamed(ScheduleExpertCall
//                                           //         .routeNamed);
//                                           //   },
//                                           //   child: CustomAutoSizeTextMontserrat(
//                                           //     text: "Schedule expert call",
//                                           //     fontSize: 12,
//                                           //     fontWeight: FontWeight.bold,
//                                           //     textColor:
//                                           //         ThemeConstants.bluecolor,
//                                           //   ),
//                                           // ),
//                                         ),
//                                       ),
//                                     ),

//                                     // Showcase(
//                                     //   descTextStyle: TextStyle(
//                                     //       color: ThemeConstants.whitecolor,
//                                     //       fontSize: 18),
//                                     //   tooltipBackgroundColor:
//                                     //       ThemeConstants.bluecolor,
//                                     //   overlayColor: Colors.black54,
//                                     //   overlayOpacity: 0.40,
//                                     //   tooltipPadding: const EdgeInsets.only(
//                                     //       left: 5,
//                                     //       right: 5,
//                                     //       top: 10,
//                                     //       bottom: 10),
//                                     //   targetShapeBorder:
//                                     //       const RoundedRectangleBorder(
//                                     //           borderRadius: BorderRadius.all(
//                                     //               Radius.circular(20))),
//                                     //   key: _seven,
//                                     //   description:
//                                     //       "Appointments compliments time management. Book an Appointment with your advisor now and save your time.",
//                                     //   child: SizedBox(
//                                     //     height: 40,
//                                     //     child: ElevatedButton(
//                                     //       style: ElevatedButton.styleFrom(
//                                     //         foregroundColor:
//                                     //             ThemeConstants.whitecolor,
//                                     //         elevation: 0,
//                                     //         backgroundColor:
//                                     //             ThemeConstants.whitecolor,
//                                     //         shadowColor: ThemeConstants
//                                     //             .lightorangeColor,
//                                     //         side: BorderSide(
//                                     //             color: ThemeConstants
//                                     //                 .orangeColor), // foreground
//                                     //       ),
//                                     //       onPressed: () {
//                                     //         Get.toNamed(
//                                     //             BookAnAppointment.routeNamed);
//                                     //       },
//                                     //       child: CustomAutoSizeTextMontserrat(
//                                     //         text: "Book an appointment",
//                                     //         fontSize: 12,
//                                     //         textColor:
//                                     //             ThemeConstants.orangeColor,
//                                     //         fontWeight: FontWeight.bold,
//                                     //       ),
//                                     //     ),
//                                     //   ),
//                                     // ),
//                                     // const SizedBox(
//                                     //   width: 20,
//                                     // ),
//                                   ],
//                                 ),
//                                 const SizedBox(
//                                   height: 20,
//                                 ),

//                                 Wrap(
//                                   runSpacing: 15.0,
//                                   spacing: 30,
//                                   alignment: WrapAlignment.center,
//                                   runAlignment: WrapAlignment.center,
//                                   children: [
//                                     // Create profile
//                                     InkWell(
//                                       onTap: () async {
//                                         // getDailogForAgree(context);
//                                         // Get.to(ProfilePageCopy1());
//                                         Get.toNamed(
//                                             ProfilePageCopy1.routeNamed);
//                                       },
//                                       child: Column(
//                                         children: [
//                                           Showcase(
//                                             descTextStyle: TextStyle(
//                                                 color:
//                                                     ThemeConstants.whitecolor,
//                                                 fontSize: 18),
//                                             tooltipBackgroundColor:
//                                                 ThemeConstants.bluecolor,
//                                             overlayColor: Colors.black54,
//                                             overlayOpacity: 0.40,
//                                             tooltipPadding:
//                                                 const EdgeInsets.only(
//                                                     left: 5,
//                                                     right: 5,
//                                                     top: 10,
//                                                     bottom: 10),
//                                             targetBorderRadius:
//                                                 BorderRadius.circular(18.0),
//                                             key: _two,
//                                             description:
//                                                 'Feed all your profile details and get started. Your profile shall be your portfolio to search for the best course.',
//                                             child: Container(
//                                                 height: height * 0.15,
//                                                 width: height * 0.15,
//                                                 decoration: BoxDecoration(
//                                                     border: Border.all(
//                                                         width: 1.2,
//                                                         color: ThemeConstants
//                                                             .VioletColor),
//                                                     color:
//                                                         const Color(0xFFF1F0FF),
//                                                     borderRadius:
//                                                         const BorderRadius.all(
//                                                             Radius.circular(
//                                                                 20))),
//                                                 child: svgImage(
//                                                     "create_profile",
//                                                     const Color(0xFF6F61FF),
//                                                     80,
//                                                     80)),
//                                           ),
//                                           Padding(
//                                             padding:
//                                                 const EdgeInsets.only(top: 10),
//                                             child: Text(
//                                               "Create your profile",
//                                               style: _textStyle,
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     //Upload Document
//                                     InkWell(
//                                       onTap: () {
//                                         Get.toNamed(UploadDocument.routeNamed);
//                                       },
//                                       child: Ink(
//                                         color: Colors.amber,
//                                         child: Column(
//                                           children: [
//                                             Showcase(
//                                               targetBorderRadius:
//                                                   BorderRadius.circular(18.0),
//                                               descTextStyle: TextStyle(
//                                                   color:
//                                                       ThemeConstants.whitecolor,
//                                                   fontSize: 18),
//                                               tooltipBackgroundColor:
//                                                   ThemeConstants.bluecolor,
//                                               overlayColor: Colors.black54,
//                                               overlayOpacity: 0.40,
//                                               tooltipPadding:
//                                                   const EdgeInsets.only(
//                                                       left: 5,
//                                                       right: 5,
//                                                       top: 10,
//                                                       bottom: 10),
//                                               targetShapeBorder:
//                                                   const RoundedRectangleBorder(
//                                                       borderRadius:
//                                                           BorderRadius.all(
//                                                               Radius.circular(
//                                                                   20))),
//                                               key: _three,
//                                               description:
//                                                   "All documents required for your Application to be uploaded here.",
//                                               child: Container(
//                                                   height: height * 0.15,
//                                                   width: height * 0.15,
//                                                   decoration: BoxDecoration(
//                                                       border: Border.all(
//                                                         width: 1.2,
//                                                         color: ThemeConstants
//                                                             .yellow,
//                                                       ),
//                                                       color: const Color(
//                                                           0xFFFEF6E6),
//                                                       borderRadius:
//                                                           const BorderRadius
//                                                                   .all(
//                                                               Radius.circular(
//                                                                   20))),
//                                                   child: svgImage(
//                                                       "upload_document",
//                                                       const Color(0xFFF8A300),
//                                                       80,
//                                                       80)),
//                                             ),
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   top: 10),
//                                               child: Text(
//                                                 "Upload document",
//                                                 style: _textStyle,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     //Course Search
//                                     InkWell(
//                                       onTap: () {
//                                         Get.toNamed(CourseSearch.routeNamed);
//                                       },
//                                       child: Column(
//                                         children: [
//                                           Showcase(
//                                             descTextStyle: TextStyle(
//                                                 color:
//                                                     ThemeConstants.whitecolor,
//                                                 fontSize: 18),
//                                             tooltipBackgroundColor:
//                                                 ThemeConstants.bluecolor,
//                                             overlayColor: Colors.black54,
//                                             overlayOpacity: 0.40,
//                                             tooltipPadding:
//                                                 const EdgeInsets.only(
//                                                     left: 5,
//                                                     right: 5,
//                                                     top: 10,
//                                                     bottom: 10),
//                                             targetBorderRadius:
//                                                 BorderRadius.circular(18.0),
//                                             key: _four,
//                                             description:
//                                                 "Course Search assists you in searching your desired course across the globe.",
//                                             child: Container(
//                                                 height: height * 0.15,
//                                                 width: height * 0.15,
//                                                 decoration: BoxDecoration(
//                                                     border: Border.all(
//                                                         width: 1.2,
//                                                         color: const Color(
//                                                             0xFFF16660)),
//                                                     color:
//                                                         const Color(0xFFFEF0F0),
//                                                     borderRadius:
//                                                         const BorderRadius.all(
//                                                             Radius.circular(
//                                                                 20))),
//                                                 child: svgImage(
//                                                     "course",
//                                                     const Color(0xFFF16660),
//                                                     80,
//                                                     80)),
//                                           ),
//                                           Padding(
//                                             padding:
//                                                 const EdgeInsets.only(top: 10),
//                                             child: Text(
//                                               "Course Search",
//                                               style: _textStyle,
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     // Track Application
//                                     InkWell(
//                                       onTap: () {
//                                         Get.toNamed(
//                                             ApplicationSummary.routeNamed);
//                                       },
//                                       child: Column(
//                                         children: [
//                                           Showcase(
//                                             descTextStyle: TextStyle(
//                                                 color:
//                                                     ThemeConstants.whitecolor,
//                                                 fontSize: 18),
//                                             tooltipBackgroundColor:
//                                                 ThemeConstants.bluecolor,
//                                             overlayColor: Colors.black54,
//                                             overlayOpacity: 0.40,
//                                             tooltipPadding:
//                                                 const EdgeInsets.only(
//                                                     left: 5,
//                                                     right: 5,
//                                                     top: 10,
//                                                     bottom: 10),
//                                             targetBorderRadius:
//                                                 BorderRadius.circular(18.0),
//                                             key: _five,
//                                             description:
//                                                 "You can keep a track on your Application Stage and Status.",
//                                             child: Container(
//                                               height: height * 0.15,
//                                               width: height * 0.15,
//                                               decoration: BoxDecoration(
//                                                   border: Border.all(
//                                                       width: 1.2,
//                                                       color: const Color(
//                                                           0xFF05B4D2)),
//                                                   color:
//                                                       const Color(0xFFE8FAFD),
//                                                   borderRadius:
//                                                       const BorderRadius.all(
//                                                           Radius.circular(20))),
//                                               child: Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(30.0),
//                                                 child: svgImage(
//                                                     "track",
//                                                     const Color(0xFF05B4D2),
//                                                     80,
//                                                     80),
//                                               ),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding:
//                                                 const EdgeInsets.only(top: 10),
//                                             child: Text(
//                                               "Track application",
//                                               style: _textStyle,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),

//                                 // Upcoming Event
//                                 // if (_.loadingUpcomingEvents.value == true)
//                                 //   Padding(
//                                 //     padding: const EdgeInsets.only(
//                                 //       top: 15,
//                                 //     ),
//                                 //     child: Container(
//                                 //         // width: displayMobileLayout == true
//                                 //         //     ? MediaQuery.of(context).size.width - 240
//                                 //         //     : MediaQuery.of(context).size.width * 0.90,
//                                 //         constraints: const BoxConstraints(
//                                 //             maxWidth: 300),
//                                 //         child: Card(
//                                 //           elevation: 0.7,
//                                 //           shadowColor:
//                                 //               const Color(0xFFE5E1FE),
//                                 //           shape: const RoundedRectangleBorder(
//                                 //             side: BorderSide(
//                                 //                 color: Color(0xFFE5E1FE),
//                                 //                 width: 1.0),
//                                 //             borderRadius: BorderRadius.all(
//                                 //                 Radius.circular(10)),
//                                 //           ),
//                                 //           child: Column(
//                                 //             children: [
//                                 //               Padding(
//                                 //                 padding:
//                                 //                     const EdgeInsets.only(
//                                 //                         top: 10, left: 35),
//                                 //                 child: Text(
//                                 //                   "Upcoming Event",
//                                 //                   style: GoogleFonts.roboto(
//                                 //                     fontWeight:
//                                 //                         FontWeight.bold,
//                                 //                     fontSize: 26,
//                                 //                   ),
//                                 //                 ),
//                                 //               ),
//                                 //               Row(
//                                 //                 children: [
//                                 //                   Padding(
//                                 //                     padding:
//                                 //                         const EdgeInsets.only(
//                                 //                             left: 5),
//                                 //                     child: SizedBox(
//                                 //                         width: 50,
//                                 //                         child: svgImage(
//                                 //                             "calender",
//                                 //                             const Color(
//                                 //                                 0xFF6F61FF),
//                                 //                             70,
//                                 //                             60)),
//                                 //                   ),
//                                 //                   Padding(
//                                 //                     padding:
//                                 //                         const EdgeInsets.only(
//                                 //                             top: 5),
//                                 //                     child: SizedBox(
//                                 //                       width: displayMobileLayout == true
//                                 //                           ? (MediaQuery.of(
//                                 //                                           context)
//                                 //                                       .size
//                                 //                                       .width -
//                                 //                                   240) *
//                                 //                               0.70
//                                 //                           : MediaQuery.of(
//                                 //                                       context)
//                                 //                                   .size
//                                 //                                   .width *
//                                 //                               0.70,
//                                 //                       child: Column(
//                                 //                         children: [
//                                 //                           BulletedList(
//                                 //                             crossAxisAlignment:
//                                 //                                 CrossAxisAlignment
//                                 //                                     .start,
//                                 //                             bullet:
//                                 //                                 const MyBullet(),
//                                 //                             listItems: [
//                                 //                               CustomAutoSizeText(
//                                 //                                   text: _
//                                 //                                       .upcomingModel![
//                                 //                                           0]
//                                 //                                       .campaignName,
//                                 //                                   maxLines:
//                                 //                                       3),
//                                 //                             ],
//                                 //                           ),
//                                 //                           SizedBox(
//                                 //                             width: MediaQuery.of(
//                                 //                                         context)
//                                 //                                     .size
//                                 //                                     .width *
//                                 //                                 0.70,
//                                 //                             child: Padding(
//                                 //                               padding:
//                                 //                                   const EdgeInsets
//                                 //                                           .only(
//                                 //                                       left:
//                                 //                                           38),
//                                 //                               child: Text(_
//                                 //                                   .upcomingModel![
//                                 //                                       0]
//                                 //                                   .campaignDate!),
//                                 //                             ),
//                                 //                           )
//                                 //                         ],
//                                 //                       ),
//                                 //                     ),
//                                 //                   )
//                                 //                 ],
//                                 //               ),
//                                 //               TextButton(
//                                 //                   onPressed: () {
//                                 //                     Navigator.push(
//                                 //                         context,
//                                 //                         MaterialPageRoute(
//                                 //                             builder: (context) =>
//                                 //                                 UpcomingEvent(
//                                 //                                   model: _
//                                 //                                       .upcomingModel,
//                                 //                                 )));

//                                 //                     // Get.snackbar(
//                                 //                     //   "DashBoard",
//                                 //                     //   "View All",
//                                 //                     //   snackPosition:
//                                 //                     //       SnackPosition.BOTTOM,
//                                 //                     // );
//                                 //                   },
//                                 //                   child:
//                                 //                       const Text("View all"))
//                                 //             ],
//                                 //           ),
//                                 //         )),
//                                 //   ),

//                                 const SizedBox(
//                                   height: 40,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   : Center(
//                       child: getLoading(context),
//                     ),
//           // floatingActionButtonLocation:
//           //     FloatingActionButtonLocation.centerDocked,
//           floatingActionButton: Showcase(
//             descTextStyle:
//                 TextStyle(color: ThemeConstants.whitecolor, fontSize: 18),
//             tooltipBackgroundColor: ThemeConstants.bluecolor,
//             overlayColor: Colors.black54,
//             overlayOpacity: 0.40,
//             // targetBorderRadius: BorderRadius.circular(25.0),
//             // tooltipPadding: const EdgeInsets.only(0.0)
//             targetShapeBorder: const CircleBorder(),
//             key: _eight,
//             description:
//                 "Need Assistance? Join the SIEC Virtual Office and meet your advisor.",

//             child: Container(
//               height: 75.0,
//               width: 75.0,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(80),
//                 color: ThemeConstants.bluecolor,
//               ),
//               padding: EdgeInsets.all(15),
//               child: FittedBox(
//                 child: FloatingActionButton(
//                   backgroundColor: ThemeConstants.bluecolor,
//                   child: SvgPicture.asset(
//                     'assets/icons/chatbot icon.svg',
//                     color: ThemeConstants.whitecolor,
//                   ),

//                   //                                  svgImage(
//                   // "video-call", ThemeConstants.whitecolor, 40, 30),
//                   onPressed: () async {
//                     // SVO Join Code
//                     await _launchURL();
//                     // isExtended: true,
//                     // Overlay.of(context).insert(entry);
//                   },
//                 ),
//               ),
//             ),
//           ),

//           // BottomNavigation()

//           //  BottomAppBar(
//           //   shape: const CircularNotchedRectangle(),
//           //   notchMargin: 6.0,
//           //   child: SizedBox(
//           //     height: 60,
//           //     child: Row(
//           //       mainAxisSize: MainAxisSize.max,
//           //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //       children: <Widget>[
//           //         SizedBox(
//           //           height: 50,
//           //           width: 60,
//           //           child: Column(
//           //             children: [
//           //               Padding(
//           //                 padding: const EdgeInsets.only(left: 25),
//           //                 child: SizedBox(
//           //                   height: 50,
//           //                   width: 60,
//           //                   child: InkWell(
//           //                     splashColor: ThemeConstants.bluecolor,
//           //                     onTap: () {
//           //                       Get.toNamed(DashBoard.routeNamed);
//           //                     },
//           //                     child: Padding(
//           //                       padding: const EdgeInsets.only(bottom: 5),
//           //                       child: Column(
//           //                         mainAxisAlignment: MainAxisAlignment.center,
//           //                         children: <Widget>[
//           //                           svgImage("home", ThemeConstants.bluecolor,
//           //                               30, 30),
//           //                         ],
//           //                       ),
//           //                     ),
//           //                   ),
//           //                 ),
//           //               ),
//           //             ],
//           //           ),
//           //         ),
//           //         SizedBox(
//           //           height: 50,
//           //           width: 60,
//           //           child: Column(
//           //             children: [
//           //               Padding(
//           //                 padding: const EdgeInsets.only(left: 20),
//           //                 child: SizedBox(
//           //                   height: 46,
//           //                   width: 60,
//           //                   child: InkWell(
//           //                     splashColor: ThemeConstants.bluecolor,
//           //                     onTap: () {
//           //                       Get.toNamed(TrackyourTickets.routeNamed);
//           //                     },
//           //                     child: Column(
//           //                       mainAxisAlignment: MainAxisAlignment.center,
//           //                       children: <Widget>[
//           //                         Showcase(
//           //                             descTextStyle: TextStyle(
//           //                                 color: ThemeConstants.whitecolor,
//           //                                 fontSize: 18),
//           //                             tooltipBackgroundColor:
//           //                                 ThemeConstants.bluecolor,
//           //                             overlayColor: Colors.black54,
//           //                             overlayOpacity: 0.40,
//           //                             // targetBorderRadius: BorderRadius.circular(25.0),
//           //                             // tooltipPadding: const EdgeInsets.only(0.0)
//           //                             targetShapeBorder:
//           //                                 const RoundedRectangleBorder(
//           //                                     borderRadius: BorderRadius.all(
//           //                                         Radius.circular(20))),
//           //                             key: _11,
//           //                             description:
//           //                                 "You can track updates on your ticket from this section.",
//           //                             child: Icon(
//           //                               Icons.track_changes_sharp,
//           //                               size: 35,
//           //                               color: ThemeConstants.TextColor,
//           //                             )),
//           //                       ],
//           //                     ),
//           //                   ),
//           //                 ),
//           //               ),
//           //             ],
//           //           ),
//           //         ),
//           //         Center(
//           //             child: Padding(
//           //           padding: const EdgeInsets.only(top: 30, left: 5),
//           //           child: CustomAutoSizeTextMontserrat(
//           //             text: "Join SVO link",
//           //             textColor: ThemeConstants.bluecolor,
//           //             fontSize: 13,
//           //           ),
//           //         )),
//           //         SizedBox(
//           //           height: 50,
//           //           width: 60,
//           //           child: Column(
//           //             children: [
//           //               Padding(
//           //                 padding: const EdgeInsets.only(left: 20),
//           //                 child: SizedBox(
//           //                   height: 46,
//           //                   width: 60,
//           //                   child: InkWell(
//           //                     splashColor: Colors.transparent,
//           //                     onTap: () {
//           //                       Get.toNamed(RaiseYourTicket.routeNamed);
//           //                     },
//           //                     child: Column(
//           //                       mainAxisAlignment: MainAxisAlignment.center,
//           //                       children: <Widget>[
//           //                         Showcase(
//           //                             descTextStyle: TextStyle(
//           //                                 color: ThemeConstants.whitecolor,
//           //                                 fontSize: 18),
//           //                             tooltipBackgroundColor:
//           //                                 ThemeConstants.bluecolor,
//           //                             overlayColor: Colors.black54,
//           //                             overlayOpacity: 0.40,
//           //                             // targetBorderRadius: BorderRadius.circular(25.0),
//           //                             // tooltipPadding: const EdgeInsets.only(0.0)
//           //                             targetShapeBorder:
//           //                                 const RoundedRectangleBorder(
//           //                                     borderRadius: BorderRadius.all(
//           //                                         Radius.circular(20))),
//           //                             key: _12,
//           //                             description:
//           //                                 "Need a help? Quicky raise a ticket at Gradlynk support and in minimal time, query shall be resolved.",
//           //                             child: Icon(
//           //                               Icons.help_outline_sharp,
//           //                               size: 35,
//           //                               color: ThemeConstants.TextColor,
//           //                             )),
//           //                       ],
//           //                     ),
//           //                   ),
//           //                 ),
//           //               ),
//           //             ],
//           //           ),
//           //         ),
//           //         SizedBox(
//           //           height: 50,
//           //           width: 60,
//           //           child: Column(
//           //             children: [
//           //               SizedBox(
//           //                 height: 46,
//           //                 width: 50,
//           //                 child: InkWell(
//           //                   splashColor: ThemeConstants.bluecolor,
//           //                   onTap: () {
//           //                     Get.toNamed(ProfilePageCopy1.routeNamed);
//           //                   },
//           //                   child: Padding(
//           //                     padding: const EdgeInsets.only(bottom: 5),
//           //                     child: Column(
//           //                       mainAxisAlignment: MainAxisAlignment.center,
//           //                       children: <Widget>[
//           //                         svgImage("profile-bottom",
//           //                             ThemeConstants.IconColor, 30, 30),
//           //                       ],
//           //                     ),
//           //                   ),
//           //                 ),
//           //               ),
//           //               const Spacer()
//           //             ],
//           //           ),
//           //         ),
//           //       ],
//           //     ),
//           //   ),
//           // )

//           bottomNavigationBar: CustomButtomNavbar(currentIndex: 0),

//           // floatingActionButton: Showcase(
//           //   descTextStyle:
//           //       TextStyle(color: ThemeConstants.whitecolor, fontSize: 18),
//           //   tooltipBackgroundColor: ThemeConstants.bluecolor,
//           //   overlayColor: Colors.black54,
//           //   overlayOpacity: 0.40,
//           //   targetBorderRadius: BorderRadius.circular(25.0),
//           //   tooltipPadding:
//           //       const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
//           //   targetShapeBorder: const RoundedRectangleBorder(
//           //       borderRadius: BorderRadius.all(Radius.circular(20))),
//           //   key: _eight,
//           //   description:
//           //       "Need Assistance? Join the SIEC Virtual Office and meet your advisor.",
//           //   child: FloatingActionButton.extended(
//           //     tooltip: "SVO",
//           //     backgroundColor: ThemeConstants.bluecolor,
//           //     onPressed: () async {
//           //       // SVO Join Code
//           //       await _launchURL();
//           //       // isExtended: true,
//           //     },
//           //     icon: svgImage("video-call", ThemeConstants.whitecolor, 40, 30),
//           //     label: CustomAutoSizeTextMontserrat(
//           //       text: "Join SVO",
//           //       textColor: ThemeConstants.whitecolor,
//           //     ),
//           //   ),
//           // ),
//         );
//       });
//     }));
//   }

//   callbackDropDownButton(varTopic) {}

//   _launchURL() async {
//     // final call = Uri.parse('tel:+91 8394049598');
//     // if (await canLaunchUrl(call)) {
//     //   launchUrl(call);
//     // } else {
//     //   throw 'Could not launch $call';
//     // }

//     const url =
//         'https://zoom.us/j/97485138279?pwd=Y1cwcXRHUWZWOFN3aTZOdmhHZm4yQT09';
//     // ignore: deprecated_member_use
//     if (await canLaunch(url)) {
//       // ignore: deprecated_member_use
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }

// class MyBullet extends StatelessWidget {
//   const MyBullet({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 7,
//       width: 7,
//       decoration: const BoxDecoration(
//         color: Colors.black,
//         shape: BoxShape.circle,
//       ),
//     );
//   }
// }
