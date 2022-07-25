import 'package:back_pressed/back_pressed.dart';
import 'package:studentpanel/ui/controllers/basemixin.dart';
import 'package:studentpanel/ui/controllers/textscreencontroller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:studentpanel/widgets/customtab.dart';
import 'dart:async';
import 'dart:io';

import 'package:studentpanel/widgets/drawerfilter.dart';

class TextScreen extends StatefulWidget {
  const TextScreen({Key? key}) : super(key: key);
  static const routeNamed = '/TextScreen';

  @override
  State<TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  var textScreenController = Get.put(TextScreenController());

  @override
  void initState() {
    super.initState();
    // textScreenController.startTimer(routeNamed);
  }

  @override
  void deactivate() {
    // textScreenController.temp = true.obs;
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerFilter(),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: CustomTab(),
        )
        //  OnBackPressed(
        //     perform: () {
        //       textScreenController.temp = true.obs;
        //       if (kDebugMode) {
        //         debugPrint(Get.previousRoute);
        //       }
        //       Get.toNamed(Get.previousRoute, arguments: true);
        //       if (kDebugMode) {
        //         debugPrint('The back button on the device was pressed');
        //       }
        //     },
        //     child: Container(child: Center(child: Text("Text screen")))),
        );
  }
}

// class Example3 extends StatelessWidget {
//   const Example3({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: PhloxAnimations(
//           duration: const Duration(seconds: 2),
//           child: Container(
//             height: 250,
//             width: 250,
//             decoration: BoxDecoration(
//                 color: Colors.blue.shade900,
//                 borderRadius: BorderRadius.circular(32)
//             ),
//           ),
//           fromX: -200,
//           toX: 200,
//           fromY: -200, /// add
//           toY: 200, /// add
//           loop: true, /// add **Loop**
//         ),
//       ),
//     );
//   }
// }
