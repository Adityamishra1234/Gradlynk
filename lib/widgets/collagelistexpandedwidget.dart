import 'package:animate_icons/animate_icons.dart';
import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CollagelistExpandedWidget extends StatefulWidget {
  const CollagelistExpandedWidget({Key? key}) : super(key: key);

  @override
  State<CollagelistExpandedWidget> createState() =>
      _CollagelistExpandedWidgetState();
}

class _CollagelistExpandedWidgetState extends State<CollagelistExpandedWidget>
    with TickerProviderStateMixin {
  bool resize = false;
  bool delayresize = false;
  late AnimationController controller;
  AnimateIconController c1 = AnimateIconController();

  @override
  void initState() {
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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: resize ? 415 : 160,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Column(
          children: [
            SizedBox(
              height: 140,
              child: Stack(
                children: [
                  Positioned(
                      top: 2,
                      right: 10,
                      child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              color: Color(0xFFECF0FB), shape: BoxShape.circle),
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
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset("assets/icons/arrow.svg"),
                            ),
                          )))),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 50, left: 10),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Bachelor of Business-Economics and Finance",
                          maxLines: 5,
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
                                "Australia,Victor,Melbourne | RMIT University",
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
                            text: "Melbourne City Campus",
                            maxLines: 3,
                            textColor: ThemeConstants.bluegreycolor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/clock.svg",
                              height: 20,
                              color: ThemeConstants.bluelightgreycolor,
                            ),
                            CustomAutoSizeTextMontserrat(
                              text: "3 Year",
                              maxLines: 1,
                              textColor: ThemeConstants.bluelightgreycolor,
                            ),
                            SvgPicture.asset(
                              "assets/icons/price.svg",
                              color: ThemeConstants.bluelightgreycolor,
                              height: 20,
                            ),
                            CustomAutoSizeTextMontserrat(
                              text: "14500 AUD",
                              maxLines: 1,
                              textColor: ThemeConstants.bluelightgreycolor,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  "assets/icons/i.svg",
                                  height: 20,
                                  color: ThemeConstants.bluecolor,
                                )),
                            const Spacer(flex: 1),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: ThemeConstants.bluecolor,
                                  border: Border.all(),
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
                      // if (resize == true)
                      //   Padding(
                      //     padding: const EdgeInsets.only(left: 10, right: 10),
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
                                child: CustomAutoSizeTextMontserrat(
                                  text: "14500 AUD (INR)",
                                  maxLines: 1,
                                  textColor: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              TableCell(
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Yes",
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
                                  text: "IELTS-6.0",
                                  maxLines: 1,
                                  textColor: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              TableCell(
                                child: CustomAutoSizeTextMontserrat(
                                  text: "No",
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
                                  text: "India-Class 12-65.00-0",
                                  maxLines: 1,
                                  textColor: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              TableCell(
                                child: CustomAutoSizeTextMontserrat(
                                  text: "7 Days:",
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
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
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
                                      text: "jul",
                                      textColor: Colors.grey,
                                    ),
                                  )),
                                  TableCell(
                                    child: Center(
                                      child: CustomAutoSizeTextMontserrat(
                                        maxLines: 1,
                                        text: "2022",
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
                        padding:
                            const EdgeInsets.only(left: 20, right: 10, top: 10),
                        child: Row(
                          children: [
                            CustomAutoSizeTextMontserrat(
                              text: "ARWU:301",
                              maxLines: 1,
                              textColor: Colors.grey,
                              fontSize: 14,
                            ),
                            Spacer(),
                            CustomAutoSizeTextMontserrat(
                              text: "Times:301",
                              maxLines: 1,
                              textColor: Colors.grey,
                              fontSize: 14,
                            ),
                            Spacer(),
                            CustomAutoSizeTextMontserrat(
                              text: "US News:301",
                              maxLines: 1,
                              textColor: Colors.grey,
                              fontSize: 14,
                            ),
                            Spacer(),
                            CustomAutoSizeTextMontserrat(
                              text: "QS World:301",
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
