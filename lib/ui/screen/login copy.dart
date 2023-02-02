import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studentpanel/ui/controllers/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/otpscreen.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class LoginCopy extends StatefulWidget {
  const LoginCopy({Key? key}) : super(key: key);
  static const routeNamed = '/LoginCopy';

  @override
  State<LoginCopy> createState() => _LoginCopyState();
}

class _LoginCopyState extends State<LoginCopy> {
  String? email, password;
  var controller = Get.put(LoginController());

  @override
  void initState() {
    super.initState();

    // _checkVersion();
  }

  // void _checkVersion() async {
  //   final newVersion = NewVersion(
  //     // For Real Case
  //     // androidId: "com.example.studentpanel",
  //     //Use For Test Purpose only
  //     androidId: "com.snapchat.android",
  //   );
  //   final status = await newVersion.getVersionStatus();
  //   newVersion.showUpdateDialog(
  //     context: context,
  //     versionStatus: status!,
  //     dialogTitle: "UPDATE!!!",
  //     dismissButtonText: "Skip",
  //     dialogText:
  //         "Please update the app from ${status.localVersion} to ${status.storeVersion}",
  //     dismissAction: () {
  //       Navigator.of(context).pop();
  //     },
  //     updateButtonText: "Lets update",
  //   );
  //   debugPrint("DEVICE : ${status.localVersion}");
  //   debugPrint("STORE : ${status.storeVersion}");
  // }

  List<Widget> imglist1 = [
    Image.asset(
      "assets/images/login-page.png",
    ),
    Image.asset(
      "assets/images/University-of-Melbourne.png",
    ),
    Image.asset(
      "assets/images/University-of-Toronto.png",
    ),
  ];

  setTextposistion(int chooseImageIndex) {
    switch (chooseImageIndex) {
      case 0:
        return Positioned(
            left: 10,
            top: MediaQuery.of(context).size.height * 0.65,
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  child: Row(
                    children: [
                      svgImage("location", ThemeConstants.whitecolor, 35, 35),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Mahima chadha \nStudying in Canada",
                          textColor: ThemeConstants.whitecolor,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: CustomAutoSizeTextMontserrat(
                      text:
                          "My requirement was 7 each and I must say without, it would not possiable I must Appreciate the hard work and passion of the faculty of ACCT-Siec.",
                      fontSize: 10,
                      textColor: ThemeConstants.whitecolor,
                    ),
                  ),
                )
              ],
            ));

      case 1:
        return Positioned(
            left: 10,
            top: MediaQuery.of(context).size.height * 0.65,
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  child: Row(
                    children: [
                      svgImage("location", ThemeConstants.whitecolor, 35, 35),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: CustomAutoSizeTextMontserrat(
                          text: "University of Melbourne",
                          textColor: ThemeConstants.whitecolor,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: CustomAutoSizeTextMontserrat(
                      text:
                          "The university of Melbourne is apublic research university location in Melbource,Australia Founded in 1853",
                      fontSize: 10,
                      textColor: ThemeConstants.whitecolor,
                    ),
                  ),
                )
              ],
            ));

      case 2:
        return Positioned(
            left: 10,
            top: MediaQuery.of(context).size.height * 0.65,
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  child: Row(
                    children: [
                      svgImage("location", ThemeConstants.whitecolor, 35, 35),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: CustomAutoSizeTextMontserrat(
                          text: "University of Toronto",
                          textColor: ThemeConstants.whitecolor,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: CustomAutoSizeTextMontserrat(
                      text:
                          "The University of Toronto is a public research university inToronto,Ontario,Canada, located on the ground that surround Queen's Park",
                      fontSize: 10,
                      textColor: ThemeConstants.whitecolor,
                    ),
                  ),
                )
              ],
            ));

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: ThemeConstants.bluecolor),
          child: Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    controller.setUpdateCurrentIndex(index);
                  },
                  aspectRatio: 2.0,
                  disableCenter: true,
                  viewportFraction: 1,
                  enlargeCenterPage: false,
                  autoPlayCurve: Curves.ease,
                  autoPlay: true,
                  height: MediaQuery.of(context).size.height - 100,
                  autoPlayInterval: const Duration(seconds: 3),
                ),
                items: imglist1,
              ),

              //Icon And Text
              GetBuilder<LoginController>(
                builder: (_) => setTextposistion(_.currentindex.value),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  heightFactor: 1.1,
                  child: SizedBox(
                    height: 240,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 10, right: 10),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[800]),
                                hintText: "Enter your phone number",
                                fillColor: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 10, right: 10),
                          child: SizedBox(
                            height: 55,
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side: BorderSide(
                                    width: 1.0,
                                    color: ThemeConstants.whitecolor,
                                  ),
                                  backgroundColor: ThemeConstants.bluecolor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(12), // <-- Radius
                                  ),
                                ),
                                onPressed: () {
                                  Get.toNamed(OTPScreen.routeNamed);
                                },
                                child: CustomAutoSizeTextMontserrat(
                                  text: "Log-In",
                                  textColor: Colors.white,
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
