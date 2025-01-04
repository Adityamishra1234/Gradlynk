import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/screen/Profile_module_2/controllers.dart/contact_information_in_popup_controller.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customBottomNavbar.dart';
import 'package:studentpanel/widgets/customRichTextWidget.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
import '../../../BlocData/Bloc/field_bloc.dart';
import '../../../BlocData/Repositories/field_repo.dart';
import '../../../main.dart';
import '../../../widgets/drawerfilter.dart';
import '../dashboard.dart';
import '../mark_attendance/qrCodeScreen.dart';

class ProfileView extends StatefulWidget {
  static const routeNamed = '/ProfileView';
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  var controller =
      Get.put(ContactInformationInPopUpController(), permanent: true);

  @override
  void initState() {
    if (profileValidationModel == null) {
      bloc.getProfileValidation(bloc.baseController.model1.id);
    }
    if (profileDataModel == null) {
      bloc.getLoginData();
    }

    // print("${ BaseController().getDataAgain()}");
    // controller.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;

    List<String> advancedDetails = [
      "Course Information",
      "Qualification Details",
      "Work History",
      "Language Test",
      "Qualifying Test",
      "Passport",
      "Travel History",
      "Relative Information",
    ];

    List<String> iconss = [
      "assets/images/info.png",
      "assets/images/badge.png",
      "assets/images/history.png",
      "assets/images/language.png",
      "assets/images/test.png",
      "assets/images/passport.png",
      "assets/images/castle.png",
      "assets/images/img.png",
    ];
    // var ProfileController =
    //     Get.put(ProfileViewMainController(), ;
    return WillPopScope(
        onWillPop: () async {
          // Get.back();
          Get.offAllNamed(DashBoard.routeNamed);
          return true;
        },
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            elevation: 2.5,
            centerTitle: true,
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
              //     icon: const Icon(Icons.arrow_back, color: Colors.black),
              //     onPressed: () => Get.back(),
              //   ),
              // if (displayMobileLayout == false)
              //   Padding(
              //     padding: const EdgeInsets.only(left: 10),
              //     child: IconButton(
              //       // icon: Image.asset("assets/images/gradlynk lense.png"),
              //       icon: const Icon(
              //         Icons.menu,
              //         color: Colors.black,
              //       ),
              //       // icon: const Icon(Icons.menu,color: Colors.black,),
              //       onPressed: () {
              //         // Get.find<BaseController>().profileDataValidator();
              //         _scaffoldKey.currentState!.openDrawer();
              //
              //         DrawerFilter();
              //       },
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
                  icon: svgImage("qr code", ThemeConstants.IconColor, 25, 25),
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
          drawer: CustomDrawer(
                  index: 1,
                ),
          body: controller.obx((state) {
            return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: bloc.loadingProfileValidation,
                          builder: (context, value, _) {
                            if (value == false &&
                                profileValidationModel != null) {
                              return ValueListenableBuilder(
                                valueListenable: bloc.loginLoading,
                                builder: (BuildContext context, bool value1,
                                    Widget? _) {
                                  if (value1 == false &&
                                      profileDataModel != null) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: ThemeConstants.whitecolor,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color: ThemeConstants.bluecolor
                                                  .withOpacity(0.5),
                                              spreadRadius: -2.5,
                                              blurRadius: 5,
                                              offset: const Offset(0, 4.5),
                                            )
                                          ],
                                          // border: Border.all(
                                          //     width: 0.1, color: ThemeConstants.lightgreycolor),
                                        ),
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(15),
                                        height: 130,
                                        child: Row(children: [
                                          CircleAvatar(
                                            onBackgroundImageError:
                                                (exception, stackTrace) {},
                                            radius: 35.0,
                                            backgroundImage: const NetworkImage(
                                                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                                            backgroundColor: Colors.transparent,
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          SizedBox(
                                            height: 200,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomAutoSizeTextMontserrat(
                                                    text:
                                                        "${profileDataModel?.enquiryName}",
                                                    fontSize: 18,
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            ThemeConstants
                                                                .bluecolor,
                                                        radius: 8,
                                                        child: Icon(
                                                          Icons.call,
                                                          size: 10,
                                                          color: ThemeConstants
                                                              .whitecolor,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 4,
                                                      ),
                                                      CustomAutoSizeTextMontserrat(
                                                        text:
                                                            "${profileDataModel?.mobile}",
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            ThemeConstants
                                                                .bluecolor,
                                                        radius: 8,
                                                        child: Icon(
                                                          Icons.email,
                                                          size: 10,
                                                          color: ThemeConstants
                                                              .whitecolor,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 4,
                                                      ),
                                                      SizedBox(
                                                        width: 170,
                                                        child: Wrap(children: [
                                                          CustomAutoSizeTextMontserrat(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            text:
                                                                "${profileDataModel?.email}",
                                                            fontSize: 10,
                                                          ),
                                                        ]),
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15),
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              color: ThemeConstants
                                                                  .lightgreycolor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          width: 150,
                                                          height: 6,
                                                        ),
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              color: const Color
                                                                  .fromARGB(255,
                                                                  16, 32, 255),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          width: profileValidationModel!
                                                                  .totalPercentageComplete!
                                                                  .toDouble() *
                                                              1.5,
                                                          height: 6,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15),
                                                    child:
                                                        CustomAutoSizeTextMontserrat(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      text:
                                                          "${profileValidationModel?.totalPercentageComplete}% Profile Completed",
                                                      fontSize: 10,
                                                    ),
                                                  )
                                                ]),
                                          )
                                        ]),
                                      ),
                                    );
                                  }
                                  else {
                                    return getLoading(context,
                                        height: 140.0, width: 300.0);
                                  }
                                },
                              );
                            } else {
                              return getLoading(context,
                                  height: 140.0, width: 300.0);
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: CustomRichTextWidget(
                                  maxLines: 6,
                                  fontSize: 14,
                                  text1: "Increase your chances of moving ",
                                  text: "ABROAD ",
                                  text3: 'by completing your profile',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            controller.getDailog(8, context);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ThemeConstants.lightblueColor2,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      ThemeConstants.bluecolor.withOpacity(0.5),
                                  spreadRadius: -1.5,
                                  blurRadius: 3,
                                  offset: const Offset(0, 4.5),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 5, left: 5, top: 5, bottom: 5),
                              child: ListTile(
                                leading: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.5),
                                          spreadRadius:
                                              -2, // Negative value to contain the shadow within the border
                                          blurRadius: 9,
                                          offset: const Offset(0, 6),
                                        )
                                      ]),
                                  child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.label_important,
                                        color: Colors.green,
                                      )),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Mandatory Details",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                trailing: const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // child: Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 10),
                        //   child: Container(
                        //       decoration: BoxDecoration(
                        //         color: Colors.amber,
                        //         borderRadius: BorderRadius.circular(10),
                        //
                        //         // border: Border.all(
                        //         //     width: 1, color: ThemeConstants.lightgreycolor),
                        //       ),
                        //
                        //       width: double.infinity,
                        //       padding: const EdgeInsets.all(10),
                        //       height: 80,
                        //       child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           crossAxisAlignment:
                        //               CrossAxisAlignment.center,
                        //           children: [
                        //             svgImage("doc", ThemeConstants.blackcolor,
                        //                 35, 35),
                        //             const SizedBox(
                        //               width: 10,
                        //             ),
                        //             CustomAutoSizeTextMontserrat(
                        //               text: "Mandatory Details",
                        //               fontSize: 20,
                        //               fontWeight: FontWeight.w500,
                        //               textColor: ThemeConstants.blackcolor,
                        //             )
                        //             // CustomAutoSizeTextMontserrat(
                        //             //     text: "Mandatory Details")
                        //           ])),
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Advance Application Details",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  )),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                // Container(
                                //   width: 30,
                                //   height: 30,
                                //   alignment: Alignment.center,
                                //   decoration: BoxDecoration(
                                //       color: ThemeConstants.bluecolor,
                                //       borderRadius: BorderRadius.circular(100)),
                                //   child: InkWell(
                                //     onTap: () async {
                                //       await controller.profileDataValidator();
                                //     },
                                //     child: Icon(
                                //       Icons.refresh_rounded,
                                //       size: 20,
                                //       color: ThemeConstants.whitecolor,
                                //     ),
                                //   ),
                                // )
                              ],
                            )),
                        const SizedBox(
                          height: 8,
                        ),
                        Divider(
                          height: 0.1,
                          color: Colors.grey.withOpacity(0.5),
                          // indent: 5,
                          // endIndent: 5,
                        ),
                        // Wrap(
                        //   runSpacing: 15,
                        //   spacing: 15,
                        //   children: [
                        //     if (Get.find<BaseController>()
                        //                 .model1
                        //                 .service_id !=
                        //             1 &&
                        //         Get.find<BaseController>()
                        //                 .model1
                        //                 .service_id !=
                        //             3)
                        //       InkWell(
                        //         splashColor: ThemeConstants.lightgreycolor,
                        //         onTap: () {
                        //           print(context.size!.width);
                        //           controller.getDailog(0, context);
                        //         },
                        //         child: CustomProfileButton(
                        //           isCompleted: int.parse(controller
                        //               .profileValidationData
                        //               .validateIconForCourseInfo!),
                        //           // isCompleted: 0,
                        //
                        //           title: "Course Info",
                        //         ),
                        //       ),
                        //     InkWell(
                        //       splashColor: ThemeConstants.lightgreycolor,
                        //       onTap: () {
                        //         controller.getDailog(1, context);
                        //       },
                        //       child: CustomProfileButton(
                        //         isCompleted: int.parse(controller
                        //             .profileValidationData
                        //             .validateIconForQualificationInfo!),
                        //         title: "Qualification",
                        //       ),
                        //     ),
                        //     InkWell(
                        //       splashColor: ThemeConstants.lightgreycolor,
                        //       onTap: () {
                        //         controller.getDailog(2, context);
                        //       },
                        //       child: CustomProfileButton(
                        //         isCompleted: int.parse(controller
                        //             .profileValidationData
                        //             .validateIconForWorkHistory!),
                        //         title: "Work History",
                        //       ),
                        //     ),
                        //     InkWell(
                        //       splashColor: ThemeConstants.lightgreycolor,
                        //       onTap: () {
                        //         controller.getDailog(3, context);
                        //       },
                        //       child: CustomProfileButton(
                        //         isCompleted: int.parse(controller
                        //             .profileValidationData
                        //             .validateIconForEnglishTest!),
                        //         title: "Language Test",
                        //       ),
                        //     ),
                        //     if (Get.find<BaseController>()
                        //             .model1
                        //             .service_id !=
                        //         1)
                        //       InkWell(
                        //         splashColor: ThemeConstants.lightgreycolor,
                        //         onTap: () {
                        //           controller.getDailog(4, context);
                        //         },
                        //         child: CustomProfileButton(
                        //           isCompleted: int.parse(controller
                        //               .profileValidationData
                        //               .validateIconForOtherTest!),
                        //           title: "Qualifying Test",
                        //         ),
                        //       ),
                        //     InkWell(
                        //       splashColor: ThemeConstants.lightgreycolor,
                        //       onTap: () {
                        //         controller.getDailog(5, context);
                        //       },
                        //       child: CustomProfileButton(
                        //         isCompleted: int.parse(controller
                        //             .profileValidationData
                        //             .validateIconForPassport!),
                        //         title: "Passport",
                        //       ),
                        //     ),
                        //     InkWell(
                        //       splashColor: ThemeConstants.lightgreycolor,
                        //       onTap: () {
                        //         controller.getDailog(6, context);
                        //       },
                        //       child: CustomProfileButton(
                        //         isCompleted: int.parse(controller
                        //             .profileValidationData
                        //             .validateIconForTravelHistory!),
                        //         title: "Travel History",
                        //       ),
                        //     ),
                        //     InkWell(
                        //       splashColor: ThemeConstants.lightgreycolor,
                        //       onTap: () {
                        //         controller.getDailog(7, context);
                        //       },
                        //       child: CustomProfileButton(
                        //         isCompleted: int.parse(
                        //             Get.find<BaseController>()
                        //                     .data
                        //                     .value
                        //                     .validateIconForRelativeInfo ??
                        //                 "0"),
                        //         title: "Relative Info",
                        //       ),
                        //     ),
                        //   ],
                        // )

                        SizedBox(
                          child: ListView.builder(
                            itemCount: advancedDetails.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                splashColor: ThemeConstants.lightblueColor,
                                onTap: () {
                                  if (Get.find<BaseController>()
                                              .model1
                                              .service_id !=
                                          1 &&
                                      Get.find<BaseController>()
                                              .model1
                                              .service_id !=
                                          3) {
                                    if (index == 0) {
                                      controller.getDailog(0, context);
                                    } else if (index == 1) {
                                      controller.getDailog(1, context);
                                    } else if (index == 2) {
                                      controller.getDailog(2, context);
                                    } else if (index == 3) {
                                      controller.getDailog(3, context);
                                    }
                                  }
                                  if (Get.find<BaseController>()
                                          .model1
                                          .service_id !=
                                      1) {
                                    if (index == 4) {
                                      controller.getDailog(4, context);
                                    } else if (index == 5) {
                                      controller.getDailog(5, context);
                                    } else if (index == 6) {
                                      controller.getDailog(6, context);
                                    } else if (index == 7) {
                                      controller.getDailog(7, context);
                                    }
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 5, left: 5, top: 5, bottom: 0),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 0),
                                    leading: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: ThemeConstants.bluecolor
                                                  .withOpacity(0.5),
                                              spreadRadius:
                                                  -3.9, // Negative value to contain the shadow within the border
                                              blurRadius: 9,
                                              offset: const Offset(0, 6),
                                            )
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          iconss[index],
                                          scale: 20,
                                        ),
                                      ),
                                    ),
                                    title: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CustomAutoSizeTextMontserrat(
                                        text: advancedDetails[index],
                                        fontSize: 15,
                                      ),
                                    ),
                                    trailing: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ]),
                ));
          }, onLoading: getLoading(context)),
          bottomNavigationBar: CustomButtomNavbar(
            currentIndex: 1,
            context2: context,
          ),
        ));
  }
}
