import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:studentpanel/ui/controllers/coursesearchcontroller.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CollagelistExpandedWidget extends StatefulWidget {
  String? currentPage;
  String? lastPage;
  CourseSearchModel courseSearchModel;
  final Function callbackFunction;
  final Function callbackCompare;
  bool? iscompare;
  int? index;
  CollagelistExpandedWidget(
      {Key? key,
      required this.iscompare,
      required this.courseSearchModel,
      required this.callbackFunction,
      required this.callbackCompare,
      required this.index,
      this.currentPage,
      this.lastPage})
      : super(key: key);

  @override
  State<CollagelistExpandedWidget> createState() =>
      _CollagelistExpandedWidgetState();
}

class _CollagelistExpandedWidgetState extends State<CollagelistExpandedWidget>
    with TickerProviderStateMixin {
  CourseSearchModel courseSearchModel = CourseSearchModel();
  bool resize = false;
  bool delayresize = false;
  late AnimationController controller;
  AnimateIconController c1 = AnimateIconController();
  bool? addCompare;
  bool? isCompare;
  int? index;

  @override
  void initState() {
    courseSearchModel = widget.courseSearchModel;
    isCompare = widget.iscompare;
    index = widget.index;

    controller =
        AnimationController(duration: const Duration(seconds: 0), vsync: this);
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
      // Future.delayed(Duration(milliseconds: 600), () {
      //   setState(() {

      delayresize = true;
      //   });
      // });
    });
    return true;
  }

  final rowSpacer = const TableRow(children: [
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
      duration: const Duration(milliseconds: 600),
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
                      child: SizedBox(
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
                                "${courseSearchModel.universityId},${courseSearchModel.courseId},${courseSearchModel.id}";
                            widget.callbackFunction(temp);
                            // Get.toNamed(CourseSearchFullDetail.routeNamed,
                            //     arguments: [
                            //       {"first": courseSearchModel!.id},
                            //       {"second": courseSearchModel!.universityId}
                            //     ]);
                          },
                          child: CustomAutoSizeTextMontserrat(
                            text: courseSearchModel.courseName ?? "",
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
                              "${courseSearchModel.countryName!},${courseSearchModel.stateName!},${courseSearchModel.cityName!}|${courseSearchModel.universityName!}",
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
                          text: courseSearchModel.campusName,
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
                          if (courseSearchModel.durationYear != null)
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: CustomAutoSizeTextMontserrat(
                                text:
                                    "${courseSearchModel.durationYear!} Years",
                                textColor: ThemeConstants.bluelightgreycolor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (courseSearchModel.annualTutionFees != null)
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: SvgPicture.asset(
                                "assets/icons/price.svg",
                                color: ThemeConstants.bluelightgreycolor,
                                height: 15,
                              ),
                            ),
                          if (courseSearchModel.annualTutionFees != null)
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: SizedBox(
                                width: 100,
                                child: CustomAutoSizeTextMontserrat(
                                  text: courseSearchModel.annualTutionFees
                                          .toString() +
                                      courseSearchModel.currencyCode!,
                                  textColor: ThemeConstants.bluelightgreycolor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          if (courseSearchModel.annualTutionFees != null)
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  "assets/icons/i.svg",
                                  height: 20,
                                  width: 20,
                                  color: ThemeConstants.bluecolor,
                                )),
                          const Spacer(),
                          SizedBox(
                            height: 30,
                            width: 80,
                            child: Row(
                              children: [
                                const Spacer(),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
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
                                const Spacer(),
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
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  children: <Widget>[
                    Table(
                      columnWidths: const {0: FractionColumnWidth(.5)},
                      children: [
                        TableRow(children: [
                          TableCell(
                            child: Container(
                              constraints: const BoxConstraints(
                                minHeight: 60, //minimum height
                              ),
                              decoration: BoxDecoration(
                                  color: ThemeConstants.lightVioletColor,
                                  border: Border.all(
                                      color: ThemeConstants.VioletColor),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomAutoSizeTextMontserrat(
                                    text: "Total Tuition Fees:",
                                    textColor: ThemeConstants.VioletColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  CustomAutoSizeTextMontserrat(
                                    text:
                                        "${courseSearchModel.totalFees}${courseSearchModel.currencyCode} (${courseSearchModel.totalFeesInr}INR)",
                                    textColor: Colors.grey,
                                    fontSize: 12,
                                  )
                                ],
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 5),
                              child: Container(
                                constraints: const BoxConstraints(
                                  minHeight: 60, //minimum height
                                ),
                                decoration: BoxDecoration(
                                    color: ThemeConstants.lightYellow,
                                    border: Border.all(
                                        color: ThemeConstants.yellow),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: Column(
                                  children: [
                                    CustomAutoSizeTextMontserrat(
                                      text: "Conditional Offer:",
                                      textColor: ThemeConstants.yellow,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    CustomAutoSizeTextMontserrat(
                                      text: courseSearchModel.conditionalOffer,
                                      textColor: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ]),

                        rowSpacer,
                        TableRow(children: [
                          TableCell(
                            child: Container(
                              constraints: const BoxConstraints(
                                minHeight: 60, //minimum height
                              ),
                              decoration: BoxDecoration(
                                  color: ThemeConstants.lightgreentColor,
                                  border: Border.all(
                                      color: ThemeConstants.GreenColor),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomAutoSizeTextMontserrat(
                                    text: "English test Requirement:",
                                    textColor: ThemeConstants.GreenColor,
                                    fontSize: 14,
                                  ),
                                  CustomAutoSizeTextMontserrat(
                                    text: courseSearchModel.englishProficiency
                                        .toString()
                                        .split("|")[0],
                                    textColor: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 5),
                              child: Container(
                                constraints: const BoxConstraints(
                                  minHeight: 60, //minimum height
                                ),
                                decoration: BoxDecoration(
                                    color: ThemeConstants.lightSkyblue,
                                    border: Border.all(
                                        color: ThemeConstants.skycolor),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomAutoSizeTextMontserrat(
                                      text: "Scholarship:",
                                      textColor: ThemeConstants.skycolor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    CustomAutoSizeTextMontserrat(
                                      text: courseSearchModel.scholarship ?? "",
                                      textColor: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ]),
                        // TableRow(children: [
                        //   // TableCell(
                        //   //   child: CustomAutoSizeTextMontserrat(
                        //   //     text: courseSearchModel!.englishProficiency
                        //   //         .toString()
                        //   //         .split("|")[0],
                        //   //     textColor: Colors.grey,
                        //   //     fontSize: 12,
                        //   //   ),
                        //   // ),

                        //   TableCell(
                        //     child: CustomAutoSizeTextMontserrat(
                        //       text: courseSearchModel!.scholarship ?? "",
                        //       textColor: Colors.grey,
                        //       fontSize: 12,
                        //     ),
                        //   )
                        // ]),

                        rowSpacer,
                        TableRow(children: [
                          TableCell(
                            child: Container(
                              constraints: const BoxConstraints(
                                minHeight: 60, //minimum height
                              ),
                              decoration: BoxDecoration(
                                  color: ThemeConstants.lightbrow,
                                  border: Border.all(
                                      color: ThemeConstants.browcolor),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomAutoSizeTextMontserrat(
                                    text: "Academic Requirement:",
                                    textColor: ThemeConstants.browcolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  CustomAutoSizeTextMontserrat(
                                    text:
                                        courseSearchModel.academicRequire ?? "",
                                    textColor: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 5),
                              child: Container(
                                constraints: const BoxConstraints(
                                  minHeight: 60, //minimum height
                                ),
                                decoration: BoxDecoration(
                                    color: ThemeConstants.lightRed,
                                    border:
                                        Border.all(color: ThemeConstants.red),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomAutoSizeTextMontserrat(
                                      text: "Offer TAT:",
                                      textColor: ThemeConstants.red,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    CustomAutoSizeTextMontserrat(
                                      text: courseSearchModel.offerTat ?? "",
                                      textColor: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ]),
                        // TableRow(children: [
                        //   TableCell(
                        //     child: CustomAutoSizeTextMontserrat(
                        //       text: courseSearchModel.academicRequire ?? "",
                        //       textColor: Colors.grey,
                        //       fontSize: 12,
                        //     ),
                        //   ),
                        //   TableCell(
                        //     child: CustomAutoSizeTextMontserrat(
                        //       text: courseSearchModel.offerTat ?? "",
                        //       textColor: Colors.grey,
                        //       fontSize: 12,
                        //     ),
                        //   )
                        // ]),
                      ],
                    ),
                    //NearBy Intake
                    if (courseSearchModel.nearByIntake != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: CustomAutoSizeTextMontserrat(
                            text: " NearBy Intake:",
                            textColor: Colors.grey,
                          ),
                        ),
                      ),
                    if (courseSearchModel.nearByIntake != null)
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                        ),
                        child: Table(
                          border: TableBorder.all(),
                          children: [
                            TableRow(
                                decoration: const BoxDecoration(
                                    color: Color(0xFFECF0FB)),
                                children: [
                                  TableCell(
                                      child: Center(
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Month",
                                    ),
                                  )),
                                  TableCell(
                                    child: Center(
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Year",
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                      child: Center(
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Admission",
                                    ),
                                  )),
                                ]),
                          ],
                        ),
                      ),
                    if (courseSearchModel.nearByIntake != null)
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
                                      text:
                                          courseSearchModel.nearByIntake != null
                                              ? courseSearchModel.nearByIntake!
                                                  .split("-")[0]
                                              : "",
                                      textColor: Colors.grey,
                                    ),
                                  )),
                                  TableCell(
                                    child: Center(
                                      child: CustomAutoSizeTextMontserrat(
                                        text: courseSearchModel.nearByIntake !=
                                                null
                                            ? courseSearchModel.nearByIntake!
                                                .split("-")[1]
                                            : "",
                                        textColor: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                      child: Center(
                                    child: CustomAutoSizeTextMontserrat(
                                      text: courseSearchModel
                                              .listIntake!.isNotEmpty
                                          ? courseSearchModel.listIntake![0]
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
                    // Ranking
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/star.svg",
                            height: 15,
                            color: const Color(0xFFF97316),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: CustomAutoSizeTextMontserrat(
                              text: "Ranking",
                              textColor: ThemeConstants.bluelightgreycolor,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),

                    Padding(
                      padding:
                          const EdgeInsets.only(right: 10, top: 5, bottom: 10),
                      child: Row(
                        children: [
                          if (courseSearchModel.arwuRank != null)
                            CustomAutoSizeTextMontserrat(
                              text: "ARWU:${courseSearchModel.arwuRank ?? ""}",
                              textColor: Colors.grey,
                              fontSize: 14,
                            ),
                          const Spacer(),
                          if (courseSearchModel.timesRank != null)
                            CustomAutoSizeTextMontserrat(
                              text:
                                  "Times:${courseSearchModel.timesRank ?? ""}",
                              textColor: Colors.grey,
                              fontSize: 14,
                            ),
                          const Spacer(),
                          if (courseSearchModel.usNewsRank != null)
                            CustomAutoSizeTextMontserrat(
                              text:
                                  "US News:${courseSearchModel.usNewsRank ?? ""}",
                              textColor: Colors.grey,
                              fontSize: 14,
                            ),
                          const Spacer(),
                          if (courseSearchModel.qsWorldRank != null)
                            CustomAutoSizeTextMontserrat(
                              text:
                                  "QS World:${courseSearchModel.qsWorldRank ?? ""}",
                              textColor: Colors.grey,
                              fontSize: 14,
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            if (isCompare == true) AddedButtonShow(),
            // if ((addCompare == false || addCompare == null) &&
            //     isCompare == true &&
            //     )
          ],
        ),
      ),
    );
  }
  // Function

  AddedButtonShow() {
    // add compare in both
    if (addCompare == null) {
      if (Get.find<CourseSearchController>().courseSearchModelCompare1.id ==
              courseSearchModel.id ||
          Get.find<CourseSearchController>().courseSearchModelCompare2.id ==
              courseSearchModel.id) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SizedBox(
            width: 160,
            height: 40,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ThemeConstants.bluecolor, // background
                  onPrimary: ThemeConstants.bluecolor, // foreground
                ),
                onPressed: () {
                  addCompare = false;
                  // widget.callbackCompare(false);

                  if (Get.find<CourseSearchController>()
                          .courseSearchModelCompare1
                          .id ==
                      courseSearchModel.id) {
                    Get.find<CourseSearchController>()
                        .courseSearchModelCompare1 = CourseSearchModel();
                  } else {
                    Get.find<CourseSearchController>()
                        .courseSearchModelCompare2 = CourseSearchModel();
                  }
                  setState(() {});
                },
                child: Row(
                  children: [
                    const Spacer(),
                    SvgPicture.asset(
                      "assets/icons/plus.svg",
                      height: 15,
                      color: ThemeConstants.whitecolor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CustomAutoSizeTextMontserrat(
                      text: "Added",
                      textColor: ThemeConstants.whitecolor,
                    ),
                    const Spacer(),
                  ],
                )),
          ),
        );
      } else if (Get.find<CourseSearchController>()
                  .courseSearchModelCompare1
                  .id !=
              courseSearchModel.id &&
          Get.find<CourseSearchController>().courseSearchModelCompare2.id !=
              courseSearchModel.id) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SizedBox(
            width: 190,
            height: 40,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: ThemeConstants.bluegreycolor),
                  primary: ThemeConstants.whitecolor, // background
                  onPrimary: ThemeConstants.whitecolor, // foreground
                ),
                onPressed: () {
                  if (Get.find<CourseSearchController>()
                              .courseSearchModelCompare1
                              .id !=
                          null &&
                      Get.find<CourseSearchController>()
                              .courseSearchModelCompare2
                              .id !=
                          null) {
                    Get.bottomSheet(SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: const Text("data"),
                    ));
                  } else {
                    setState(() {
                      addCompare = true;
                      widget.callbackCompare("${true},$index");
                    });
                  }
                },
                child: Row(
                  children: [
                    const Spacer(),
                    SvgPicture.asset(
                      "assets/icons/plus.svg",
                      height: 15,
                      color: ThemeConstants.bluegreycolor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CustomAutoSizeTextMontserrat(
                      text: "Add to Compare",
                      textColor: ThemeConstants.bluegreycolor,
                    ),
                    const Spacer(),
                  ],
                )),
          ),
        );
      }
    }
    if (addCompare == true) {
      //Added Button
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
          width: 160,
          height: 40,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: ThemeConstants.bluecolor, // background
                onPrimary: ThemeConstants.bluecolor, // foreground
              ),
              onPressed: () {
                addCompare = false;
                // widget.callbackCompare(false);

                if (Get.find<CourseSearchController>()
                        .courseSearchModelCompare1
                        .id ==
                    courseSearchModel.id) {
                  Get.find<CourseSearchController>().courseSearchModelCompare1 =
                      CourseSearchModel();
                } else {
                  Get.find<CourseSearchController>().courseSearchModelCompare2 =
                      CourseSearchModel();
                }
                setState(() {});
              },
              child: Row(
                children: [
                  const Spacer(),
                  SvgPicture.asset(
                    "assets/icons/plus.svg",
                    height: 15,
                    color: ThemeConstants.whitecolor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: "Added",
                    textColor: ThemeConstants.whitecolor,
                  ),
                  const Spacer(),
                ],
              )),
        ),
      );
    } else if (addCompare == false) {
      // added to compare
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
          width: 190,
          height: 40,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: ThemeConstants.bluegreycolor),
                primary: ThemeConstants.whitecolor, // background
                onPrimary: ThemeConstants.whitecolor, // foreground
              ),
              onPressed: () {
                if (Get.find<CourseSearchController>()
                            .courseSearchModelCompare1
                            .id !=
                        null &&
                    Get.find<CourseSearchController>()
                            .courseSearchModelCompare2
                            .id !=
                        null) {
                  Get.bottomSheet(SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: const Text("data"),
                  ));
                } else {
                  setState(() {
                    addCompare = true;
                    widget.callbackCompare("${true},$index");
                  });
                }
              },
              child: Row(
                children: [
                  const Spacer(),
                  SvgPicture.asset(
                    "assets/icons/plus.svg",
                    height: 15,
                    color: ThemeConstants.bluegreycolor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: "Add to Compare",
                    textColor: ThemeConstants.bluegreycolor,
                  ),
                  const Spacer(),
                ],
              )),
        ),
      );
    }
  }
}
