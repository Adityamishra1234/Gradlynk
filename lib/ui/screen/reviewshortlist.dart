import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/reviewshortlistcontroller.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/ui/models/filterModel.dart';
import 'package:studentpanel/ui/screen/compare.dart';
import 'package:studentpanel/ui/screen/coursesearchfulldetail.dart';
import 'package:studentpanel/ui/screen/finalshortlist.dart';
import 'package:studentpanel/ui/screen/fliter.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/collagelistexpandedwidget.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class ReviewShortList extends StatefulWidget {
  CourseModelFilter? courseModelFilter = CourseModelFilter();
  ReviewShortList({Key? key, this.courseModelFilter}) : super(key: key);
  static const routeNamed = '/CourseShortList';

  @override
  State<ReviewShortList> createState() => _ReviewShortListState();
}

class _ReviewShortListState extends State<ReviewShortList> {
  var controller1 = Get.put(ReviewShortListController());

  @override
  void initState() {
    if (widget.courseModelFilter == null) {
      controller1.GetCourseShortList("78623");
    } else {
      controller1.courseModelFilter = widget.courseModelFilter!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("title"),
        body: GetBuilder<ReviewShortListController>(
          builder: (_) => Column(
            children: [
              if (_.loadingCourseShortList.value == true)
                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        // Get.toNamed(ReviewShortList.routeNamed);
                      },
                      child: Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                            color: ThemeConstants.whitecolor,
                            border: Border.all(
                                color: ThemeConstants.bluelightgreycolor),
                            borderRadius:
                                BorderRadiusDirectional.circular(5.0)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: CustomAutoSizeTextMontserrat(
                                text: "Sort",
                                fontSize: 12,
                                textColor: ThemeConstants.bluelightgreycolor),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(Filter(
                            courseModelFilter: controller1.courseModelFilter));
                      },
                      child: Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                            color: ThemeConstants.whitecolor,
                            border: Border.all(
                                color: ThemeConstants.bluelightgreycolor),
                            borderRadius:
                                BorderRadiusDirectional.circular(5.0)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: CustomAutoSizeTextMontserrat(
                                text: "Filter",
                                fontSize: 12,
                                textColor: ThemeConstants.bluelightgreycolor),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        if (controller1.compareApply.value == false) {
                          controller1.setCompare(true.obs);
                        } else {
                          controller1.setCompare(false.obs);
                        }
                      },
                      child: Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                            color: ThemeConstants.whitecolor,
                            border: Border.all(
                                color: ThemeConstants.bluelightgreycolor),
                            borderRadius:
                                BorderRadiusDirectional.circular(5.0)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: CustomAutoSizeTextMontserrat(
                                text: "Compare",
                                fontSize: 12,
                                textColor: ThemeConstants.bluelightgreycolor),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.toNamed(FinalShortList.routeNamed);
                        Get.snackbar("Final ShortList", "Test",
                            snackPosition: SnackPosition.BOTTOM);
                      },
                      child: Container(
                        height: 30,
                        width: 120,
                        decoration: BoxDecoration(
                            color: ThemeConstants.whitecolor,
                            border: Border.all(
                                color: ThemeConstants.bluelightgreycolor),
                            borderRadius:
                                BorderRadiusDirectional.circular(5.0)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: CustomAutoSizeTextMontserrat(
                                text: "Final Shortlist",
                                fontSize: 12,
                                textColor: ThemeConstants.bluelightgreycolor),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              if (_.loadingCourseShortList.value == true)
                Expanded(
                  child: ListView.builder(
                      itemCount: widget.courseModelFilter == null
                          ? (controller1.courseSearchModel.length + 1)
                          : widget.courseModelFilter!.courseSearchList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            if (controller1.courseSearchModel.length != index)
                              CollagelistExpandedWidget(
                                index: index,
                                courseSearchModelCompare1Id:
                                    controller1.courseSearchModelCompare1.id,
                                courseSearchModelCompare2Id:
                                    controller1.courseSearchModelCompare2.id,
                                callbackForModelCompare: callbackModelCompare,
                                callbackCompare: callbackCompare,
                                //done
                                iscompare: controller1.compareApply.value,
                                courseSearchModel:
                                    controller1.courseSearchModel[index],
                                callbackFunction: callbackCompleteDetailCourse,
                              ),
                          ],
                        );
                      }),
                ),
              if (controller1.compareApply.value == true)
                InkWell(
                  onTap: () {
                    Get.to(
                      Comparing(
                        courseSearchModel1:
                            Get.find<ReviewShortListController>()
                                .courseSearchModelCompare1,
                        courseSearchModel2:
                            Get.find<ReviewShortListController>()
                                .courseSearchModelCompare2,
                      ),
                    );
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: ThemeConstants.bluecolor,
                        borderRadius: const BorderRadiusDirectional.only(
                          topStart: Radius.circular(20.0),
                          topEnd: Radius.circular(20.0),
                        )),
                    child: Center(
                      child: Row(
                        children: [
                          const Spacer(),
                          SvgPicture.asset(
                            "assets/icons/compare.svg",
                            height: 30,
                            color: ThemeConstants.whitecolor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          CustomAutoSizeTextMontserrat(
                            text: "Compare",
                            fontSize: 20,
                            textColor: ThemeConstants.whitecolor,
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              if (_.loadingCourseShortList.value == false)
                const CircularProgressIndicator()
            ],
          ),
        ));
  }

  // Function
  callbackCompare(varTopic) async {
    // Add To Compare  For Comparing
    if (varTopic.toString().split(",")[0].toString() == true.toString()) {
      if (controller1.courseSearchModelCompare1.id == null) {
        controller1.courseSearchModelCompare1 = controller1
            .courseSearchModel[int.parse(varTopic.toString().split(",")[1])];
        controller1
            .courseSearchModel[int.parse(varTopic.toString().split(",")[1])]
            .isSelected = true;
      } else if (controller1.courseSearchModelCompare2.id == null) {
        controller1.courseSearchModelCompare2 = controller1
            .courseSearchModel[int.parse(varTopic.toString().split(",")[1])];
        controller1
            .courseSearchModel[int.parse(varTopic.toString().split(",")[1])]
            .isSelected = true;
      } else {
        debugPrint(varTopic);
      }
      // Added Button For Comparing
    } else {}
  }

  callbackCompleteDetailCourse(varTopic) async {
    List<String> endpoint = varTopic.toString().split(',');

    var res = await controller1.completeCourseDetailMethod(
        endpoint[0], endpoint[1], endpoint[2]);

    if (res != null) {
      Get.to(CourseSearchFullDetail(
        completeCourseDetail: res,
      ));
    }
  }

  callbackModelCompare(varTopic) {
    debugPrint(varTopic);
    if (varTopic == "Model1") {
      controller1.courseSearchModelCompare1 = CourseSearchModel();
    } else {
      controller1.courseSearchModelCompare2 = CourseSearchModel();
    }
  }
}
