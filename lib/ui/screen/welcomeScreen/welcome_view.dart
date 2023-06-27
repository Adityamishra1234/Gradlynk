import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/login%20copy.dart';
import 'package:studentpanel/ui/screen/welcomeScreen/welcome_view_controller.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class WelcomeView extends StatelessWidget {
  WelcomeView({super.key});
  static const routeNamed = '/WelcomeView';

  var controller = Get.put(WelcomeViewController());

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width > 600;

    return Scaffold(
        body: controller.obx(
      (state) => SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: ListView(

              // crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                SizedBox(
                    height: 50,
                    child: Image.asset(
                      "assets/images/logo.png",
                    )),
                Column(
                  children: [
                    SizedBox(
                        child: CustomAutoSizeTextMontserrat(
                      text: 'Welcome to Gradlynk',
                      fontSize: 28,
                    )),
                    SizedBox(
                        child: CustomAutoSizeTextMontserrat(
                      text: 'Your international Study Partner',
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Data(
                          icon: "assets/icons/Explore the world.svg",
                          text:
                              'Discover courses from top universities across Australia, Canada, USA, UK, Europe, New Zealand and Asia.',
                          title: 'Explore the Globe',
                          context: context),
                      //     Spacer(),
                      const SizedBox(
                        height: 20,
                      ),
                      Data(
                          icon: "assets/icons/Expert.svg",
                          text:
                              'Get assistance from experts in the industry and build your dream career.',
                          title: 'Excel with the Experts',
                          context: context),
                      const SizedBox(
                        height: 20,
                      ),
                      Data(
                          icon: "assets/icons/Track Issue.svg",
                          text:
                              'Stay live updated on your application and offer status.',
                          title: 'Track your Journey',
                          context: context),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: InkWell(
                    onTap: () async {
                      Get.offNamed(LoginCopy.routeNamed);
                    },
                    child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: ThemeConstants.whitecolor,
                          ),
                          color: ThemeConstants.bluecolor,

                          borderRadius:
                              BorderRadius.circular(120), // <-- Radius
                        ),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Start the Journey",
                          textColor: Colors.white,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 300,
                  child: CustomAutoSizeTextMontserrat(
                    textColor: Colors.grey[700],
                    text: 'Register your story amongst 50K+ success stories',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    textalingCentre: true,
                  ),
                ),
              ]),
        ),
      ),
    ));
  }

  Widget Data(
      {required String icon,
      required String title,
      required String text,
      required BuildContext context}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1,
      // color: Colors.amber,
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: CircleAvatar(
              backgroundColor: ThemeConstants.lightblueColor,
              child: SvgPicture.asset(
                icon,
                color: ThemeConstants.bluecolor,
                height: 50,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomAutoSizeTextMontserrat(
                  text: title,
                  fontSize: 22,
                  textalingCentre: true,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.height * 0.45,
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[700]),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
