import 'package:animate_icons/animate_icons.dart';
import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CollagelistExpandedWidget extends StatefulWidget {
  CourseSearchModel courseSearchModel;
  CollagelistExpandedWidget({Key? key, required this.courseSearchModel})
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
      Future.delayed(Duration(milliseconds: 220), () {
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
    print(
        "${courseSearchModel!.countryName!},${courseSearchModel!.stateName!},${courseSearchModel!.cityName!}|${courseSearchModel!.universityName!}"
            .length);
    print(courseSearchModel!.courseName!.length);
    print(courseSearchModel!.courseName);
    double size = 0;
    if (courseSearchModel!.courseName!.length > 70) {
      size = 30;
    } else {
      setState(() {
        size = 0;
      });
    }
    if ("${courseSearchModel!.countryName!},${courseSearchModel!.stateName!},${courseSearchModel!.cityName!}|${courseSearchModel!.universityName!}"
            .length >
        75) {
      size = size + 20.0;
    }
    if (courseSearchModel!.courseName!.length > 10) {
      //

    }
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        // height: resize ? 445 + size : 170 + size,
        child: Card(
          shadowColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: ThemeConstants.bluelightgreycolor, width: 0.5),
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                        top: 8,
                        right: 10,
                        child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Color(0xFFECF0FB),
                                shape: BoxShape.circle),
                            child: Center(
                                child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (resize == false) {
                                    onStartIconPress(context);
                                  } else {
                                    onEndIconPress(context);
                                  }
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child:
                                    SvgPicture.asset("assets/icons/arrow.svg"),
                              ),
                            )))),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 50, left: 10, top: 10),
                          child: CustomAutoSizeTextMontserrat(
                            text: courseSearchModel!.courseName ?? "",
                            maxLines: 3,
                            textColor: ThemeConstants.bluecolor,
                            fontWeight: FontWeight.bold,
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
                              left: 10, right: 10, top: 0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/clock.svg",
                                height: 15,
                                color: ThemeConstants.bluelightgreycolor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: CustomAutoSizeTextMontserrat(
                                  text: "3 Year",
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
                                  child: CustomAutoSizeTextMontserrat(
                                    text: courseSearchModel!.annualTutionFees
                                            .toString() +
                                        courseSearchModel!.currencyCode!,
                                    maxLines: 1,
                                    textColor:
                                        ThemeConstants.bluelightgreycolor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              if (courseSearchModel!.annualTutionFees != null)
                                IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      "assets/icons/i.svg",
                                      height: 20,
                                      color: ThemeConstants.bluecolor,
                                    )),
                              Spacer(),
                              Container(
                                height: 30,
                                width: 120,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: ThemeConstants.bluecolor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7))),
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7))),
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7))),
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
              ),
              if (delayresize == true)
                Container(
                  child: SizedBox(
                    height: 260,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Table(
                            columnWidths: {0: FractionColumnWidth(.6)},
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
                                    text: courseSearchModel!.academicRequire ??
                                        "",
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: CustomAutoSizeTextMontserrat(
                              text: "Intake:",
                              maxLines: 1,
                              textColor: Colors.grey,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
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
                              TableRow(
                                  decoration: BoxDecoration(
                                      color: ThemeConstants.whitecolor),
                                  children: [
                                    TableCell(
                                        child: Center(
                                      child: CustomAutoSizeTextMontserrat(
                                        maxLines: 1,
                                        text:
                                            courseSearchModel!.intakeFromYear ??
                                                "",
                                        textColor: Colors.grey,
                                      ),
                                    )),
                                    TableCell(
                                      child: Center(
                                        child: CustomAutoSizeTextMontserrat(
                                          maxLines: 1,
                                          text: courseSearchModel!
                                                  .intakeFromYear ??
                                              "",
                                          textColor: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                        child: Center(
                                      child: CustomAutoSizeTextMontserrat(
                                        maxLines: 1,
                                        text: "Close",
                                        textColor: Colors.grey,
                                      ),
                                    )),
                                  ]),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/star.svg",
                                height: 15,
                                color: Color(0xFFF97316),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
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
                              left: 20, right: 10, top: 10),
                          child: Row(
                            children: [
                              CustomAutoSizeTextMontserrat(
                                text: "ARWU:${courseSearchModel!.arwuRank}",
                                maxLines: 1,
                                textColor: Colors.grey,
                                fontSize: 14,
                              ),
                              Spacer(),
                              CustomAutoSizeTextMontserrat(
                                text: "Times:${courseSearchModel!.timesRank}",
                                maxLines: 1,
                                textColor: Colors.grey,
                                fontSize: 14,
                              ),
                              Spacer(),
                              CustomAutoSizeTextMontserrat(
                                text:
                                    "US News:${courseSearchModel!.usNewsRank}",
                                maxLines: 1,
                                textColor: Colors.grey,
                                fontSize: 14,
                              ),
                              Spacer(),
                              CustomAutoSizeTextMontserrat(
                                text:
                                    "QS World:${courseSearchModel!.qsWorldRank}",
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
      ),
    );
  }
}
