import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class MyDocument extends StatelessWidget {
  const MyDocument({Key? key}) : super(key: key);
  static const routeNamed = '/MyDocument';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("title"),
      body: Container(
          color: ThemeConstants.whitecolor,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: CustomAutoSizeTextMontserrat(
                      text: "My Document Search",
                      textColor: ThemeConstants.bluecolor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  controller: ScrollController(),
                  children: [
                    InkWell(
                      highlightColor: ThemeConstants.TextColor,
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
                                text: "Sponsor Documents",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 30, top: 10),
                              child: SvgPicture.asset(
                                "assets/icons/nextscreen_arrow.svg",
                                height: 20,
                              ),
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
                      highlightColor: ThemeConstants.TextColor,
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
                                text: "Work Experience Document",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 30, top: 10),
                              child: SvgPicture.asset(
                                "assets/icons/nextscreen_arrow.svg",
                                height: 20,
                              ),
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
                      highlightColor: ThemeConstants.TextColor,
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
                                text: "Academic Document",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 30, top: 10),
                              child: SvgPicture.asset(
                                "assets/icons/nextscreen_arrow.svg",
                                height: 20,
                              ),
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
                      highlightColor: ThemeConstants.TextColor,
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
                                text: "Identity Proof",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 30, top: 10),
                              child: SvgPicture.asset(
                                "assets/icons/nextscreen_arrow.svg",
                                height: 20,
                              ),
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
                      highlightColor: ThemeConstants.TextColor,
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
                                text: "Application Documents",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 30, top: 10),
                              child: SvgPicture.asset(
                                "assets/icons/nextscreen_arrow.svg",
                                height: 20,
                              ),
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
                      highlightColor: ThemeConstants.TextColor,
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
                                text: "Visa Forms",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 30, top: 10),
                              child: SvgPicture.asset(
                                "assets/icons/nextscreen_arrow.svg",
                                height: 20,
                              ),
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
                      highlightColor: ThemeConstants.TextColor,
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
                                text: "Funds Planner Documents",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 30, top: 10),
                              child: SvgPicture.asset(
                                "assets/icons/nextscreen_arrow.svg",
                                height: 20,
                              ),
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
                      highlightColor: ThemeConstants.TextColor,
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
                                text: "Language Tests",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 30, top: 10),
                              child: SvgPicture.asset(
                                "assets/icons/nextscreen_arrow.svg",
                                height: 20,
                              ),
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
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
