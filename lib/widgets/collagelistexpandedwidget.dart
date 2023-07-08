import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/ui/screen/course_search/courseshortlist.dart';
import 'package:studentpanel/ui/screen/course_search/finalshortlist.dart';
import 'package:studentpanel/ui/screen/course_search/reviewshortlist.dart';
import 'package:studentpanel/ui/screen/course_search/remove_compare_course.dart';
import 'package:studentpanel/ui/screen/fund/fund_requiremen.dart';
import 'package:studentpanel/ui/screen/fund/plan_fund.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CollagelistExpandedWidget extends StatefulWidget {
  CourseSearchModel? courseSearchModelCompare1;
  CourseSearchModel? courseSearchModelCompare2;
  String? previousRoute;
  bool? finalShortListFirst;
  bool? courseShortListFirst;
  String? courseSearchModelCompare1Id;
  String? courseSearchModelCompare2Id;
  bool? shortList = false;
  bool? finalShortList = false;
  String? currentPage;
  String? lastPage;
  CourseSearchModel courseSearchModel;
  final Function callbackRemoveCourse;
  final Function callbackFunction;
  final Function callbackCompare;
  final Function? callbackShortListButton;
  final Function? callbackFinalShortListButton;
  final Function? callbackForModelCompare;
  bool? iscompare;
  int? index;
  CollagelistExpandedWidget(
      {Key? key,
      this.courseSearchModelCompare1,
      this.courseSearchModelCompare2,
      this.previousRoute,
      required this.callbackRemoveCourse,
      required this.finalShortListFirst,
      required this.courseShortListFirst,
      required this.callbackForModelCompare,
      this.courseSearchModelCompare1Id,
      this.finalShortList,
      this.courseSearchModelCompare2Id,
      required this.iscompare,
      required this.courseSearchModel,
      required this.callbackFunction,
      this.callbackFinalShortListButton,
      required this.callbackCompare,
      this.callbackShortListButton,
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
  String? courseSearchModelCompare1Id;
  String? courseSearchModelCompare2Id;
  CourseSearchModel courseSearchModel = CourseSearchModel();
  bool resize = false;
  bool delayresize = false;
  late AnimationController controller;
  AnimateIconController c1 = AnimateIconController();
  bool? addCompare;
  bool? isCompare;
  int? index;
  bool shortlist = false;
  bool finalShortList = false;

  @override
  void initState() {
    courseSearchModel = widget.courseSearchModel;
    shortlist = widget.shortList!;
    if (widget.finalShortList != null) {
      finalShortList = widget.finalShortList!;
    }
    index = widget.index;
    courseSearchModelCompare1Id = widget.courseSearchModelCompare1Id;
    courseSearchModelCompare2Id = widget.courseSearchModelCompare2Id;

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
    return AnimatedContainer(
      margin: EdgeInsets.only(bottom: 10, right: 10, left: 5),
      duration: const Duration(milliseconds: 600),
      child: Card(
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(
          side:
              BorderSide(color: ThemeConstants.bluelightgreycolor, width: 0.5),
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 2,
        child: Column(
          children: [
            Stack(
              children: [
                // if (courseSearchModel.siecRep == "Yes")
                //   Positioned(
                //       top: 8,
                //       right: 10,
                //       child: Padding(
                //         padding: const EdgeInsets.all(5),
                //         child: svgImage(
                //             "star", ThemeConstants.orangeColor, 20, 20),
                //       )),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        var temp =
                            "${courseSearchModel.universityId},${courseSearchModel.courseId},${courseSearchModel.id}";
                        widget.callbackFunction(temp);
                      },
                      child: Column(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 50, left: 10, top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: courseSearchModel.courseName ?? "",
                                maxLines: 3,
                                textColor: ThemeConstants.bluecolor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text:
                                    "${courseSearchModel.countryName ?? ""},${courseSearchModel.stateName ?? ""},${courseSearchModel.cityName ?? ""}\n${courseSearchModel.universityName ?? ""}",
                                // "Australia,Victor,Melbourne | RMIT University",
                                maxLines: 3,
                                textColor: ThemeConstants.bluegreycolor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: courseSearchModel.campusName,
                                maxLines: 3,
                                textColor: ThemeConstants.bluegreycolor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: Row(
                        children: [
                          svgImage("clock", ThemeConstants.bluelightgreycolor,
                              20, 20),
                          if (getNUllChecker(
                                  courseSearchModel.courseDuration) ==
                              false)
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: CustomAutoSizeTextMontserrat(
                                text:
                                    "${(int.parse(courseSearchModel.courseDuration!) / 12).toStringAsFixed(1)} Years",
                                textColor: ThemeConstants.bluelightgreycolor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (getNUllChecker(
                                  courseSearchModel.annualTutionFees) ==
                              false)
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: svgImage("price",
                                  ThemeConstants.bluelightgreycolor, 15, 15),
                            ),
                          if (getNUllChecker(
                                  courseSearchModel.annualTutionFees) ==
                              false)
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: SizedBox(
                                width: 100,
                                child: CustomAutoSizeTextMontserrat(
                                  text: getNUllChecker(
                                              courseSearchModel.currencyCode) ==
                                          false
                                      ? (courseSearchModel.annualTutionFees
                                              .toString() +
                                          courseSearchModel.currencyCode!)
                                      : courseSearchModel.annualTutionFees
                                          .toString(),
                                  textColor: ThemeConstants.bluelightgreycolor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          if (getNUllChecker(
                                  courseSearchModel.annualTutionFees) ==
                              false)
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 7, bottom: 10),
                              child: InkWell(
                                onTap: () {
                                  getToast(
                                      "${courseSearchModel.annualTutionFeesInr} INR");
                                },
                                child: svgImage(
                                    "i", ThemeConstants.bluecolor, 20, 20),
                              ),
                            ),
                          const Spacer(),
                          // Row(
                          //   children: [
                          //     // const Spacer(),
                          //     // Container(
                          //     //   height: 30,
                          //     //   width: 30,
                          //     //   decoration: const BoxDecoration(
                          //     //       color: Color(0xFF2FAF5E),
                          //     //       borderRadius:
                          //     //           BorderRadius.all(Radius.circular(7))),
                          //     //   child: Padding(
                          //     //     padding: const EdgeInsets.all(3),
                          //     //     child: SvgPicture.asset(
                          //     //       "assets/icons/list.svg",
                          //     //       color: ThemeConstants.whitecolor,
                          //     //       height: 25,
                          //     //     ),
                          //     //   ),
                          //     // ),

                          //     // const Spacer(),
                          //     // Container(
                          //     //   height: 30,
                          //     //   width: 30,
                          //     //   decoration: const BoxDecoration(
                          //     //       color: Color(0xFFF97316),
                          //     //       borderRadius:
                          //     //           BorderRadius.all(Radius.circular(7))),
                          //     //   child: Padding(
                          //     //     padding: const EdgeInsets.all(5),
                          //     //     child: SvgPicture.asset(
                          //     //       "assets/icons/star.svg",
                          //     //       color: ThemeConstants.whitecolor,
                          //     //       height: 20,
                          //     //     ),
                          //     //   ),
                          //     // ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Expanded Details
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
                                minHeight: 70, //minimum height
                              ),
                              decoration: BoxDecoration(
                                  color: ThemeConstants.lightVioletColor,
                                  // border: Border.all(
                                  //     width: 0.5,
                                  //     color: ThemeConstants.VioletColor),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomAutoSizeTextMontserrat(
                                    text: "Total Tuition Fees ",
                                    textColor: ThemeConstants.VioletColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  if (getNUllChecker(
                                          courseSearchModel.totalFees) ==
                                      false)
                                    CustomAutoSizeTextMontserrat(
                                      text:
                                          "${courseSearchModel.totalFees}${courseSearchModel.currencyCode} (${courseSearchModel.totalFeesInr}INR)",
                                      textColor:
                                          ThemeConstants.bluelightgreycolor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
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
                                  minHeight: 70, //minimum height
                                ),
                                decoration: BoxDecoration(
                                    color: ThemeConstants.lightYellow,
                                    // border: Border.all(
                                    //     width: 0.5,
                                    //     color: ThemeConstants.yellow),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: Center(
                                  child: Column(
                                    children: [
                                      CustomAutoSizeTextMontserrat(
                                        text: "Conditional Offer ",
                                        textColor: ThemeConstants.yellow,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      if (getNUllChecker(courseSearchModel
                                              .conditionalOffer) ==
                                          false)
                                        CustomAutoSizeTextMontserrat(
                                          text: courseSearchModel
                                              .conditionalOffer,
                                          textColor:
                                              ThemeConstants.bluelightgreycolor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                    ],
                                  ),
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
                                minHeight: 70, //minimum height
                              ),
                              decoration: BoxDecoration(
                                  color: ThemeConstants.lightgreentColor,
                                  // border: Border.all(
                                  //     width: 0.5,
                                  //     color: ThemeConstants.GreenColor),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomAutoSizeTextMontserrat(
                                    text: "English test Req. ",
                                    textColor: ThemeConstants.GreenColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  CustomAutoSizeTextMontserrat(
                                    text: courseSearchModel.englishProficiency,
                                    textColor:
                                        ThemeConstants.bluelightgreycolor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
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
                                  minHeight: 70, //minimum height
                                ),
                                decoration: BoxDecoration(
                                    color: ThemeConstants.lightSkyblue,
                                    // border: Border.all(
                                    //     width: 0.5,
                                    //     color: ThemeConstants.skycolor),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomAutoSizeTextMontserrat(
                                      text: "Scholarship ",
                                      textColor: ThemeConstants.skycolor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    CustomAutoSizeTextMontserrat(
                                      text: courseSearchModel.scholarship ?? "",
                                      textColor:
                                          ThemeConstants.bluelightgreycolor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
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
                                minHeight: 70, //minimum height
                              ),
                              decoration: BoxDecoration(
                                  color: ThemeConstants.lightbrow,
                                  // border: Border.all(
                                  //     width: 0.5,
                                  //     color: ThemeConstants.browcolor),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomAutoSizeTextMontserrat(
                                    text: "Academic Req. ",
                                    textColor: ThemeConstants.browcolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  if (getNUllChecker(
                                          courseSearchModel.academicRequire) ==
                                      false)
                                    CustomAutoSizeTextMontserrat(
                                      text: courseSearchModel.academicRequire ??
                                          "",
                                      textColor:
                                          ThemeConstants.bluelightgreycolor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
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
                                  minHeight: 70, //minimum height
                                ),
                                decoration: BoxDecoration(
                                    color: ThemeConstants.lightRed,
                                    // border: Border.all(
                                    //     width: 0.5, color: ThemeConstants.red),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomAutoSizeTextMontserrat(
                                      text: "Offer TAT ",
                                      textColor: ThemeConstants.red,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    if (getNUllChecker(
                                            courseSearchModel.offerTat) ==
                                        false)
                                      CustomAutoSizeTextMontserrat(
                                        text:
                                            "${courseSearchModel.offerTat!} Day",
                                        textColor:
                                            ThemeConstants.bluelightgreycolor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
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
                    if (courseSearchModel.nearByIntake!.isNotEmpty ||
                        courseSearchModel.nearByIntake != "")
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: CustomAutoSizeTextMontserrat(
                            text: " NearBy Intake:",
                            fontWeight: FontWeight.bold,
                            textColor: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    if (courseSearchModel.nearByIntake!.isNotEmpty ||
                        courseSearchModel.nearByIntake != "")
                      const SizedBox(
                        height: 10,
                      ),
                    if (courseSearchModel.nearByIntake!.isNotEmpty ||
                        courseSearchModel.nearByIntake != "")
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
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Month",
                                        fontSize: 14,
                                      ),
                                    ),
                                  )),
                                  TableCell(
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: CustomAutoSizeTextMontserrat(
                                          text: "Year",
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                      child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Admission",
                                        fontSize: 14,
                                      ),
                                    ),
                                  )),
                                ]),
                          ],
                        ),
                      ),

                    if (getNUllChecker(courseSearchModel.nearByIntake) == false)
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
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: CustomAutoSizeTextMontserrat(
                                        text: (getNUllChecker(courseSearchModel
                                                    .nearByIntake) ==
                                                false)
                                            ? courseSearchModel.nearByIntake!
                                                .split("-")[1]
                                            : "",
                                        textColor: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  )),
                                  TableCell(
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: CustomAutoSizeTextMontserrat(
                                          text: (getNUllChecker(
                                                      courseSearchModel
                                                          .nearByIntake) ==
                                                  false)
                                              ? courseSearchModel.nearByIntake!
                                                  .split("-")[0]
                                              : "",
                                          fontSize: 14,
                                          textColor: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                      child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: CustomAutoSizeTextMontserrat(
                                        text: courseSearchModel
                                                .listIntake!.isNotEmpty
                                            ? courseSearchModel.listIntake![0]
                                                .toString()
                                                .split('-')[2]
                                            : "Closed",
                                        fontSize: 14,
                                        textColor: Colors.grey,
                                      ),
                                    ),
                                  )),
                                ]),
                              ],
                            ),
                          )),
                    // Ranking
                    if (getNUllChecker(courseSearchModel.arwuRank) == false ||
                        getNUllChecker(courseSearchModel.timesRank) == false ||
                        getNUllChecker(courseSearchModel.usNewsRank) == false ||
                        getNUllChecker(courseSearchModel.qsWorldRank) == false)
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Ranking",
                                fontWeight: FontWeight.bold,
                                textColor: ThemeConstants.bluelightgreycolor,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),

                    Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                        top: 5,
                      ),
                      child: Wrap(
                        children: [
                          if (getNUllChecker(courseSearchModel.arwuRank) ==
                              false)
                            CustomAutoSizeTextMontserrat(
                              text: "ARWU:${courseSearchModel.arwuRank ?? ""}",
                              textColor: Colors.grey,
                              fontSize: 14,
                            ),
                          const SizedBox(
                            width: 20,
                          ),
                          if (getNUllChecker(courseSearchModel.timesRank) ==
                              false)
                            CustomAutoSizeTextMontserrat(
                              text:
                                  "Times:${courseSearchModel.timesRank ?? ""}",
                              textColor: Colors.grey,
                              fontSize: 14,
                            ),
                          const SizedBox(
                            width: 20,
                          ),
                          if (getNUllChecker(courseSearchModel.usNewsRank) ==
                              false)
                            CustomAutoSizeTextMontserrat(
                              text:
                                  "US News:${courseSearchModel.usNewsRank ?? ""}",
                              textColor: Colors.grey,
                              fontSize: 14,
                            ),
                          const SizedBox(
                            width: 20,
                          ),
                          if (getNUllChecker(courseSearchModel.qsWorldRank) ==
                              false)
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
            SizedBox(
              height: 5,
            ),
            // Button List
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                spacing: 20,
                children: [
                  // if (widget.previousRoute != ReviewShortList.routeNamed)
                  // SpacerFlex(),
                  // if (widget.iscompare == true) const Spacer(),

                  if (widget.iscompare == true) AddedButtonShow(),
                  // if (widget.iscompare == true) const Spacer(),
                  // const Spacer(),
                  if (widget.previousRoute == FinalShortList.routeNamed)
                    FundCalculateButton(),

                  if (widget.previousRoute != FinalShortList.routeNamed)
                    AddToShortList(),
                  // if (widget.previousRoute != FinalShortList.routeNamed)
                  //   const Spacer(),
                  FinalButton(),

                  // if ((finalShortList == true ||
                  //         widget.finalShortListFirst == true) &&
                  //     courseSearchModel.finalList == "")

                  // FinalButton(),
                  // const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      onTap: (() {
                        setState(() {
                          if (resize == false) {
                            onStartIconPress(context);
                          } else {
                            onEndIconPress(context);
                          }
                        });
                      }),
                      child: Container(
                        width: 150,
                        height: 35,
                        decoration: BoxDecoration(
                            color: ThemeConstants.lightblueColor,
                            border: Border.all(
                              color: ThemeConstants.bluecolor,
                            ),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Row(
                              children: [
                                resize == false
                                    ? Icon(
                                        Icons.arrow_downward,
                                        size: 15,
                                        color: ThemeConstants.bluecolor,
                                      )
                                    : Icon(
                                        Icons.arrow_upward,
                                        size: 15,
                                        color: ThemeConstants.bluecolor,
                                      ),
                                CustomAutoSizeTextMontserrat(
                                  text: "Details",
                                  textColor: ThemeConstants.bluecolor,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // const Spacer(),
                ],
              ),
            ),

            // if (widget.iscompare == true) AddedButtonShow(),
            // if ((addCompare == false || addCompare == null) &&
            //     isCompare == true &&
            //     ),
          ],
        ),
      ),
    );
  }
  // Function

  FundCalculateButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        width: 150,
        height: 35,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: ThemeConstants.bluecolor,
              backgroundColor: ThemeConstants.bluecolor, // foreground
            ),
            onPressed: () {
              // addCompare = false;

              // // Remove Course Search model
              // if (widget.courseSearchModelCompare1Id == courseSearchModel.id) {
              //   widget.callbackForModelCompare!("Model1");
              // } else {
              //   widget.callbackForModelCompare!("Model2");
              // }

              print(courseSearchModel.id);
              Get.toNamed(Fundrequirement.routenamed,
                  arguments: courseSearchModel.id);
              setState(() {});
            },
            child: CustomAutoSizeTextMontserrat(
              text: "Calculate Fund",
              fontSize: 12,
              textColor: ThemeConstants.whitecolor,
            )),
      ),
    );
  }

  AddedButtonShow() {
    print(widget.iscompare);
    // add compare in both

    //Added Button
    if (widget.courseSearchModelCompare1Id == courseSearchModel.id ||
        widget.courseSearchModelCompare2Id == courseSearchModel.id) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
          width: 150,
          height: 35,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: ThemeConstants.bluecolor,
                backgroundColor: ThemeConstants.bluecolor, // foreground
              ),
              onPressed: () {
                addCompare = false;

                // Remove Course Search model
                if (widget.courseSearchModelCompare1Id ==
                    courseSearchModel.id) {
                  widget.callbackForModelCompare!("Model1");
                } else {
                  widget.callbackForModelCompare!("Model2");
                }

                // setState(() {});
              },
              child: CustomAutoSizeTextMontserrat(
                text: "Added",
                fontSize: 12,
                textColor: ThemeConstants.whitecolor,
              )),
        ),
      );
    }
    //Compare button
    else if (widget.courseSearchModelCompare1Id != courseSearchModel.id &&
        widget.courseSearchModelCompare2Id != courseSearchModel.id) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
            width: 150,
            height: 35,
            child: InkWell(
              onTap: () {
                if (widget.courseSearchModelCompare1Id != null &&
                    widget.courseSearchModelCompare2Id != null) {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            contentPadding:
                                const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            content: RemoveCompareCourse(
                              model1: widget.courseSearchModelCompare1!,
                              model2: widget.courseSearchModelCompare2!,
                              callbackRemoveCourse: callbackRemoveCourse,
                            ),
                            insetPadding:
                                const EdgeInsets.only(left: 5, right: 5),
                          ));
                } else {
                  setState(() {
                    addCompare = true;
                    widget.callbackCompare("${true},$index");
                  });
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: ThemeConstants.TextColor),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Center(
                    child: CustomAutoSizeTextMontserrat(
                  text: "Compare",
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                  textColor: ThemeConstants.TextColor,
                )),
              ),
            )),
      );
    }

//     //Added Button
//     if (addCompare == true) {
//       return Padding(
//         padding: const EdgeInsets.only(bottom: 10),
//         child: SizedBox(
//           width: 90,
//           height: 35,
//           child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary: ThemeConstants.bluecolor, // background
//                 onPrimary: ThemeConstants.bluecolor, // foreground
//               ),
//               onPressed: () async {
//                 addCompare = false;

// // Remove Course Search model
//                 if (courseSearchModelCompare1Id == courseSearchModel.id) {
//                   courseSearchModelCompare1Id = null;
//                   await widget.callbackForModelCompare!("Model1");
//                 } else {
//                   courseSearchModelCompare2Id = null;
//                   await widget.callbackForModelCompare!("Model2");
//                 }
//                 setState(() {});
//               },
//               child: CustomAutoSizeTextMontserrat(
//                 text: "Added",
//                 fontSize: 12,
//                 textColor: ThemeConstants.whitecolor,
//               )),
//         ),
//       );
//     }
//     //Compare button
//     else if (addCompare == false) {
//       return Padding(
//         padding: const EdgeInsets.only(bottom: 10),
//         child: SizedBox(
//             width: 90,
//             height: 35,
//             child: InkWell(
//               onTap: () {
//                 if (courseSearchModelCompare1Id != null &&
//                     courseSearchModelCompare2Id != null) {
//                   Get.bottomSheet(SizedBox(
//                     height: 40,
//                     width: MediaQuery.of(context).size.width,
//                     child: const Text("data"),
//                   ));
//                 } else {
//                   setState(() {
//                     addCompare = true;
//                     widget.callbackCompare("${true},$index");
//                   });
//                 }
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                     border: Border.all(color: ThemeConstants.TextColor),
//                     borderRadius: BorderRadius.all(Radius.circular(5))),
//                 child: Center(
//                     child: CustomAutoSizeTextMontserrat(
//                   text: "Compare",
//                   fontSize: 8,
//                   fontWeight: FontWeight.w600,
//                   textColor: ThemeConstants.TextColor,
//                 )),
//               ),
//             )),
//       );
//     }
  }

  AddToShortList() {
    if (widget.iscompare == true) {
      if (widget.previousRoute == ReviewShortList.routeNamed) {
        return Container();
      } else {
        // Remove ShortList
        if ((widget.shortList == true ||
                courseSearchModel.shortList.toString() == "1") &&
            widget.courseShortListFirst == true) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: InkWell(
              onTap: () {
                widget.shortList = false;
                courseSearchModel.shortList = "0";
                widget.callbackShortListButton!(
                    "$index,${courseSearchModel.id!}");
                setState(() {});
              },
              child: Container(
                width: 150,
                height: 35,
                decoration: BoxDecoration(
                    color: ThemeConstants.lightRed,
                    border: Border.all(color: ThemeConstants.red, width: 0.5),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3, right: 3),
                    child: CustomAutoSizeTextMontserrat(
                      text: "Remove ShortList",
                      textColor: ThemeConstants.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 8,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        // Add to ShortList
        if ((courseSearchModel.shortList.toString() == "null" ||
                courseSearchModel.shortList.toString() == "0") &&
            widget.courseShortListFirst == true &&
            widget.shortList == false) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: InkWell(
              onTap: (() {
                widget.shortList = true;
                courseSearchModel.shortList = "1";
                widget.callbackShortListButton!(
                    "$index,${courseSearchModel.id!}");
                setState(() {});
              }),
              child: Container(
                width: 150,
                height: 35,
                decoration: BoxDecoration(
                    color: ThemeConstants.lightgreentColor,
                    border: Border.all(
                        color: ThemeConstants.GreenColor, width: 0.5),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3, right: 3),
                    child: CustomAutoSizeTextMontserrat(
                      text: "Add to ShortList",
                      textColor: ThemeConstants.GreenColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 8,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      }
    } else {
      // Remove Shortlist
      if ((widget.shortList == true ||
              courseSearchModel.shortList.toString() == "1") &&
          widget.courseShortListFirst == true) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: InkWell(
            onTap: () {
              courseSearchModel.shortList = "0";
              widget.shortList = false;
              widget
                  .callbackShortListButton!("$index,${courseSearchModel.id!}");
              setState(() {});
            },
            child: Container(
              width: 150,
              height: 35,
              decoration: BoxDecoration(
                  color: ThemeConstants.lightRed,
                  border: Border.all(color: ThemeConstants.red, width: 0.5),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 2, right: 2),
                  child: CustomAutoSizeTextMontserrat(
                    text: "Remove ShortList",
                    textColor: ThemeConstants.red,
                    fontWeight: FontWeight.w600,
                    fontSize: 8,
                  ),
                ),
              ),
            ),
          ),
        );
      }

      // Add to Shortlist
      if ((courseSearchModel.shortList.toString() == "null" ||
              courseSearchModel.shortList.toString() == "0") &&
          widget.courseShortListFirst == true &&
          widget.shortList == false) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: InkWell(
            onTap: (() {
              widget.shortList = true;
              courseSearchModel.shortList = "1";
              widget
                  .callbackShortListButton!("$index,${courseSearchModel.id!}");
              setState(() {});
            }),
            child: Container(
              width: 150,
              height: 35,
              decoration: BoxDecoration(
                  color: ThemeConstants.lightgreentColor,
                  border:
                      Border.all(color: ThemeConstants.GreenColor, width: 0.5),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 3, right: 3),
                  child: CustomAutoSizeTextMontserrat(
                    text: "Add to ShortList",
                    textColor: ThemeConstants.GreenColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 8,
                  ),
                ),
              ),
            ),
          ),
        );
      } else {
        return Container();
      }
    }
  }

  SpacerFlex() {
    if (widget.iscompare == false) {
      if (widget.previousRoute == CourseSearchList.routeNamed ||
          widget.previousRoute == FinalShortList.routeNamed) {
        return const Spacer(
          flex: 15,
        );
      }
    } else {
      return Container();
    }
  }

  FinalButton() {
    if (courseSearchModel.finalList == "Final") {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: InkWell(
          onTap: (() {
            finalShortList = false;
            courseSearchModel.finalList = "";
            widget.callbackFinalShortListButton!(
                "$index,${courseSearchModel.id!}");
            setState(() {});
          }),
          child: Container(
            width: 150,
            height: 35,
            decoration: BoxDecoration(
                color: ThemeConstants.lightRed,
                border: Border.all(color: ThemeConstants.red, width: 0.5),
                borderRadius: BorderRadius.circular(5.0)),
            child: Padding(
              padding: const EdgeInsets.only(left: 3, right: 3),
              child: Center(
                child: CustomAutoSizeTextMontserrat(
                  text: "Remove Final ShortList",
                  textColor: ThemeConstants.red,
                  fontWeight: FontWeight.w600,
                  fontSize: 8,
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      if (finalShortList == false && widget.finalShortListFirst == true) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: InkWell(
            onTap: (() {
              finalShortList = true;
              courseSearchModel.finalList = "Final";
              widget.callbackFinalShortListButton!(
                  "$index,${courseSearchModel.id!}");
              setState(() {});
            }),
            child: Container(
              width: 150,
              height: 35,
              decoration: BoxDecoration(
                  color: ThemeConstants.lightgreentColor,
                  border:
                      Border.all(color: ThemeConstants.GreenColor, width: 0.5),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 3, right: 3),
                  child: CustomAutoSizeTextMontserrat(
                    text: "Add to Final ShortList",
                    textColor: ThemeConstants.GreenColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 8,
                  ),
                ),
              ),
            ),
          ),
        );
      } else if ((finalShortList == true &&
          widget.finalShortListFirst == true)) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: InkWell(
            onTap: (() {
              courseSearchModel.finalList = "";
              finalShortList = false;
              widget.callbackFinalShortListButton!(
                  "$index,${courseSearchModel.id!}");
              setState(() {});
            }),
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                  color: ThemeConstants.lightRed,
                  border: Border.all(color: ThemeConstants.red, width: 0.5),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Padding(
                padding: const EdgeInsets.only(left: 3, right: 3),
                child: Center(
                  child: CustomAutoSizeTextMontserrat(
                    text: "Remove Final ShortList",
                    textColor: ThemeConstants.red,
                    fontWeight: FontWeight.w600,
                    fontSize: 8,
                  ),
                ),
              ),
            ),
          ),
        );
      } else {
        return Container();
      }
    }
  }

  callbackRemoveCourse(data) {
    if (data == "1") {
      courseSearchModelCompare1Id = null;
    } else if (data == "2") {
      courseSearchModelCompare2Id = null;
    } else if (data == "12") {
      courseSearchModelCompare1Id = null;
      courseSearchModelCompare2Id = null;
    }
    widget.callbackRemoveCourse(data);
    setState(() {});
  }
}
