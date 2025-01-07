import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/new_widgets/text_fields.dart';
import 'package:studentpanel/ui/new_screens/authentication/login_screen.dart';
import 'package:studentpanel/ui/new_screens/authentication/registration_screen.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:toggle_switch/toggle_switch.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});
  static const routeNamed = '/IntroductionScreen';

  @override
  State<IntroductionScreen> createState() => IntroductionScreenState();
}

class IntroductionScreenState extends State<IntroductionScreen> {
  dynamic toggleIndex;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ThemeConstants.greenColor,
      body: SafeArea(
        child: Container(
          height: height,alignment: Alignment.bottomCenter,
          width: width,
          decoration: const BoxDecoration(
            // color: ThemeConstants.greenColor,
              image: DecorationImage(image:  AssetImage(
            "assets/images/bggggg.png",
          ),fit: BoxFit.fill)
          ),
          child: Container(
            height: height/2.3,
            width: width,
            decoration: BoxDecoration(
                color: ThemeConstants.whitecolor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            padding: const EdgeInsets.only(top: 22, left: 25, right: 25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Welcome to ",
                      overflow: TextOverflow.ellipsis,
                      textScaler: TextScaler.noScaling,
                      style: buttonStylePop(
                          ThemeConstants.blackcolor, FontWeight.w600, 28)),
                  const SizedBox(
                    height: 6,
                  ),
                  Image.asset(
                    "assets/images/new_icon.png",
                    scale: 1.7,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      "From exploring universities to settling into a new country, Gradlynk offers you personalized tools and resources to ensure your success.",
                      overflow: TextOverflow.ellipsis,
                      textScaler: TextScaler.noScaling,
                      maxLines: 5,
                      style: buttonStyleJost(
                          ThemeConstants.blackcolor, FontWeight.w400, 16)),
                  const SizedBox(
                    height: 25,
                  ),
                  ToggleSwitch(
                    minWidth: 300.0,
                    cornerRadius: 15.0,
                    borderWidth: 2,
                    animate: true,
                    animationDuration: 00,
                    customTextStyles: const [
                      TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      )
                    ],
                    curve: Curves.easeIn,
                    borderColor: [ThemeConstants.TextColor],
                    activeFgColor: Colors.white,
                    inactiveBgColor: ThemeConstants.whitecolor,
                    inactiveFgColor: ThemeConstants.greenColor,
                    initialLabelIndex: toggleIndex,
                    totalSwitches: 2,
                    labels: const ['Register', 'Login'],
                    radiusStyle: true,
                    activeBgColor: [ThemeConstants.greenColor],
                    onToggle: (index) {
                      if (index == 0) {
                        Get.toNamed(RegistrationScreen.routeNamed)?.then((value) {
                          setState(() {
                            toggleIndex = null;
                          });
                        });
                      }
                      else {
                        Get.toNamed(LoginScreen.routeNamed)?.then((value) {
                          setState(() {
                            toggleIndex = null;
                          });
                        });
                      }
                    },
                  ),

                  // Container(
                  //   padding: const EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(15),
                  //       border: Border.all(color: ThemeConstants.greenColor,width: 1.3)
                  //   ),
                  //   child: IntrinsicHeight(
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //       children: [
                  //         InkWell(
                  //           onTap: (){
                  //             Get.toNamed(LoginScreen.routeNamed);
                  //           },
                  //           child: Text(" Login",
                  //               overflow: TextOverflow.ellipsis,
                  //               textScaler: TextScaler.noScaling,
                  //               style: buttonStylePop(
                  //                   ThemeConstants.blackcolor, FontWeight.w500, 20 )),
                  //         ),
                  //         const SizedBox(width: 10,),
                  //         VerticalDivider(
                  //           thickness: 1.1,
                  //           color: ThemeConstants.greenColor,
                  //           width: 15,
                  //           indent: 0,
                  //           endIndent: 0,
                  //         ),
                  //         const SizedBox(width: 1,),
                  //         InkWell(
                  //           onTap: (){
                  //             Get.toNamed(RegistrationScreen.routeNamed);
                  //           },
                  //           child: Text("Register",
                  //               overflow: TextOverflow.ellipsis,
                  //               textScaler: TextScaler.noScaling,
                  //               style: buttonStylePop(
                  //                   ThemeConstants.blackcolor, FontWeight.w500, 20)),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
