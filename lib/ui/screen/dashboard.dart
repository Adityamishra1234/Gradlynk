import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:studentpanel/ui/controllers/dashboardcontroller.dart';
import 'package:studentpanel/ui/models/usermodel.dart';
import 'package:studentpanel/ui/screen/detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/utils/constants.dart';

class DashBoard extends StatefulWidget {
  DashBoard({
    Key? key,
  }) : super(key: key);
  static const routeNamed = '/DashBoard';

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  UserModel? model;
  var dashboardController = Get.put(DashboardController());

//Aman Verma

  @override
  void initState() {
    // model = widget.model;
    // dashboardController.newAndUpdates();
    // dashboardController.upcomingEvents();
    // dashboardController.upcomingholidays();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(Get.arguments);

    return Scaffold(
      body: Container(
        decoration: Constants.boxDecorationfield,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
              child: SizedBox(
                height: 150,
                child: Card(
                  elevation: 5,
                  child: Row(
                    children: [
                      Container(
                          height: 96,
                          width: 96,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/profile.svg",
                            color: Colors.black,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(
                                  "Shivam soni",
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF011B67),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/mail.svg",
                                      height: 20,
                                      color: Color(0xFF6366F1),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Shivam Gupta",
                                        style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF011B67),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/work.svg",
                                      height: 20,
                                      color: Color(0xFF6366F1),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Shivam Gupta",
                                        style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF011B67),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 4),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/location.svg",
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 13),
                                      child: Text(
                                        "Shivam Gupta",
                                        style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF011B67),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
