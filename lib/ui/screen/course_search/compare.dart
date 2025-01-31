import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

import '../../controllers/basecontroller.dart';
import '../mark_attendance/qrCodeScreen.dart';

class Comparing extends StatelessWidget {
  CourseSearchModel courseSearchModel1,
      courseSearchModel2 = CourseSearchModel();
  Comparing(
      {Key? key,
      required this.courseSearchModel1,
      required this.courseSearchModel2})
      : super(key: key);
  static const routeNamed = '/Compring';

  @override
  Widget build(BuildContext context) {
    courseSearchModel1.countryName = "";
    courseSearchModel2.countryName = "";
    return Scaffold(
      appBar:  AppBar(
        elevation: 2.5,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child:  IconButton(
              // icon: Image.asset("assets/images/gradlynk lense.png"),
              icon: const Icon(Icons.arrow_back, color: Colors.black,),
              // icon: const Icon(Icons.menu,color: Colors.black,),
              onPressed: () {
                // Get.find<BaseController>().profileDataValidator();
                Get.back();
              },
            ),
          ),
          // svgImage("work", Colors.transparent, 32, 32),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Image.network(
              "https://sieceducation.in/assets/assets/images/logo.png",
              width: 130,
              height: 30,
            ),
          ),
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
          const Spacer(),
          if (Get.find<BaseController>()
              .meetingZoneStatus
              .qrCodeGenerated ==
              true)
            IconButton(
              icon: svgImage(
                  "qr code", ThemeConstants.IconColor, 25, 25),
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
        index: 3,
      ),
      body: ListView(
        controller: ScrollController(),
        children: [
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder(
                horizontalInside: BorderSide(
                    width: 1,
                    color: ThemeConstants.bluelightgreycolor2,
                    style: BorderStyle.solid),
                verticalInside: BorderSide(
                    width: 1,
                    color: ThemeConstants.bluelightgreycolor2,
                    style: BorderStyle.solid)),
            children: [
              TableRow(
                  decoration: const BoxDecoration(color: Color(0xFFECF0FB)),
                  children: [
                    TableCell(
                        child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 15, right: 5),
                        child: CustomAutoSizeTextMontserrat(
                            text: "University & Campus Name",
                            fontSize: 14,
                            textColor: ThemeConstants.bluecolor,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                    TableCell(
                        child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 5, right: 5),
                        child: CustomAutoSizeTextMontserrat(
                          text:
                              "${courseSearchModel1.universityName}(${courseSearchModel1.campusName})",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          textColor: ThemeConstants.bluecolor,
                        ),
                      ),
                    )),
                    TableCell(
                        child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 5, right: 5),
                        child: CustomAutoSizeTextMontserrat(
                          text:
                              "${courseSearchModel2.universityName}(${courseSearchModel2.campusName})",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          textColor: ThemeConstants.bluecolor,
                        ),
                      ),
                    )),
                  ]),
              if (getNUllChecker(courseSearchModel1.countryName) == false ||
                  getNUllChecker(courseSearchModel2.countryName) == false)
                TableRow(children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        color: ThemeConstants.lightgreycolor,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 15, right: 5),
                          child: CustomAutoSizeTextMontserrat(
                            text: "Country",
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            textColor: ThemeConstants.blackcolor,
                          ),
                        ),
                      )),
                  TableCell(
                      child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: courseSearchModel1.countryName,
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                    ),
                  )),
                  TableCell(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 5, right: 5),
                      child: CustomAutoSizeTextMontserrat(
                        text: courseSearchModel2.countryName,
                        fontSize: 14,
                        textColor: ThemeConstants.TextColor,
                      ),
                    ),
                  )),
                ]),
              if (getNUllChecker(courseSearchModel1.stateName) == false ||
                  getNUllChecker(courseSearchModel2.stateName) == false)
                TableRow(children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        color: ThemeConstants.lightgreycolor,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 15, right: 5),
                          child: CustomAutoSizeTextMontserrat(
                            text: "State",
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            textColor: ThemeConstants.blackcolor,
                          ),
                        ),
                      )),
                  TableCell(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 5, right: 5),
                      child: CustomAutoSizeTextMontserrat(
                        text: courseSearchModel1.stateName,
                        fontSize: 14,
                        textColor: ThemeConstants.TextColor,
                      ),
                    ),
                  )),
                  TableCell(
                      child: Center(
                          child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 5, right: 5),
                    child: CustomAutoSizeTextMontserrat(
                      text: courseSearchModel2.stateName,
                      fontSize: 14,
                      textColor: ThemeConstants.TextColor,
                    ),
                  ))),
                ]),
              if (getNUllChecker(courseSearchModel1.cityName) == false ||
                  getNUllChecker(courseSearchModel2.cityName) == false)
                TableRow(children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        color: ThemeConstants.lightgreycolor,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 15, right: 5),
                          child: CustomAutoSizeTextMontserrat(
                            text: "City",
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            textColor: ThemeConstants.blackcolor,
                          ),
                        ),
                      )),
                  TableCell(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 5, right: 5),
                      child: CustomAutoSizeTextMontserrat(
                        text: courseSearchModel1.cityName,
                        fontSize: 14,
                        textColor: ThemeConstants.TextColor,
                      ),
                    ),
                  )),
                  TableCell(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 5, right: 5),
                      child: CustomAutoSizeTextMontserrat(
                        text: courseSearchModel2.cityName,
                        fontSize: 14,
                        textColor: ThemeConstants.TextColor,
                      ),
                    ),
                  )),
                ]),
              if (getNUllChecker(courseSearchModel1.courseName) == false ||
                  getNUllChecker(courseSearchModel2.courseName) == false)
                TableRow(children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        color: ThemeConstants.lightgreycolor,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 15, right: 5),
                          child: CustomAutoSizeTextMontserrat(
                            text: "Course Name",
                            fontSize: 14,
                            textColor: ThemeConstants.blackcolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                  TableCell(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 5, right: 5),
                      child: CustomAutoSizeTextMontserrat(
                        text: courseSearchModel1.courseName,
                        fontSize: 14,
                        textColor: ThemeConstants.TextColor,
                      ),
                    ),
                  )),
                  TableCell(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 5, right: 5),
                      child: CustomAutoSizeTextMontserrat(
                        text: courseSearchModel2.courseName,
                        fontSize: 14,
                        textColor: ThemeConstants.TextColor,
                      ),
                    ),
                  )),
                ]),
              if (getNUllChecker(courseSearchModel1.courseLevel) == false ||
                  getNUllChecker(courseSearchModel2.courseLevel) == false)
                TableRow(children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        color: ThemeConstants.lightgreycolor,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 15, right: 5),
                          child: CustomAutoSizeTextMontserrat(
                            text: "Course Level",
                            fontSize: 14,
                            textColor: ThemeConstants.blackcolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                  TableCell(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 5, right: 5),
                      child: CustomAutoSizeTextMontserrat(
                        text: courseSearchModel1.courseLevel,
                        fontSize: 14,
                        textColor: ThemeConstants.TextColor,
                      ),
                    ),
                  )),
                  TableCell(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 5, right: 5),
                      child: CustomAutoSizeTextMontserrat(
                        text: courseSearchModel1.courseLevel,
                        fontSize: 14,
                        textColor: ThemeConstants.TextColor,
                      ),
                    ),
                  )),
                ]),
              if (getNUllChecker(courseSearchModel1.durationYear) == false ||
                  getNUllChecker(courseSearchModel2.durationYear) == false)
                TableRow(children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        color: ThemeConstants.lightgreycolor,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 15, right: 5),
                          child: CustomAutoSizeTextMontserrat(
                            text: "Course Duration",
                            fontSize: 14,
                            textColor: ThemeConstants.blackcolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                  TableCell(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 5, right: 5),
                      child: CustomAutoSizeTextMontserrat(
                        text: getNUllChecker(courseSearchModel1.durationYear) ==
                                false
                            ? "${courseSearchModel1.durationYear ?? ""} Year"
                            : "",
                        fontSize: 14,
                        textColor: ThemeConstants.TextColor,
                      ),
                    ),
                  )),
                  TableCell(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 5, right: 5),
                      child: CustomAutoSizeTextMontserrat(
                        text: getNUllChecker(courseSearchModel2.durationYear) ==
                                false
                            ? "${courseSearchModel1.durationYear ?? ""} Year"
                            : "",
                        fontSize: 14,
                        textColor: ThemeConstants.TextColor,
                      ),
                    ),
                  )),
                ]),
              if (getNUllChecker(courseSearchModel1.scholarship) == false ||
                  getNUllChecker(courseSearchModel2.scholarship) == false)
                TableRow(children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        color: ThemeConstants.lightgreycolor,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 15, right: 5),
                          child: CustomAutoSizeTextMontserrat(
                            text: "Scholarship",
                            fontSize: 14,
                            textColor: ThemeConstants.blackcolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                  TableCell(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 5, right: 5),
                      child: CustomAutoSizeTextMontserrat(
                        text: courseSearchModel1.scholarship,
                        fontSize: 14,
                        textColor: ThemeConstants.TextColor,
                      ),
                    ),
                  )),
                  TableCell(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 5, right: 5),
                      child: CustomAutoSizeTextMontserrat(
                        text: courseSearchModel2.scholarship,
                        fontSize: 14,
                        textColor: ThemeConstants.TextColor,
                      ),
                    ),
                  )),
                ]),
              if (getNUllChecker(courseSearchModel1.annualTutionFees) ==
                      false ||
                  getNUllChecker(courseSearchModel2.annualTutionFees) == false)
                TableRow(children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        color: ThemeConstants.lightgreycolor,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 15, right: 5),
                          child: CustomAutoSizeTextMontserrat(
                            text: "Annual Tuition Fees  ",
                            fontSize: 14,
                            textColor: ThemeConstants.blackcolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                  TableCell(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 5, right: 5),
                      child: CustomAutoSizeTextMontserrat(
                        text: getNUllChecker(
                                    courseSearchModel1.annualTutionFees) ==
                                false
                            ? "${courseSearchModel1.annualTutionFees ?? ""} ${courseSearchModel1.currencyCode ?? ""}\n${courseSearchModel1.annualTutionFeesInr ?? ""} INR"
                            : "",
                        fontSize: 14,
                        textColor: ThemeConstants.TextColor,
                      ),
                    ),
                  )),
                  TableCell(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 5, right: 5),
                      child: CustomAutoSizeTextMontserrat(
                        text: getNUllChecker(
                                    courseSearchModel2.annualTutionFees) ==
                                false
                            ? "${courseSearchModel2.annualTutionFees ?? ""} ${courseSearchModel2.currencyCode ?? ""}\n${courseSearchModel2.annualTutionFeesInr ?? ""} INR"
                            : "",
                        fontSize: 14,
                        textColor: ThemeConstants.TextColor,
                      ),
                    ),
                  )),
                ]),
              if (getNUllChecker(courseSearchModel1.totalFees) == false ||
                  getNUllChecker(courseSearchModel2.totalFees) == false)
                TableRow(children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        color: ThemeConstants.lightgreycolor,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 15, right: 5),
                          child: CustomAutoSizeTextMontserrat(
                            text: "Total  Fees ",
                            fontSize: 14,
                            textColor: ThemeConstants.blackcolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                  TableCell(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 5, right: 5),
                      child: CustomAutoSizeTextMontserrat(
                        text: getNUllChecker(courseSearchModel1.totalFees) ==
                                false
                            ? "${courseSearchModel1.totalFees} ${courseSearchModel1.currencyCode ?? ""}\n${courseSearchModel1.totalFeesInr ?? ""} INR"
                            : "",
                        fontSize: 14,
                        textColor: ThemeConstants.TextColor,
                      ),
                    ),
                  )),
                  TableCell(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 5, right: 5),
                      child: CustomAutoSizeTextMontserrat(
                        text: getNUllChecker(courseSearchModel2.totalFees) ==
                                false
                            ? "${courseSearchModel2.totalFees} ${courseSearchModel2.currencyCode ?? ""}\n${courseSearchModel2.totalFeesInr ?? ""} INR"
                            : "",
                        fontSize: 14,
                        textColor: ThemeConstants.TextColor,
                      ),
                    ),
                  )),
                ]),
              if (getNUllChecker(courseSearchModel1.isApplicationFee) ==
                      false ||
                  getNUllChecker(courseSearchModel2.isApplicationFee) == false)
                TableRow(children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        color: ThemeConstants.lightgreycolor,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 15, right: 5),
                          child: CustomAutoSizeTextMontserrat(
                            text: "Application Fees",
                            fontSize: 14,
                            textColor: ThemeConstants.blackcolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                  TableCell(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 5, right: 5),
                      child: CustomAutoSizeTextMontserrat(
                        text: courseSearchModel1.isApplicationFee ?? "",
                        fontSize: 14,
                        textColor: ThemeConstants.TextColor,
                      ),
                    ),
                  )),
                  TableCell(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 5, right: 5),
                      child: CustomAutoSizeTextMontserrat(
                        text: courseSearchModel1.isApplicationFee,
                        fontSize: 14,
                        textColor: ThemeConstants.TextColor,
                      ),
                    ),
                  )),
                ]),
              if (getNUllChecker(courseSearchModel1.intakeMonth) == false ||
                  getNUllChecker(courseSearchModel2.intakeMonth) == false)
                TableRow(children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        color: ThemeConstants.lightgreycolor,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 15, right: 5),
                          child: SizedBox(
                            height: 60,
                            child: CustomAutoSizeTextMontserrat(
                              text: "Intake Month and Year-",
                              fontSize: 14,
                              textColor: ThemeConstants.blackcolor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )),
                  TableCell(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 5, right: 5),
                      child: CustomAutoSizeTextMontserrat(
                        text: courseSearchModel1.intakeMonth,
                        fontSize: 14,
                        textColor: ThemeConstants.TextColor,
                      ),
                    ),
                  )),
                  TableCell(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 5, right: 5),
                      child: Column(
                        children: [
                          CustomAutoSizeTextMontserrat(
                            text: courseSearchModel2.intakeMonth,
                            fontSize: 14,
                            textColor: ThemeConstants.TextColor,
                          ),
                        ],
                      ),
                    ),
                  )),
                ]),
              if (getNUllChecker(courseSearchModel1.englishProficiency) ==
                      false ||
                  getNUllChecker(courseSearchModel2.englishProficiency) ==
                      false)
                TableRow(children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        color: ThemeConstants.lightgreycolor,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 15, right: 5),
                          child: CustomAutoSizeTextMontserrat(
                            text: "Language tests Required- ",
                            fontSize: 14,
                            textColor: ThemeConstants.blackcolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                  TableCell(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 5, right: 5),
                      child: CustomAutoSizeTextMontserrat(
                        text: courseSearchModel1.englishProficiency,
                        fontSize: 14,
                        textColor: ThemeConstants.TextColor,
                      ),
                    ),
                  )),
                  TableCell(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 5, right: 5),
                      child: CustomAutoSizeTextMontserrat(
                        text: courseSearchModel2.englishProficiency,
                        fontSize: 14,
                        textColor: ThemeConstants.TextColor,
                      ),
                    ),
                  )),
                ]),
            ],
          ),
        ],
      ),
    );
  }
}
