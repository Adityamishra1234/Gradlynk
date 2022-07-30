import 'package:auto_size_text/auto_size_text.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/controllers/dashboardcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/profilepage.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/bottomnavigation.dart';
import 'package:studentpanel/widgets/customautosizetext.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({
    Key? key,
  }) : super(key: key);
  static const routeNamed = '/DashBoard';

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  var dashboardController = Get.put(DashboardController());
  final TextStyle _textStyle = GoogleFonts.roboto(
    fontWeight: FontWeight.w800,
    fontSize: 17,
  );

  @override
  Widget build(BuildContext context) {
    debugPrint(Get.arguments);
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    print(MediaQuery.of(context).size.height);
    return Scaffold(
      appBar: CustomAppBar("DashBoard"),
      body: Container(
        color: Colors.white,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            "Hi,",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                textStyle: const TextStyle()),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: CustomAutoSizeText(
                              text: "Nishant",
                              maxLines: 1,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const Divider(
                        thickness: 1,
                        indent: 30,
                        endIndent: 30,
                        color: Color(0xFFD6D6D6),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Get.snackbar(
                  //   "DashBoard",
                  //   "Create your profile",
                  //   snackPosition: SnackPosition.BOTTOM,
                  // );
                  Get.toNamed(ProfilePage.routeNamed, parameters: {
                    "studentPanelModel":
                        dashboardController.studentPanel.toString()
                  });

                  debugPrint("Create your profile");
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 130,
                            width: 160,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0, color: const Color(0xFFF1F0FF)),
                                color: const Color(0xFFF1F0FF),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: SvgPicture.asset(
                                "assets/icons/create_profile.svg",
                                color: const Color(0xFF6F61FF),
                                height: 60,
                                width: 80,
                                fit: BoxFit.scaleDown),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Create your profile",
                              style: _textStyle,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Get.snackbar(
                            "DashBoard",
                            "Upload Document",
                            snackPosition: SnackPosition.BOTTOM,
                          );
                          debugPrint("Upload Document");
                        },
                        child: Ink(
                          height: 160,
                          width: 160,
                          color: Colors.amber,
                          child: Column(
                            children: [
                              Container(
                                height: 130,
                                width: 160,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0,
                                        color: const Color(0xFFFEF6E6)),
                                    color: const Color(0xFFFEF6E6),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: SvgPicture.asset(
                                  "assets/icons/upload_document.svg",
                                  color: const Color(0xFFF8A300),
                                  height: 60,
                                  width: 80,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  "Upload document",
                                  style: _textStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.snackbar(
                    "DashBoard",
                    "Course Search",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  debugPrint("Course Search");
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 130,
                            width: 160,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0, color: const Color(0xFFFEF0F0)),
                                color: const Color(0xFFFEF0F0),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: SvgPicture.asset("assets/icons/course.svg",
                                color: const Color(0xFFF16660),
                                height: 60,
                                width: 80,
                                fit: BoxFit.scaleDown),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Course Search",
                              style: _textStyle,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Get.snackbar(
                            "DashBoard",
                            "Track Application",
                            snackPosition: SnackPosition.BOTTOM,
                          );
                          debugPrint('Track Application');
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 130,
                              width: 160,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0, color: const Color(0xFFE8FAFD)),
                                  color: const Color(0xFFE8FAFD),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              child: SvgPicture.asset("assets/icons/track.svg",
                                  color: const Color(0xFF05B4D2),
                                  height: 60,
                                  width: 80,
                                  fit: BoxFit.scaleDown),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Track application",
                                style: _textStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                ),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.90,
                    child: Card(
                      elevation: 0.7,
                      shadowColor: const Color(0xFFE5E1FE),
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xFFE5E1FE), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 35),
                            child: Text(
                              "Upcoming Event",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: SizedBox(
                                  width: 50,
                                  child: SvgPicture.asset(
                                    "assets/icons/calender.svg",
                                    color: Color(0xFF6F61FF),
                                    height: 50,
                                    width: 40,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.70,
                                  child: Column(
                                    children: [
                                      BulletedList(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        bullet: MyBullet(),
                                        listItems: [
                                          CustomAutoSizeText(
                                              text:
                                                  "Canada Migration Counselling Day Bangalore",
                                              maxLines: 3),
                                        ],
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.70,
                                        child: const Padding(
                                          padding: EdgeInsets.only(left: 38),
                                          child: Text(
                                              "on Thu, May 5th, 2022  16:11 pm"),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          TextButton(
                              onPressed: () {
                                Get.snackbar(
                                  "DashBoard",
                                  "View All",
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              },
                              child: const Text("View all"))
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          showFab ? FloatingActionButtonLocation.miniCenterDocked : null,
      floatingActionButton: Visibility(
        visible: showFab,
        child: FloatingActionButton(
            tooltip: "Action",
            backgroundColor: const Color(0xFF1940B3),
            onPressed: () {},
            // isExtended: true,
            child: SvgPicture.asset(
              "assets/icons/video-call.svg",
              height: 30,
              color: Colors.white,
            )),
      ),
      bottomNavigationBar: BottomNavigation(
        index: 0,
      ),
    );
  }
}

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      width: 7,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
