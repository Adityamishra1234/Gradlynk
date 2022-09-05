import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

enum BestTutorSite { Ascending, Deascending }

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);
  static const routeNamed = '/Test';

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late BestTutorSite _site = BestTutorSite.Ascending;

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
                              height: 200,
                              child: Column(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    height: 40,
                                    child: ListTile(
                                      title: const Text('Ascending'),
                                      leading: Radio<BestTutorSite>(
                                        autofocus: true,
                                        value: BestTutorSite.Ascending,
                                        groupValue: _site,
                                        onChanged: (BestTutorSite? value) {
                                          setState(() {
                                            _site = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    height: 40,
                                    child: ListTile(
                                      title: const Text('Deascending'),
                                      leading: Radio<BestTutorSite>(
                                        value: BestTutorSite.Deascending,
                                        groupValue: _site,
                                        onChanged: (BestTutorSite? value) {
                                          setState(() {
                                            _site = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
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
