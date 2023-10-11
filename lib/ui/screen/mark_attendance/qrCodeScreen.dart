import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/button/circleButton.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class QRScreen extends StatelessWidget {
  String Url;
  String code;
  QRScreen({super.key, required this.Url, required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar("title"),
      body: Stack(
        children: [
          Positioned(
              right: 30,
              top: 40,
              child: CircleContainerWithIcon(
                icon: Icons.close,
                color: ThemeConstants.lightgreycolor,
                size: 50,
                onPress: () {
                  Get.back();
                },
              )),
          Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height / 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: SizedBox(
                      width: 280,
                      child: Align(
                          alignment: Alignment.topCenter,
                          child:
                              Image.asset("assets/images/profile-code.png"))),
                ),
              ),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(
                              MediaQuery.sizeOf(context).width.toDouble() * 2),
                        ),
                        color: ThemeConstants.bluecolor),
                    height: MediaQuery.sizeOf(context).height / 2,
                    width: MediaQuery.sizeOf(context).width,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      // color: ThemeConstants.GreenColor,
                      child: Image.asset("assets/images/map.png")),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.2,
                    child: Opacity(
                      opacity: 0.8,
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: Image.asset("assets/images/monumet.png")),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 8, color: ThemeConstants.whitecolor)),
                      child: Image.network(Url)),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomAutoSizeTextMontserrat(
                    text: code,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    textColor: ThemeConstants.whitecolor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
