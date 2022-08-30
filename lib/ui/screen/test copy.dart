import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

enum BestTutorSite { Ascending, Deascending }

class Test1 extends StatefulWidget {
  const Test1({Key? key}) : super(key: key);
  static const routeNamed = '/Test1';

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: TextButton(
              onPressed: () {
                Get.bottomSheet(Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  color: ThemeConstants.whitecolor,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 5, left: 5),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: ThemeConstants.lightblueColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          height: 40,
                          child: Row(
                            children: [
                              Spacer(),
                              CustomAutoSizeTextMontserrat(
                                text: "Sort By",
                                textColor: ThemeConstants.bluecolor,
                                fontSize: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              SvgPicture.asset(
                                "assets/icons/sort.svg",
                                height: 20,
                                color: ThemeConstants.bluecolor,
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: TextButton(
                                        onPressed: () {},
                                        child: CustomAutoSizeTextMontserrat(
                                          text: "Budget",
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: TextButton(
                                        onPressed: () {},
                                        child: CustomAutoSizeTextMontserrat(
                                          text: "%Range",
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: TextButton(
                                        onPressed: () {},
                                        child: CustomAutoSizeTextMontserrat(
                                          text: "Times Ranking",
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: TextButton(
                                        onPressed: () {},
                                        child: CustomAutoSizeTextMontserrat(
                                          text: "QR World Ranking",
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              height: 200,
                              child: Align(
                                alignment: AlignmentDirectional.topStart,
                                child: Row(
                                  children: [
                                    Spacer(),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: ThemeConstants
                                              .bluecolor, // background
                                          onPrimary: ThemeConstants
                                              .bluecolor, // foreground
                                        ),
                                        onPressed: () {
                                          // Api call
                                        },
                                        child: Text(
                                          "Asc.",
                                          style: TextStyle(
                                              color: ThemeConstants.whitecolor),
                                        )),
                                    Spacer(),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: ThemeConstants
                                              .bluecolor, // background
                                          onPrimary: ThemeConstants
                                              .bluecolor, // foreground
                                        ),
                                        onPressed: () {
                                          // Api call
                                          // controller1.courseSearch(
                                          //     controller.selectCountryCode
                                          //         .toString(),
                                          //     controller.selectCourseCode
                                          //         .toString());
                                        },
                                        child: Text(
                                          "Deas.",
                                          style: TextStyle(
                                              color: ThemeConstants.whitecolor),
                                        )),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
              },
              child: Text("Click")),
        ),
      ),
    );
  }
}
