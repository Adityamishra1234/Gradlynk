import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/fund/fund_requiremen.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/Custom_Tabbar/custom_tabbar.dart';
import 'package:studentpanel/widgets/button/custom_button.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/custombutton.dart';
import 'package:studentpanel/ui/screen/letsGetStarted/letsGetStartedController.dart';

class LetsGetStartedMainView extends StatelessWidget {
  static const routeNamed = '/letsGetStarted';
  LetsGetStartedMainView({super.key});

  var controller = Get.put(LetsGetStartedController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.obx(
      (state) => SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                const Positioned(
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
                    child: SizedBox(
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
          if (controller.questionNumberToShow == 0)
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: CustomAutoSizeTextMontserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                          text: 'What is your last qualification?'),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        runSpacing: 20,
                        spacing: 25,
                        children: [
                          CustomButtonWidget(
                            text: '12th',
                          ),
                          CustomButtonWidget(
                            text: 'Bachelors',
                          ),
                          CustomButtonWidget(
                            text: 'Masters',
                          ),
                          CustomButtonWidget(
                            text: 'Diploma',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomIconTextTogether(
                                text: 'Back',
                                Bgcolor: ThemeConstants.whitecolor,
                                color: ThemeConstants.bluecolor,
                                fontWeight: FontWeight.w400,
                                textSize: 12,
                                iconData: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  size: 10,
                                  color: ThemeConstants.bluecolor,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              CustomIconTextTogether(
                                iconBeforeText: false,
                                text: 'Next',
                                Bgcolor: ThemeConstants.whitecolor,
                                color: ThemeConstants.bluecolor,
                                fontWeight: FontWeight.w400,
                                textSize: 12,
                                iconData: Icon(
                                  Icons.navigate_next,
                                  size: 15,
                                  color: ThemeConstants.bluecolor,
                                ),
                              ),
                              const SizedBox(
                                width: 35,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
            ),
          if (controller.questionNumberToShow == 1)
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: CustomAutoSizeTextMontserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                          text: 'What is your last qualification?'),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        runSpacing: 20,
                        spacing: 25,
                        children: [
                          CustomButtonWidget(
                            text: '12th',
                          ),
                          CustomButtonWidget(
                            text: 'Bachelors',
                          ),
                          CustomButtonWidget(
                            text: 'Masters',
                          ),
                          CustomButtonWidget(
                            text: 'Diploma',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomIconTextTogether(
                                text: 'Back',
                                Bgcolor: ThemeConstants.whitecolor,
                                color: ThemeConstants.bluecolor,
                                fontWeight: FontWeight.w400,
                                textSize: 12,
                                iconData: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  size: 10,
                                  color: ThemeConstants.bluecolor,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              CustomIconTextTogether(
                                iconBeforeText: false,
                                text: 'Next',
                                Bgcolor: ThemeConstants.whitecolor,
                                color: ThemeConstants.bluecolor,
                                fontWeight: FontWeight.w400,
                                textSize: 12,
                                iconData: Icon(
                                  Icons.navigate_next,
                                  size: 15,
                                  color: ThemeConstants.bluecolor,
                                ),
                              ),
                              const SizedBox(
                                width: 35,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
            )
        ]),
      ),
      onLoading: getLoading(context),
    ));
  }
}
