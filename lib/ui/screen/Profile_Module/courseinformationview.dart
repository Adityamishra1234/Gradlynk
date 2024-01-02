import 'package:flutter/material.dart';
import 'package:studentpanel/ui/models/viewcourseinformation.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/empty_widget.dart';

class CourseInformationView extends StatelessWidget {
  List<ViewCourseInformation> model;
  Function callbackFunction;
  Function callbackIndexDelete;
  Function callbackIndexEdit;
  CourseInformationView(
      {Key? key,
      required this.model,
      required this.callbackFunction,
      required this.callbackIndexEdit,
      required this.callbackIndexDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeConstants.whitecolor,
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: SizedBox(
              height: 35,
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
          if (model.length != 0)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  controller: ScrollController(),
                  itemCount: model.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Container(
                        constraints: BoxConstraints(minHeight: 150),
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
                                  // Padding(
                                  //   padding:
                                  //       const EdgeInsets.only(top: 20, right: 20),
                                  //   child: ElevatedButton(
                                  //       style: ElevatedButton.styleFrom(
                                  //         foregroundColor:
                                  //             ThemeConstants.whitecolor,
                                  //         elevation: 0.0,
                                  //         backgroundColor:
                                  //             ThemeConstants.whitecolor,
                                  //         side: BorderSide(
                                  //             color: ThemeConstants.TextColor),
                                  //         // foreground
                                  //       ),
                                  //       onPressed: () async {
                                  //         callbackIndexDelete(index);
                                  //       },
                                  //       child: CustomAutoSizeTextMontserrat(
                                  //         text: "Delete",
                                  //         textColor: ThemeConstants.TextColor,
                                  //       )),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, right: 20),
                                    child: SizedBox(
                                      width: 90,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor:
                                                ThemeConstants.bluecolor,
                                            elevation: 0.0,
                                            backgroundColor: ThemeConstants
                                                .bluecolor, // foreground
                                          ),
                                          onPressed: () async {
                                            // Api call
                                            callbackIndexEdit(index);
                                          },
                                          child: CustomAutoSizeTextMontserrat(
                                            text: "Edit",
                                            textColor:
                                                ThemeConstants.whitecolor,
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
          if (model.length == 0) Empty_details()
        ],
      ),
    );
  }
}
