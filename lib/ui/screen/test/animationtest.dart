import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif_view/gif_view.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';

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
    controller = GifController(
      loop: false,
      onFinish: () {
        Get.toNamed(DashBoard.routeNamed);
      },
    );
    super.initState();
  }

  void startTimer() {
    Future.delayed(const Duration(milliseconds: 4550), () {
      Get.toNamed(DashBoard.routeNamed);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: GifView.asset(
                frameRate: 24,
                controller: controller,
                "assets/icons/logoanimation.gif",
              )),
        ],
      ),
    );
  }
}
