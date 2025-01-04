import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/new_widgets/text_fields.dart';
import 'package:studentpanel/ui/new_screens/authentication/login_screen.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:toggle_switch/toggle_switch.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});
  static const routeNamed = '/IntroductionScreen';

  @override
  State<IntroductionScreen> createState() => IntroductionScreenState();
}

class IntroductionScreenState extends State<IntroductionScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ThemeConstants.greenColor,
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          color: ThemeConstants.greenColor,
          child: Stack(
            children: [
              SizedBox(
                width: width,
                height: height - (height * 0.41),
                child: Image.asset(
                  "assets/images/intro_bg.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: height * 0.379,
                  width: width,
                  decoration: BoxDecoration(
                      color: ThemeConstants.whitecolor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome to",
                            overflow: TextOverflow.ellipsis,
                            textScaler: TextScaler.noScaling,
                            style: buttonStyleOpenSans(
                                ThemeConstants.blackcolor, FontWeight.bold, 44)),
                        const SizedBox(
                          height: 15,
                        ),
                        Image.asset(
                          "assets/images/new_icon.png",
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                            "From exploring universities to settling into a new country, GradLynk offers you personalized tools and resources to ensure your success.",
                            overflow: TextOverflow.ellipsis,
                            textScaler: TextScaler.noScaling,
                            maxLines: 5,
                            style: buttonStyleOpenSans(
                                ThemeConstants.blackcolor, FontWeight.w400, 16)),
                        const SizedBox(
                          height: 22,
                        ),
                        ToggleSwitch(
                          minWidth: 300.0,
                          cornerRadius: 15.0,
                          borderWidth: 2,
                          animate: true,
                          animationDuration: 100,
                          customTextStyles: const [
                            TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                            )
                          ],
                          curve: Curves.easeIn,
                          borderColor: [ThemeConstants.TextColor],
                          activeFgColor: Colors.white,
                          inactiveBgColor: ThemeConstants.whitecolor,
                          inactiveFgColor: ThemeConstants.greenColor,
                          initialLabelIndex: 0,
                          totalSwitches: 2,
                          labels: const ['Register', 'Login'],
                          radiusStyle: true,
                          activeBgColor: [ThemeConstants.greenColor],
                          onToggle: (index) {
                            if (index == 0) {
                            } else {
                              Get.toNamed(LoginScreen.routeNamed);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
