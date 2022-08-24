import 'package:animate_icons/animate_icons.dart';
import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:studentpanel/ui/controllers/coursesearchcontroller.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/ui/screen/coursesearchfulldetail.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CollagelistExpandedWidget extends StatefulWidget {
  CourseSearchModel courseSearchModel;
  final Function callbackFunction;
  CollagelistExpandedWidget(
      {Key? key,
      required this.courseSearchModel,
      required this.callbackFunction})
      : super(key: key);

  @override
  State<CollagelistExpandedWidget> createState() =>
      _CollagelistExpandedWidgetState();
}

class _CollagelistExpandedWidgetState extends State<CollagelistExpandedWidget>
    with TickerProviderStateMixin {
  CourseSearchModel? courseSearchModel;
  bool resize = false;
  bool delayresize = false;
  late AnimationController controller;
  AnimateIconController c1 = AnimateIconController();

  @override
  void initState() {
    courseSearchModel = widget.courseSearchModel;
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    super.initState();
  }

  // Dispose the controller
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool onEndIconPress(BuildContext context) {
    setState(() {
      resize = false;
      delayresize = false;
    });
    return true;
  }

  bool onStartIconPress(BuildContext context) {
    setState(() {
      resize = true;
      Future.delayed(Duration(milliseconds: 400), () {
        setState(() {
          delayresize = true;
        });
      });
    });
    return true;
  }

  final rowSpacer = TableRow(children: [
    SizedBox(
      height: 8,
    ),
    SizedBox(
      height: 8,
    )
  ]);

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatterMonth = DateFormat('MMM');
    var formatterYear = DateFormat('YYYY');
    String formattedDate = formatterMonth.format(now);
    String formattedDate2 = formatterYear.format(now);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      child: Card(
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(
          side:
              BorderSide(color: ThemeConstants.bluelightgreycolor, width: 0.5),
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                    top: 8,
                    right: 10,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (resize == false) {
                            onStartIconPress(context);
                          } else {
                            onEndIconPress(context);
                          }
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                  color: Color(0xFFECF0FB),
                                  shape: BoxShape.circle),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(8),
                                child:
                                    SvgPicture.asset("assets/icons/arrow.svg"),
                              ))),
                        ),
                      ),
                    )),
                Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(right: 50, left: 10, top: 10),
                        child: InkWell(
                          onTap: () {
                            var temp =
                                "${courseSearchModel!.id},${courseSearchModel!.universityId}";
                            widget.callbackFunction(temp);
                            // Get.toNamed(CourseSearchFullDetail.routeNamed,
                            //     arguments: [
                            //       {"first": courseSearchModel!.id},
                            //       {"second": courseSearchModel!.universityId}
                            //     ]);
                          },
                          child: CustomAutoSizeTextMontserrat(
                            text: courseSearchModel!.courseName ?? "",
                            maxLines: 3,
                            textColor: ThemeConstants.bluecolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: CustomAutoSizeTextMontserrat(
                          text:
                              "${courseSearchModel!.countryName!},${courseSearchModel!.stateName!},${courseSearchModel!.cityName!}|${courseSearchModel!.universityName!}",
                          // "Australia,Victor,Melbourne | RMIT University",
                          maxLines: 3,
                          textColor: ThemeConstants.bluegreycolor,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: CustomAutoSizeTextMontserrat(
                          text: courseSearchModel!.campusName,
                          maxLines: 3,
                          textColor: ThemeConstants.bluegreycolor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/clock.svg",
                            height: 15,
                            color: ThemeConstants.bluelightgreycolor,
                          ),
                          if (courseSearchModel!.durationYear != null)
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: CustomAutoSizeTextMontserrat(
                                text:
                                    "${courseSearchModel!.durationYear!} Years",
                                maxLines: 1,
                                textColor: ThemeConstants.bluelightgreycolor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (courseSearchModel!.annualTutionFees != null)
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: SvgPicture.asset(
                                "assets/icons/price.svg",
                                color: ThemeConstants.bluelightgreycolor,
                                height: 15,
                              ),
                            ),
                          if (courseSearchModel!.annualTutionFees != null)
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: SizedBox(
                                width: 100,
                                child: CustomAutoSizeTextMontserrat(
                                  text: courseSearchModel!.annualTutionFees
                                          .toString() +
                                      courseSearchModel!.currencyCode!,
                                  maxLines: 1,
                                  textColor: ThemeConstants.bluelightgreycolor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          if (courseSearchModel!.annualTutionFees != null)
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  "assets/icons/i.svg",
                                  height: 20,
                                  width: 20,
                                  color: ThemeConstants.bluecolor,
                                )),
                          Spacer(),
                          SizedBox(
                            height: 30,
                            width: 100,
                            child: Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: ThemeConstants.bluecolor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(7))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: SvgPicture.asset(
                                      "assets/icons/compare.svg",
                                      color: ThemeConstants.whitecolor,
                                      height: 25,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF2FAF5E),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(7))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: SvgPicture.asset(
                                      "assets/icons/list.svg",
                                      color: ThemeConstants.whitecolor,
                                      height: 25,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFF97316),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(7))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: SvgPicture.asset(
                                      "assets/icons/star.svg",
                                      color: ThemeConstants.whitecolor,
                                      height: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // if (resize == true)
                    //   Padding(
                    //     padding: const EdgeInsets.only(
                    //         left: 10, right: 10, top: 5),
                    //     child: DottedLine(
                    //       dashLength: 12,
                    //       dashGapLength: 7,
                    //       lineThickness: 2,
                    //       dashColor: ThemeConstants.lightgreycolor,
                    //       dashGapColor: ThemeConstants.whitecolor,
                    //     ),
                    //   ),
                  ],
                ),
              ],
            ),
            if (delayresize == true)
              SizedBox(
                height: 240,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: <Widget>[
                      Table(
                        columnWidths: const {0: FractionColumnWidth(.6)},
                        children: [
                          TableRow(children: [
                            TableCell(
                              child: CustomAutoSizeTextMontserrat(
                                text: "Total Tuition Fees:",
                                maxLines: 1,
                                textColor: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            TableCell(
                              child: CustomAutoSizeTextMontserrat(
                                text: "Conditional Offer:",
                                maxLines: 1,
                                textColor: Colors.grey,
                                fontSize: 14,
                              ),
                            )
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: courseSearchModel!.totalFees != null
                                    ? CustomAutoSizeTextMontserrat(
                                        text:
                                            "${courseSearchModel!.totalFees}${courseSearchModel!.currencyCode} (${courseSearchModel!.totalFeesInr}INR)",
                                        maxLines: 1,
                                        textColor: Colors.grey,
                                        fontSize: 12,
                                      )
                                    : Container()),
                            TableCell(
                              child: CustomAutoSizeTextMontserrat(
                                text: courseSearchModel!.conditionalOffer,
                                maxLines: 1,
                                textColor: Colors.grey,
                                fontSize: 12,
                              ),
                            )
                          ]),
                          rowSpacer,
                          TableRow(children: [
                            TableCell(
                              child: CustomAutoSizeTextMontserrat(
                                text: "English test Requirement:",
                                maxLines: 1,
                                textColor: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            TableCell(
                              child: CustomAutoSizeTextMontserrat(
                                text: "Scholarship:",
                                maxLines: 1,
                                textColor: Colors.grey,
                                fontSize: 14,
                              ),
                            )
                          ]),
                          TableRow(children: [
                            TableCell(
                              child: CustomAutoSizeTextMontserrat(
                                text: courseSearchModel!.englishProficiency
                                    .toString()
                                    .split("|")[0],
                                maxLines: 1,
                                textColor: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            TableCell(
                              child: CustomAutoSizeTextMontserrat(
                                text: courseSearchModel!.scholarship ?? "",
                                maxLines: 1,
                                textColor: Colors.grey,
                                fontSize: 12,
                              ),
                            )
                          ]),
                          rowSpacer,
                          TableRow(children: [
                            TableCell(
                              child: CustomAutoSizeTextMontserrat(
                                text: "Academic Requirement:",
                                maxLines: 1,
                                textColor: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            TableCell(
                              child: CustomAutoSizeTextMontserrat(
                                text: "Offer TAT:",
                                maxLines: 1,
                                textColor: Colors.grey,
                                fontSize: 14,
                              ),
                            )
                          ]),
                          TableRow(children: [
                            TableCell(
                              child: CustomAutoSizeTextMontserrat(
                                text: courseSearchModel!.academicRequire ?? "",
                                maxLines: 1,
                                textColor: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            TableCell(
                              child: CustomAutoSizeTextMontserrat(
                                text: courseSearchModel!.offerTat ?? "",
                                maxLines: 1,
                                textColor: Colors.grey,
                                fontSize: 12,
                              ),
                            )
                          ]),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: CustomAutoSizeTextMontserrat(
                            text: " NearBy Intake:",
                            maxLines: 1,
                            textColor: Colors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                        ),
                        child: Table(
                          border: TableBorder.all(),
                          children: [
                            TableRow(
                                decoration:
                                    BoxDecoration(color: Color(0xFFECF0FB)),
                                children: [
                                  TableCell(
                                      child: Center(
                                    child: CustomAutoSizeTextMontserrat(
                                      maxLines: 1,
                                      text: "Month",
                                    ),
                                  )),
                                  TableCell(
                                    child: Center(
                                      child: CustomAutoSizeTextMontserrat(
                                        maxLines: 1,
                                        text: "Year",
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                      child: Center(
                                    child: CustomAutoSizeTextMontserrat(
                                      maxLines: 1,
                                      text: "Admission",
                                    ),
                                  )),
                                ]),
                          ],
                        ),
                      ),
                      MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          removeBottom: true,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 20,
                            ),
                            child: Table(
                              border: TableBorder.all(),
                              children: [
                                TableRow(children: [
                                  TableCell(
                                      child: Center(
                                    child: CustomAutoSizeTextMontserrat(
                                      maxLines: 1,
                                      text: courseSearchModel!.nearByIntake !=
                                              null
                                          ? courseSearchModel!.nearByIntake!
                                              .split("-")[0]
                                          : "",
                                      textColor: Colors.grey,
                                    ),
                                  )),
                                  TableCell(
                                    child: Center(
                                      child: CustomAutoSizeTextMontserrat(
                                        maxLines: 1,
                                        text: courseSearchModel!.nearByIntake !=
                                                null
                                            ? courseSearchModel!.nearByIntake!
                                                .split("-")[1]
                                            : "",
                                        textColor: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                      child: Center(
                                    child: CustomAutoSizeTextMontserrat(
                                      maxLines: 1,
                                      text: courseSearchModel!
                                              .listIntake!.isNotEmpty
                                          ? courseSearchModel!.listIntake![0]
                                              .toString()
                                              .split('-')[2]
                                          : "",
                                      textColor: Colors.grey,
                                    ),
                                  )),
                                ]),
                              ],
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/star.svg",
                              height: 15,
                              color: Color(0xFFF97316),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Ranking",
                                maxLines: 1,
                                textColor: Colors.grey,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 5, bottom: 10),
                        child: Row(
                          children: [
                            CustomAutoSizeTextMontserrat(
                              text: "ARWU:${courseSearchModel!.arwuRank ?? ""}",
                              maxLines: 1,
                              textColor: Colors.grey,
                              fontSize: 14,
                            ),
                            Spacer(),
                            CustomAutoSizeTextMontserrat(
                              text:
                                  "Times:${courseSearchModel!.timesRank ?? ""}",
                              maxLines: 1,
                              textColor: Colors.grey,
                              fontSize: 14,
                            ),
                            Spacer(),
                            CustomAutoSizeTextMontserrat(
                              text:
                                  "US News:${courseSearchModel!.usNewsRank ?? ""}",
                              maxLines: 1,
                              textColor: Colors.grey,
                              fontSize: 14,
                            ),
                            Spacer(),
                            CustomAutoSizeTextMontserrat(
                              text:
                                  "QS World:${courseSearchModel!.qsWorldRank ?? ""}",
                              maxLines: 1,
                              textColor: Colors.grey,
                              fontSize: 14,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
