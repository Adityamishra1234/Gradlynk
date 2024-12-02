import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import 'package:studentpanel/ui/controllers/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/registeration/registeration_main_view.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customRichTextWidget.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/dialogs/registration_dialogue.dart';

class LoginCopy extends StatefulWidget {
  const LoginCopy({Key? key}) : super(key: key);
  static const routeNamed = '/LoginCopy';

  @override
  State<LoginCopy> createState() => _LoginCopyState();
}

class _LoginCopyState extends State<LoginCopy> {
  String? email, password;
  var controller = Get.put(LoginController());

  bool _isKeyBoardVisible = false;

  String? appSignature;
  String? otpCode;

  String _code = "";

  static TextEditingController phoneNumber = TextEditingController();
  static TextEditingController otpcontroller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  final defaultPinTheme = PinTheme(
    width: 58,
    height: 70,
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: Colors.white,
    ),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(255, 255, 255, 0.349),
      borderRadius: BorderRadius.circular(19),
      border: Border.all(color: ThemeConstants.whitecolor),
    ),
  );
  @override
  void initState() {
    super.initState();
    // showRegisterDialgoue();
    // _focusNode.addListener(_onFocusChange);
    // MobileNumber.listenPhonePermission((isPermissionGranted) {
    //   if (isPermissionGranted) {
    //     // initMobileNumberState();
    //   } else {}
    // });

    // _checkVersion();
  }

  showRegisterDialgoue() async {
    await Future.delayed(const Duration(milliseconds: 500));


    showAnimatedDialog(
        duration: const Duration(milliseconds: 350),
        animationType:
        DialogTransitionType.slideFromBottomFade,
        context: context,
        builder: (_) => Stack(children: [
          const Center(
              child: RegistrationDialogue()),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
              const EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: () {
                 Get.back();
                  // Get.back();
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: ThemeConstants.bluecolor,
                      borderRadius:
                      BorderRadius.circular(
                          200)),
                  child: Icon(
                    Icons.close_rounded,
                    color:
                    ThemeConstants.whitecolor,
                  ),
                ),
              ),
            ),
          )
        ]));
    // showAnimatedDialog(
    //     animationType: DialogTransitionType.slideFromBottomFade,
    //     curve: Curves.easeInOutQuart,
    //     context: context,
    //     builder: (_) => const RegistrationDialogue());
  }

  signature() async {
    // String? smsCode = await AndroidSmsRetriever.listenForOneTimeConsent(senderPhoneNumber: );

    // otpCode = await AltSmsAutofill().listenForSms;

    var d = otpCode!.split(' ');

    // print(match);

    // var d = int.parse();

    otpcontroller.text = d[8];
    // print('otpCode)');

    // print(odtpCode);
    // await SmsAutoFill().getAppSignature.then((signature) {
    //   setState(() {
    //     appSignature = signature;
    //   });
    // });

    // await SmsAutoFill().listenForCode();
    // print(appSignature);
  }

  @override
  void dispose() {
    // AltSmsAutofill().unregisterListener();

    // SmsAutoFill().unregisterListener();
    _focusNode.removeListener(_onFocusChange);
    // controller.dispose();
    phoneNumber.text = "";
    otpcontroller.text = "";

    super.dispose();
  }

  _onFocusChange() async {
    // SmsAutoFill _autoFill = SmsAutoFill();
    // var completePhoneNumber = await _autoFill.hint;
    // print(completePhoneNumber);
    // phoneNumber.text = completePhoneNumber!;
    setState(() {});
    // setState(() {
    //   _isKeyBoardVisible = _focusNode.hasFocus;
    // });
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
      fit: BoxFit.fill,
    ),
    Image.asset(
      "assets/images/University-of-Melbourne.png",
      fit: BoxFit.fill,
    ),
    Image.asset(
      "assets/images/University-of-Toronto.png",
      fit: BoxFit.fill,
    ),
  ];

  setTextposistion(int chooseImageIndex) {
    switch (chooseImageIndex) {
      case 0:
        return Visibility(
          visible: true,
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 20,
                child: Row(
                  children: [
                    svgImage("location", ThemeConstants.whitecolor, 25, 25),
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
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(top: 0, left: 10),
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
          ),
        );

      case 1:
        return Visibility(
          visible: true,
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 20,
                child: Row(
                  children: [
                    svgImage("location", ThemeConstants.whitecolor, 25, 25),
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: CustomAutoSizeTextMontserrat(
                        text: "University of Melbourne",
                        textColor: ThemeConstants.whitecolor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(top: 0, left: 10),
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
          ),
        );

      case 2:
        return Visibility(
          visible: true,
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 20,
                child: Row(
                  children: [
                    svgImage("location", ThemeConstants.whitecolor, 25, 25),
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
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(top: 0, left: 10),
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
          ),
        );

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return Scaffold(
        body: controller.obx(
            (state) => Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: ThemeConstants.bluecolor),
                child: Stack(
                  children: [
                    SingleChildScrollView(
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
                          height: MediaQuery.of(context).size.height - 100,
                          autoPlayInterval: const Duration(seconds: 3),
                        ),
                        items: imglist1,
                      ),
                    ),

                    //Icon And Text
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(
                              height: 70,
                            ),
                            SizedBox(
                                width: 200,
                                height: 50,
                                child: Image.asset(
                                  "assets/images/logo.png",
                                )),
                            const Spacer(),
                            controller.otpEnable.value == false
                                ? setTextposistion(
                                    controller.currentindex.value)
                                : Container(),

                            // PinFieldAutoFill(
                            //   codeLength: 4,
                            //   autoFocus: true,
                            //   decoration: UnderlineDecoration(
                            //     lineHeight: 2,
                            //     lineStrokeCap: StrokeCap.square,
                            //     bgColorBuilder: PinListenColorBuilder(
                            //         Colors.green.shade200,
                            //         Colors.grey.shade200),
                            //     colorBuilder:
                            //         const FixedColorBuilder(Colors.transparent),
                            //   ),
                            // ),

                            if (controller.otpEnable.value == false)
                              Stack(
                                children: [
                                  // if (controller.otpEnable.value == false)
                                  // Padding(
                                  //   padding: const EdgeInsets.only(
                                  //       top: 20, left: 10, right: 10),
                                  //   child: TextFormField(
                                  //       focusNode: _focusNode,
                                  //       autovalidateMode:
                                  //           AutovalidateMode.onUserInteraction,
                                  //       controller: phoneNumber,
                                  //       keyboardType: TextInputType.number,
                                  //       inputFormatters: [
                                  //         FilteringTextInputFormatter.digitsOnly
                                  //       ],
                                  //       decoration: InputDecoration(
                                  //         border: OutlineInputBorder(
                                  //           borderRadius:
                                  //               BorderRadius.circular(10.0),
                                  //         ),
                                  //         filled: true,
                                  //         hintStyle: TextStyle(
                                  //             color: Colors.grey[800]),
                                  //         hintText: "Enter your phone number",
                                  //         fillColor: Colors.white,
                                  //       ),
                                  //       validator: (value) {
                                  //         return getPhoneNumbervalidation(
                                  //             value);
                                  //       }),
                                  // ),

                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 10, right: 10),
                                    // child: PhoneFieldHint(
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value != null) {
                                          print(value);
                                          if (value.length != 10) {
                                            return 'Enter 10 digit Number';
                                          }
                                        }
                                      },
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      focusNode: _focusNode,
                                      controller: phoneNumber,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        filled: true,
                                        hintStyle: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.grey[800],
                                            fontSize: 13.9,
                                          ),
                                        ),
                                        hintText: "Enter your phone number",
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  if (controller.otpEnable.value == false)
                                    // Padding(
                                    //   padding: const EdgeInsets.only(
                                    //       top: 20, left: 10, right: 10),
                                    //   child: TextFormField(
                                    //       focusNode: _focusNode,
                                    //       autovalidateMode: AutovalidateMode
                                    //           .onUserInteraction,
                                    //       controller: phoneNumber,
                                    //       keyboardType: TextInputType.number,
                                    //       inputFormatters: [
                                    //         FilteringTextInputFormatter
                                    //             .digitsOnly
                                    //       ],
                                    //       decoration: InputDecoration(
                                    //         border: OutlineInputBorder(
                                    //           borderRadius:
                                    //               BorderRadius.circular(10.0),
                                    //         ),
                                    //         filled: true,
                                    //         hintStyle: TextStyle(
                                    //             color: Colors.grey[800]),
                                    //         hintText: "Enter your phone number",
                                    //         fillColor: Colors.white,
                                    //       ),
                                    //       validator: (value) {
                                    //         return getPhoneNumbervalidation(
                                    //             value);
                                    //       }),
                                    // ),
                                    if (controller.otpEnable.value == false)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 10, right: 10),
                                        child: SizedBox(
                                          height: 55,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                side: BorderSide(
                                                  width: 1.0,
                                                  color:
                                                      ThemeConstants.whitecolor,
                                                ),
                                                backgroundColor:
                                                    ThemeConstants.bluecolor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12), // <-- Radius
                                                ),
                                              ),
                                              onPressed: () async {
                                                if (getNUllChecker(
                                                        phoneNumber.text) ==
                                                    true) {
                                                  getToast(SnackBarConstants
                                                      .phoneNumberError1!);
                                                }
                                                // else if (getNUllChecker(password.text) ==
                                                //     true) {
                                                //   getToast("Please enter your password");
                                                // }
                                                else {
                                                  if (phoneNumber.text.length >
                                                      9) {
                                                    otpcontroller.text = "";
                                                    var alreadyRegistered =
                                                        await controller
                                                            .phonenumberVerfiy(
                                                                phoneNumber
                                                                    .text);

                                                    if (!alreadyRegistered) {
                                                      showRegisterDialgoue();
                                                    }
                                                    // await SmsAutoFill()
                                                    //     .listenForCode();
                                                    // signature();
                                                    // controller.phonenumberVerfiy(
                                                    //     phoneNumber.text);
                                                  } else {
                                                    getToast(SnackBarConstants
                                                        .phoneNumberError2!);
                                                  }
                                                }

                                                // Get.toNamed(OTPScreen.routeNamed);
                                              },
                                              child:
                                                  CustomAutoSizeTextMontserrat(
                                                text: "Get OTP",
                                                textColor: Colors.white,
                                              )),
                                        ),
                                      ),
                                  // if (controller.otpEnable.value == true)
                                  // PinFieldAutoFill(
                                  //   decoration: UnderlineDecoration(
                                  //     textStyle: const TextStyle(
                                  //         fontSize: 20, color: Colors.black),
                                  //     colorBuilder: FixedColorBuilder(
                                  //         Colors.black.withOpacity(0.3)),
                                  //   ),
                                  //   currentCode: _code,
                                  //   onCodeSubmitted: (code) {},
                                  //   onCodeChanged: (code) {
                                  //     if (code!.length == 6) {
                                  //       FocusScope.of(context)
                                  //           .requestFocus(FocusNode());
                                  //     }
                                  //   },
                                  // ),
                                  // if (controller.otpEnable.value == true)
                                  // PinFieldAutoFill(
                                  //   controller: otpcontroller,
                                  //   textInputAction: TextInputAction.done,
                                  //   decoration: UnderlineDecoration(
                                  //     textStyle: const TextStyle(
                                  //         fontSize: 20,
                                  //         color: Color.fromARGB(
                                  //             255, 255, 255, 255)),
                                  //     colorBuilder: FixedColorBuilder(
                                  //         const Color.fromARGB(
                                  //                 255, 255, 255, 255)
                                  //             .withOpacity(1)),
                                  //   ),
                                  //   currentCode: _code,
                                  //   codeLength: 6,
                                  //   onCodeSubmitted: (code) {},
                                  //   onCodeChanged: (code) {
                                  //     print(code);
                                  //     setState(() {
                                  //       _code = code!;
                                  //     });

                                  //     if (code!.length == 6) {
                                  //       FocusScope.of(context)
                                  //           .requestFocus(FocusNode());
                                  //     }
                                  //   },
                                  // ),
                                  if (controller.otpEnable.value == true)
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Pinput(
                                        length: 6,
                                        controller: otpcontroller,
                                        focusNode: _focusNode,

                                        androidSmsAutofillMethod:
                                            AndroidSmsAutofillMethod
                                                .smsUserConsentApi,
                                        listenForMultipleSmsOnAndroid: true,
                                        // defaultPinTheme: defaultPinTheme,
                                        separatorBuilder: (index) =>
                                            const SizedBox(width: 8),
                                        // validator: (value) {
                                        //   return value == '2222'
                                        //       ? null
                                        //       : 'Pin is incorrect';
                                        // },
                                        // onClipboardFound: (value) {
                                        //   debugPrint('onClipboardFound: $value');
                                        //   pinController.setText(value);
                                        // },
                                        hapticFeedbackType:
                                            HapticFeedbackType.lightImpact,
                                        onCompleted: (pin) {
                                          debugPrint('onCompleted: $pin');
                                        },
                                        onChanged: (value) {
                                          debugPrint('onChanged: $value');
                                        },
                                        cursor: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 9),
                                              width: 22,
                                              height: 1,
                                              // color: focusedBorderColor,
                                            ),
                                          ],
                                        ),
                                        defaultPinTheme: defaultPinTheme,
                                        // focusedPinTheme:
                                        //     defaultPinTheme.copyWith(
                                        //         decoration: BoxDecoration(
                                        //   borderRadius:
                                        //       BorderRadius.circular(8),
                                        //   border: Border.all(
                                        //       color: ThemeConstants.whitecolor),
                                        // )),
                                        // submittedPinTheme:
                                        //     defaultPinTheme.copyWith(
                                        //   decoration: defaultPinTheme
                                        //       .decoration!
                                        //       .copyWith(
                                        //     color: ThemeConstants.whitecolor,
                                        //     borderRadius:
                                        //         BorderRadius.circular(19),
                                        //     border: Border.all(
                                        //         color:
                                        //             ThemeConstants.whitecolor),
                                        //   ),
                                        // ),
                                        // errorPinTheme:
                                        //     defaultPinTheme.copyBorderWith(
                                        //   border: Border.all(
                                        //       color: Colors.redAccent),
                                        // ),
                                      ),
                                    ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(
                                  //       top: 20, left: 10, right: 10),
                                  //   child: TextFormField(
                                  //       autovalidateMode: AutovalidateMode
                                  //           .onUserInteraction,
                                  //       controller: otpcontroller,
                                  //       keyboardType: TextInputType.number,
                                  //       inputFormatters: [
                                  //         FilteringTextInputFormatter
                                  //             .digitsOnly
                                  //       ],
                                  //       decoration: InputDecoration(
                                  //           border: OutlineInputBorder(
                                  //             borderRadius:
                                  //                 BorderRadius.circular(10.0),
                                  //           ),
                                  //           filled: true,
                                  //           hintStyle: TextStyle(
                                  //               color: Colors.grey[800]),
                                  //           hintText: "Enter your OTP",
                                  //           fillColor: Colors.white),
                                  //       validator: (value) {
                                  //         if (value != null) {
                                  //           if (value.length != 6) {
                                  //             return SnackBarConstants
                                  //                 .OTPError;
                                  //           }
                                  //         }
                                  //         return null;
                                  //       }),
                                  // ),
                                  if (controller.otpEnable.value == true)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, left: 10, right: 10),
                                      child: SizedBox(
                                        height: 55,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              side: BorderSide(
                                                width: 1.0,
                                                color:
                                                    ThemeConstants.whitecolor,
                                              ),
                                              backgroundColor:
                                                  ThemeConstants.bluecolor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12), // <-- Radius
                                              ),
                                            ),
                                            onPressed: () {
                                              print(
                                                  'wwwwwwwddd${otpcontroller.text} dd ${phoneNumber.text}');
                                              if (otpcontroller.text.length ==
                                                  6) {
                                                controller.login(
                                                    phoneNumber.text,
                                                    otpcontroller.text);
                                              } else {
                                                getToast(SnackBarConstants
                                                    .OTPError!);
                                              }
                                            },
                                            child: CustomAutoSizeTextMontserrat(
                                              text: "Login",
                                              textColor: Colors.white,
                                            )),
                                      ),
                                    ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  if (controller.otpEnable.value == true)
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            controller.otpEnable.value = false;
                                            controller.update();
                                          },
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: CustomAutoSizeTextMontserrat(
                                              text: "Change phone number ?",
                                              textColor:
                                                  ThemeConstants.whitecolor,
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
                                            controller.phonenumberVerfiy(
                                                phoneNumber.text);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: CustomAutoSizeTextMontserrat(
                                              text: "Resend OTP",
                                              textColor:
                                                  ThemeConstants.whitecolor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      phoneNumber.clear();
                                      controller.otpEnable.value = false;
                                      controller.update();
                                      Get.toNamed(
                                          RegisterationMainView.routeNmaed);
                                    },
                                    child: CustomRichTextWidget(
                                        fontWeight2: FontWeight.w700,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13,
                                        textColor: ThemeConstants.whitecolor,
                                        text1: "Don't have Account?",
                                        textColor2: ThemeConstants.whitecolor,
                                        // textColor: ThemeConstants.yellow,
                                        text: " Register now"),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                            )
                          ]),
                    ),
                  ],
                )),
            onLoading: getLoading(context)));
  }
}
