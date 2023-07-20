import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/Profile_Module/contactinformation.dart';
import 'package:studentpanel/ui/screen/Profile_module_2/controllers.dart/contact_information_in_popup_controller.dart';
import 'package:studentpanel/ui/screen/Profile_module_2/controllers.dart/profile_main_controller.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customBottomNavbar.dart';
import 'package:studentpanel/widgets/customRichTextWidget.dart';
import 'package:studentpanel/widgets/custom_profile_button/custom_profile_button.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';
// import 'qualificationdetails.dart';

class ProfileView extends StatelessWidget {
  static const routeNamed = '/ProfileView';
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    var controller = Get.put(ContactInformationInPopUpController());
    var ProfileController =
        Get.put(ProfileViewMainController(), permanent: true);
    return WillPopScope(
        onWillPop: () async {
          Get.offAllNamed(DashBoard.routeNamed);
          return true;
        },
        child: Scaffold(
          appBar: const CustomAppBar("title"),
          drawer: displayMobileLayout == false
              ? CustomDrawer(
                  index: 1,
                )
              : null,
          body: controller.obx((state) {
            return

                // CustomTabbar(tablist: const [
                //   "Personal",
                //   "Course Info",
                //   "Qualification ",
                //   "Work History",
                //   "Language test ",
                //   "Qualifying test ",
                //   "Passport ",
                //   "Travel History",
                //   "Relative Info"
                // ], listWidget: [
                // ContactInformationCopy(),
                // CourseInformationCopy(),
                // QualificationDetailsCopy(),
                //   WorkHistoryCopy(),
                //   EnglishTestDetails(),
                //   OthertestDetail(),
                //   PassportDetails(),
                //   TravingHistory(),
                //   RelativeInformation()
                // ]),

                Container(
                    height: MediaQuery.of(context).size.height,
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: ThemeConstants.whitecolor,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    width: 1,
                                    color: ThemeConstants.lightgreycolor),
                              ),
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              height: 130,
                              child: Row(children: [
                                CircleAvatar(
                                  onBackgroundImageError:
                                      (exception, stackTrace) {
                                    print(exception);
                                    print(stackTrace.toString());
                                  },
                                  // onForegroundImageError: (exception, stackTrace) {
                                  //   print(exception);
                                  //   print(stackTrace.toString());
                                  // },
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
                                              "${controller.model.enquiryName}",
                                          fontSize: 18,
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  ThemeConstants.bluecolor,
                                              radius: 8,
                                              child: Icon(
                                                Icons.call,
                                                size: 10,
                                                color:
                                                    ThemeConstants.whitecolor,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            CustomAutoSizeTextMontserrat(
                                              text:
                                                  "${controller.model.mobile}",
                                              fontSize: 5,
                                              fontWeight: FontWeight.w400,
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  ThemeConstants.bluecolor,
                                              radius: 8,
                                              child: Icon(
                                                Icons.email,
                                                size: 10,
                                                color:
                                                    ThemeConstants.whitecolor,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Container(
                                              width: 190,
                                              child: Wrap(children: [
                                                CustomAutoSizeTextMontserrat(
                                                  fontWeight: FontWeight.w400,
                                                  text:
                                                      "${controller.model.email}",
                                                  fontSize: 5,
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
                                              const EdgeInsets.only(left: 15),
                                          child: Stack(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: ThemeConstants
                                                        .lightgreycolor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                width: 200,
                                                height: 6,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 16, 32, 255),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                width: controller
                                                        .profileValidationData
                                                        .totalPercentageComplete!
                                                        .toDouble() *
                                                    2,
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
                                              const EdgeInsets.only(left: 15),
                                          child: CustomAutoSizeTextMontserrat(
                                            fontWeight: FontWeight.w400,
                                            text:
                                                "${controller.profileValidationData.totalPercentageComplete}% Profile Completed",
                                            fontSize: 5,
                                          ),
                                        )
                                      ]),
                                )
                              ]),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: CustomRichTextWidget(
                                fontSize: 15,
                                text1: "Increase your chances of moving ",
                                text: "ABROAD ",
                                text3: 'by completing your profile',
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                print(";sadxl");
                                ProfileController.getDailog(8, context);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(20),
                                      // border: Border.all(
                                      //     width: 1, color: ThemeConstants.lightgreycolor),
                                    ),
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(10),
                                    height: 80,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          svgImage("doc",
                                              ThemeConstants.IconColor, 35, 35),
                                          // SvgPicture.asset(
                                          //     "assets/icons/doc.svg",
                                          //     color: ThemeConstants.blackcolor,
                                          //     width: 50,
                                          //     height: 50),
                                          CustomAutoSizeTextMontserrat(
                                            text: "Mandatory Details",
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          )
                                          // CustomAutoSizeTextMontserrat(
                                          //     text: "Mandatory Details")
                                        ])),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    CustomAutoSizeTextMontserrat(
                                      text: "Advance Application Details",
                                      fontSize: 15,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: ThemeConstants.bluecolor,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: InkWell(
                                        onTap: () async {
                                          await controller
                                              .profileDataValidator();
                                        },
                                        child: Icon(
                                          Icons.refresh_rounded,
                                          size: 20,
                                          color: ThemeConstants.whitecolor,
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Wrap(
                                runSpacing: 15,
                                spacing: 15,
                                children: [
                                  InkWell(
                                    splashColor: ThemeConstants.lightgreycolor,
                                    onTap: () {
                                      ProfileController.getDailog(0, context);
                                    },
                                    child: CustomProfileButton(
                                      isCompleted: int.parse(controller
                                          .profileValidationData
                                          .validateIconForCourseInfo!),
                                      // isCompleted: 0,

                                      title: "Course Info",
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: ThemeConstants.lightgreycolor,
                                    onTap: () {
                                      ProfileController.getDailog(1, context);
                                    },
                                    child: CustomProfileButton(
                                      isCompleted: int.parse(controller
                                          .profileValidationData
                                          .validateIconForQualificationInfo!),
                                      title: "Qualification",
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: ThemeConstants.lightgreycolor,
                                    onTap: () {
                                      ProfileController.getDailog(2, context);
                                    },
                                    child: CustomProfileButton(
                                      isCompleted: int.parse(controller
                                          .profileValidationData
                                          .validateIconForWorkHistory!),
                                      title: "Work History",
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: ThemeConstants.lightgreycolor,
                                    onTap: () {
                                      ProfileController.getDailog(3, context);
                                    },
                                    child: CustomProfileButton(
                                      isCompleted: int.parse(controller
                                          .profileValidationData
                                          .validateIconForEnglishTest!),
                                      title: "Language Test",
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: ThemeConstants.lightgreycolor,
                                    onTap: () {
                                      ProfileController.getDailog(4, context);
                                    },
                                    child: CustomProfileButton(
                                      isCompleted: int.parse(controller
                                          .profileValidationData
                                          .validateIconForOtherTest!),
                                      title: "Qualifying Test",
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: ThemeConstants.lightgreycolor,
                                    onTap: () {
                                      ProfileController.getDailog(5, context);
                                    },
                                    child: CustomProfileButton(
                                      isCompleted: int.parse(controller
                                          .profileValidationData
                                          .validateIconForPassport!),
                                      title: "Passport",
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: ThemeConstants.lightgreycolor,
                                    onTap: () {
                                      ProfileController.getDailog(6, context);
                                    },
                                    child: CustomProfileButton(
                                      isCompleted: int.parse(controller
                                          .profileValidationData
                                          .validateIconForTravelHistory!),
                                      title: "Travel History",
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: ThemeConstants.lightgreycolor,
                                    onTap: () {
                                      ProfileController.getDailog(7, context);
                                    },
                                    child: CustomProfileButton(
                                      isCompleted: int.parse(controller
                                          .profileValidationData
                                          .validateIconForRelativeInfo!),
                                      title: "Relative Info",
                                    ),
                                  ),
                                ],
                                // gridDelegate:
                                //     const SliverGridDelegateWithMaxCrossAxisExtent(
                                //         maxCrossAxisExtent: 200,
                                //         childAspectRatio: 5 / 2,
                                //         crossAxisSpacing: 20,
                                //         mainAxisSpacing: 20),
                                // itemCount: 8,
                                // itemBuilder: (BuildContext ctx, index) {
                                //   return
                              ),
                            )

                            // Container(
                            //   height: 350,
                            //   child: GridView.count(
                            //     crossAxisCount: 2,
                            //     crossAxisSpacing: 10,
                            //     mainAxisSpacing: 10,
                            //     childAspectRatio: 5 / 2,
                            //     children: [
                            //       Container(
                            //         padding: const EdgeInsets.all(8),
                            //         color: Colors.teal[100],
                            //         child: const Text("He'd have you all unravel at the"),
                            //       ),
                            //       Container(
                            //         padding: const EdgeInsets.all(8),
                            //         color: Colors.teal[100],
                            //         child: const Text("He'd have you all unravel at the"),
                            //       ),
                            //       Container(
                            //         padding: const EdgeInsets.all(8),
                            //         color: Colors.teal[100],
                            //         child: const Text("He'd have you all unravel at the"),
                            //       ),
                            //       Container(
                            //         padding: const EdgeInsets.all(8),
                            //         color: Colors.teal[100],
                            //         child: const Text("He'd have you all unravel at the"),
                            //       ),
                            //       Container(
                            //         padding: const EdgeInsets.all(8),
                            //         color: Colors.teal[100],
                            //         child: const Text("He'd have you all unravel at the"),
                            //       ),
                            //       Container(
                            //         padding: const EdgeInsets.all(8),
                            //         color: Colors.teal[100],
                            //         child: const Text("He'd have you all unravel at the"),
                            //       ),
                            //       Container(
                            //         padding: const EdgeInsets.all(8),
                            //         color: Colors.teal[100],
                            //         child: const Text("He'd have you all unravel at the"),
                            //       ),
                            //       Container(
                            //         padding: const EdgeInsets.all(8),
                            //         color: Colors.teal[100],
                            //         child: const Text("He'd have you all unravel at the"),
                            //       ),

                            //     ],
                            //   ),
                            // )
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
