import 'package:back_pressed/back_pressed.dart';
import 'package:studentpanel/ui/controllers/detailcontroller.dart';

import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as timeDate;

class DetialScreen extends StatefulWidget {
  const DetialScreen({Key? key}) : super(key: key);
  static const routeNamed = '/DetailPage';

  @override
  State<DetialScreen> createState() => _DetialScreenState();
}

class _DetialScreenState extends State<DetialScreen>
    with WidgetsBindingObserver {
  var detailController = Get.put(DetailController());

  @override
  void initState() {
    super.initState();
    if (Get.arguments == true) {
      detailController.temp = false.obs;
      detailController.startTimer("Detail Page");
    } else {
      detailController.startTimer("DetailPage");
    }
  }

  @override
  void deactivate() {
    detailController.temp = true.obs;
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      debugPrint("DetailPage${Get.arguments}");
    }

    List<String> difference = [];
    List<double> min = [];
    List<double> hr = [];
    return Scaffold(
      body: OnBackPressed(
        perform: () {
          if (kDebugMode) {
            debugPrint(Get.previousRoute);
          }
          Get.toNamed(Get.previousRoute, arguments: false);
          detailController.temp = true.obs;
          if (kDebugMode) {
            debugPrint('The back button on the device was pressed');
          }
        },
        child: SizedBox(
          child: Column(
            children: [
              GetBuilder<DetailController>(
                  init: DetailController(),
                  builder: (controller) {
                    if (controller.isLoading.value == true) {
                      if (kDebugMode) {
                        debugPrint("back button");
                      }
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ListView.builder(
                            controller: ScrollController(),
                            itemCount: detailController.userHistoryList!.length,
                            itemBuilder: (BuildContext context, index) {
                              String logintime = detailController
                                  .userHistoryList![index].loginTime!
                                  .toString();
                              DateTime parseDate =
                                  timeDate.DateFormat("yyyy-MM-dd' 'HH:mm:ss")
                                      .parse(logintime);
                              var inputDate =
                                  DateTime.parse(parseDate.toString());

                              String logouttime = detailController
                                  .userHistoryList![index].logoutTime!
                                  .toString();
                              DateTime parseDate2 =
                                  timeDate.DateFormat("yyyy-MM-dd' 'HH:mm:ss")
                                      .parse(logouttime);
                              var inputDate2 =
                                  DateTime.parse(parseDate2.toString());
                              difference.add(inputDate2
                                  .difference(inputDate)
                                  .inMinutes
                                  .toString());

                              min.add(
                                  int.parse(difference[index].toString()) % 60);

                              hr.add((int.parse(difference[index].toString()) /
                                  60));

                              return Table(
                                textDirection: TextDirection.ltr,
                                border: TableBorder.all(
                                    width: 1.0, color: Colors.black),
                                children: [
                                  if (index == 0)
                                    TableRow(children: [
                                      Text(
                                        "Login Time",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.roboto(fontSize: 22),
                                      ),
                                      Text(
                                        "Logout Time",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.roboto(fontSize: 22),
                                      ),
                                      Text(
                                        "Active Time",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.roboto(fontSize: 22),
                                      ),
                                    ]),
                                  TableRow(children: [
                                    Text(
                                      detailController
                                          .userHistoryList![index].loginTime!
                                          .toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      detailController
                                          .userHistoryList![index].logoutTime!,
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      getHoursAndMin(hr[index].toString(),
                                          min[index].toString()),
                                      textAlign: TextAlign.center,
                                    ),
                                  ]),
                                ],
                              );
                            }),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
              SizedBox(
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const Text("aman")
                  // CustomDropDown(
                  //   model: const [
                  //     "India",
                  //     "USA",
                  //     "Brazil",
                  //     "Canada",
                  //     "Australia",
                  //     "Singapore"
                  //   ],
                  //   hint: "Country",
                  // ),
                  ),
            ],
          ),
        ),
      ),
    );
  }

// Function
  String getHoursAndMin(String hr, String min) {
    String time;
    if (hr.split('.')[0].toString() == 0.toString()) {
      time = "";
    } else {
      time = "${hr.split('.')[0]} hr";
    }
    if (min.split('.')[0].toString() == 0.toString()) {
      time = time;
    } else {
      time = "$time${min.split('.')[0]} min";
    }
    if (hr.split('.')[0].toString() == 0.toString() &&
        min.split('.')[0].toString() == 0.toString()) {
      time = "0 min";
    }
    return time;
  }
}
