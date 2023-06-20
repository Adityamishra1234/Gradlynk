import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/Profile_Module/profilepage.dart';

import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class BottomNavigation extends StatelessWidget {
  int? index;
  BottomNavigation({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 50,
              width: 60,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: SizedBox(
                      height: 50,
                      width: 60,
                      child: InkWell(
                        splashColor: ThemeConstants.bluecolor,
                        onTap: () {
                          Get.toNamed(DashBoard.routeNamed);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            svgImage(
                                "home",
                                index == 0
                                    ? ThemeConstants.bluecolor
                                    : ThemeConstants.IconColor,
                                30,
                                30),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              width: 60,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 46,
                      width: 60,
                      child: InkWell(
                        splashColor: ThemeConstants.bluecolor,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            svgImage(
                                "messanger",
                                index == 1
                                    ? ThemeConstants.bluecolor
                                    : ThemeConstants.IconColor,
                                30,
                                30),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 5),
              child: CustomAutoSizeTextMontserrat(
                text: "Join SVO link",
                textColor: ThemeConstants.bluecolor,
                fontSize: 13,
              ),
            )),
            SizedBox(
              height: 50,
              width: 60,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 46,
                      width: 60,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            svgImage(
                                "enqiry",
                                index == 2
                                    ? ThemeConstants.bluecolor
                                    : ThemeConstants.IconColor,
                                30,
                                30),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              width: 60,
              child: Column(
                children: [
                  SizedBox(
                    height: 46,
                    width: 50,
                    child: InkWell(
                      splashColor: ThemeConstants.bluecolor,
                      onTap: () {
                        Get.toNamed(ProfilePageCopy.routeNamed);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          svgImage(
                              "profile-bottom",
                              index == 3
                                  ? ThemeConstants.bluecolor
                                  : ThemeConstants.IconColor,
                              30,
                              30),
                        ],
                      ),
                    ),
                  ),
                  const Spacer()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
