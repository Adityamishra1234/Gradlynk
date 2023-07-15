import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/fund/fund_requiremen.dart';
import 'package:studentpanel/utils/conditionals/switchForMaximumScoreEnglsihTest.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/Custom_Tabbar/custom_tabbar.dart';
import 'package:studentpanel/widgets/button/custom_button.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/custombutton.dart';
import 'package:studentpanel/ui/screen/letsGetStarted/letsGetStartedController.dart';
import 'package:studentpanel/widgets/customtextfield.dart';

class LetsGetStartedMainView extends StatefulWidget {
  static const routeNamed = '/letsGetStarted';
  LetsGetStartedMainView({super.key});

  @override
  State<LetsGetStartedMainView> createState() => _LetsGetStartedMainViewState();
}

class _LetsGetStartedMainViewState extends State<LetsGetStartedMainView> {
  var controller = Get.put(LetsGetStartedController());

  // @override
  // void initState() {
  //   // controller.onInit();
  //   controller.initialized;
  //   // TODO: implement initState
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 252, 255),
      body: controller.obx(
        (state) => SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    const Positioned(
                      left: -250,
                      top: -250,
                      child: CircleAvatar(
                        radius: 240,
                        backgroundColor: Color.fromARGB(32, 0, 76, 138),
                      ),
                    ),
                    Positioned(
                        right: 0,
                        top: 0,
                        child: Image.asset(
                          'assets/images/letsGetStarted_bgImage.png',
                          width: MediaQuery.of(context).size.width * 0.65,
                        ))
                    //  Positioned(
                    //   left: -160,
                    //   top: -160,
                    //   child: ClipRRect(

                    //     radius: 200,
                    //     backgroundColor: ThemeConstants.GreenColor,
                    //   ),
                    // )
                  ],
                ),
              ),
              Form(
                key: controller.formKey,
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.22,
                        ),
                        if (controller.showConsentTermsForm == true)
                          SizedBox(
                            height: 80,
                          ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 15),
                        //   child: Stack(
                        //     children: [
                        //       Container(
                        //         decoration: BoxDecoration(
                        //             color: ThemeConstants.ultraLightgreyColor,
                        //             borderRadius: BorderRadius.circular(20)),
                        //         width: 240,
                        //         height: 10,
                        //       ),
                        //       AnimatedContainer(
                        //         curve: Curves.fastOutSlowIn,
                        //         duration: Duration(milliseconds: 800),
                        //         width: controller.widthOfSlider,
                        //         height: 10,
                        //         decoration: BoxDecoration(
                        //             color: ThemeConstants.bluecolor,
                        //             borderRadius: BorderRadius.circular(20)),
                        //       )
                        //     ],
                        //   ),
                        // ),

                        SizedBox(
                          height: 10,
                        ),
                        if (controller.questionNumberToShow == 1) ...[
                          Container(
                            padding: EdgeInsets.only(left: 15),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomAutoSizeTextMontserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 28,
                                      text: "Let's Get Started!"),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  // Container(
                                  //   child: Wrap(
                                  //     alignment: WrapAlignment.start,
                                  //     runSpacing: 15,
                                  //     spacing: 15,
                                  //     children: [
                                  //       CustomButtonWidget(
                                  //         onTapF: () {
                                  //           controller.selectedQualification(7);
                                  //         },
                                  //         isSelected: controller
                                  //                     .selectedLastQualification ==
                                  //                 7
                                  //             ? true
                                  //             : false,
                                  //         text: '12th',
                                  //         selectedColor:
                                  //             ThemeConstants.bluecolor,
                                  //       ),
                                  //       CustomButtonWidget(
                                  //         onTap: () {
                                  //           controller.selectedQualification(4);
                                  //         },
                                  //         selectedColor:
                                  //             ThemeConstants.bluecolor,
                                  //         isSelected: controller
                                  //                     .selectedLastQualification ==
                                  //                 4
                                  //             ? true
                                  //             : false,
                                  //         text: 'Bachelors',
                                  //       ),
                                  //       CustomButtonWidget(
                                  //         onTap: () {
                                  //           controller.selectedQualification(3);
                                  //         },
                                  //         text: 'Masters',
                                  //         selectedColor:
                                  //             ThemeConstants.bluecolor,
                                  //         isSelected: controller
                                  //                     .selectedLastQualification ==
                                  //                 3
                                  //             ? true
                                  //             : false,
                                  //       ),
                                  //       CustomButtonWidget(
                                  //         onTap: () {
                                  //           controller.selectedQualification(6);
                                  //         },
                                  //         selectedColor:
                                  //             ThemeConstants.bluecolor,
                                  //         isSelected: controller
                                  //                     .selectedLastQualification ==
                                  //                 6
                                  //             ? true
                                  //             : false,
                                  //         text: 'Diploma',
                                  //       ),
                                  //     ],
                                  //   ),
                                  // )
                                ]),
                          ),
                        ],
                        if (controller.showConsentTermsForm == true) ...[
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: SizedBox(
                                width: 300.0,
                                height: 60.0,
                                child: Center(
                                    child: CustomAutoSizeTextMontserrat(
                                  text:
                                      "Welcome to SIEC Gradlynk Student Panel",
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                  textColor: ThemeConstants.bluecolor,
                                ))),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: SizedBox(
                                width: 300.0,
                                child: Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "I, agree to the following :",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    textColor: ThemeConstants.blackcolor,
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: SizedBox(
                                width: 300.0,
                                height: 150.0,
                                child: Center(
                                    child: CustomAutoSizeTextMontserrat(
                                  fontWeight: FontWeight.w400,
                                  text:
                                      """1. Neither, I nor my heirs, will claim against SIC for using my information throughout the process.
2. All the information submitted is correct and collaborates with my legal documents.
3. In case of any discrepancy in information, SIEC will not be liable for any halt throughout the process.
4.I, agree to all SIEC's Terms & Conditions.""",
                                  fontSize: 18,
                                  textColor: ThemeConstants.blackcolor,
                                ))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: () async {
                                controller.postLetsGetStartedData();
                              },
                              child: Container(
                                height: 35,
                                width: 300,
                                decoration: BoxDecoration(
                                    color: ThemeConstants.bluecolor,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Center(
                                    child: CustomAutoSizeTextMontserrat(
                                  text: "I Agree",
                                  textColor: ThemeConstants.whitecolor,
                                )),
                              ),
                            ),
                          )
                        ],

                        if (controller.questionNumberToShow == 2) ...[
                          Container(
                            padding: EdgeInsets.only(left: 15),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomAutoSizeTextMontserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 28,
                                      text: 'What is your last qualification'),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Wrap(
                                      alignment: WrapAlignment.start,
                                      runSpacing: 15,
                                      spacing: 15,
                                      children: [
                                        CustomButtonWidget(
                                          onTap: () {
                                            controller.selectedQualification(7);
                                          },
                                          isSelected: controller
                                                      .selectedLastQualification ==
                                                  7
                                              ? true
                                              : false,
                                          text: '12th',
                                          selectedColor:
                                              ThemeConstants.bluecolor,
                                        ),
                                        CustomButtonWidget(
                                          onTap: () {
                                            controller.selectedQualification(4);
                                          },
                                          selectedColor:
                                              ThemeConstants.bluecolor,
                                          isSelected: controller
                                                      .selectedLastQualification ==
                                                  4
                                              ? true
                                              : false,
                                          text: 'Bachelors',
                                        ),
                                        CustomButtonWidget(
                                          onTap: () {
                                            controller.selectedQualification(3);
                                          },
                                          text: 'Masters',
                                          selectedColor:
                                              ThemeConstants.bluecolor,
                                          isSelected: controller
                                                      .selectedLastQualification ==
                                                  3
                                              ? true
                                              : false,
                                        ),
                                        CustomButtonWidget(
                                          onTap: () {
                                            controller.selectedQualification(6);
                                          },
                                          selectedColor:
                                              ThemeConstants.bluecolor,
                                          isSelected: controller
                                                      .selectedLastQualification ==
                                                  6
                                              ? true
                                              : false,
                                          text: 'Diploma',
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                        ],

                        //         Padding(
                        //           padding: const EdgeInsets.symmetric(
                        //               horizontal: 30, vertical: 20),
                        //           child: CustomAutoSizeTextMontserrat(
                        //               fontWeight: FontWeight.w600,
                        //               fontSize: 28,
                        //               text: 'What is your last qualification?'),
                        //         ),
                        //         Container(
                        //           padding:
                        //               EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                        //           height: MediaQuery.of(context).size.height * 0.4,
                        //           child: Wrap(
                        //             alignment: WrapAlignment.start,
                        //             runSpacing: 20,
                        //             spacing: 25,
                        //             children: [
                        //               CustomButtonWidget(
                        //                 text: '12th',
                        //               ),
                        //               CustomButtonWidget(
                        //                 text: 'Bachelors',
                        //               ),
                        //               CustomButtonWidget(
                        //                 text: 'Masters',
                        //               ),
                        //               CustomButtonWidget(
                        //                 text: 'Diploma',
                        //               ),
                        //               // Row(
                        //               //   mainAxisAlignment: MainAxisAlignment.end,
                        //               //   children: [
                        //               //     CustomIconTextTogether(
                        //               //       text: 'Back',
                        //               //       Bgcolor: ThemeConstants.whitecolor,
                        //               //       color: ThemeConstants.bluecolor,
                        //               //       fontWeight: FontWeight.w400,
                        //               //       textSize: 12,
                        //               //       iconData: Icon(
                        //               //         Icons.arrow_back_ios_new_rounded,
                        //               //         size: 10,
                        //               //         color: ThemeConstants.bluecolor,
                        //               //       ),
                        //               //     ),
                        //               //     const SizedBox(
                        //               //       width: 20,
                        //               //     ),
                        //               //     CustomIconTextTogether(
                        //               //       // iconBeforeText: false,
                        //               //       text: 'Next',
                        //               //       Bgcolor: ThemeConstants.whitecolor,
                        //               //       color: ThemeConstants.bluecolor,
                        //               //       fontWeight: FontWeight.w400,
                        //               //       textSize: 12,
                        //               //       iconData: Icon(
                        //               //         Icons.navigate_next,
                        //               //         size: 15,
                        //               //         color: ThemeConstants.bluecolor,
                        //               //       ),
                        //               //     ),
                        //               //     const SizedBox(
                        //               //       width: 35,
                        //               //     ),
                        //               //   ],
                        //               // )
                        //             ],
                        //           ),
                        //         )
                        //       ]),
                        // ),
                        if (controller.questionNumberToShow == 3) ...[
                          if (controller.questionToShowInEnglsihTest == 0) ...[
                            Container(
                                padding: EdgeInsets.only(left: 15),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomAutoSizeTextMontserrat(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 28,
                                          text:
                                              'Have you appeared in English test?'),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          child: Wrap(
                                              alignment: WrapAlignment.start,
                                              runSpacing: 20,
                                              spacing: 15,
                                              children: [
                                            CustomButtonWidget(
                                              selectedColor:
                                                  ThemeConstants.bluecolor,
                                              isSelected: controller
                                                          .selectedAppearedInEnglishTest ==
                                                      1
                                                  ? true
                                                  : false,
                                              onTap: () {
                                                controller
                                                    .selectedAppearedInEnglishTest = 1;
                                                controller.update();
                                              },
                                              text: 'Yes',
                                            ),
                                            CustomButtonWidget(
                                              selectedColor:
                                                  ThemeConstants.bluecolor,
                                              isSelected: controller
                                                          .selectedAppearedInEnglishTest ==
                                                      2
                                                  ? true
                                                  : false,
                                              onTap: () {
                                                controller
                                                    .selectedAppearedInEnglishTest = 2;

                                                controller.update();
                                              },
                                              text: 'No',
                                            ),
                                            // CustomButtonWidget(
                                            //   text: 'Masters',
                                            // ),
                                            // CustomButtonWidget(
                                            //   text: 'Diploma',
                                            // ),
                                          ])),
                                    ])),
                          ],
                          if (controller.questionToShowInEnglsihTest == 1) ...[
                            Container(
                                padding: EdgeInsets.only(left: 15),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomAutoSizeTextMontserrat(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 28,
                                          text:
                                              'Select the test you have appeared for?'),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                          child: Wrap(
                                              alignment: WrapAlignment.start,
                                              runSpacing: 20,
                                              spacing: 25,
                                              children: [
                                            CustomButtonWidget(
                                              selectedColor:
                                                  ThemeConstants.bluecolor,
                                              isSelected: controller
                                                          .selectedTestYouAppearedFor ==
                                                      'IELTS'
                                                  ? true
                                                  : false,
                                              onTap: () {
                                                controller
                                                        .selectedTestYouAppearedFor =
                                                    'IELTS';
                                                controller.update();
                                              },
                                              text: 'IELTS',
                                            ),
                                            CustomButtonWidget(
                                              selectedColor:
                                                  ThemeConstants.bluecolor,
                                              isSelected: controller
                                                          .selectedTestYouAppearedFor ==
                                                      'PTE'
                                                  ? true
                                                  : false,
                                              onTap: () {
                                                controller
                                                        .selectedTestYouAppearedFor =
                                                    'PTE';

                                                controller.update();
                                              },
                                              text: 'PTE',
                                            ),
                                            CustomButtonWidget(
                                              selectedColor:
                                                  ThemeConstants.bluecolor,
                                              isSelected: controller
                                                          .selectedTestYouAppearedFor ==
                                                      'TOEFL'
                                                  ? true
                                                  : false,
                                              onTap: () {
                                                controller
                                                        .selectedTestYouAppearedFor =
                                                    'TOEFL';

                                                controller.update();
                                              },
                                              text: 'TOEFL',
                                            ),
                                            CustomButtonWidget(
                                              selectedColor:
                                                  ThemeConstants.bluecolor,
                                              isSelected: controller
                                                          .selectedTestYouAppearedFor ==
                                                      'Duolingo'
                                                  ? true
                                                  : false,
                                              onTap: () {
                                                controller
                                                        .selectedTestYouAppearedFor =
                                                    'Duolingo';

                                                controller.update();
                                              },
                                              text: 'Duolingo',
                                            ),
                                            CustomButtonWidget(
                                              selectedColor:
                                                  ThemeConstants.bluecolor,
                                              isSelected: controller
                                                          .selectedTestYouAppearedFor ==
                                                      'Cambridge'
                                                  ? true
                                                  : false,
                                              onTap: () {
                                                controller
                                                        .selectedTestYouAppearedFor =
                                                    'Cambridge';

                                                controller.update();
                                              },
                                              text: 'Cambridge',
                                            ),
                                            // CustomButtonWidget(
                                            //   text: 'Masters',
                                            // ),
                                            // CustomButtonWidget(
                                            //   text: 'Diploma',
                                            // ),
                                          ])),
                                    ])),
                          ],
                          if (controller.questionToShowInEnglsihTest == 2) ...[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              child: CustomAutoSizeTextMontserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 28,
                                  text:
                                      'Specify \nYour \n${controller.selectedTestYouAppearedFor} score.'),
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 70),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 10),
                                    hintText: '',
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.w500),
                                    filled: true,
                                    fillColor:
                                        ThemeConstants.ultraLightgreyColor2,
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: ThemeConstants.red),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0,
                                          color: ThemeConstants.blackcolor),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: ThemeConstants
                                              .ultraLightgreyColor2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: ThemeConstants
                                              .ultraLightgreyColor2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  keyboardType: TextInputType.phone,
                                  validator: (value) {
                                    var res = switchForMaximumScoreEnglishText(
                                        controller.selectedTestYouAppearedFor!);

                                    var marksFilled = int.parse(value!);

                                    if (marksFilled > res) {
                                      return 'Maximum marks $res';
                                    }
                                  },
                                  controller:
                                      controller.specifyCourseTextController),
                            )
                            // CustomButtonWidget(
                            //   text: 'Masters',
                            // ),
                            // CustomButtonWidget(
                            //   text: 'Diploma',
                            // ),
                          ],

                          // Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: 30, vertical: 20),
                          //   child: CustomAutoSizeTextMontserrat(
                          //       fontWeight: FontWeight.w600,
                          //       fontSize: 28,
                          //       text: 'Select the test you have appaered for?'),
                          // ),
                          // Container(
                          //     padding: EdgeInsets.symmetric(
                          //         horizontal: 35, vertical: 5),
                          //     child: Wrap(
                          //         alignment: WrapAlignment.start,
                          //         runSpacing: 20,
                          //         spacing: 25,
                          //         children: [
                          //           CustomButtonWidget(
                          //             text: 'IELTS',
                          //           ),
                          //           CustomButtonWidget(
                          //             text: 'PTE',
                          //           ),
                          //           CustomButtonWidget(
                          //             text: 'TOEFL',
                          //           ),
                          //           // CustomButtonWidget(
                          //           //   text: 'Masters',
                          //           // ),
                          //           // CustomButtonWidget(
                          //           //   text: 'Diploma',
                          //           // ),
                          //         ])),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: 30, vertical: 20),
                          //   child: CustomAutoSizeTextMontserrat(
                          //       fontWeight: FontWeight.w600,
                          //       fontSize: 28,
                          //       text: 'Specify your score'),
                          // ),
                          // Container(
                          //     padding: EdgeInsets.symmetric(
                          //         horizontal: 35, vertical: 5),
                          //     child: Wrap(
                          //         alignment: WrapAlignment.start,
                          //         runSpacing: 20,
                          //         spacing: 25,
                          //         children: [
                          //           CustomTextField(
                          //               hint: 'hint',
                          //               controller: TextEditingController()),
                          //           // CustomButtonWidget(
                          //           //   text: 'IELTS',
                          //           // ),
                          //           // CustomButtonWidget(
                          //           //   text: 'PTE',
                          //           // ),
                          //           // CustomButtonWidget(
                          //           //   text: 'TOEFL',
                          //           // ),
                          //           // CustomButtonWidget(
                          //           //   text: 'Masters',
                          //           // ),
                          //           // CustomButtonWidget(
                          //           //   text: 'Diploma',
                          //           // ),
                          //         ]))
                        ],
                        // if (controller.questionNumberToShow == 4) ...[],

                        // if (controller.questionNumberToShow == 5) ...[],
                        if (controller.questionNumberToShow == 4) ...[
                          Container(
                              padding: EdgeInsets.only(left: 15),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomAutoSizeTextMontserrat(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 28,
                                        text:
                                            'What level do you want to study at?'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        child: Wrap(
                                            alignment: WrapAlignment.start,
                                            runSpacing: 20,
                                            spacing: 25,
                                            children: [
                                          CustomButtonWidget(
                                            selectedColor:
                                                ThemeConstants.bluecolor,
                                            isSelected: controller
                                                        .selectedLevelYouWantToStudy ==
                                                    7
                                                ? true
                                                : false,
                                            onTap: () {
                                              controller
                                                  .selectedLevelYouWantToStudy = 7;
                                              controller.update();
                                            },
                                            text: 'UG',
                                          ),
                                          CustomButtonWidget(
                                            selectedColor:
                                                ThemeConstants.bluecolor,
                                            isSelected: controller
                                                        .selectedLevelYouWantToStudy ==
                                                    4
                                                ? true
                                                : false,
                                            onTap: () {
                                              controller
                                                  .selectedLevelYouWantToStudy = 4;
                                              controller.update();
                                            },
                                            text: 'PG',
                                          ),
                                          CustomButtonWidget(
                                            selectedColor:
                                                ThemeConstants.bluecolor,
                                            isSelected: controller
                                                        .selectedLevelYouWantToStudy ==
                                                    3
                                                ? true
                                                : false,
                                            onTap: () {
                                              controller
                                                  .selectedLevelYouWantToStudy = 3;
                                              controller.update();
                                            },
                                            text: 'Diploma',
                                          ),
                                          // CustomButtonWidget(
                                          //   text: 'Masters',
                                          // ),
                                          // CustomButtonWidget(
                                          //   text: 'Diploma',
                                          // ),
                                        ]))
                                  ])),
                        ],

                        if (controller.questionNumberToShow == 5) ...[
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 15),
                          //   child: Container(
                          //     width: 100,
                          //     padding: EdgeInsets.symmetric(
                          //         vertical: 5, horizontal: 15),
                          //     decoration: BoxDecoration(
                          //         color: ThemeConstants.yellow,
                          //         borderRadius: BorderRadius.circular(20)),
                          //     child: CustomAutoSizeTextMontserrat(
                          //       text: 'Great',
                          //     ),
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 10),
                            child: Container(
                              child: CustomAutoSizeTextMontserrat(
                                fontSize: 30,
                                text: 'What course are you looking for?',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            width: MediaQuery.of(context).size.width * .95,
                            padding: EdgeInsets.symmetric(vertical: 5),
                            height: 110,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    controller.AllCourseSearchBroadField.length,
                                itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        controller.selectCourseBoardFieldCode =
                                            controller
                                                .AllCourseSearchBroadField[
                                                    index]
                                                .id;
                                        controller.update();
                                        // controller.getCoursenarrowField(
                                        //     controller.selectCourseBoardFieldCode!);
                                      },
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        width: 140,
                                        decoration: BoxDecoration(
                                            color: controller
                                                        .selectCourseBoardFieldCode ==
                                                    controller
                                                        .AllCourseSearchBroadField[
                                                            index]
                                                        .id
                                                ? ThemeConstants.lightblueColor
                                                : ThemeConstants.whitecolor,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                width: 1,
                                                color:
                                                    ThemeConstants.bluecolor)),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 50,
                                                height: 50,
                                                child: CachedNetworkImage(
                                                  imageUrl: controller
                                                      .AllCourseSearchBroadField[
                                                          index]
                                                      .imageLink!,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '${controller.AllCourseSearchBroadField[index].broadFieldName}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ]),
                                      ),
                                    )),
                          ),
                        ],

                        SizedBox(
                          height: 10,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 105, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // CustomIconTextTogether(
                              //   text: 'Back',
                              //   Bgcolor: ThemeConstants.whitecolor,
                              //   color: ThemeConstants.bluecolor,
                              //   fontWeight: FontWeight.w400,
                              //   textSize: 12,
                              //   iconData: Icon(
                              //     Icons.arrow_back_ios_new_rounded,
                              //     size: 10,
                              //     color: ThemeConstants.bluecolor,
                              //   ),
                              // ),
                              if ((controller.questionNumberToShow != 0 &&
                                      controller.questionNumberToShow != 1 &&
                                      controller.questionNumberToShow != 2 &&
                                      controller.questionToShowInEnglsihTest ==
                                          0) ||
                                  controller.questionNumberToShow == 4)
                                InkWell(
                                  onTap: () {
                                    controller.back();
                                  },
                                  child: Container(
                                    width: 100,
                                    child: CustomIconTextTogether(
                                      iconBeforetext: true,
                                      // iconBeforeText: false,
                                      text: 'Back',
                                      Bgcolor: ThemeConstants.whitecolor,
                                      color: ThemeConstants.bluecolor,
                                      fontWeight: FontWeight.w400,
                                      textSize: 12,
                                      iconData: Icon(
                                        Icons.arrow_circle_left,
                                        size: 15,
                                        color: ThemeConstants.bluecolor,
                                      ),
                                    ),
                                  ),
                                ),
                              if (controller.questionNumberToShow == 3 &&
                                  controller.questionToShowInEnglsihTest != 0)
                                InkWell(
                                  onTap: () {
                                    controller.backForEnglish();
                                  },
                                  child: Container(
                                    width: 100,
                                    child: CustomIconTextTogether(
                                      iconBeforetext: true,
                                      // iconBeforeText: false,
                                      text: 'Back',
                                      Bgcolor: ThemeConstants.whitecolor,
                                      color: ThemeConstants.bluecolor,
                                      fontWeight: FontWeight.w400,
                                      textSize: 12,
                                      iconData: Icon(
                                        Icons.arrow_circle_left,
                                        size: 15,
                                        color: ThemeConstants.bluecolor,
                                      ),
                                    ),
                                  ),
                                ),
                              SizedBox(
                                width: 20,
                              ),
                              if (controller.nextForChange == false)
                                InkWell(
                                  onTap: () {
                                    if (controller
                                                .selectedAppearedInEnglishTest ==
                                            null &&
                                        controller
                                                .questionToShowInEnglsihTest ==
                                            0) {
                                      getToast('Please Select one option');
                                    } else if (controller
                                                .selectedTestYouAppearedFor ==
                                            null &&
                                        controller
                                                .questionToShowInEnglsihTest ==
                                            1) {
                                      getToast('Please Select one option');
                                    }
                                    // else if (controller.specifyYourScore == null &&
                                    //     controller.questionToShowInEnglsihTest == 2) {
                                    //   getToast('Please Select one option');
                                    // }

                                    else if (controller
                                                .specifyCourseTextController
                                                .text ==
                                            '' &&
                                        controller
                                                .questionToShowInEnglsihTest ==
                                            2) {
                                      getToast('Please Select one option');
                                    } else {
                                      if (controller
                                              .questionToShowInEnglsihTest ==
                                          2) {
                                        if (controller.formKey.currentState!
                                            .validate()) {
                                          controller.nextForChange = true;
                                          controller.showQuestion();
                                        }
                                      } else if (controller
                                                  .questionToShowInEnglsihTest ==
                                              0 &&
                                          controller
                                                  .selectedAppearedInEnglishTest ==
                                              2) {
                                        controller.nextForChange = true;
                                        controller.showQuestion();
                                      } else {
                                        controller
                                            .showEnglishTestNextQuestion();
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: 100,
                                    child: CustomIconTextTogether(
                                      // iconBeforeText: false,
                                      text: 'Next',
                                      Bgcolor: ThemeConstants.whitecolor,
                                      color: ThemeConstants.bluecolor,
                                      fontWeight: FontWeight.w400,
                                      textSize: 12,
                                      iconData: Icon(
                                        Icons.arrow_circle_right,
                                        size: 20,
                                        color: ThemeConstants.bluecolor,
                                      ),
                                    ),
                                  ),
                                ),

                              if (controller.nextForChange == true &&
                                  controller.showConsentTermsForm == false) ...[
                                SizedBox(
                                  height: 40,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (controller.selectedLastQualification ==
                                            null &&
                                        controller.questionNumberToShow == 2) {
                                      getToast(
                                          'Please select last qualification');
                                    } else if (controller
                                                .appearedForEnglishTest ==
                                            null &&
                                        controller.questionNumberToShow == 3) {
                                      getToast('Please select one');
                                    } else if (controller
                                                .appearedForEnglishTest ==
                                            null &&
                                        controller.questionNumberToShow == 3) {
                                      getToast('Please select one');
                                    } else if (controller.nextForChange ==
                                        true) {
                                      if (controller.questionNumberToShow ==
                                              4 &&
                                          controller
                                                  .selectedLevelYouWantToStudy ==
                                              null) {
                                        getToast("Please select one");
                                      } else if (controller
                                              .questionNumberToShow ==
                                          4) {
                                        controller.showQuestion();
                                        // controller.questionNumberToShow =
                                        //     controller.questionNumberToShow + 1;
                                        controller.update();
                                      } else if (controller
                                                  .selectCourseBoardFieldCode ==
                                              null &&
                                          controller.questionNumberToShow ==
                                              5) {
                                        getToast(
                                            'Please Select one Broad Field');
                                      } else {
                                        if (controller.questionNumberToShow ==
                                            5) {
                                          controller.showConsentTermsForm =
                                              true;
                                          controller.questionNumberToShow = 0;
                                          controller.update();
                                        } else {
                                          controller.showQuestion();
                                        }
                                      }
                                    }
                                    // else if (controller.nextForChange ==
                                    //     false) {
                                    //   controller.showQuestion();
                                    // }
                                  },
                                  child: Container(
                                    width: 100,
                                    child: CustomIconTextTogether(
                                      // iconBeforeText: false,
                                      text: 'Next',
                                      Bgcolor: ThemeConstants.whitecolor,
                                      color: ThemeConstants.bluecolor,
                                      fontWeight: FontWeight.w400,
                                      textSize: 12,
                                      iconData: Icon(
                                        Icons.arrow_circle_right,
                                        size: 15,
                                        color: ThemeConstants.bluecolor,
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                            ],
                          ),
                        ),

                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.05,
                        // )
                      ]),
                ),
              )
            ],
          ),
        ),
        onLoading: getLoading(context),
      ),
    );
  }
}
