import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class ProfilePageCopy extends StatelessWidget {
  const ProfilePageCopy({Key? key}) : super(key: key);
  static const routeNamed = '/ProfilePageCopy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("title"),
      body: Container(
          color: ThemeConstants.whitecolor,
          child: Column(
            children: [
              Card(
                color: ThemeConstants.lightVioletColor,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: new BoxDecoration(
                          color: ThemeConstants.IconColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CustomAutoSizeTextMontserrat(
                              text: "Nishant Bhardwaj",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CustomAutoSizeTextMontserrat(
                              text: "Male",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CustomAutoSizeTextMontserrat(
                              text: "12/02/2001",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    InkWell(
                      highlightColor: ThemeConstants.TextColor,
                      onTap: () {
                        print("click");
                      },
                      child: Container(
                        height: 40,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Personal Information",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
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
                        print("click");
                      },
                      child: Container(
                        height: 40,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Official Information",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
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
                        print("click");
                      },
                      child: Container(
                        height: 40,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Contact Information",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
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
                        print("click");
                      },
                      child: Container(
                        height: 40,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Country and Course Information",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
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
                        print("click");
                      },
                      child: Container(
                        height: 40,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Qualification Details",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
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
                        print("click");
                      },
                      child: Container(
                        height: 40,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Work History",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
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
                        print("click");
                      },
                      child: Container(
                        height: 40,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Applicant English Test Details",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
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
                        print("click");
                      },
                      child: Container(
                        height: 40,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Spouse English test Details",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
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
                        print("click");
                      },
                      child: Container(
                        height: 40,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Applicant other Test Details",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
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
                        print("click");
                      },
                      child: Container(
                        height: 40,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: CustomAutoSizeTextMontserrat(
                                text: "Spouse Other Test Details",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, top: 10),
                              child: SvgPicture.asset(
                                "assets/icons/nextscreen_arrow.svg",
                                height: 20,
                              ),
                            ),
                            Spacer(),
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
