// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:studentpanel/ui/controllers/dashboardcontroller.dart';
// import 'package:studentpanel/ui/controllers/profilepagecontroller.dart';
// import 'package:studentpanel/ui/screen/profilepage.dart';
// import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
// import 'package:studentpanel/widgets/customtab.dart';

// class TestDetail extends StatefulWidget {
//   const TestDetail({Key? key}) : super(key: key);

//   @override
//   State<TestDetail> createState() => _TestDetailState();
// }

// class _TestDetailState extends State<TestDetail> {
//   var controller = Get.put(ProfilePageController());

//   late BestTutorSite _site = BestTutorSite.Tentative;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         if (Get.find<DashboardController>().loadingStudentPanelData.value ==
//             true)
//           Column(
//             children: [
//               const Padding(
//                 padding: EdgeInsets.only(top: 10),
//                 child: CustomTab(),
//               ),
//               SizedBox(
//                 child: Column(
//                   children: [
//                     if (controller.englishTestDetail!.value == true)
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height - 290,
//                         width: MediaQuery.of(context).size.width,
//                         child: ListView(
//                           controller: ScrollController(),
//                           physics: const BouncingScrollPhysics(),
//                           children: [
//                             Align(
//                               alignment: AlignmentDirectional.topStart,
//                               child: Padding(
//                                   padding:
//                                       const EdgeInsets.only(left: 20, top: 15),
//                                   child: CustomAutoSizeTextMontserrat(
//                                     text: "Self",
//                                     fontSize: 24,
//                                     underline: true,
//                                     fontWeight: FontWeight.bold,
//                                   )),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 20, right: 10, top: 10),
//                               child: SizedBox(
//                                 height: 40,
//                                 child: Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 10),
//                                       child: CustomAutoSizeTextMontserrat(
//                                         text: "Exam Status",
//                                         textColor: Colors.grey,
//                                       ),
//                                     ),
//                                     const Spacer(),
//                                     SizedBox(
//                                       width: 150,
//                                       // custom Text field
//                                       child: CustomAutoSizeTextMontserrat(
//                                         text: Get.find<DashboardController>()
//                                             .studentPanel
//                                             .testDetails!
//                                             .examStatus,
//                                         maxLines: 1,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.only(left: 20, right: 20),
//                               child: Divider(
//                                 height: 5,
//                                 thickness: 1,
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                 left: 20,
//                                 right: 10,
//                               ),
//                               child: SizedBox(
//                                 height: 40,
//                                 child: Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 10),
//                                       child: CustomAutoSizeTextMontserrat(
//                                         text: "Exam Name",
//                                         textColor: Colors.grey,
//                                       ),
//                                     ),
//                                     const Spacer(),
//                                     SizedBox(
//                                       width: 150,
//                                       // custom Text field
//                                       child: CustomAutoSizeTextMontserrat(
//                                         text: Get.find<DashboardController>()
//                                             .studentPanel
//                                             .testDetails!
//                                             .examName,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.only(left: 20, right: 20),
//                               child: Divider(
//                                 height: 5,
//                                 thickness: 1,
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                 left: 20,
//                                 right: 10,
//                               ),
//                               child: SizedBox(
//                                 height: 40,
//                                 child: Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 10),
//                                       child: CustomAutoSizeTextMontserrat(
//                                         text: "Date of Exam",
//                                         textColor: Colors.grey,
//                                       ),
//                                     ),
//                                     const Spacer(),
//                                     SizedBox(
//                                       height: 40,
//                                       width: 150,
//                                       // custom Text field
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(top: 15),
//                                         child: CustomAutoSizeTextMontserrat(
//                                           text: Get.find<DashboardController>()
//                                               .studentPanel
//                                               .testDetails!
//                                               .dateOfExam,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.only(left: 20, right: 20),
//                               child: Divider(
//                                 height: 5,
//                                 thickness: 1,
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                 left: 20,
//                                 right: 10,
//                               ),
//                               child: SizedBox(
//                                 height: 40,
//                                 child: Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 10),
//                                       child: CustomAutoSizeTextMontserrat(
//                                         text: "Date Of Test Report",
//                                         textColor: Colors.grey,
//                                       ),
//                                     ),
//                                     const Spacer(),
//                                     SizedBox(
//                                       height: 40,
//                                       width: 150,
//                                       // custom Text field
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(top: 15),
//                                         child: CustomAutoSizeTextMontserrat(
//                                           text: Get.find<DashboardController>()
//                                               .studentPanel
//                                               .testDetails!
//                                               .resultDate,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.only(left: 20, right: 20),
//                               child: Divider(
//                                 height: 5,
//                                 thickness: 1,
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                 left: 20,
//                                 right: 10,
//                               ),
//                               child: SizedBox(
//                                 height: 40,
//                                 child: Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 10),
//                                       child: CustomAutoSizeTextMontserrat(
//                                         text: "Test Score Expiration ",
//                                         textColor: Colors.grey,
//                                       ),
//                                     ),
//                                     const Spacer(),
//                                     SizedBox(
//                                       height: 40,
//                                       width: 150,
//                                       // custom Text field
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(top: 15),
//                                         child: CustomAutoSizeTextMontserrat(
//                                           text: Get.find<DashboardController>()
//                                               .studentPanel
//                                               .testDetails!
//                                               .expirationDate,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 SizedBox(
//                                   width: 170,
//                                   child: ListTile(
//                                     minLeadingWidth: 0.0,
//                                     minVerticalPadding: 0.0,
//                                     contentPadding:
//                                         const EdgeInsets.only(left: 0),
//                                     title: const Text('Tentative'),
//                                     leading: Radio<BestTutorSite>(
//                                       autofocus: true,
//                                       value: BestTutorSite.Tentative,
//                                       groupValue: _site,
//                                       onChanged: (BestTutorSite? value) {
//                                         setState(() {
//                                           _site = value!;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 170,
//                                   child: ListTile(
//                                     contentPadding:
//                                         const EdgeInsets.only(left: 0),
//                                     title: const Text('Definite'),
//                                     leading: Radio<BestTutorSite>(
//                                       value: BestTutorSite.Definite,
//                                       groupValue: _site,
//                                       onChanged: (BestTutorSite? value) {
//                                         setState(() {
//                                           _site = value!;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                 left: 20,
//                                 right: 10,
//                               ),
//                               child: SizedBox(
//                                 height: 40,
//                                 child: Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 10),
//                                       child: CustomAutoSizeTextMontserrat(
//                                         text: "English Overall Scores ",
//                                         textColor: Colors.grey,
//                                       ),
//                                     ),
//                                     const Spacer(),
//                                     SizedBox(
//                                       height: 40,
//                                       width: 150,
//                                       // custom Text field
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(top: 15),
//                                         child: CustomAutoSizeTextMontserrat(
//                                           text: Get.find<DashboardController>()
//                                               .studentPanel
//                                               .testDetails!
//                                               .overAll
//                                               .toString(),
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.only(left: 20, right: 20),
//                               child: Divider(
//                                 height: 5,
//                                 thickness: 1,
//                               ),
//                             ),
//                             if (_site == BestTutorSite.Definite)
//                               Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       SizedBox(
//                                         width:
//                                             MediaQuery.of(context).size.width /
//                                                 2,
//                                         child: Column(
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Padding(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                           top: 10, left: 20),
//                                                   child:
//                                                       CustomAutoSizeTextMontserrat(
//                                                     text: "Listening",
//                                                     textColor: Colors.grey,
//                                                   ),
//                                                 ),
//                                                 const Spacer(),
//                                                 SizedBox(
//                                                   height: 40,
//                                                   width: 50,
//                                                   // custom Text field
//                                                   child: Padding(
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                             top: 15),
//                                                     child:
//                                                         CustomAutoSizeTextMontserrat(
//                                                       text: Get.find<
//                                                               DashboardController>()
//                                                           .studentPanel
//                                                           .testDetails!
//                                                           .listening
//                                                           .toString(),
//                                                       fontWeight:
//                                                           FontWeight.w600,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             const Padding(
//                                               padding: EdgeInsets.only(
//                                                   left: 20, right: 20),
//                                               child: Divider(
//                                                 height: 5,
//                                                 thickness: 1,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width:
//                                             MediaQuery.of(context).size.width /
//                                                 2,
//                                         child: Column(
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Padding(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                           top: 10, left: 20),
//                                                   child:
//                                                       CustomAutoSizeTextMontserrat(
//                                                     text: "Writing",
//                                                     textColor: Colors.grey,
//                                                   ),
//                                                 ),
//                                                 const Spacer(),
//                                                 SizedBox(
//                                                   height: 40,
//                                                   width: 50,
//                                                   // custom Text field
//                                                   child: Padding(
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                             top: 15),
//                                                     child:
//                                                         CustomAutoSizeTextMontserrat(
//                                                       text: Get.find<
//                                                               DashboardController>()
//                                                           .studentPanel
//                                                           .testDetails!
//                                                           .writing
//                                                           .toString(),
//                                                       fontWeight:
//                                                           FontWeight.w600,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             const Padding(
//                                               padding: EdgeInsets.only(
//                                                   left: 20, right: 20),
//                                               child: Divider(
//                                                 height: 5,
//                                                 thickness: 1,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             if (_site == BestTutorSite.Definite)
//                               Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       SizedBox(
//                                         width:
//                                             MediaQuery.of(context).size.width /
//                                                 2,
//                                         child: Column(
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Padding(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                           top: 10, left: 20),
//                                                   child:
//                                                       CustomAutoSizeTextMontserrat(
//                                                     text: "Reading",
//                                                     textColor: Colors.grey,
//                                                   ),
//                                                 ),
//                                                 const Spacer(),
//                                                 SizedBox(
//                                                   height: 40,
//                                                   width: 50,
//                                                   // custom Text field
//                                                   child: Padding(
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                             top: 15),
//                                                     child:
//                                                         CustomAutoSizeTextMontserrat(
//                                                       text: Get.find<
//                                                               DashboardController>()
//                                                           .studentPanel
//                                                           .testDetails!
//                                                           .reading
//                                                           .toString(),
//                                                       fontWeight:
//                                                           FontWeight.w600,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             const Padding(
//                                               padding: EdgeInsets.only(
//                                                   left: 20, right: 20),
//                                               child: Divider(
//                                                 height: 5,
//                                                 thickness: 1,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width:
//                                             MediaQuery.of(context).size.width /
//                                                 2,
//                                         child: Column(
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Padding(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                           top: 10, left: 20),
//                                                   child:
//                                                       CustomAutoSizeTextMontserrat(
//                                                     text: "Speaking",
//                                                     textColor: Colors.grey,
//                                                   ),
//                                                 ),
//                                                 const Spacer(),
//                                                 SizedBox(
//                                                   height: 40,
//                                                   width: 50,
//                                                   // custom Text field
//                                                   child: Padding(
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                             top: 15),
//                                                     child:
//                                                         CustomAutoSizeTextMontserrat(
//                                                       text: Get.find<
//                                                               DashboardController>()
//                                                           .studentPanel
//                                                           .testDetails!
//                                                           .speaking
//                                                           .toString(),
//                                                       fontWeight:
//                                                           FontWeight.w600,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             const Padding(
//                                               padding: EdgeInsets.only(
//                                                   left: 20, right: 20),
//                                               child: Divider(
//                                                 height: 5,
//                                                 thickness: 1,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               )
//                           ],
//                         ),
//                       ),
//                     if (controller.englishTestDetail!.value == false)
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height - 290,
//                         width: MediaQuery.of(context).size.width,
//                         child: ListView(
//                           controller: ScrollController(),
//                           children: [
//                             Align(
//                               alignment: AlignmentDirectional.topStart,
//                               child: Padding(
//                                   padding:
//                                       const EdgeInsets.only(left: 20, top: 15),
//                                   child: CustomAutoSizeTextMontserrat(
//                                     text: "Self",
//                                     fontSize: 24,
//                                     underline: true,
//                                     fontWeight: FontWeight.bold,
//                                   )),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 20, right: 10, top: 20),
//                               child: SizedBox(
//                                 height: 40,
//                                 child: Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 10),
//                                       child: CustomAutoSizeTextMontserrat(
//                                         text: "Exam Status",
//                                         textColor: Colors.grey,
//                                       ),
//                                     ),
//                                     const Spacer(),
//                                     SizedBox(
//                                       height: 40,
//                                       width: 150,
//                                       // custom Text field
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(top: 15),
//                                         child: CustomAutoSizeTextMontserrat(
//                                           text: "Not Yet Registered",
//                                           maxLines: 1,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.only(left: 20, right: 20),
//                               child: Divider(
//                                 height: 5,
//                                 thickness: 1,
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                 left: 20,
//                                 right: 10,
//                               ),
//                               child: SizedBox(
//                                 height: 40,
//                                 child: Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 10),
//                                       child: CustomAutoSizeTextMontserrat(
//                                         text: "want to a book test?",
//                                         textColor: Colors.grey,
//                                       ),
//                                     ),
//                                     const Spacer(),
//                                     SizedBox(
//                                       height: 40,
//                                       width: 150,
//                                       // custom Text field
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(top: 15),
//                                         child: CustomAutoSizeTextMontserrat(
//                                           text: "No",
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.only(left: 20, right: 20),
//                               child: Divider(
//                                 height: 5,
//                                 thickness: 1,
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                 left: 20,
//                                 right: 10,
//                               ),
//                               child: SizedBox(
//                                 height: 40,
//                                 child: Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 10),
//                                       child: CustomAutoSizeTextMontserrat(
//                                         text: "assumptive Proficiency Level",
//                                         textColor: Colors.grey,
//                                       ),
//                                     ),
//                                     const Spacer(),
//                                     SizedBox(
//                                       height: 40,
//                                       width: 100,
//                                       // custom Text field
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(top: 15),
//                                         child: CustomAutoSizeTextMontserrat(
//                                           text: "Good",
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.only(left: 20, right: 20),
//                               child: Divider(
//                                 height: 5,
//                                 thickness: 1,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         if (Get.find<DashboardController>().loadingStudentPanelData.value ==
//             false)
//           const Center(
//             child: CircularProgressIndicator(),
//           )
//       ],
//     );
//   }
// }
