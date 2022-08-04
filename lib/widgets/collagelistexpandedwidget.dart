import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CollagelistExpandedWidget extends StatefulWidget {
  const CollagelistExpandedWidget({Key? key}) : super(key: key);

  @override
  State<CollagelistExpandedWidget> createState() =>
      _CollagelistExpandedWidgetState();
}

class _CollagelistExpandedWidgetState extends State<CollagelistExpandedWidget> {
  bool resize = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        height: 130,
        child: Stack(
          children: [
            Positioned(
                top: 5,
                right: 10,
                child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Color(0xFFECF0FB), shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: SvgPicture.asset(
                        "assets/icons/arrow.svg",
                        color: ThemeConstants.bluecolor,
                      ),
                    ))),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 50, left: 10),
                  child: CustomAutoSizeTextMontserrat(
                    text: "Bachelor of Business-Economics and Finance",
                    maxLines: 5,
                    textColor: ThemeConstants.bluecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: CustomAutoSizeTextMontserrat(
                        text: "Australia,Victor,Melbourne | RMIT University",
                        maxLines: 3),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: CustomAutoSizeTextMontserrat(
                        text: "Melbourne City Campus", maxLines: 3),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/clock.svg",
                        height: 20,
                      ),
                      CustomAutoSizeTextMontserrat(text: "3 Year", maxLines: 1),
                      SvgPicture.asset(
                        "assets/icons/price.svg",
                        height: 20,
                      ),
                      CustomAutoSizeTextMontserrat(
                          text: "14500 AUD", maxLines: 1),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/icons/i.svg",
                            height: 20,
                            color: ThemeConstants.bluecolor,
                          )),
                      const Spacer(flex: 1),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: ThemeConstants.bluecolor,
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(7))),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: SvgPicture.asset(
                            "assets/icons/compare.svg",
                            color: ThemeConstants.whitecolor,
                            height: 25,
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Color(0xFF2FAF5E),
                            borderRadius: BorderRadius.all(Radius.circular(7))),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: SvgPicture.asset(
                            "assets/icons/list.svg",
                            color: ThemeConstants.whitecolor,
                            height: 25,
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            color: Color(0xFFF97316),
                            borderRadius: BorderRadius.all(Radius.circular(7))),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: SvgPicture.asset(
                            "assets/icons/star.svg",
                            color: ThemeConstants.whitecolor,
                            height: 25,
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
      ),
    );
  }
}
