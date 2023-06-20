import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:studentpanel/ui/controllers/trackapplicationcontroller.dart';
import 'package:studentpanel/ui/screen/track_application/applicantdetail.dart';
import 'package:studentpanel/ui/screen/track_application/applicationdetail.dart';
import 'package:studentpanel/ui/screen/track_application/coursedetail.dart';
import 'package:studentpanel/ui/screen/track_application/documentchecklist.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class TrackApplicationCopy extends StatefulWidget {
  const TrackApplicationCopy({Key? key}) : super(key: key);
  static const routeNamed = '/TrackApplicationCopy';

  @override
  State<TrackApplicationCopy> createState() => _TrackApplicationCopyState();
}

class _TrackApplicationCopyState extends State<TrackApplicationCopy> {
  var controller = Get.put(TrackApplicationController());
  final scrollDirection = Axis.horizontal;

  AutoScrollController scrollcontroller = AutoScrollController();
  List<List<int>>? randomList;

  List<String>? listProgressName = [
    "Application Documnentation \n(Preparation)",
    "Applicationa Validation \nBy Branch Team",
    "Applicationa Validation\nBy Central Team",
    "Submit to university"
  ];

  @override
  void initState() {
    super.initState();
    scrollcontroller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);
    _scrollToIndex();
  }

  Future _scrollToIndex() async {
    await scrollcontroller.scrollToIndex(2,
        preferPosition: AutoScrollPosition.begin);
  }

  chooseIndex(int chooseIndex) {
    switch (chooseIndex) {
      case 0:
        return const ApplicantDetail();
      case 1:
        return const CourseDetail();
      case 2:
        return const ApplicationDetail();
      case 3:
        return const DocumentCheckList();

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar("title"),
      body: ListView(
        controller: ScrollController(),
        children: [
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: scrollDirection,
              controller: scrollcontroller,
              children: <Widget>[
                ...List.generate(4, (index) {
                  return AutoScrollTag(
                      key: ValueKey(index),
                      controller: scrollcontroller,
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
                              child: svgImage(
                                  "add", ThemeConstants.whitecolor, 25, 25),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: SizedBox(
                              width: 190,
                              child: CustomAutoSizeTextMontserrat(
                                  textColor: ThemeConstants.GreenColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  text: listProgressName![index]),
                            ),
                          ),
                          if (index != 3)
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
            child: Center(
              child: CustomAutoSizeTextMontserrat(
                text: "General Apllication",
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Divider(
              height: 5,
              thickness: 1,
            ),
          ),
          InkWell(
            highlightColor: ThemeConstants.whitecolor,
            onTap: () {
              debugPrint("click");
            },
            child: SizedBox(
              height: 40,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 0),
                    child: CustomAutoSizeTextMontserrat(
                      text: "Application Detail",
                      fontWeight: FontWeight.bold,
                      textColor: ThemeConstants.bluecolor,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, top: 10),
                    child: svgImage(
                        "nextscreen_arrow", ThemeConstants.bluecolor, 25, 25),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Divider(
              height: 5,
              thickness: 1,
            ),
          ),
          InkWell(
            highlightColor: ThemeConstants.whitecolor,
            onTap: () {
              debugPrint("click");
            },
            child: SizedBox(
              height: 40,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: CustomAutoSizeTextMontserrat(
                      text: "Course Detail",
                      textColor: ThemeConstants.bluecolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, top: 10),
                    child: svgImage(
                        "nextscreen_arrow", ThemeConstants.bluecolor, 25, 25),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Divider(
              height: 5,
              thickness: 1,
            ),
          ),
          InkWell(
            highlightColor: ThemeConstants.whitecolor,
            onTap: () {
              debugPrint("click");
            },
            child: SizedBox(
              height: 40,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: CustomAutoSizeTextMontserrat(
                      text: "Application Detail",
                      textColor: ThemeConstants.bluecolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, top: 10),
                    child: svgImage(
                        "nextscreen_arrow", ThemeConstants.bluecolor, 25, 25),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Divider(
              height: 5,
              thickness: 1,
            ),
          ),
          InkWell(
            highlightColor: ThemeConstants.whitecolor,
            onTap: () {
              debugPrint("click");
            },
            child: SizedBox(
              height: 40,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: CustomAutoSizeTextMontserrat(
                      text: "Document checklist",
                      textColor: ThemeConstants.bluecolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, top: 10),
                    child: svgImage(
                        "nextscreen_arrow", ThemeConstants.bluecolor, 25, 25),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
