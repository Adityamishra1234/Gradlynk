import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/coursesearchcontroller.dart';
import 'package:studentpanel/ui/screen/personalinformation%20copy.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/collagelistexpandedwidget.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdropdownbutton.dart';

class CourseSearch extends StatefulWidget {
  CourseSearch({Key? key}) : super(key: key);
  static const routeNamed = '/CourseSearch';

  @override
  State<CourseSearch> createState() => _CourseSearchState();
}

class _CourseSearchState extends State<CourseSearch> {
  var controller = Get.put(CourseSearchController());

  callback(varTopic) {
    print("mandatory" + varTopic);

    // controller.setdropdown1(varTopic);
  }

  bool size = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("title"),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: 40,
                child: Row(
                  children: [
                    const Spacer(),
                    CustomAutoSizeTextMontserrat(
                      text: "Course Search",
                      maxLines: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    Spacer()
                  ],
                ),
              ),
              if (false)
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Divider(
                    height: 5,
                    thickness: 1,
                  ),
                ),
              if (false)
                SizedBox(
                    height: MediaQuery.of(context).size.height - 200,
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return CollagelistExpandedWidget();
                        })),
              if (true)
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 10, top: 0),
                      child: SizedBox(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Select Country",
                                maxLines: 1,
                                textColor: Colors.grey,
                                mandatory: true,
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 200,
                              // custom Text field
                              child: Padding(
                                  padding: const EdgeInsets.only(),
                                  child: CustomDropDown(
                                    hint: "Select Country *",
                                    model: const ["1", "2", "3"],
                                    callbackFunction: callback,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                        height: 5,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 10,
                      ),
                      child: SizedBox(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Select State",
                                maxLines: 1,
                                textColor: Colors.grey,
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 200,
                              // custom Text field
                              child: Padding(
                                  padding: const EdgeInsets.only(),
                                  child: CustomDropDown(
                                    hint: "Select State *",
                                    model: const ["1", "2", "3"],
                                    callbackFunction: callback,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                        height: 5,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 10,
                      ),
                      child: SizedBox(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Select Cities",
                                maxLines: 1,
                                textColor: Colors.grey,
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 200,
                              // custom Text field
                              child: Padding(
                                  padding: const EdgeInsets.only(),
                                  child: CustomDropDown(
                                    hint: "Select Cities *",
                                    model: const ["1", "2", "3"],
                                    callbackFunction: callback,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                        height: 5,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 10,
                      ),
                      child: SizedBox(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Course Level",
                                maxLines: 1,
                                textColor: Colors.grey,
                                mandatory: true,
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 200,
                              // custom Text field
                              child: Padding(
                                  padding: const EdgeInsets.only(),
                                  child: CustomDropDown(
                                    hint: "Course Level *",
                                    model: const ["1", "2", "3"],
                                    callbackFunction: callback,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                        height: 5,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 10,
                      ),
                      child: SizedBox(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Course Board Field",
                                maxLines: 1,
                                textColor: Colors.grey,
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 200,
                              // custom Text field
                              child: Padding(
                                  padding: const EdgeInsets.only(),
                                  child: CustomDropDown(
                                    hint: "Course Board Field",
                                    model: const ["1", "2", "3"],
                                    callbackFunction: callback,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                        height: 5,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 10,
                      ),
                      child: SizedBox(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Course Narrow Field",
                                maxLines: 1,
                                textColor: Colors.grey,
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 180,
                              // custom Text field
                              child: Padding(
                                  padding: const EdgeInsets.only(),
                                  child: CustomDropDown(
                                    hint: "Course Narrow Field",
                                    model: const ["1", "2", "3"],
                                    callbackFunction: callback,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                        height: 5,
                        thickness: 1,
                      ),
                    ),
                    //Specialization

                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //     left: 20,
                    //     right: 10,
                    //   ),
                    //   child: SizedBox(
                    //     child: Row(
                    //       children: [
                    //         Padding(
                    //           padding: const EdgeInsets.only(top: 10),
                    //           child: CustomAutoSizeTextMontserrat(
                    //             text: "Specialization",
                    //             maxLines: 1,
                    //             textColor: Colors.grey,
                    //           ),
                    //         ),
                    //         const Spacer(),
                    //         SizedBox(
                    //           width: 200,
                    //           // custom Text field
                    //           child: Padding(
                    //               padding: const EdgeInsets.only(),
                    //               child: CustomDropDown(
                    //                 hint: "Specialization",
                    //                 model: const ["1", "2", "3"],
                    //                 callbackFunction: callback,
                    //               )),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // const Padding(
                    //   padding: EdgeInsets.only(left: 20, right: 20),
                    //   child: Divider(
                    //     height: 5,
                    //     thickness: 1,
                    //   ),
                    // ),

                    // BY Course Name Only

                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //     left: 20,
                    //     right: 10,
                    //   ),
                    //   child: SizedBox(
                    //     child: Row(
                    //       children: [
                    //         Padding(
                    //           padding: const EdgeInsets.only(top: 10),
                    //           child: CustomAutoSizeTextMontserrat(
                    //             text: "By Course Name Only",
                    //             maxLines: 1,
                    //             textColor: Colors.grey,
                    //           ),
                    //         ),
                    //         const Spacer(),
                    //         SizedBox(
                    //           width: 180,
                    //           // custom Text field
                    //           child: Padding(
                    //               padding: const EdgeInsets.only(),
                    //               child: CustomDropDown(
                    //                 hint: "By Course Name Only",
                    //                 model: const ["1", "2", "3"],
                    //                 callbackFunction: callback,
                    //               )),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // const Padding(
                    //   padding: EdgeInsets.only(left: 20, right: 20),
                    //   child: Divider(
                    //     height: 5,
                    //     thickness: 1,
                    //   ),
                    // ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        ThemeConstants.whitecolor, // background
                                    onPrimary:
                                        ThemeConstants.whitecolor, // foreground
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Clean",
                                    style: TextStyle(
                                        color: ThemeConstants.blackcolor),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        ThemeConstants.bluecolor, // background
                                    onPrimary:
                                        ThemeConstants.bluecolor, // foreground
                                  ),
                                  onPressed: () {
                                    // Api call
                                  },
                                  child: Text(
                                    "Search",
                                    style: TextStyle(
                                        color: ThemeConstants.whitecolor),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          )),
    );
  }
}
