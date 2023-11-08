// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:studentpanel/ui/controllers/lunchingpagecontroller.dart';
// import 'package:studentpanel/ui/screen/dashboard.dart';

// class LunchingPage extends StatefulWidget {
//   const LunchingPage({Key? key}) : super(key: key);
//   static const routeNamed = '/LunchingPage';

//   @override
//   State<LunchingPage> createState() => _LunchingPageState();
// }

// class _LunchingPageState extends State<LunchingPage> {
//   bool temp = false;

//   // @override
//   // void initState() {
//   //   controller.startTimer();
//   //   super.initState();
//   // }

//   var controller = Get.put(LunchingPageController());
//   void startTimer() {
//     Future.delayed(const Duration(milliseconds: 4550), () {
//       Get.toNamed(DashBoard.routeNamed);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     startTimer();

//     return Scaffold(
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         color: Colors.white,
//         child: Image.asset(
//           "assets/icons/logo-4.gif",
//           gaplessPlayback: false,
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           fit: BoxFit.contain,
//         ),
//       ),
//     );
//   }
// }
