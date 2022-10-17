import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/ui/screen/courseshortlist.dart';
import 'package:studentpanel/ui/screen/finalshortlist.dart';
import 'package:studentpanel/ui/screen/reviewshortlist.dart';
import 'package:studentpanel/ui/screen/sort.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CollagelistExpandedWidget extends StatefulWidget {
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
  final Function callbackFunction;
  final Function callbackCompare;
  final Function? callbackShortListButton;
  final Function? callbackFinalShortListButton;
  final Function? callbackForModelCompare;
  bool? iscompare;
  int? index;
  CollagelistExpandedWidget(
      {Key? key,
      this.previousRoute,
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
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: SvgPicture.asset(
                        "assets/icons/star.svg",
                        color: ThemeConstants.orangeColor,
                        height: 20,
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
                              "${courseSearchModel.countryName ?? ""},${courseSearchModel.stateName ?? ""},${courseSearchModel.cityName ?? ""}|${courseSearchModel.universityName ?? ""}",
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
                        left: 10,
                        right: 10,
                      ),
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
                                  text: courseSearchModel.currencyCode != null
                                      ? (courseSearchModel.annualTutionFees
                                              .toString() +
                                          courseSearchModel.currencyCode!)
                                      : courseSearchModel.annualTutionFees
                                          .toString(),
                                  textColor: ThemeConstants.bluelightgreycolor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          if (courseSearchModel.annualTutionFees != null)
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 7, bottom: 10),
                              child: InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  "assets/icons/i.svg",
                                  height: 18,
                                  width: 18,
                                  color: ThemeConstants.bluecolor,
                                ),
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
                                      CustomAutoSizeTextMontserrat(
                                        text:
                                            courseSearchModel.conditionalOffer,
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
                                    text: courseSearchModel.englishProficiency
                                        .toString()
                                        .split("|")[0],
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
                                  CustomAutoSizeTextMontserrat(
                                    text:
                                        courseSearchModel.academicRequire ?? "",
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
                                    CustomAutoSizeTextMontserrat(
                                      text: courseSearchModel.offerTat ?? "",
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

                    if (courseSearchModel.nearByIntake!.isNotEmpty ||
                        courseSearchModel.nearByIntake != "")
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
                                                  .split("-")[1]
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
                                                .split("-")[0]
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
                    if (courseSearchModel.arwuRank != null ||
                        courseSearchModel.timesRank != null ||
                        courseSearchModel.usNewsRank != null ||
                        courseSearchModel.qsWorldRank != null)
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

            // Button List
            Row(
              children: [
                if (widget.previousRoute != ReviewShortList.routeNamed)
                  SpacerFlex(),
                if (widget.iscompare == true) const Spacer(),
                if (widget.iscompare == true) AddedButtonShow(),
                if (widget.iscompare == true) const Spacer(),
                // const Spacer(),
                if (widget.previousRoute != FinalShortList.routeNamed)
                  const Spacer(),
                if (widget.previousRoute != FinalShortList.routeNamed)
                  AddToShortList(),
                if (widget.previousRoute != FinalShortList.routeNamed)
                  const Spacer(),

                if (finalShortList == true &&
                    widget.finalShortListFirst == true)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      onTap: (() {
                        finalShortList = false;
                        widget.callbackFinalShortListButton!(
                            courseSearchModel.id);
                        setState(() {});
                      }),
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: ThemeConstants.TextColor,
                            ),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 3, right: 3),
                          child: Center(
                            child: CustomAutoSizeTextMontserrat(
                              text: "Remove Final ShortList",
                              textColor: ThemeConstants.TextColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                if (finalShortList == true &&
                    widget.finalShortListFirst == true)
                  const Spacer(),
                if (finalShortList == false &&
                    widget.finalShortListFirst == true)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      onTap: (() {
                        finalShortList = true;
                        widget.callbackFinalShortListButton!(
                            courseSearchModel.id);
                        setState(() {});
                      }),
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: ThemeConstants.TextColor,
                            ),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3, right: 3),
                            child: CustomAutoSizeTextMontserrat(
                              text: "Add to Final ShortList",
                              textColor: ThemeConstants.TextColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                const Spacer(),
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
                      height: 35,
                      decoration: BoxDecoration(
                          color: ThemeConstants.lightblueColor,
                          // border: Border.all(
                          //   color: ThemeConstants.bluecolor,
                          // ),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_downward,
                                size: 15,
                                color: ThemeConstants.bluecolor,
                              ),
                              CustomAutoSizeTextMontserrat(
                                text: "Course Details",
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
                const Spacer(),
              ],
            ),

            // if (widget.iscompare == true) AddedButtonShow(),
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
      if (courseSearchModelCompare1Id == courseSearchModel.id ||
          courseSearchModelCompare2Id == courseSearchModel.id) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SizedBox(
            width: 90,
            height: 35,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ThemeConstants.bluecolor, // background
                  onPrimary: ThemeConstants.bluecolor, // foreground
                ),
                onPressed: () {
                  addCompare = false;

                  // Remove Course Search model
                  if (courseSearchModelCompare1Id == courseSearchModel.id) {
                    widget.callbackForModelCompare!("Model1");
                  } else {
                    widget.callbackForModelCompare!("Model2");
                  }

                  setState(() {});
                },
                child: CustomAutoSizeTextMontserrat(
                  text: "Added",
                  fontSize: 12,
                  textColor: ThemeConstants.whitecolor,
                )),
          ),
        );
      } else if (courseSearchModelCompare1Id != courseSearchModel.id &&
          courseSearchModelCompare2Id != courseSearchModel.id) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SizedBox(
              width: 90,
              height: 35,
              child: InkWell(
                onTap: () {
                  if (courseSearchModelCompare1Id != null &&
                      courseSearchModelCompare2Id != null) {
                    showDialog(
                        context: context,
                        builder: (_) => const AlertDialog(
                              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              content: BottomSheetRemoveCourse(),
                              insetPadding: EdgeInsets.only(left: 5, right: 5),
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
                      borderRadius: BorderRadius.all(Radius.circular(5))),
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
    }
    if (addCompare == true) {
      //Added Button
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
          width: 90,
          height: 35,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: ThemeConstants.bluecolor, // background
                onPrimary: ThemeConstants.bluecolor, // foreground
              ),
              onPressed: () {
                addCompare = false;
                // widget.callbackCompare(false);

// Remove Course Search model
                if (courseSearchModelCompare1Id == courseSearchModel.id) {
                  widget.callbackForModelCompare!("Model1");
                } else {
                  widget.callbackForModelCompare!("Model2");
                }
                setState(() {});
              },
              child: CustomAutoSizeTextMontserrat(
                text: "Added",
                fontSize: 12,
                textColor: ThemeConstants.whitecolor,
              )),
        ),
      );
    } else if (addCompare == false) {
      // added to compare
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
            width: 90,
            height: 35,
            child: InkWell(
              onTap: () {
                if (courseSearchModelCompare1Id != null &&
                    courseSearchModelCompare2Id != null) {
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
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: ThemeConstants.TextColor),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
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
  }

  AddToShortList() {
    if (widget.iscompare == true) {
      if (widget.previousRoute == ReviewShortList.routeNamed) {
        return Container();
      } else {
        if ((shortlist == true ||
                courseSearchModel.shortList.toString() == "1") &&
            widget.courseShortListFirst == true) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: InkWell(
              onTap: (() {
                shortlist = false;
                widget.callbackShortListButton!(
                    "$index,${courseSearchModel.id!}");
                setState(() {});
              }),
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: ThemeConstants.TextColor,
                    ),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3, right: 3),
                    child: CustomAutoSizeTextMontserrat(
                      text: "Remove ShortList",
                      textColor: ThemeConstants.TextColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 8,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        if ((courseSearchModel.shortList.toString() == "null" ||
                courseSearchModel.shortList.toString() == "0") &&
            widget.courseShortListFirst == true &&
            shortlist == false) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: InkWell(
              onTap: (() {
                shortlist = true;
                widget.callbackShortListButton!(
                    "$index,${courseSearchModel.id!}");
                setState(() {});
              }),
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: ThemeConstants.TextColor,
                    ),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3, right: 3),
                    child: CustomAutoSizeTextMontserrat(
                      text: "Add to ShortList",
                      textColor: ThemeConstants.TextColor,
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
      if ((shortlist == true ||
              courseSearchModel.shortList.toString() == "1") &&
          widget.courseShortListFirst == true) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: InkWell(
            onTap: (() {
              shortlist = false;
              widget
                  .callbackShortListButton!("$index,${courseSearchModel.id!}");
              setState(() {});
            }),
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: ThemeConstants.TextColor,
                  ),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(),
                  child: CustomAutoSizeTextMontserrat(
                    text: "Remove ShortList",
                    textColor: ThemeConstants.TextColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 8,
                  ),
                ),
              ),
            ),
          ),
        );
      }
      if ((courseSearchModel.shortList.toString() == "null" ||
              courseSearchModel.shortList.toString() == "0") &&
          widget.courseShortListFirst == true &&
          shortlist == false) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: InkWell(
            onTap: (() {
              shortlist = true;
              widget
                  .callbackShortListButton!("$index,${courseSearchModel.id!}");
              setState(() {});
            }),
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: ThemeConstants.TextColor,
                  ),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 3, right: 3),
                  child: CustomAutoSizeTextMontserrat(
                    text: "Add to ShortList",
                    textColor: ThemeConstants.TextColor,
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
}
