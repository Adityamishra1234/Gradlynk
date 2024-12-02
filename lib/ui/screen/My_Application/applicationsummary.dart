import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/applicationsummarycontroller.dart';
import 'package:studentpanel/ui/screen/My_Application/applicationcompletedetail.dart';
import 'package:studentpanel/utils/constants.dart';

import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customBottomNavbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

import '../../../widgets/drawerfilter.dart';
import '../../controllers/basecontroller.dart';
import '../mark_attendance/qrCodeScreen.dart';

class ApplicationSummary extends StatefulWidget {
  ApplicationSummary({Key? key}) : super(key: key);
  static const routeNamed = '/ApplicationSummary';

  @override
  State<ApplicationSummary> createState() => _ApplicationSummaryState();
}

class _ApplicationSummaryState extends State<ApplicationSummary> {
  var controller = Get.put(ApplicationSummaryController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController =ScrollController();

  // List<Map<String, dynamic>> items = [];
  @override
  Widget build(BuildContext context) {
    bool isFocused = false;
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 700;
    double width = MediaQuery.of(context).size.width;

    FocusNode _searchFocusNode = FocusNode();

    if (displayMobileLayout == true) {
      width = MediaQuery.of(context).size.width - 240.00;
    }

    print(controller.searchedList.length);
    print(controller.searchedList.length);

    return Scaffold(
      key: _scaffoldKey,
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
                icon: const Icon(Icons.menu, color: Colors.black,),
                // icon: const Icon(Icons.menu,color: Colors.black,),
                onPressed: () {
                  // Get.find<BaseController>().profileDataValidator();
                  _scaffoldKey.currentState!.openDrawer();

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
              index: 2,
            )
          : null,
      body: GetBuilder<ApplicationSummaryController>(builder: (_) {
        // For Update model with Staus Name
        if (_.loadingStatus.value == true &&
            _.loadingApplicationSummary.value == true) {
          for (var i = 0; i < _.searchedList.length; i++) {
            for (var j = 0; j < _.statusListId.length; j++) {
              if (_.searchedList[i].statusId.toString() ==
                  _.statusListId[j].toString()) {
                _.searchedList[i].statusName = _.statusListName[j];
              }
            }
          }
        }

        // For  Update model with Stage Names
        if (_.loadingStage.value == true &&
            _.loadingApplicationSummary.value == true) {
          for (var i = 0; i < _.searchedList.length; i++) {
            for (var j = 0; j < _.stageListID.length; j++) {
              if (_.searchedList[i].stageId.toString() ==
                  _.stageListID[j].toString()) {
                _.searchedList[i].stageName = _.stageNameList[j];
              }
            }
          }
        }


        return Row(
          children: [
            if (displayMobileLayout == true)
              CustomDrawer(
                index: 2,
              ),
            Flexible(
              child: Column(
                children: [
                  if (_.loadingApplicationSummary.value == true)
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 20),
                      child: Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: CustomAutoSizeTextMontserrat(
                          text: "Track Your Application",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          textColor: ThemeConstants.bluecolor,
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       vertical: 10, horizontal: 10),
                  //   child: SizedBox(
                  //     height: 55,
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(15),
                  //         color: Colors.white,
                  //         boxShadow: [
                  //           BoxShadow(
                  //             color: ThemeConstants.bluecolor.withOpacity(0.5),
                  //             spreadRadius: -2,
                  //             blurRadius: 9,
                  //             offset: const Offset(0, 6),
                  //           )
                  //         ],
                  //
                  //         border: Border.all(
                  //           color: isFocused ? ThemeConstants.bluecolor: Colors.transparent,
                  //         ),
                  //       ),
                  //       child: Center(
                  //         child: TextField(
                  //           focusNode: _searchFocusNode,
                  //           onChanged: (value) {
                  //             controller.filterSearchResults(value.toString());
                  //             controller.update();
                  //           },
                  //           decoration: const InputDecoration(
                  //             border: InputBorder.none,
                  //             hintText: "Search by country or university",
                  //             prefixIcon: Icon(Icons.search),
                  //             hintStyle: TextStyle(color: Colors.grey),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  //
                  // ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: SizedBox(
                      height: 55,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.5),
                              spreadRadius: -3.9,
                              blurRadius: 10,
                              offset: const Offset(0, 6),
                            )
                          ],
                          border: Border.all(
                            color: _searchFocusNode.hasFocus ? ThemeConstants.bluecolor.withOpacity(0.6) : Colors.transparent,
                          ),
                        ),
                        child: Center(
                          child: TextField(
                            onChanged: (value) {
                             controller.filterSearchResults(value.toString());
                              if(controller.searchedList.isEmpty){
                                print("no result found");
                                 Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Container(
                                        width: 200,
                                        height: 200,
                                        color: Colors.black,
                                        child: Text("No Results Found", style: TextStyle(
                                            color: Colors.white
                                        ),),
                                      ),
                                    ),
                                  ],
                                );
                              }
                             controller.update();
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search by country or university",
                              prefixIcon: Icon(Icons.search),
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  if (_.loadingApplicationSummary.value == true)
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          controller: ScrollController(),
                          itemCount: controller.searchedList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed(
                                    ApplicationCompleteDetails.routeNamed,
                                    arguments: controller.searchedList[index].id
                                        .toString());
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: Colors.grey,
                                        width: 0.2),
                                    borderRadius: BorderRadius.circular(15),

                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 15, right: 10, left: 10),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomAutoSizeTextMontserrat(
                                            text: controller.searchedList[index]
                                                .universityName,
                                            fontSize: 14,
                                            textColor: ThemeConstants.bluecolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              CustomAutoSizeTextMontserrat(
                                                text: "Country: ",
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              SizedBox(
                                                width: width-100,
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .searchedList[index]
                                                      .countryName,
                                                  fontSize: 14,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              CustomAutoSizeTextMontserrat(
                                                text: "Course Level: ",
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              SizedBox(
                                                width: width - 140,
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .searchedList[index]
                                                      .courseLevel,
                                                  fontSize: 14,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              CustomAutoSizeTextMontserrat(
                                                text: "Course Name: ",
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              SizedBox(
                                                width: width - 140,
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .searchedList[index]
                                                      .courseName,
                                                  fontSize: 14,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              CustomAutoSizeTextMontserrat(
                                                text: "campus Name: ",
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              SizedBox(
                                                width: width - 150,
                                                child:
                                                    CustomAutoSizeTextMontserrat(
                                                  text: controller
                                                      .searchedList[index]
                                                      .campusName,
                                                  fontSize: 14,
                                                  textColor:
                                                      ThemeConstants.TextColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: width,
                                            decoration: BoxDecoration(
                                                color: ThemeConstants
                                                    .bluecolor.withAlpha(180),
                                                borderRadius:
                                                    BorderRadius.circular(7.0)),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 10,
                                                      left: 10,
                                                      bottom: 10),
                                                  child:
                                                      CustomAutoSizeTextMontserrat(
                                                    text: "Stage: ",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                        textColor: Colors.white,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                SizedBox(
                                                  width: width-95,
                                                  child:
                                                      CustomAutoSizeTextMontserrat(
                                                    text: controller
                                                        .searchedList[index]
                                                        .stageName,
                                                    textColor:
                                                        ThemeConstants.whitecolor,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width:
                                                MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(7.0),
                                              color:
                                                  ThemeConstants.bluecolor.withAlpha(130),
                                            ),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 10,
                                                      bottom: 10,
                                                      left: 10),
                                                  child:
                                                      CustomAutoSizeTextMontserrat(
                                                    text: "Status: ",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                        textColor: Colors.white,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                SizedBox(
                                                  width: width - 100,
                                                  child:
                                                      CustomAutoSizeTextMontserrat(
                                                    text: controller
                                                        .searchedList[index]
                                                        .statusName,
                                                    fontSize: 14,
                                                    textColor:
                                                        ThemeConstants.whitecolor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  if (_.loadingApplicationSummary.value == false)
                    const Spacer(),
                  if (_.loadingApplicationSummary.value == false)
                    Center(child: getLoading(context)),
                  if (_.loadingApplicationSummary.value == false)
                    const Spacer(),
                ],
              ),
            ),
          ],
        );

      }),
      // bottomNavigationBar: CustomButtomNavbar(
      //   currentIndex: 5,
      //   context2: context,
      // ),


    );
  }
}



//  Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 10, horizontal: 10),
//                     child: SizedBox(
//                       height: 50,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           color: Colors.white,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               spreadRadius: -2,
//                               blurRadius: 9,
//                               offset: const Offset(0, 6),
//                             )
//                           ],
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10),
//                           child: TextField(
//                             onChanged: (value) {
//                               controller.filterSearchResults(value.toString());
//                               controller.update();
//                             },
//                             decoration: const InputDecoration(
//                               border: InputBorder.none,
//                               hintText: "Search by country or university",
//                               prefixIcon: Icon(Icons.search),
//                               hintStyle: TextStyle(color: Colors.grey),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//
//                   ),





//return row wala h ye
// Row(
//           children: [
//             if (displayMobileLayout == true)
//               CustomDrawer(
//                 index: 2,
//               ),
//             Flexible(
//               child: Column(
//                 children: [
//                   if (_.loadingApplicationSummary.value == true)
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10, top: 20),
//                       child: Align(
//                         alignment: AlignmentDirectional.topCenter,
//                         child: CustomAutoSizeTextMontserrat(
//                           text: "Track Your Application",
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                           textColor: ThemeConstants.bluecolor,
//                         ),
//                       ),
//                     ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   // Padding(
//                   //   padding: const EdgeInsets.symmetric(
//                   //       vertical: 10, horizontal: 10),
//                   //   child: SizedBox(
//                   //     height: 55,
//                   //     child: Container(
//                   //       decoration: BoxDecoration(
//                   //         borderRadius: BorderRadius.circular(15),
//                   //         color: Colors.white,
//                   //         boxShadow: [
//                   //           BoxShadow(
//                   //             color: ThemeConstants.bluecolor.withOpacity(0.5),
//                   //             spreadRadius: -2,
//                   //             blurRadius: 9,
//                   //             offset: const Offset(0, 6),
//                   //           )
//                   //         ],
//                   //
//                   //         border: Border.all(
//                   //           color: isFocused ? ThemeConstants.bluecolor: Colors.transparent,
//                   //         ),
//                   //       ),
//                   //       child: Center(
//                   //         child: TextField(
//                   //           focusNode: _searchFocusNode,
//                   //           onChanged: (value) {
//                   //             controller.filterSearchResults(value.toString());
//                   //             controller.update();
//                   //           },
//                   //           decoration: const InputDecoration(
//                   //             border: InputBorder.none,
//                   //             hintText: "Search by country or university",
//                   //             prefixIcon: Icon(Icons.search),
//                   //             hintStyle: TextStyle(color: Colors.grey),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ),
//                   //
//                   // ),
//
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                     child: SizedBox(
//                       height: 55,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.white,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.blue.withOpacity(0.5),
//                               spreadRadius: -3.9,
//                               blurRadius: 10,
//                               offset: const Offset(0, 6),
//                             )
//                           ],
//                           border: Border.all(
//                             color: _searchFocusNode.hasFocus ? ThemeConstants.bluecolor.withOpacity(0.6) : Colors.transparent,
//                           ),
//                         ),
//                         child: Center(
//                           child: TextField(
//                             focusNode: _searchFocusNode,
//                             onChanged: (value) {
//                               controller.filterSearchResults(value.toString());
//                               controller.update();
//                             },
//                             decoration: const InputDecoration(
//                               border: InputBorder.none,
//                               hintText: "Search by country or university",
//                               prefixIcon: Icon(Icons.search),
//                               hintStyle: TextStyle(color: Colors.grey),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   if (_.loadingApplicationSummary.value == true)
//                     Expanded(
//                       child: ListView.builder(
//                           shrinkWrap: true,
//                           controller: ScrollController(),
//                           itemCount: controller.searchedList.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return InkWell(
//                               onTap: () {
//                                 Get.toNamed(
//                                     ApplicationCompleteDetails.routeNamed,
//                                     arguments: controller.searchedList[index].id
//                                         .toString());
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(vertical: 8),
//                                 child: Card(
//                                   elevation: 10,
//                                   shape: RoundedRectangleBorder(
//                                     side: BorderSide(
//                                         color: Colors.grey,
//                                         width: 0.2),
//                                     borderRadius: BorderRadius.circular(15),
//
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 15, bottom: 15, right: 10, left: 10),
//                                     child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           CustomAutoSizeTextMontserrat(
//                                             text: controller.searchedList[index]
//                                                 .universityName,
//                                             fontSize: 14,
//                                             textColor: ThemeConstants.bluecolor,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           Row(
//                                             children: [
//                                               CustomAutoSizeTextMontserrat(
//                                                 text: "Country: ",
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 14,
//                                               ),
//                                               const SizedBox(
//                                                 width: 5,
//                                               ),
//                                               SizedBox(
//                                                 width: width-100,
//                                                 child:
//                                                     CustomAutoSizeTextMontserrat(
//                                                   text: controller
//                                                       .searchedList[index]
//                                                       .countryName,
//                                                   fontSize: 14,
//                                                   textColor:
//                                                       ThemeConstants.TextColor,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           Row(
//                                             children: [
//                                               CustomAutoSizeTextMontserrat(
//                                                 text: "Course Level: ",
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 14,
//                                               ),
//                                               const SizedBox(
//                                                 width: 5,
//                                               ),
//                                               SizedBox(
//                                                 width: width - 140,
//                                                 child:
//                                                     CustomAutoSizeTextMontserrat(
//                                                   text: controller
//                                                       .searchedList[index]
//                                                       .courseLevel,
//                                                   fontSize: 14,
//                                                   textColor:
//                                                       ThemeConstants.TextColor,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           Row(
//                                             children: [
//                                               CustomAutoSizeTextMontserrat(
//                                                 text: "Course Name: ",
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 14,
//                                               ),
//                                               const SizedBox(
//                                                 width: 5,
//                                               ),
//                                               SizedBox(
//                                                 width: width - 140,
//                                                 child:
//                                                     CustomAutoSizeTextMontserrat(
//                                                   text: controller
//                                                       .searchedList[index]
//                                                       .courseName,
//                                                   fontSize: 14,
//                                                   textColor:
//                                                       ThemeConstants.TextColor,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           Row(
//                                             children: [
//                                               CustomAutoSizeTextMontserrat(
//                                                 text: "campus Name: ",
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 14,
//                                               ),
//                                               const SizedBox(
//                                                 width: 5,
//                                               ),
//                                               SizedBox(
//                                                 width: width - 150,
//                                                 child:
//                                                     CustomAutoSizeTextMontserrat(
//                                                   text: controller
//                                                       .searchedList[index]
//                                                       .campusName,
//                                                   fontSize: 14,
//                                                   textColor:
//                                                       ThemeConstants.TextColor,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           Container(
//                                             width: width,
//                                             decoration: BoxDecoration(
//                                                 color: ThemeConstants
//                                                     .GreenColor.withAlpha(180),
//                                                 borderRadius:
//                                                     BorderRadius.circular(7.0)),
//                                             child: Row(
//                                               children: [
//                                                 Padding(
//                                                   padding: const EdgeInsets.only(
//                                                       top: 10,
//                                                       left: 10,
//                                                       bottom: 10),
//                                                   child:
//                                                       CustomAutoSizeTextMontserrat(
//                                                     text: "Stage: ",
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 14,
//                                                         textColor: Colors.white,
//                                                   ),
//                                                 ),
//                                                 const SizedBox(
//                                                   width: 5,
//                                                 ),
//                                                 SizedBox(
//                                                   width: width-95,
//                                                   child:
//                                                       CustomAutoSizeTextMontserrat(
//                                                     text: controller
//                                                         .searchedList[index]
//                                                         .stageName,
//                                                     textColor:
//                                                         ThemeConstants.whitecolor,
//                                                     fontSize: 14,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           Container(
//                                             width:
//                                                 MediaQuery.of(context).size.width,
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                               BorderRadius.circular(7.0),
//                                               color:
//                                                   ThemeConstants.orangeColor.withAlpha(180),
//                                             ),
//                                             child: Row(
//                                               children: [
//                                                 Padding(
//                                                   padding: const EdgeInsets.only(
//                                                       top: 10,
//                                                       bottom: 10,
//                                                       left: 10),
//                                                   child:
//                                                       CustomAutoSizeTextMontserrat(
//                                                     text: "Status: ",
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 14,
//                                                         textColor: Colors.white,
//                                                   ),
//                                                 ),
//                                                 const SizedBox(
//                                                   width: 5,
//                                                 ),
//                                                 SizedBox(
//                                                   width: width - 100,
//                                                   child:
//                                                       CustomAutoSizeTextMontserrat(
//                                                     text: controller
//                                                         .searchedList[index]
//                                                         .statusName,
//                                                     fontSize: 14,
//                                                     textColor:
//                                                         ThemeConstants.whitecolor,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ]),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           }),
//                     ),
//                   if (_.loadingApplicationSummary.value == false)
//                     const Spacer(),
//                   if (_.loadingApplicationSummary.value == false)
//                     Center(child: getLoading(context)),
//                   if (_.loadingApplicationSummary.value == false)
//                     const Spacer(),
//                 ],
//               ),
//             ),
//           ],
//         );








//
