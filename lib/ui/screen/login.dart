import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:studentpanel/ui/controllers/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/otpscreen.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const routeNamed = '/Login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
    Column(
      children: [
        Image.asset(
          "assets/images/study.gif",
          height: 350,
          width: 300,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CustomAutoSizeTextMontserrat(
            text: "Your International Study patner",
            textColor: Colors.white,
          ),
        )
      ],
    ),
    Column(
      children: [
        Image.asset(
          "assets/images/upload_doc.png",
          height: 350,
          width: 300,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CustomAutoSizeTextMontserrat(
            text: "Upload your documents",
            textColor: Colors.white,
          ),
        )
      ],
    ),
    Column(
      children: [
        Image.asset(
          "assets/images/track.gif",
          height: 350,
          width: 300,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CustomAutoSizeTextMontserrat(
            text: "Track your application",
            textColor: Colors.white,
          ),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: ThemeConstants.bluecolor),
          child: ListView(
            controller: ScrollController(),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    const Spacer(),
                    CustomAutoSizeTextMontserrat(
                      text: "Welcome to",
                      textColor: Colors.white,
                      fontSize: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 2),
                      child: Image.asset(
                        "assets/images/logow.png",
                        height: 45,
                      ),
                    ),
                    const Spacer()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: CarouselSlider(
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
                      height: 410,
                      autoPlayInterval: const Duration(seconds: 3),
                    ),
                    items: imglist1),
              ),
              Row(
                children: [
                  const Spacer(),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: SizedBox(
                          height: 10,
                          child: GetBuilder<LoginController>(
                              builder: (_) => Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: _.currentindex.value == 0
                                            ? Colors.white
                                            : Colors.grey,
                                        size:
                                            _.currentindex.value == 0 ? 11 : 8,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Icon(
                                          Icons.circle,
                                          color: _.currentindex.value == 1
                                              ? Colors.white
                                              : Colors.grey,
                                          size: _.currentindex.value == 1
                                              ? 11
                                              : 8,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Icon(
                                          Icons.circle,
                                          color: _.currentindex.value == 2
                                              ? Colors.white
                                              : Colors.grey,
                                          size: _.currentindex.value == 2
                                              ? 11
                                              : 8,
                                        ),
                                      ),
                                    ],
                                  ))),
                    ),
                  ),
                  const Spacer()
                ],
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                heightFactor: 1.1,
                child: Container(
                  height: 240,
                  width: 355,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                              fillColor: Colors.white70),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(
                          height: 55,
                          width: 315,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
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
                                text: "Send OTP",
                                textColor: Colors.white,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
