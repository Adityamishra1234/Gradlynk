import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif_view/gif_view.dart';
import 'package:studentpanel/ui/controllers/animationtestcontroller.dart';
import 'package:studentpanel/ui/screen/Login_Module/LoginScreen.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/ui/screen/login%20copy.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';

class AnimationTest extends StatefulWidget {
  const AnimationTest({Key? key}) : super(key: key);
  static const routeNamed = '/AnimationTest';

  @override
  State<AnimationTest> createState() => _AnimationTestState();
}

class _AnimationTestState extends State<AnimationTest>
    with TickerProviderStateMixin {
  late final GifController controller;

  @override
  void initState() {
    // controller = GifController(
    //   loop: false,
    //   onFinish: () {
    //     if (getNUllChecker(controller1.phone) == false) {
    //       Get.offNamed(DashBoard.routeNamed);
    //     } else {
    //       Get.offNamed(LoginScreen.routeNamed, arguments: controller1.phone);
    //     }
    //   },
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: ThemeConstants.whitecolor,
              child: GifView.asset(
                frameRate: 45,
                controller: controller,
                "assets/icons/logoanimation.gif",
              )),
        ],
      ),
    );
  }
}
