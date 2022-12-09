import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/ModificationUi/profilepage.dart';
import 'package:studentpanel/ui/screen/ModificationUi/visasummary.dart';
import 'package:studentpanel/ui/screen/applicationsummary.dart';
import 'package:studentpanel/ui/screen/coursesearch.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/ui/screen/finalshortlist.dart';
import 'package:studentpanel/ui/screen/reviewshortlist.dart';
import 'package:studentpanel/ui/screen/visa.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 240,
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 60,
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
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 180),
                        child: SizedBox(
                            height: 30,
                            child: SvgPicture.asset(
                              "assets/icons/edit.svg",
                              color: ThemeConstants.bluecolor,
                            )))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: CustomAutoSizeTextMontserrat(
                    text: "Nishant Bharwaj",
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
                      backgroundColor: Color(0xffD6D6D6),
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
                          Get.toNamed(ApplicationSummary.routeNamed);
                        },
                        child: SizedBox(
                          height: 30,
                          width: MediaQuery.of(context).size.width,
                          child: CustomAutoSizeTextMontserrat(
                            text: "My Application",
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
              ]),
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
                    SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset("assets/icons/logout.svg")),
                    CustomAutoSizeTextMontserrat(
                      text: "Logout",
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
