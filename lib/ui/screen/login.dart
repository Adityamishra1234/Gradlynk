import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/widgets/bottomnavigation.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/drawerfilter.dart';
import 'package:new_version/new_version.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const routeNamed = '/Login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? email, password;

  @override
  void initState() {
    super.initState();

    _checkVersion();
  }

  void _checkVersion() async {
    final newVersion = NewVersion(
      // For Real Case
      // androidId: "com.example.studentpanel",
      //Use For Test Purpose only
      androidId: "com.snapchat.android",
    );
    final status = await newVersion.getVersionStatus();
    newVersion.showUpdateDialog(
      context: context,
      versionStatus: status!,
      dialogTitle: "UPDATE!!!",
      dismissButtonText: "Skip",
      dialogText:
          "Please update the app from ${status.localVersion} to ${status.storeVersion}",
      dismissAction: () {
        Navigator.of(context).pop();
      },
      updateButtonText: "Lets update",
    );
    debugPrint("DEVICE : ${status.localVersion}");
    debugPrint("STORE : ${status.storeVersion}");
  }

  List<Widget> imglist1 = [
    SizedBox(
      height: 400,
      child: Column(
        children: [
          Container(
            height: 300,
            width: 250,
            child: Image.asset(
              "assets/images/study.gif",
            ),
          ),
          CustomAutoSizeTextMontserrat(
            text: "Your International Study patner",
            maxLines: 1,
            textColor: Colors.white,
          )
        ],
      ),
    ),
    SizedBox(
      height: 400,
      child: Column(
        children: [
          Container(
            height: 300,
            width: 250,
            child: Image.asset(
              "assets/images/upload_doc.png",
            ),
          ),
          CustomAutoSizeTextMontserrat(
            text: "Upload your documents",
            maxLines: 1,
            textColor: Colors.white,
          )
        ],
      ),
    ),
    SizedBox(
      height: 400,
      child: Column(
        children: [
          Container(
            height: 300,
            width: 250,
            child: Image.asset(
              "assets/images/track.png",
            ),
          ),
          CustomAutoSizeTextMontserrat(
            text: "Track your application",
            maxLines: 1,
            textColor: Colors.white,
          )
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Color(0xFF1940B3)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    const Spacer(),
                    CustomAutoSizeTextMontserrat(
                      text: "Welcome to",
                      maxLines: 1,
                      textColor: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 2),
                      child: Image.asset(
                        "assets/images/logow.png",
                        height: 32,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlayCurve: Curves.ease,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                    ),
                    items: imglist1),
              ),
              Container(
                height: 260,
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
                        height: 45,
                        width: 315,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF1940B3),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(12), // <-- Radius
                              ),
                            ),
                            onPressed: () {},
                            child: CustomAutoSizeTextMontserrat(
                              text: "Send OTP",
                              maxLines: 1,
                              textColor: Colors.white,
                            )),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
