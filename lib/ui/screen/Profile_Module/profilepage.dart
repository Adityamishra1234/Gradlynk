import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/profilepagecontroller.dart';
import 'package:studentpanel/ui/screen/Profile_Module/contactinformation.dart';
import 'package:studentpanel/ui/screen/Profile_Module/courseinformation.dart';
import 'package:studentpanel/ui/screen/Profile_Module/englishtestdetails.dart';
import 'package:studentpanel/ui/screen/Profile_Module/othertestdetails.dart';
import 'package:studentpanel/ui/screen/Profile_Module/passportdetails.dart';
import 'package:studentpanel/ui/screen/Profile_Module/qualificationdetails.dart';
import 'package:studentpanel/ui/screen/Profile_Module/relativeinformation.dart';
import 'package:studentpanel/ui/screen/Profile_Module/travinghistory.dart';
import 'package:studentpanel/ui/screen/Profile_Module/workhistory.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

class ProfilePageCopy extends StatelessWidget {
  ProfilePageCopy({
    Key? key,
  }) : super(key: key);
  static const routeNamed = '/ProfilePageCopy';
  ScrollController controller = ScrollController();
  // ScrollPhysics scrollPhysics = ScrollPhysics();
  var profilePageController = Get.put(ProfilePageController());

  @override
  Widget build(BuildContext conx) {
    final bool displayMobileLayout = MediaQuery.of(conx).size.width > 600;
    final bool displayMobileLayout900 = MediaQuery.of(conx).size.width > 900;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar("title"),
        drawer: displayMobileLayout == false
            ? CustomDrawer(
                index: 1,
              )
            : null,
        body: GetBuilder<ProfilePageController>(
          builder: (_) => LayoutBuilder(
              builder: (BuildContext context, BoxConstraints cons) {
            double constraints = cons.maxWidth;
            if (displayMobileLayout == false) {
              constraints = constraints + 240.00;
            }
            return Row(
              children: [
                if (displayMobileLayout == true)
                  CustomDrawer(
                    index: 1,
                  ),
                Container(
                    width: constraints - 240,
                    color: ThemeConstants.whitecolor,
                    child: Column(
                      children: [
                        SizedBox(
                          width: constraints - 240,
                          height: 85,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: displayMobileLayout900 == true ? 1 : 2,
                              controller: controller,
                              itemBuilder: (BuildContext context, int index) {
                                if (displayMobileLayout900 == true) {
                                  return SizedBox(
                                    width: constraints - 240,
                                    child: Stack(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                              width: constraints - 240,
                                              child: Wrap(
                                                alignment: WrapAlignment.center,
                                                runAlignment:
                                                    WrapAlignment.center,
                                                runSpacing: 10.0,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5, right: 5),
                                                    child: InkWell(
                                                      onTap: () {
                                                        _.getChooseIndex(0.obs);
                                                      },
                                                      child: Container(
                                                        width: 100,
                                                        height: 35,
                                                        decoration: BoxDecoration(
                                                            color: _.chooseIndex!.value ==
                                                                    0
                                                                ? ThemeConstants
                                                                    .bluecolor
                                                                : ThemeConstants
                                                                    .whitecolor,
                                                            border: Border.all(
                                                                color: _.chooseIndex!
                                                                            .value ==
                                                                        0
                                                                    ? ThemeConstants
                                                                        .bluecolor
                                                                    : ThemeConstants
                                                                        .TextColor),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0)),
                                                        child: Row(
                                                          children: [
                                                            const Spacer(),
                                                            CustomAutoSizeTextMontserrat(
                                                              text: "Personal ",
                                                              fontSize: 12,
                                                              textColor: _.chooseIndex!
                                                                          .value ==
                                                                      0
                                                                  ? ThemeConstants
                                                                      .whitecolor
                                                                  : ThemeConstants
                                                                      .TextColor,
                                                            ),
                                                            // const Icon(Icons.abc_outlined),
                                                            const Spacer(),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5, right: 5),
                                                    child: InkWell(
                                                      onTap: () {
                                                        _.getChooseIndex(1.obs);
                                                      },
                                                      child: Container(
                                                        width: 100,
                                                        height: 35,
                                                        decoration: BoxDecoration(
                                                            color: _.chooseIndex!.value ==
                                                                    1
                                                                ? ThemeConstants
                                                                    .bluecolor
                                                                : ThemeConstants
                                                                    .whitecolor,
                                                            border: Border.all(
                                                                color: _.chooseIndex!
                                                                            .value ==
                                                                        1
                                                                    ? ThemeConstants
                                                                        .bluecolor
                                                                    : ThemeConstants
                                                                        .TextColor),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0)),
                                                        child: Row(
                                                          children: [
                                                            const Spacer(),
                                                            CustomAutoSizeTextMontserrat(
                                                              text:
                                                                  "Course Info.",
                                                              fontSize: 12,
                                                              textColor: _.chooseIndex!
                                                                          .value ==
                                                                      1
                                                                  ? ThemeConstants
                                                                      .whitecolor
                                                                  : ThemeConstants
                                                                      .TextColor,
                                                            ),
                                                            // const Icon(
                                                            //     Icons.abc_outlined),
                                                            const Spacer(),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5, right: 5),
                                                    child: InkWell(
                                                      onTap: () {
                                                        _.getChooseIndex(2.obs);
                                                      },
                                                      child: Container(
                                                        width: 110,
                                                        height: 35,
                                                        decoration: BoxDecoration(
                                                            color: _.chooseIndex!.value ==
                                                                    2
                                                                ? ThemeConstants
                                                                    .bluecolor
                                                                : ThemeConstants
                                                                    .whitecolor,
                                                            border: Border.all(
                                                                color: _.chooseIndex!
                                                                            .value ==
                                                                        2
                                                                    ? ThemeConstants
                                                                        .bluecolor
                                                                    : ThemeConstants
                                                                        .TextColor),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0)),
                                                        child: Row(
                                                          children: [
                                                            const Spacer(),
                                                            CustomAutoSizeTextMontserrat(
                                                              text:
                                                                  "Qualification",
                                                              fontSize: 12,
                                                              textColor: _.chooseIndex!
                                                                          .value ==
                                                                      2
                                                                  ? ThemeConstants
                                                                      .whitecolor
                                                                  : ThemeConstants
                                                                      .TextColor,
                                                            ),
                                                            // const Icon(
                                                            //     Icons.abc_outlined),
                                                            const Spacer(),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5, right: 5),
                                                    child: InkWell(
                                                      onTap: () {
                                                        _.getChooseIndex(3.obs);
                                                      },
                                                      child: Container(
                                                        width: 110,
                                                        height: 35,
                                                        decoration: BoxDecoration(
                                                            color: _.chooseIndex!.value ==
                                                                    3
                                                                ? ThemeConstants
                                                                    .bluecolor
                                                                : ThemeConstants
                                                                    .whitecolor,
                                                            border: Border.all(
                                                                color: _.chooseIndex!
                                                                            .value ==
                                                                        3
                                                                    ? ThemeConstants
                                                                        .bluecolor
                                                                    : ThemeConstants
                                                                        .TextColor),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0)),
                                                        child: Row(
                                                          children: [
                                                            const Spacer(),
                                                            CustomAutoSizeTextMontserrat(
                                                              text:
                                                                  "Work History",
                                                              fontSize: 12,
                                                              textColor: _.chooseIndex!
                                                                          .value ==
                                                                      3
                                                                  ? ThemeConstants
                                                                      .whitecolor
                                                                  : ThemeConstants
                                                                      .TextColor,
                                                            ),
                                                            // const Icon(
                                                            //     Icons.abc_outlined),
                                                            const Spacer(),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5, right: 5),
                                                    child: InkWell(
                                                      onTap: () {
                                                        _.getChooseIndex(4.obs);
                                                      },
                                                      child: Container(
                                                        width: 110,
                                                        height: 35,
                                                        decoration: BoxDecoration(
                                                            color: _.chooseIndex!.value ==
                                                                    4
                                                                ? ThemeConstants
                                                                    .bluecolor
                                                                : ThemeConstants
                                                                    .whitecolor,
                                                            border: Border.all(
                                                                color: _.chooseIndex!
                                                                            .value ==
                                                                        4
                                                                    ? ThemeConstants
                                                                        .bluecolor
                                                                    : ThemeConstants
                                                                        .TextColor),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0)),
                                                        child: Row(
                                                          children: [
                                                            const Spacer(),
                                                            CustomAutoSizeTextMontserrat(
                                                              text:
                                                                  "English Test.",
                                                              fontSize: 12,
                                                              textColor: _.chooseIndex!
                                                                          .value ==
                                                                      4
                                                                  ? ThemeConstants
                                                                      .whitecolor
                                                                  : ThemeConstants
                                                                      .TextColor,
                                                            ),
                                                            // const Icon(
                                                            //     Icons.abc_outlined),
                                                            const Spacer(),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5, right: 5),
                                                    child: InkWell(
                                                      onTap: () {
                                                        _.getChooseIndex(5.obs);
                                                      },
                                                      child: Container(
                                                        width: 110,
                                                        height: 35,
                                                        decoration: BoxDecoration(
                                                            color: _.chooseIndex!.value ==
                                                                    5
                                                                ? ThemeConstants
                                                                    .bluecolor
                                                                : ThemeConstants
                                                                    .whitecolor,
                                                            border: Border.all(
                                                                color: _.chooseIndex!
                                                                            .value ==
                                                                        5
                                                                    ? ThemeConstants
                                                                        .bluecolor
                                                                    : ThemeConstants
                                                                        .TextColor),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0)),
                                                        child: Row(
                                                          children: [
                                                            const Spacer(),
                                                            CustomAutoSizeTextMontserrat(
                                                              text:
                                                                  "Other Test",
                                                              fontSize: 12,
                                                              textColor: _.chooseIndex!
                                                                          .value ==
                                                                      5
                                                                  ? ThemeConstants
                                                                      .whitecolor
                                                                  : ThemeConstants
                                                                      .TextColor,
                                                            ),
                                                            // const Icon(
                                                            //     Icons.abc_outlined),
                                                            const Spacer(),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5, right: 5),
                                                    child: InkWell(
                                                      onTap: () {
                                                        _.getChooseIndex(6.obs);
                                                      },
                                                      child: Container(
                                                        width: 100,
                                                        height: 35,
                                                        decoration: BoxDecoration(
                                                            color: _.chooseIndex!.value ==
                                                                    6
                                                                ? ThemeConstants
                                                                    .bluecolor
                                                                : ThemeConstants
                                                                    .whitecolor,
                                                            border: Border.all(
                                                                color: _.chooseIndex!
                                                                            .value ==
                                                                        6
                                                                    ? ThemeConstants
                                                                        .bluecolor
                                                                    : ThemeConstants
                                                                        .TextColor),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0)),
                                                        child: Row(
                                                          children: [
                                                            const Spacer(),
                                                            CustomAutoSizeTextMontserrat(
                                                              text: "Passport",
                                                              fontSize: 12,
                                                              textColor: _.chooseIndex!
                                                                          .value ==
                                                                      6
                                                                  ? ThemeConstants
                                                                      .whitecolor
                                                                  : ThemeConstants
                                                                      .TextColor,
                                                            ),
                                                            // const Icon(
                                                            //     Icons.abc_outlined),
                                                            const Spacer(),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5, right: 5),
                                                    child: InkWell(
                                                      onTap: () {
                                                        _.getChooseIndex(7.obs);
                                                      },
                                                      child: Container(
                                                        width: 120,
                                                        height: 35,
                                                        decoration: BoxDecoration(
                                                            color: _.chooseIndex!.value ==
                                                                    7
                                                                ? ThemeConstants
                                                                    .bluecolor
                                                                : ThemeConstants
                                                                    .whitecolor,
                                                            border: Border.all(
                                                                color: _.chooseIndex!
                                                                            .value ==
                                                                        7
                                                                    ? ThemeConstants
                                                                        .bluecolor
                                                                    : ThemeConstants
                                                                        .TextColor),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0)),
                                                        child: Row(
                                                          children: [
                                                            const Spacer(),
                                                            CustomAutoSizeTextMontserrat(
                                                              text:
                                                                  "Travel History",
                                                              fontSize: 12,
                                                              textColor: _.chooseIndex!
                                                                          .value ==
                                                                      7
                                                                  ? ThemeConstants
                                                                      .whitecolor
                                                                  : ThemeConstants
                                                                      .TextColor,
                                                            ),
                                                            // const Icon(
                                                            //     Icons.abc_outlined),
                                                            const Spacer(),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5, right: 5),
                                                    child: InkWell(
                                                      onTap: () {
                                                        _.getChooseIndex(8.obs);
                                                      },
                                                      child: Container(
                                                        width: 90,
                                                        height: 35,
                                                        decoration: BoxDecoration(
                                                            color: _.chooseIndex!.value ==
                                                                    8
                                                                ? ThemeConstants
                                                                    .bluecolor
                                                                : ThemeConstants
                                                                    .whitecolor,
                                                            border: Border.all(
                                                                color: _.chooseIndex!
                                                                            .value ==
                                                                        8
                                                                    ? ThemeConstants
                                                                        .bluecolor
                                                                    : ThemeConstants
                                                                        .TextColor),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0)),
                                                        child: Row(
                                                          children: [
                                                            const Spacer(),
                                                            CustomAutoSizeTextMontserrat(
                                                              text: "Relative",
                                                              fontSize: 12,
                                                              textColor: _.chooseIndex!
                                                                          .value ==
                                                                      8
                                                                  ? ThemeConstants
                                                                      .whitecolor
                                                                  : ThemeConstants
                                                                      .TextColor,
                                                            ),
                                                            // const Icon(
                                                            //     Icons.abc_outlined),
                                                            const Spacer(),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  if (index == 0) {
                                    return SizedBox(
                                      width: constraints - 240,
                                      child: Stack(
                                        children: [
                                          Column(
                                            children: [
                                              SizedBox(
                                                width: constraints - 240,
                                                child: Wrap(
                                                  alignment:
                                                      WrapAlignment.center,
                                                  runAlignment:
                                                      WrapAlignment.center,
                                                  runSpacing: 10.0,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5,
                                                              right: 5),
                                                      child: InkWell(
                                                        onTap: () {
                                                          _.getChooseIndex(
                                                              0.obs);
                                                        },
                                                        child: Container(
                                                          width: 100,
                                                          height: 35,
                                                          decoration: BoxDecoration(
                                                              color: _.chooseIndex!
                                                                          .value ==
                                                                      0
                                                                  ? ThemeConstants
                                                                      .bluecolor
                                                                  : ThemeConstants
                                                                      .whitecolor,
                                                              border: Border.all(
                                                                  color: _.chooseIndex!
                                                                              .value ==
                                                                          0
                                                                      ? ThemeConstants
                                                                          .bluecolor
                                                                      : ThemeConstants
                                                                          .TextColor),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0)),
                                                          child: Row(
                                                            children: [
                                                              const Spacer(),
                                                              CustomAutoSizeTextMontserrat(
                                                                text:
                                                                    "Personal ",
                                                                fontSize: 12,
                                                                textColor: _.chooseIndex!
                                                                            .value ==
                                                                        0
                                                                    ? ThemeConstants
                                                                        .whitecolor
                                                                    : ThemeConstants
                                                                        .TextColor,
                                                              ),
                                                              // const Icon(Icons.abc_outlined),
                                                              const Spacer(),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5,
                                                              right: 5),
                                                      child: InkWell(
                                                        onTap: () {
                                                          _.getChooseIndex(
                                                              1.obs);
                                                        },
                                                        child: Container(
                                                          width: 100,
                                                          height: 35,
                                                          decoration: BoxDecoration(
                                                              color: _.chooseIndex!
                                                                          .value ==
                                                                      1
                                                                  ? ThemeConstants
                                                                      .bluecolor
                                                                  : ThemeConstants
                                                                      .whitecolor,
                                                              border: Border.all(
                                                                  color: _.chooseIndex!
                                                                              .value ==
                                                                          1
                                                                      ? ThemeConstants
                                                                          .bluecolor
                                                                      : ThemeConstants
                                                                          .TextColor),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0)),
                                                          child: Row(
                                                            children: [
                                                              const Spacer(),
                                                              CustomAutoSizeTextMontserrat(
                                                                text:
                                                                    "Course Info.",
                                                                fontSize: 12,
                                                                textColor: _.chooseIndex!
                                                                            .value ==
                                                                        1
                                                                    ? ThemeConstants
                                                                        .whitecolor
                                                                    : ThemeConstants
                                                                        .TextColor,
                                                              ),
                                                              // const Icon(
                                                              //     Icons.abc_outlined),
                                                              const Spacer(),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5,
                                                              right: 5),
                                                      child: InkWell(
                                                        onTap: () {
                                                          _.getChooseIndex(
                                                              2.obs);
                                                        },
                                                        child: Container(
                                                          width: 110,
                                                          height: 35,
                                                          decoration: BoxDecoration(
                                                              color: _.chooseIndex!
                                                                          .value ==
                                                                      2
                                                                  ? ThemeConstants
                                                                      .bluecolor
                                                                  : ThemeConstants
                                                                      .whitecolor,
                                                              border: Border.all(
                                                                  color: _.chooseIndex!
                                                                              .value ==
                                                                          2
                                                                      ? ThemeConstants
                                                                          .bluecolor
                                                                      : ThemeConstants
                                                                          .TextColor),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0)),
                                                          child: Row(
                                                            children: [
                                                              const Spacer(),
                                                              CustomAutoSizeTextMontserrat(
                                                                text:
                                                                    "Qualification",
                                                                fontSize: 12,
                                                                textColor: _.chooseIndex!
                                                                            .value ==
                                                                        2
                                                                    ? ThemeConstants
                                                                        .whitecolor
                                                                    : ThemeConstants
                                                                        .TextColor,
                                                              ),
                                                              // const Icon(
                                                              //     Icons.abc_outlined),
                                                              const Spacer(),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5,
                                                              right: 5),
                                                      child: InkWell(
                                                        onTap: () {
                                                          _.getChooseIndex(
                                                              3.obs);
                                                        },
                                                        child: Container(
                                                          width: 110,
                                                          height: 35,
                                                          decoration: BoxDecoration(
                                                              color: _.chooseIndex!
                                                                          .value ==
                                                                      3
                                                                  ? ThemeConstants
                                                                      .bluecolor
                                                                  : ThemeConstants
                                                                      .whitecolor,
                                                              border: Border.all(
                                                                  color: _.chooseIndex!
                                                                              .value ==
                                                                          3
                                                                      ? ThemeConstants
                                                                          .bluecolor
                                                                      : ThemeConstants
                                                                          .TextColor),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0)),
                                                          child: Row(
                                                            children: [
                                                              const Spacer(),
                                                              CustomAutoSizeTextMontserrat(
                                                                text:
                                                                    "Work History",
                                                                fontSize: 12,
                                                                textColor: _.chooseIndex!
                                                                            .value ==
                                                                        3
                                                                    ? ThemeConstants
                                                                        .whitecolor
                                                                    : ThemeConstants
                                                                        .TextColor,
                                                              ),
                                                              // const Icon(
                                                              //     Icons.abc_outlined),
                                                              const Spacer(),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5,
                                                              right: 5),
                                                      child: InkWell(
                                                        onTap: () {
                                                          _.getChooseIndex(
                                                              4.obs);
                                                        },
                                                        child: Container(
                                                          width: 110,
                                                          height: 35,
                                                          decoration: BoxDecoration(
                                                              color: _.chooseIndex!
                                                                          .value ==
                                                                      4
                                                                  ? ThemeConstants
                                                                      .bluecolor
                                                                  : ThemeConstants
                                                                      .whitecolor,
                                                              border: Border.all(
                                                                  color: _.chooseIndex!
                                                                              .value ==
                                                                          4
                                                                      ? ThemeConstants
                                                                          .bluecolor
                                                                      : ThemeConstants
                                                                          .TextColor),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0)),
                                                          child: Row(
                                                            children: [
                                                              const Spacer(),
                                                              CustomAutoSizeTextMontserrat(
                                                                text:
                                                                    "English Test.",
                                                                fontSize: 12,
                                                                textColor: _.chooseIndex!
                                                                            .value ==
                                                                        4
                                                                    ? ThemeConstants
                                                                        .whitecolor
                                                                    : ThemeConstants
                                                                        .TextColor,
                                                              ),
                                                              // const Icon(
                                                              //     Icons.abc_outlined),
                                                              const Spacer(),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5,
                                                              right: 5),
                                                      child: InkWell(
                                                        onTap: () {
                                                          _.getChooseIndex(
                                                              5.obs);
                                                        },
                                                        child: Container(
                                                          width: 110,
                                                          height: 35,
                                                          decoration: BoxDecoration(
                                                              color: _.chooseIndex!
                                                                          .value ==
                                                                      5
                                                                  ? ThemeConstants
                                                                      .bluecolor
                                                                  : ThemeConstants
                                                                      .whitecolor,
                                                              border: Border.all(
                                                                  color: _.chooseIndex!
                                                                              .value ==
                                                                          5
                                                                      ? ThemeConstants
                                                                          .bluecolor
                                                                      : ThemeConstants
                                                                          .TextColor),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0)),
                                                          child: Row(
                                                            children: [
                                                              const Spacer(),
                                                              CustomAutoSizeTextMontserrat(
                                                                text:
                                                                    "Other Test",
                                                                fontSize: 12,
                                                                textColor: _.chooseIndex!
                                                                            .value ==
                                                                        5
                                                                    ? ThemeConstants
                                                                        .whitecolor
                                                                    : ThemeConstants
                                                                        .TextColor,
                                                              ),
                                                              // const Icon(
                                                              //     Icons.abc_outlined),
                                                              const Spacer(),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          if (_.iconSwipe.value == false &&
                                              _.iconSwipetrue.value == true)
                                            Positioned(
                                              right: 0,
                                              child: Opacity(
                                                opacity: 0.5,
                                                child: InkWell(
                                                  onTap: () {
                                                    final position = controller
                                                        .position
                                                        .maxScrollExtent;
                                                    controller.animateTo(
                                                      position,
                                                      duration: const Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.easeOut,
                                                    );
                                                    _.setIconSwipeTrue(false);
                                                    Future.delayed(
                                                        const Duration(
                                                            milliseconds: 305),
                                                        () {
                                                      _.setIconSwipe(true);
                                                      _.setIconSwipeTrue(true);
                                                    });
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      // gradient: LinearGradient(
                                                      //   colors: [
                                                      //     Colors.transparent,
                                                      //     ThemeConstants.lightgreycolor,
                                                      //   ],
                                                      // ),
                                                      color: ThemeConstants
                                                          .whitecolor,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                100),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                100),
                                                      ),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          color: Colors.black,
                                                          blurRadius: 2.0,
                                                          spreadRadius: 0.0,
                                                          offset: Offset(2.0,
                                                              2.0), // shadow direction: bottom right
                                                        )
                                                      ],
                                                    ),
                                                    height: 80,
                                                    width: 35,
                                                    child: Center(
                                                      child: SizedBox(
                                                        height: 20,
                                                        width: 20,
                                                        child:
                                                            RotationTransition(
                                                          turns:
                                                              const AlwaysStoppedAnimation(
                                                                  0 / 360),
                                                          child: svgImage(
                                                              "nextscreen_arrow",
                                                              ThemeConstants
                                                                  .bluecolor,
                                                              25,
                                                              25),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    );
                                  } else if (index == 1) {
                                    return SizedBox(
                                      width: constraints - 240,
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 30),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        _.getChooseIndex(6.obs);
                                                      },
                                                      child: Container(
                                                        width: 100,
                                                        height: 35,
                                                        decoration: BoxDecoration(
                                                            color: _.chooseIndex!.value ==
                                                                    6
                                                                ? ThemeConstants
                                                                    .bluecolor
                                                                : ThemeConstants
                                                                    .whitecolor,
                                                            border: Border.all(
                                                                color: _.chooseIndex!
                                                                            .value ==
                                                                        6
                                                                    ? ThemeConstants
                                                                        .bluecolor
                                                                    : ThemeConstants
                                                                        .TextColor),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0)),
                                                        child: Row(
                                                          children: [
                                                            const Spacer(),
                                                            CustomAutoSizeTextMontserrat(
                                                              text: "Passport",
                                                              fontSize: 12,
                                                              textColor: _.chooseIndex!
                                                                          .value ==
                                                                      6
                                                                  ? ThemeConstants
                                                                      .whitecolor
                                                                  : ThemeConstants
                                                                      .TextColor,
                                                            ),
                                                            // const Icon(
                                                            //     Icons.abc_outlined),
                                                            const Spacer(),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        _.getChooseIndex(7.obs);
                                                      },
                                                      child: Container(
                                                        width: 120,
                                                        height: 35,
                                                        decoration: BoxDecoration(
                                                            color: _.chooseIndex!.value ==
                                                                    7
                                                                ? ThemeConstants
                                                                    .bluecolor
                                                                : ThemeConstants
                                                                    .whitecolor,
                                                            border: Border.all(
                                                                color: _.chooseIndex!
                                                                            .value ==
                                                                        7
                                                                    ? ThemeConstants
                                                                        .bluecolor
                                                                    : ThemeConstants
                                                                        .TextColor),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0)),
                                                        child: Row(
                                                          children: [
                                                            const Spacer(),
                                                            CustomAutoSizeTextMontserrat(
                                                              text:
                                                                  "Travel History",
                                                              fontSize: 12,
                                                              textColor: _.chooseIndex!
                                                                          .value ==
                                                                      7
                                                                  ? ThemeConstants
                                                                      .whitecolor
                                                                  : ThemeConstants
                                                                      .TextColor,
                                                            ),
                                                            // const Icon(
                                                            //     Icons.abc_outlined),
                                                            const Spacer(),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        _.getChooseIndex(8.obs);
                                                      },
                                                      child: Container(
                                                        width: 90,
                                                        height: 35,
                                                        decoration: BoxDecoration(
                                                            color: _.chooseIndex!.value ==
                                                                    8
                                                                ? ThemeConstants
                                                                    .bluecolor
                                                                : ThemeConstants
                                                                    .whitecolor,
                                                            border: Border.all(
                                                                color: _.chooseIndex!
                                                                            .value ==
                                                                        8
                                                                    ? ThemeConstants
                                                                        .bluecolor
                                                                    : ThemeConstants
                                                                        .TextColor),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0)),
                                                        child: Row(
                                                          children: [
                                                            const Spacer(),
                                                            CustomAutoSizeTextMontserrat(
                                                              text: "Relative",
                                                              fontSize: 12,
                                                              textColor: _.chooseIndex!
                                                                          .value ==
                                                                      8
                                                                  ? ThemeConstants
                                                                      .whitecolor
                                                                  : ThemeConstants
                                                                      .TextColor,
                                                            ),
                                                            // const Icon(
                                                            //     Icons.abc_outlined),
                                                            const Spacer(),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                              ],
                                            ),
                                          ),
                                          if ((_.iconSwipe.value == true &&
                                              _.iconSwipetrue.value == true))
                                            Positioned(
                                              left: 0,
                                              child: Opacity(
                                                opacity: 0.5,
                                                child: InkWell(
                                                  onTap: () {
                                                    final position = controller
                                                        .position
                                                        .minScrollExtent;
                                                    controller.animateTo(
                                                      position,
                                                      duration: const Duration(
                                                          milliseconds: 305),
                                                      curve: Curves.easeOut,
                                                    );
                                                    _.setIconSwipeTrue(false);
                                                    Future.delayed(
                                                        const Duration(
                                                            milliseconds: 305),
                                                        () {
                                                      _.setIconSwipe(false);
                                                      _.setIconSwipeTrue(true);
                                                    });
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: ThemeConstants
                                                          .whitecolor,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topRight:
                                                            Radius.circular(
                                                                100),
                                                        bottomRight:
                                                            Radius.circular(
                                                                100),
                                                      ),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          color: Colors.black,
                                                          blurRadius: 2.0,
                                                          spreadRadius: 0.0,
                                                          offset: Offset(2.0,
                                                              2.0), // shadow direction: bottom right
                                                        )
                                                      ],
                                                    ),
                                                    height: 80,
                                                    width: 35,
                                                    child: Center(
                                                      child: SizedBox(
                                                        height: 20,
                                                        width: 20,
                                                        child:
                                                            RotationTransition(
                                                          turns:
                                                              const AlwaysStoppedAnimation(
                                                                  180 / 360),
                                                          child: svgImage(
                                                              "nextscreen_arrow",
                                                              ThemeConstants
                                                                  .blackcolor,
                                                              25,
                                                              25),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return Container();
                                  }
                                }
                              }),
                        ),
                        getOption(
                          context,
                          _.chooseIndex!.value,
                          constraints - 240,
                        )
                      ],
                    )),
              ],
            );
          }),
        ));
  }

  getOption(BuildContext context, int index, double width) {
    if (index == 0) {
      return Expanded(
          // width: width,
          // height: MediaQuery.of(context).size.height - 210,
          child: ContactInformationCopy());
    }

    if (index == 1) {
      return SizedBox(
        width: width,
        height: MediaQuery.of(context).size.height - 210,
        child: CourseInformationCopy(
          width: width,
        ),
      );
    }

    if (index == 2) {
      return SizedBox(
        width: width,
        height: MediaQuery.of(context).size.height - 210,
        child: QualificationDetailsCopy(),
      );
    }

    if (index == 3) {
      return SizedBox(
        width: width,
        height: MediaQuery.of(context).size.height - 210,
        child: WorkHistoryCopy(),
      );
    }
    if (index == 4) {
      return SizedBox(
        width: width,
        height: MediaQuery.of(context).size.height - 210,
        child: EnglishTestDetails(),
      );
    }
    if (index == 5) {
      return SizedBox(
        width: width,
        height: MediaQuery.of(context).size.height - 210,
        child: OthertestDetail(),
      );
    }
    if (index == 6) {
      return SizedBox(
        width: width,
        height: MediaQuery.of(context).size.height - 210,
        child: PassportDetails(),
      );
    }
    if (index == 7) {
      return SizedBox(
        width: width,
        height: MediaQuery.of(context).size.height - 210,
        child: TravingHistory(),
      );
    }
    if (index == 8) {
      return SizedBox(
        width: width,
        height: MediaQuery.of(context).size.height - 210,
        child: RelativeInformation(),
      );
    }
  }
}
