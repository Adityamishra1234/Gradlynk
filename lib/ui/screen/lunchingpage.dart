import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/lunchingpagecontroller.dart';
import 'package:studentpanel/ui/screen/login%20copy.dart';
import 'package:studentpanel/ui/screen/login.dart';

class LunchingPage extends StatefulWidget {
  LunchingPage({Key? key}) : super(key: key);
  static const routeNamed = '/LunchingPage';

  @override
  State<LunchingPage> createState() => _LunchingPageState();
}

class _LunchingPageState extends State<LunchingPage> {
  bool temp = false;

  @override
  void initState() {
    controller.startTimer();
    super.initState();
  }

  var controller = Get.put(LunchingPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Image.asset(
          "assets/icons/logo-4.gif",
          gaplessPlayback: false,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
