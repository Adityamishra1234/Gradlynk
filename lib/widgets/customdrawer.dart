import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/screen/Visa/visasummary.dart';
import 'package:studentpanel/ui/screen/Profile_Module/profilepage.dart';
import 'package:studentpanel/ui/screen/My_Application/applicationsummary.dart';
import 'package:studentpanel/ui/screen/course_search/coursesearch.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/ui/screen/course_search/finalshortlist.dart';
import 'package:studentpanel/ui/screen/course_search/reviewshortlist.dart';
import 'package:studentpanel/ui/screen/test/stage_profilemodule.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 240,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView(controller: ScrollController(), children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: 150,
                      height: 50,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70, right: 70),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: CustomAutoSizeTextMontserrat(
                      text: firstLetterChaptial(
                          Get.find<BaseController>().model1.enquiryName),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Center(
                      child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    width: 200,
                    height: 8,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: 0.7,
                        valueColor:
                            AlwaysStoppedAnimation(ThemeConstants.GreenColor),
                        backgroundColor: const Color(0xffD6D6D6),
                      ),
                    ),
                  )),
                  Center(
                    child: CustomAutoSizeTextMontserrat(
                      text: "Profile: 70% complete",
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: InkWell(
                          highlightColor: ThemeConstants.whitecolor,
                          onTap: () {
                            Get.deleteAll();
                            Get.toNamed(DashBoard.routeNamed);
                          },
                          child: SizedBox(
                            height: 30,
                            width: MediaQuery.of(context).size.width,
                            child: CustomAutoSizeTextMontserrat(
                              text: "My DashBoard",
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: InkWell(
                          highlightColor: ThemeConstants.whitecolor,
                          onTap: () {
                            Get.deleteAll();
                            Get.toNamed(ProfilePageCopy.routeNamed);
                          },
                          child: SizedBox(
                            height: 30,
                            width: MediaQuery.of(context).size.width,
                            child: CustomAutoSizeTextMontserrat(
                              text: "Profile",
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: InkWell(
                          highlightColor: ThemeConstants.whitecolor,
                          onTap: () {
                            Get.deleteAll();
                            Get.toNamed(ApplicationSummary.routeNamed);
                          },
                          child: SizedBox(
                            height: 30,
                            width: MediaQuery.of(context).size.width,
                            child: CustomAutoSizeTextMontserrat(
                              text: "Track Application",
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: InkWell(
                          highlightColor: ThemeConstants.whitecolor,
                          onTap: () {
                            Get.deleteAll();
                            Get.toNamed(CourseSearch.routeNamed);
                          },
                          child: SizedBox(
                            height: 30,
                            width: MediaQuery.of(context).size.width,
                            child: CustomAutoSizeTextMontserrat(
                              text: "Course Search",
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: InkWell(
                          highlightColor: ThemeConstants.whitecolor,
                          onTap: () {
                            Get.deleteAll();
                            Get.toNamed(ReviewShortList.routeNamed);
                          },
                          child: SizedBox(
                            height: 30,
                            width: MediaQuery.of(context).size.width,
                            child: CustomAutoSizeTextMontserrat(
                              text: "Review Course",
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: InkWell(
                          highlightColor: ThemeConstants.whitecolor,
                          onTap: () {
                            Get.deleteAll();
                            Get.toNamed(FinalShortList.routeNamed);
                          },
                          child: SizedBox(
                            height: 30,
                            width: MediaQuery.of(context).size.width,
                            child: CustomAutoSizeTextMontserrat(
                              text: "Final Course",
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: InkWell(
                          highlightColor: ThemeConstants.whitecolor,
                          onTap: () {
                            Get.deleteAll();
                            Get.toNamed(VisaSummary.routeNamed);
                          },
                          child: SizedBox(
                            height: 30,
                            width: MediaQuery.of(context).size.width,
                            child: CustomAutoSizeTextMontserrat(
                              text: "My Visa",
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: InkWell(
                          highlightColor: ThemeConstants.whitecolor,
                          onTap: () {
                            Get.deleteAll();
                            Get.toNamed(StageProgress.routeNamed);
                          },
                          child: SizedBox(
                            height: 30,
                            width: MediaQuery.of(context).size.width,
                            child: CustomAutoSizeTextMontserrat(
                              text: "Processes",
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: InkWell(
                          highlightColor: ThemeConstants.whitecolor,
                          onTap: () {},
                          child: SizedBox(
                            height: 30,
                            width: MediaQuery.of(context).size.width,
                            child: CustomAutoSizeTextMontserrat(
                              text: "Country Guide",
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: InkWell(
                          highlightColor: ThemeConstants.whitecolor,
                          onTap: () {},
                          child: SizedBox(
                            height: 30,
                            width: MediaQuery.of(context).size.width,
                            child: CustomAutoSizeTextMontserrat(
                              text: "Pre Depature Kit",
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: ThemeConstants.lightgreycolor,
                          borderRadius: BorderRadius.circular(10.0)),
                      height: 35,
                      width: 200,
                      child: Row(
                        children: [
                          const Spacer(),
                          svgImage("logout", ThemeConstants.IconColor, 25, 25),
                          CustomAutoSizeTextMontserrat(
                            text: "Logout",
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}
