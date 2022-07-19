import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/controllers/dashboardcontroller.dart';
import 'package:studentpanel/ui/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/widgets/appbar.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({
    Key? key,
  }) : super(key: key);
  static const routeNamed = '/DashBoard';

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  UserModel? model;
  var dashboardController = Get.put(DashboardController());
  final TextStyle _textStyle = GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  @override
  Widget build(BuildContext context) {
    debugPrint(Get.arguments);

    return Scaffold(
      appBar: CustomAppBar("DashBoard"),
      body: Container(
        color: Colors.white,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
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
                              fontSize: 25,
                              textStyle: const TextStyle()),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          "Nishant",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              textStyle: const TextStyle()),
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      indent: 30,
                      endIndent: 30,
                      color: const Color(0xFFD6D6D6),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
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
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
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
                    Column(
                      children: [
                        Container(
                          height: 130,
                          width: 160,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0, color: const Color(0xFFFEF6E6)),
                              color: const Color(0xFFFEF6E6),
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(20))),
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
                  ],
                ),
              ),
              Padding(
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
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
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
                    Column(
                      children: [
                        Container(
                          height: 130,
                          width: 160,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0, color: const Color(0xFFE8FAFD)),
                              color: const Color(0xFFE8FAFD),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                child: SizedBox(
                  height: 160,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Card(
                    elevation: 2,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Stack(children: [
                      Positioned(
                          top: 30,
                          left: 20,
                          child: SvgPicture.asset("assets/icons/calender.svg",
                              color: const Color(0xFF6F61FF),
                              height: 40,
                              width: 40,
                              fit: BoxFit.scaleDown)),
                      Positioned(
                        top: 10,
                        left: 80,
                        child: Text(
                          "Upcoming Event",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              textStyle: const TextStyle(
                                decoration: TextDecoration.underline,
                              )),
                        ),
                      ),
                      const Positioned(
                        top: 47,
                        left: 70,
                        child: Icon(
                          Icons.circle,
                          size: 10,
                        ),
                      ),
                      Positioned(
                          top: 42,
                          left: 85,
                          child: Text(
                            "Canda Migration Counselling",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                textStyle: const TextStyle()),
                          )),
                      const Positioned(
                          top: 60, left: 85, child: Text("Day Bangalore")),
                      const Positioned(
                          top: 75,
                          left: 85,
                          child: Text("on Thu, May 5th,2022 16:11 pm")),
                      Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: TextButton(
                              onPressed: () {}, child: const Text("View all")))
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
