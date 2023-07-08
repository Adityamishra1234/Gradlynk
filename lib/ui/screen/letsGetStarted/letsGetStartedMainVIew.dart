import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/Custom_Tabbar/custom_tabbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class LetsGetStartedMainView extends StatelessWidget {
  static const routeNamed = '/letsGetStarted';
  const LetsGetStartedMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned(
                  left: -250,
                  top: -250,
                  child: CircleAvatar(
                    radius: 250,
                    backgroundColor: Color.fromARGB(32, 0, 76, 138),
                  ),
                ),
                Positioned(
                    right: -10,
                    top: -50,
                    child: Container(
                        width: 300,
                        height: 500,
                        child: Image.asset(
                            'assets/images/letsGetStarted_bgImage.png')))
                //  Positioned(
                //   left: -160,
                //   top: -160,
                //   child: ClipRRect(

                //     radius: 200,
                //     backgroundColor: ThemeConstants.GreenColor,
                //   ),
                // )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 400,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomAutoSizeTextMontserrat(
                      text: 'What is your last qualification?')
                ]),
          )
        ]),
      ),
    );
  }
}
