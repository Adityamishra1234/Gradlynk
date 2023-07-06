// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:studentpanel/ui/controllers/versioncontroller.dart';
// import 'package:studentpanel/ui/screen/Profile_Module/contactinformation.dart';
// import 'package:studentpanel/ui/screen/Profile_Module/courseinformation.dart';
// import 'package:studentpanel/ui/screen/Profile_Module/englishtestdetails.dart';
// import 'package:studentpanel/ui/screen/Profile_Module/othertestdetails.dart';
// import 'package:studentpanel/ui/screen/Profile_Module/passportdetails.dart';
// import 'package:studentpanel/ui/screen/Profile_Module/relativeinformation.dart';
// import 'package:studentpanel/ui/screen/Profile_Module/travinghistory.dart';
// import 'package:studentpanel/ui/screen/Profile_Module/workhistory.dart';
// import 'package:studentpanel/ui/screen/dashboard.dart';
// import 'package:studentpanel/widgets/Custom_Tabbar/custom_tabbar.dart';
// import 'package:studentpanel/widgets/appbar.dart';
// import 'package:studentpanel/widgets/customBottomNavbar.dart';
// import 'package:studentpanel/widgets/customdrawer.dart';
// import 'qualificationdetails.dart';

// class ProfilePageCopy1 extends StatelessWidget {
//   static const routeNamed = '/ProfilePageCopy1';
//   ProfilePageCopy1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
//     return WillPopScope(
//       onWillPop: () async {
//         Get.offAllNamed(DashBoard.routeNamed);
//         return await true;
//       },
//       child: Scaffold(
//         appBar: CustomAppBar("title"),
//         drawer: displayMobileLayout == false
//             ? CustomDrawer(
//                 index: 1,
//               )
//             : null,
//         body: CustomTabbar(tablist: const [
//           "Personal",
//           "Course Info",
//           "Qualification ",
//           "Work History",
//           "Language test ",
//           "Qualifying test ",
//           "Passport ",
//           "Travel History",
//           "Relative Info"
//         ], listWidget: [
//           ContactInformationCopy(),
//           CourseInformationCopy(),
//           QualificationDetailsCopy(),
//           WorkHistoryCopy(),
//           EnglishTestDetails(),
//           OthertestDetail(),
//           PassportDetails(),
//           TravingHistory(),
//           RelativeInformation()
//         ]),
//         bottomNavigationBar:
//             CustomButtomNavbar(currentIndex: 1, context2: context),
//       ),
//   }
// }
