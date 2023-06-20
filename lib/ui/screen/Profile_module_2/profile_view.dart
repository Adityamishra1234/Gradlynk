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
        body: Obx(() {
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

              controller.loading.value == true
                  ? getLoading(context)
                  : Container(
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
                                    radius: 50.0,
                                    backgroundImage: const NetworkImage(
                                        "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250"),
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
                                            height: 2.5,
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
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 2.5,
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
                                              CustomAutoSizeTextMontserrat(
                                                text:
                                                    "${controller.model.email}",
                                                fontSize: 5,
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 2.5,
                                          ),
                                          Stack(
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
                                                width: controller.data.value
                                                        .totalPercentageComplete!
                                                        .toDouble() *
                                                    2,
                                                height: 6,
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 2.5,
                                          ),
                                          CustomAutoSizeTextMontserrat(
                                            text:
                                                "${controller.data.value.totalPercentageComplete}% Profile Completed",
                                            fontSize: 5,
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
                                  Get.to(const ContactInformationCopy());
                                },
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
                                          SvgPicture.asset(
                                              "assets/icons/doc.svg",
                                              color: ThemeConstants.blackcolor,
                                              width: 60,
                                              height: 60),
                                          CustomAutoSizeTextMontserrat(
                                            text: "Mandatory Details",
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          )
                                          // CustomAutoSizeTextMontserrat(
                                          //     text: "Mandatory Details")
                                        ])),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  width: double.infinity,
                                  child: CustomAutoSizeTextMontserrat(
                                    text: "Advance Application Details",
                                    fontSize: 15,
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: Wrap(
                                  runSpacing: 15,
                                  spacing: 40,
                                  children: [
                                    InkWell(
                                      splashColor:
                                          ThemeConstants.lightgreycolor,
                                      onTap: () {
                                        ProfileController.getDailog(0, context);
                                      },
                                      child: CustomProfileButton(
                                        isCompleted: int.parse(controller.data
                                            .value.validateIconForCourseInfo!),
                                        // isCompleted: 0,

                                        title: "Course Info",
                                      ),
                                    ),
                                    InkWell(
                                      splashColor:
                                          ThemeConstants.lightgreycolor,
                                      onTap: () {
                                        ProfileController.getDailog(1, context);
                                      },
                                      child: CustomProfileButton(
                                        isCompleted: 0,
                                        title: "Qualification",
                                      ),
                                    ),
                                    InkWell(
                                      splashColor:
                                          ThemeConstants.lightgreycolor,
                                      onTap: () {
                                        ProfileController.getDailog(2, context);
                                      },
                                      child: CustomProfileButton(
                                        isCompleted: 1,
                                        title: "Work History",
                                      ),
                                    ),
                                    InkWell(
                                      splashColor:
                                          ThemeConstants.lightgreycolor,
                                      onTap: () {
                                        ProfileController.getDailog(3, context);
                                      },
                                      child: CustomProfileButton(
                                        isCompleted: 1,
                                        title: "Language Test",
                                      ),
                                    ),
                                    InkWell(
                                      splashColor:
                                          ThemeConstants.lightgreycolor,
                                      onTap: () {
                                        ProfileController.getDailog(4, context);
                                      },
                                      child: CustomProfileButton(
                                        isCompleted: 1,
                                        title: "Qualifying Test",
                                      ),
                                    ),
                                    InkWell(
                                      splashColor:
                                          ThemeConstants.lightgreycolor,
                                      onTap: () {
                                        ProfileController.getDailog(5, context);
                                      },
                                      child: CustomProfileButton(
                                        isCompleted: 1,
                                        title: "Passport",
                                      ),
                                    ),
                                    InkWell(
                                      splashColor:
                                          ThemeConstants.lightgreycolor,
                                      onTap: () {
                                        ProfileController.getDailog(6, context);
                                      },
                                      child: CustomProfileButton(
                                        isCompleted: 1,
                                        title: "Travel History",
                                      ),
                                    ),
                                    InkWell(
                                      splashColor:
                                          ThemeConstants.lightgreycolor,
                                      onTap: () {
                                        ProfileController.getDailog(7, context);
                                      },
                                      child: CustomProfileButton(
                                        isCompleted: 1,
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
        }),
        bottomNavigationBar: CustomButtomNavbar(
          currentIndex: 1,
          context2: context,
        ),
      ),
    );
  }
}
