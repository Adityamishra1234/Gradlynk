import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/models/viewcourseinformation.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CourseInformationView extends StatelessWidget {
  List<ViewCourseInformation> model;
  Function callbackFunction;
  CourseInformationView(
      {Key? key, required this.model, required this.callbackFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: SizedBox(
            height: 20,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: TextButton(
                  onPressed: () {
                    callbackFunction(true);
                  },
                  child: CustomAutoSizeTextMontserrat(
                    text: "Course Added",
                    textColor: ThemeConstants.orangeColor,
                  )),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 195,
          child: ListView.builder(
              controller: ScrollController(),
              itemCount: model.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: ThemeConstants.whitecolor,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: CustomAutoSizeTextMontserrat(
                              text: "Course Broad Field",
                              textColor: ThemeConstants.blackcolor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: CustomAutoSizeTextMontserrat(
                              text: model[index].broadFieldName,
                              textColor: ThemeConstants.TextColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: CustomAutoSizeTextMontserrat(
                              text: "Course Narrow Field",
                              textColor: ThemeConstants.blackcolor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: CustomAutoSizeTextMontserrat(
                              text: model[index].narrowFieldName,
                              textColor: ThemeConstants.TextColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              const Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, right: 20),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0.0,
                                      side: BorderSide(
                                          color: ThemeConstants.TextColor),
                                      primary: ThemeConstants
                                          .whitecolor, // background
                                      onPrimary: ThemeConstants.whitecolor,
                                      // foreground
                                    ),
                                    onPressed: () async {
                                      // Api call
                                    },
                                    child: CustomAutoSizeTextMontserrat(
                                      text: "Delete",
                                      textColor: ThemeConstants.TextColor,
                                    )),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, right: 20),
                                child: SizedBox(
                                  width: 90,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0.0,
                                        primary: ThemeConstants
                                            .bluecolor, // background
                                        onPrimary: ThemeConstants
                                            .bluecolor, // foreground
                                      ),
                                      onPressed: () async {
                                        // Api call
                                        Get.bottomSheet(Container());
                                      },
                                      child: CustomAutoSizeTextMontserrat(
                                        text: "Edit",
                                        textColor: ThemeConstants.whitecolor,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
