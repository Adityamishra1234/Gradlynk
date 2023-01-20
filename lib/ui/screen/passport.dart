// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:studentpanel/ui/controllers/dashboardcontroller.dart';
// import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

// class Passport extends StatelessWidget {
//   const Passport({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         if (Get.find<DashboardController>().loadingStudentPanelData.value ==
//             true)
//           Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
//                 child: SizedBox(
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10),
//                         child: CustomAutoSizeTextMontserrat(
//                           text: "Passport Number",
//                           textColor: Colors.grey,
//                         ),
//                       ),
//                       const Spacer(),
//                       SizedBox(
//                         width: 150,
//                         // custom Text field
//                         child: CustomAutoSizeTextMontserrat(
//                           text: Get.find<DashboardController>()
//                                   .studentPanel
//                                   .passportDetails![0]
//                                   .passportNumber ??
//                               "",
//                           maxLines: 2,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(left: 20, right: 20),
//                 child: Divider(
//                   height: 5,
//                   thickness: 1,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
//                 child: SizedBox(
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10),
//                         child: CustomAutoSizeTextMontserrat(
//                           text: "Citizen of",
//                           textColor: Colors.grey,
//                         ),
//                       ),
//                       const Spacer(),
//                       SizedBox(
//                         width: 150,
//                         // custom Text field
//                         child: CustomAutoSizeTextMontserrat(
//                           text: Get.find<DashboardController>()
//                                   .studentPanel
//                                   .passportDetails![0]
//                                   .citizenOf ??
//                               "",
//                           maxLines: 2,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(left: 20, right: 20),
//                 child: Divider(
//                   height: 5,
//                   thickness: 1,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
//                 child: SizedBox(
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10),
//                         child: CustomAutoSizeTextMontserrat(
//                           text: "Country Of Issuse",
//                           textColor: Colors.grey,
//                         ),
//                       ),
//                       const Spacer(),
//                       SizedBox(
//                         width: 150,
//                         // custom Text field
//                         child: CustomAutoSizeTextMontserrat(
//                           text: Get.find<DashboardController>()
//                                   .studentPanel
//                                   .passportDetails![0]
//                                   .countryOfIssue ??
//                               "",
//                           maxLines: 2,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(left: 20, right: 20),
//                 child: Divider(
//                   height: 5,
//                   thickness: 1,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
//                 child: SizedBox(
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10),
//                         child: CustomAutoSizeTextMontserrat(
//                           text: "Place Of Issuse",
//                           textColor: Colors.grey,
//                         ),
//                       ),
//                       const Spacer(),
//                       SizedBox(
//                         width: 150,
//                         // custom Text field
//                         child: CustomAutoSizeTextMontserrat(
//                           text: Get.find<DashboardController>()
//                                   .studentPanel
//                                   .passportDetails![0]
//                                   .placeOfIssue ??
//                               "",
//                           fontWeight: FontWeight.w600,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(left: 20, right: 20),
//                 child: Divider(
//                   height: 5,
//                   thickness: 1,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
//                 child: SizedBox(
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10),
//                         child: CustomAutoSizeTextMontserrat(
//                           text: "Date Of Issuse",
//                           textColor: Colors.grey,
//                         ),
//                       ),
//                       const Spacer(),
//                       SizedBox(
//                         width: 150,
//                         // custom Text field
//                         child: CustomAutoSizeTextMontserrat(
//                           text: Get.find<DashboardController>()
//                                   .studentPanel
//                                   .passportDetails![0]
//                                   .dateOfIssue ??
//                               "",
//                           fontWeight: FontWeight.w600,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(left: 20, right: 20),
//                 child: Divider(
//                   height: 5,
//                   thickness: 1,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
//                 child: SizedBox(
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10),
//                         child: CustomAutoSizeTextMontserrat(
//                           text: "Expire Date",
//                           textColor: Colors.grey,
//                         ),
//                       ),
//                       const Spacer(),
//                       SizedBox(
//                         width: 150,
//                         // custom Text field
//                         child: CustomAutoSizeTextMontserrat(
//                           text: Get.find<DashboardController>()
//                                   .studentPanel
//                                   .passportDetails![0]
//                                   .expiryDate ??
//                               "",
//                           fontWeight: FontWeight.w600,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(left: 20, right: 20),
//                 child: Divider(
//                   height: 5,
//                   thickness: 1,
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
