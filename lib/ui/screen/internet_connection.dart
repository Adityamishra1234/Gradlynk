import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/internetchecker.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class InternetConnectionStatusScreen extends StatelessWidget {
  InternetConnectionStatusScreen({super.key});

  static const routeNamed = '/InternetConnectionStatus';
  var controller = Get.put(InternetChecker());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
              height: 250,
              child: Image.asset("assets/icons/no-connection.png")),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomAutoSizeTextMontserrat(
          text: "No connection",
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        CustomAutoSizeTextMontserrat(
          text: "Please check your internet \nconnectivity and try again",
          fontSize: 14,
          textColor: ThemeConstants.bluelightgreycolor,
        ),
        const SizedBox(
          height: 15,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              primary: ThemeConstants.bluecolor, // background
              onPrimary: ThemeConstants.bluecolor, // foreground
            ),
            onPressed: () {
              print("aldjs");
              checkUserConnection();
            },
            child: CustomAutoSizeTextMontserrat(
              text: "Retry",
              textColor: ThemeConstants.whitecolor,
            )),
      ],
    ));
  }
}
