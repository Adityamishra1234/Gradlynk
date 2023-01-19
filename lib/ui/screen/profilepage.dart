import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/controllers/profilepagecontroller.dart';
import 'package:studentpanel/ui/screen/coursechoose.dart';
import 'package:studentpanel/ui/screen/mandatoryinformation.dart';
import 'package:studentpanel/ui/screen/passport.dart';
import 'package:studentpanel/ui/screen/personalinformation.dart';
import 'package:studentpanel/ui/screen/testdetail.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/bottomnavigation.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

enum BestTutorSite { Tentative, Definite }

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const routeNamed = '/ProfilePage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final BestTutorSite _site = BestTutorSite.Tentative;
  List<Color> selectButton = [
    ThemeConstants.bluecolor,
    ThemeConstants.bluecolor,
  ];
  List<Color> unSelectButton = [
    Colors.transparent,
    Colors.transparent,
  ];

  var controller = Get.put(ProfilePageController());
  TextStyle getTextStyle(bool colorsChoose) {
    final TextStyle textStyle = GoogleFonts.montserrat(
      fontWeight: FontWeight.w600,
      color: colorsChoose ? Colors.white : Colors.black,
      fontSize: 16,
    );
    return textStyle;
  }

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return Scaffold(
      appBar: CustomAppBar("title"),
      drawer: displayMobileLayout == false ? const CustomDrawer() : null,
      body: SizedBox(
        child: Row(
          children: [
            if (displayMobileLayout == true) const CustomDrawer(),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.85,
              child: ListView(
                controller: ScrollController(),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      color: Colors.white,
                      height: 40,
                      child: GetBuilder<ProfilePageController>(
                          init: ProfilePageController(),
                          builder: (controller) {
                            return ListView(
                              controller: ScrollController(),
                              scrollDirection: Axis.horizontal,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                      height: 35,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          gradient: LinearGradient(
                                            colors:
                                                controller.chooseIndex!.value ==
                                                        0
                                                    ? selectButton
                                                    : unSelectButton,
                                            begin: FractionalOffset.centerLeft,
                                            end: FractionalOffset.centerRight,
                                          )),
                                      child: TextButton(
                                          onPressed: () {
                                            controller.getChooseIndex(0.obs);
                                          },
                                          child: Text(
                                            "Personal Information",
                                            style: getTextStyle(
                                                controller.chooseIndex!.value ==
                                                    0),
                                          ))),
                                ),
                                Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        gradient: LinearGradient(
                                          colors:
                                              controller.chooseIndex!.value == 1
                                                  ? selectButton
                                                  : unSelectButton,
                                          begin: FractionalOffset.centerLeft,
                                          end: FractionalOffset.centerRight,
                                        )),
                                    child: TextButton(
                                        onPressed: () {
                                          controller.getChooseIndex(1.obs);
                                        },
                                        child: Text("Mandatory Info.",
                                            style: getTextStyle(
                                                controller.chooseIndex!.value ==
                                                    1)))),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                      height: 35,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          gradient: LinearGradient(
                                            colors:
                                                controller.chooseIndex!.value ==
                                                        2
                                                    ? selectButton
                                                    : unSelectButton,
                                            begin: FractionalOffset.centerLeft,
                                            end: FractionalOffset.centerRight,
                                          )),
                                      child: TextButton(
                                          onPressed: () {
                                            controller.getChooseIndex(2.obs);
                                          },
                                          child: Text("Test Details",
                                              style: getTextStyle(controller
                                                      .chooseIndex!.value ==
                                                  2)))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                      height: 35,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          gradient: LinearGradient(
                                            colors:
                                                controller.chooseIndex!.value ==
                                                        3
                                                    ? selectButton
                                                    : unSelectButton,
                                            begin: FractionalOffset.centerLeft,
                                            end: FractionalOffset.centerRight,
                                          )),
                                      child: TextButton(
                                          onPressed: () {
                                            controller.getChooseIndex(3.obs);
                                          },
                                          child: Text("Course Choice",
                                              style: getTextStyle(controller
                                                      .chooseIndex!.value ==
                                                  3)))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                      height: 35,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          gradient: LinearGradient(
                                            colors:
                                                controller.chooseIndex!.value ==
                                                        4
                                                    ? selectButton
                                                    : unSelectButton,
                                            begin: FractionalOffset.centerLeft,
                                            end: FractionalOffset.centerRight,
                                          )),
                                      child: TextButton(
                                          onPressed: () {
                                            controller.getChooseIndex(4.obs);
                                          },
                                          child: Text("Passport",
                                              style: getTextStyle(controller
                                                      .chooseIndex!.value ==
                                                  4)))),
                                ),
                              ],
                            );
                          }),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Divider(
                      height: 5,
                      thickness: 1,
                    ),
                  ),
                  GetBuilder<ProfilePageController>(
                      init: ProfilePageController(),
                      builder: (controller) {
                        if (controller.chooseIndex!.value == 0) {
                          return PersonalInformation();
                        } else if (controller.chooseIndex!.value == 1) {
                          return MandatoryInformation();
                        } else if (controller.chooseIndex!.value == 2) {
                          return const TestDetail();
                        } else if (controller.chooseIndex!.value == 3) {
                          return const CourseChoose();
                        } else {
                          return const Passport();
                        }
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          showFab ? FloatingActionButtonLocation.miniCenterDocked : null,
      floatingActionButton: Visibility(
        visible: showFab,
        child: FloatingActionButton(
            tooltip: "Join SVO Link",
            backgroundColor: ThemeConstants.bluecolor,
            onPressed: () {},
            // isExtended: true,
            child: SvgPicture.asset(
              "assets/icons/video-call.svg",
              height: 30,
              color: Colors.white,
            )),
      ),
      bottomNavigationBar: BottomNavigation(
        index: 3,
      ),
    );
  }
}
