// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class MyWidget extends StatelessWidget {
//   const MyWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return   
//     if (Get.find<CourseSearchController>()
//                               .loadingCourseSearchDetail
//                               .value ==
//                           true)
//                         Padding(
//                           padding: const EdgeInsets.only(top: 15, bottom: 15),
//                           child: Row(
//                             children: [
//                               const Spacer(),
//                               InkWell(
//                                 onTap: () {
//                                   Get.bottomSheet(Container(
//                                     width: MediaQuery.of(context).size.width,
//                                     height: 250,
//                                     color: ThemeConstants.whitecolor,
//                                     child: Column(
//                                       children: [
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                               top: 10, right: 5, left: 5),
//                                           child: Container(
//                                             width: MediaQuery.of(context)
//                                                 .size
//                                                 .width,
//                                             decoration: BoxDecoration(
//                                               color:
//                                                   ThemeConstants.lightblueColor,
//                                               borderRadius:
//                                                   const BorderRadius.all(
//                                                       Radius.circular(10)),
//                                             ),
//                                             height: 40,
//                                             child: Row(
//                                               children: [
//                                                 const Spacer(),
//                                                 CustomAutoSizeTextMontserrat(
//                                                   text: "Sort By",
//                                                   textColor:
//                                                       ThemeConstants.bluecolor,
//                                                   fontSize: 20,
//                                                 ),
//                                                 const SizedBox(
//                                                   width: 5,
//                                                 ),
//                                                 SvgPicture.asset(
//                                                   "assets/icons/sort.svg",
//                                                   height: 20,
//                                                   color:
//                                                       ThemeConstants.bluecolor,
//                                                 ),
//                                                 const Spacer(),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           child: Row(
//                                             children: [
//                                               Column(
//                                                 children: [
//                                                   SizedBox(
//                                                     width:
//                                                         MediaQuery.of(context)
//                                                                 .size
//                                                                 .width /
//                                                             2,
//                                                     child: Align(
//                                                       alignment:
//                                                           AlignmentDirectional
//                                                               .topStart,
//                                                       child: TextButton(
//                                                           onPressed: () {},
//                                                           child:
//                                                               CustomAutoSizeTextMontserrat(
//                                                             text: "Budget",
//                                                           )),
//                                                     ),
//                                                   ),
//                                                   SizedBox(
//                                                     width:
//                                                         MediaQuery.of(context)
//                                                                 .size
//                                                                 .width /
//                                                             2,
//                                                     child: Align(
//                                                       alignment:
//                                                           AlignmentDirectional
//                                                               .topStart,
//                                                       child: TextButton(
//                                                           onPressed: () {},
//                                                           child:
//                                                               CustomAutoSizeTextMontserrat(
//                                                             text: "%Range",
//                                                           )),
//                                                     ),
//                                                   ),
//                                                   SizedBox(
//                                                     width:
//                                                         MediaQuery.of(context)
//                                                                 .size
//                                                                 .width /
//                                                             2,
//                                                     child: Align(
//                                                       alignment:
//                                                           AlignmentDirectional
//                                                               .topStart,
//                                                       child: TextButton(
//                                                           onPressed: () {},
//                                                           child:
//                                                               CustomAutoSizeTextMontserrat(
//                                                             text:
//                                                                 "Times Ranking",
//                                                           )),
//                                                     ),
//                                                   ),
//                                                   SizedBox(
//                                                     width:
//                                                         MediaQuery.of(context)
//                                                                 .size
//                                                                 .width /
//                                                             2,
//                                                     child: Align(
//                                                       alignment:
//                                                           AlignmentDirectional
//                                                               .topStart,
//                                                       child: TextButton(
//                                                           onPressed: () {},
//                                                           child:
//                                                               CustomAutoSizeTextMontserrat(
//                                                             text:
//                                                                 "QR World Ranking",
//                                                           )),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               SizedBox(
//                                                 height: 200,
//                                                 child: Column(
//                                                   children: [
//                                                     SizedBox(
//                                                       width:
//                                                           MediaQuery.of(context)
//                                                                   .size
//                                                                   .width /
//                                                               2,
//                                                       height: 40,
//                                                       child: ListTile(
//                                                         title: const Text(
//                                                             'Ascending'),
//                                                         leading: Radio<
//                                                             BestTutorSite>(
//                                                           autofocus: true,
//                                                           value: BestTutorSite
//                                                               .Ascending,
//                                                           groupValue: _site,
//                                                           onChanged:
//                                                               (BestTutorSite?
//                                                                   value) {
//                                                             setState(() {
//                                                               _site = value!;
//                                                             });
//                                                           },
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                       width:
//                                                           MediaQuery.of(context)
//                                                                   .size
//                                                                   .width /
//                                                               2,
//                                                       height: 40,
//                                                       child: ListTile(
//                                                         title: const Text(
//                                                             'Deascending'),
//                                                         leading: Radio<
//                                                             BestTutorSite>(
//                                                           value: BestTutorSite
//                                                               .Deascending,
//                                                           groupValue: _site,
//                                                           onChanged:
//                                                               (BestTutorSite?
//                                                                   value) {
//                                                             setState(() {
//                                                               _site = value!;
//                                                             });
//                                                           },
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ));
//                                 },
//                                 child: Container(
//                                   height: 30,
//                                   width: 60,
//                                   decoration: BoxDecoration(
//                                       color: ThemeConstants.whitecolor,
//                                       border: Border.all(
//                                           color: ThemeConstants
//                                               .bluelightgreycolor),
//                                       borderRadius:
//                                           BorderRadiusDirectional.circular(
//                                               5.0)),
//                                   child: Center(
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 5, right: 5),
//                                       child: CustomAutoSizeTextMontserrat(
//                                           text: "Sort",
//                                           fontSize: 12,
//                                           textColor: ThemeConstants
//                                               .bluelightgreycolor),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               const Spacer(),
//                               InkWell(
//                                 onTap: () {
//                                   Get.to(Filter(
//                                     courseModelFilter:
//                                         controller.courseModelFilter,
//                                   ));
//                                 },
//                                 child: Container(
//                                   height: 30,
//                                   width: 60,
//                                   decoration: BoxDecoration(
//                                       color: ThemeConstants.whitecolor,
//                                       border: Border.all(
//                                           color: ThemeConstants
//                                               .bluelightgreycolor),
//                                       borderRadius:
//                                           BorderRadiusDirectional.circular(
//                                               5.0)),
//                                   child: Center(
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 5, right: 5),
//                                       child: CustomAutoSizeTextMontserrat(
//                                           text: "Filter",
//                                           fontSize: 12,
//                                           textColor: ThemeConstants
//                                               .bluelightgreycolor),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               const Spacer(),
//                               InkWell(
//                                 onTap: () {
//                                   if (controller1.compareApply.value == false) {
//                                     controller1.setCompare(true.obs);
//                                   } else {
//                                     controller1.setCompare(false.obs);
//                                   }
//                                 },
//                                 child: Container(
//                                   height: 30,
//                                   width: 70,
//                                   decoration: BoxDecoration(
//                                       color: ThemeConstants.whitecolor,
//                                       border: Border.all(
//                                           color: ThemeConstants
//                                               .bluelightgreycolor),
//                                       borderRadius:
//                                           BorderRadiusDirectional.circular(
//                                               5.0)),
//                                   child: Center(
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 5, right: 5),
//                                       child: CustomAutoSizeTextMontserrat(
//                                           text: "Compare",
//                                           fontSize: 12,
//                                           textColor: ThemeConstants
//                                               .bluelightgreycolor),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               const Spacer(),
//                               InkWell(
//                                 onTap: () {
//                                   Get.toNamed(ReviewShortList.routeNamed);
//                                 },
//                                 child: Container(
//                                   height: 30,
//                                   width: 120,
//                                   decoration: BoxDecoration(
//                                       color: ThemeConstants.whitecolor,
//                                       border: Border.all(
//                                           color: ThemeConstants
//                                               .bluelightgreycolor),
//                                       borderRadius:
//                                           BorderRadiusDirectional.circular(
//                                               5.0)),
//                                   child: Center(
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 5, right: 5),
//                                       child: CustomAutoSizeTextMontserrat(
//                                           text: "Course Shortlist",
//                                           fontSize: 12,
//                                           textColor: ThemeConstants
//                                               .bluelightgreycolor),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               const Spacer(),
//                             ],
//                           ),
//                         ),
//                       if (Get.find<CourseSearchController>()
//                               .loadingCourseSearchDetail
//                               .value ==
//                           true)
//                         Expanded(
//                           child: ListView.builder(
//                               itemCount: controller1.courseSearchModel.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return CollagelistExpandedWidget(
//                                   index: index,
//                                   courseSearchModelCompare1Id:
//                                       controller1.courseSearchModelCompare1.id,
//                                   courseSearchModelCompare2Id:
//                                       controller1.courseSearchModelCompare2.id,
//                                   callbackForModelCompare: callbackModelCompare,
//                                   callbackCompare: callbackCompare,
//                                   callbackShortListButton:
//                                       CallbackShortListButton,
//                                   callbackFinalShortListButton:
//                                       CallbackFinalShortListButton,
//                                   iscompare: controller1.compareApply.value,
//                                   courseSearchModel:
//                                       controller1.courseSearchModel[index],
//                                   callbackFunction:
//                                       callbackCompleteDetailCourse,
//                                 );
//                               }),
//                         ),
//                       if (controller1.compareApply.value == true)
//                         InkWell(
//                           onTap: () {
//                             Get.to(
//                               Comparing(
//                                 courseSearchModel1:
//                                     Get.find<CourseSearchController>()
//                                         .courseSearchModelCompare1,
//                                 courseSearchModel2:
//                                     Get.find<CourseSearchController>()
//                                         .courseSearchModelCompare2,
//                               ),
//                             );
//                           },
//                           child: Container(
//                             height: 60,
//                             width: MediaQuery.of(context).size.width,
//                             decoration: BoxDecoration(
//                                 color: ThemeConstants.bluecolor,
//                                 borderRadius:
//                                     const BorderRadiusDirectional.only(
//                                   topStart: Radius.circular(20.0),
//                                   topEnd: Radius.circular(20.0),
//                                 )),
//                             child: Center(
//                               child: Row(
//                                 children: [
//                                   const Spacer(),
//                                   SvgPicture.asset(
//                                     "assets/icons/compare.svg",
//                                     height: 30,
//                                     color: ThemeConstants.whitecolor,
//                                   ),
//                                   const SizedBox(
//                                     width: 5,
//                                   ),
//                                   CustomAutoSizeTextMontserrat(
//                                     text: "Compare",
//                                     fontSize: 20,
//                                     textColor: ThemeConstants.whitecolor,
//                                   ),
//                                   const Spacer(),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       if (controller1.loadingCourseSearchDetail.value == false)
    
//   }
// }