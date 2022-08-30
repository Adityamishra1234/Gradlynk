import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:studentpanel/ui/screen/applicantdetail.dart';
import 'package:studentpanel/ui/screen/applicationdetail.dart';
import 'package:studentpanel/ui/screen/coursedetail.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class TrackApplication extends StatefulWidget {
  const TrackApplication({Key? key}) : super(key: key);
  static const routeNamed = '/TrackApplication';

  @override
  State<TrackApplication> createState() => _TrackApplicationState();
}

class _TrackApplicationState extends State<TrackApplication> {
  final scrollDirection = Axis.horizontal;

  AutoScrollController controller = AutoScrollController();
  List<List<int>>? randomList;

  List<String>? listProgressName = [
    "Application Documnentation (Preparation)",
    "Applicationa Validation By Branch Team",
    "Applicationa Validation By Central Team",
    "Submit to university"
  ];

  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);
    _scrollToIndex();
  }

  Future _scrollToIndex() async {
    await controller.scrollToIndex(2, preferPosition: AutoScrollPosition.begin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("title"),
      body: Container(
        child: Column(
          children: [
            CustomAutoSizeTextMontserrat(
              text: "Track Apllication",
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Divider(
                height: 5,
                thickness: 1,
              ),
            ),
            SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: scrollDirection,
                controller: controller,
                children: <Widget>[
                  ...List.generate(4, (index) {
                    return AutoScrollTag(
                        key: ValueKey(index),
                        controller: controller,
                        index: index,
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ThemeConstants.GreenColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: SvgPicture.asset(
                                  "assets/icons/submit.svg",
                                  color: ThemeConstants.whitecolor,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 190,
                              child: CustomAutoSizeTextMontserrat(
                                  textColor: ThemeConstants.GreenColor,
                                  fontWeight: FontWeight.bold,
                                  text: listProgressName![index]),
                            ),
                            CustomAutoSizeTextMontserrat(
                              text: "___     ",
                              textColor: ThemeConstants.lightgreycolor,
                            ),
                          ],
                        ));
                  }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomAutoSizeTextMontserrat(
                text: "General Apllication",
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Divider(
                height: 5,
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                height: 40,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      height: 40,
                      width: 170,
                      decoration: BoxDecoration(
                        color: true
                            ? ThemeConstants.bluecolor
                            : ThemeConstants.whitecolor,
                        border: Border.all(
                            color: true
                                ? ThemeConstants.bluecolor
                                : ThemeConstants.TextColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // controller.setIndex(0);
                        },
                        child: CustomAutoSizeTextMontserrat(
                          text: "Applicant Detail",
                          maxLines: 1,
                          textColor: true
                              ? ThemeConstants.whitecolor
                              : ThemeConstants.TextColor,
                        ),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      height: 40,
                      width: 170,
                      decoration: BoxDecoration(
                        color: true
                            ? ThemeConstants.bluecolor
                            : ThemeConstants.whitecolor,
                        border: Border.all(
                            color: true
                                ? ThemeConstants.bluecolor
                                : ThemeConstants.TextColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // controller.setIndex(1);
                        },
                        child: CustomAutoSizeTextMontserrat(
                          text: "Course Detail",
                          maxLines: 1,
                          textColor: true
                              ? ThemeConstants.whitecolor
                              : ThemeConstants.TextColor,
                        ),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      height: 40,
                      width: 170,
                      decoration: BoxDecoration(
                        color: true
                            ? ThemeConstants.bluecolor
                            : ThemeConstants.whitecolor,
                        border: Border.all(
                            color: true
                                ? ThemeConstants.bluecolor
                                : ThemeConstants.TextColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // controller.setIndex(2);
                        },
                        child: CustomAutoSizeTextMontserrat(
                          text: "Application Detail",
                          maxLines: 1,
                          textColor: true
                              ? ThemeConstants.whitecolor
                              : ThemeConstants.TextColor,
                        ),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                        color: true
                            ? ThemeConstants.bluecolor
                            : ThemeConstants.whitecolor,
                        border: Border.all(
                            color: true
                                ? ThemeConstants.bluecolor
                                : ThemeConstants.TextColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // controller.setIndex(3);
                        },
                        child: CustomAutoSizeTextMontserrat(
                          text: "Document checkList",
                          maxLines: 1,
                          textColor: true
                              ? ThemeConstants.whitecolor
                              : ThemeConstants.TextColor,
                        ),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                ]),
              ),
            ),
            Expanded(child: const ApplicationDetail()),
          ],
        ),
      ),
    );
  }
}
