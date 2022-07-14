import 'package:back_pressed/back_pressed.dart';
import 'package:studentpanel/ui/controllers/basemixin.dart';
import 'package:studentpanel/ui/controllers/textscreencontroller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:io';

import 'package:studentpanel/widgets/drawerfilter.dart';

class TextScreen extends StatefulWidget {
  const TextScreen({Key? key}) : super(key: key);

  @override
  State<TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  var textScreenController = Get.put(TextScreenController());
  static const routeNamed = '/TextScreen';

  @override
  void initState() {
    super.initState();
    textScreenController.startTimer(routeNamed);
  }

  @override
  void deactivate() {
    textScreenController.temp = true.obs;
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerFilter(),
      body: OnBackPressed(
          perform: () {
            textScreenController.temp = true.obs;
            if (kDebugMode) {
              debugPrint(Get.previousRoute);
            }
            Get.toNamed(Get.previousRoute, arguments: true);
            if (kDebugMode) {
              debugPrint('The back button on the device was pressed');
            }
          },
          child: Container(child: Center(child: Text("Text screen")))),
    );
  }
}
