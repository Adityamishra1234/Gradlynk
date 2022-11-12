import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:studentpanel/ui/controllers/trackapplicationcontroller.dart';
import 'package:studentpanel/ui/screen/applicantdetail.dart';
import 'package:studentpanel/ui/screen/applicationdetail.dart';
import 'package:studentpanel/ui/screen/coursedetail.dart';
import 'package:studentpanel/ui/screen/documentchecklist.dart';
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
        return ApplicationDetail();
      case 3:
        return const DocumentCheckList();

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverList(
            delegate: SliverChildListDelegate([
              CustomAppBar("title"),
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
                  // controller: ScrollController(),
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
                                  child: SvgPicture.asset(
                                    "assets/icons/submit.svg",
                                    color: ThemeConstants.whitecolor,
                                  ),
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
            ]),
          ),
        ];
      },
      body: Column(
        children: [
          GetBuilder<TrackApplicationController>(
            builder: (controller1) => SafeArea(
              minimum: const EdgeInsets.only(top: 35),
              child: SizedBox(
                height: 40,
                child: ListView(
                    controller: ScrollController(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                          height: 40,
                          width: 170,
                          decoration: BoxDecoration(
                            color: controller1.chooseIndex.value == 0
                                ? ThemeConstants.bluecolor
                                : ThemeConstants.whitecolor,
                            border: Border.all(
                                color: controller1.chooseIndex.value == 0
                                    ? ThemeConstants.bluecolor
                                    : ThemeConstants.TextColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextButton(
                            onPressed: () {
                              controller.setIndex(0);
                            },
                            child: CustomAutoSizeTextMontserrat(
                              text: "Applicant Detail",
                              maxLines: 1,
                              textColor: controller1.chooseIndex.value == 0
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
                            color: controller1.chooseIndex.value == 1
                                ? ThemeConstants.bluecolor
                                : ThemeConstants.whitecolor,
                            border: Border.all(
                                color: controller1.chooseIndex.value == 1
                                    ? ThemeConstants.bluecolor
                                    : ThemeConstants.TextColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextButton(
                            onPressed: () {
                              controller.setIndex(1);
                            },
                            child: CustomAutoSizeTextMontserrat(
                              text: "Course Detail",
                              maxLines: 1,
                              textColor: controller1.chooseIndex.value == 1
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
                            color: controller1.chooseIndex.value == 2
                                ? ThemeConstants.bluecolor
                                : ThemeConstants.whitecolor,
                            border: Border.all(
                                color: controller1.chooseIndex.value == 2
                                    ? ThemeConstants.bluecolor
                                    : ThemeConstants.TextColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextButton(
                            onPressed: () {
                              controller.setIndex(2);
                            },
                            child: CustomAutoSizeTextMontserrat(
                              text: "Application Detail",
                              maxLines: 1,
                              textColor: controller1.chooseIndex.value == 2
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
                            color: controller1.chooseIndex.value == 3
                                ? ThemeConstants.bluecolor
                                : ThemeConstants.whitecolor,
                            border: Border.all(
                                color: controller1.chooseIndex.value == 3
                                    ? ThemeConstants.bluecolor
                                    : ThemeConstants.TextColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextButton(
                            onPressed: () {
                              controller.setIndex(3);
                            },
                            child: CustomAutoSizeTextMontserrat(
                              text: "Document checkList",
                              maxLines: 1,
                              textColor: controller1.chooseIndex.value == 3
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
          ),
          GetBuilder<TrackApplicationController>(
            builder: (controller1) =>
                chooseIndex(controller1.chooseIndex.value),
          ),
        ],
      ),
    ));
  }
}
