import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:studentpanel/new_widgets/app_text_field.dart';
import 'package:studentpanel/new_widgets/custom_text.dart';

import '../../../new_widgets/custom_button.dart';
import '../../../new_widgets/text_fields.dart';
import '../../../utils/theme.dart';
import '../../screen/Login_Module/LoginScreen.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});
  static const routeNamed = '/OTPVerificationScreen';
  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  TextEditingController otpController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: BackButton(
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Text('Verification Code',
                          overflow: TextOverflow.ellipsis,
                          textScaler: TextScaler.noScaling,
                          style: buttonStyleOpenSans(
                              ThemeConstants.greenColor, FontWeight.bold, 32)),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomMandatoryText(text: 'Enter six digit code',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,),
                      const SizedBox(
                        height: 50,
                      ),
                      Text('+917541****08',
                          overflow: TextOverflow.ellipsis,
                          textScaler: TextScaler.noScaling,
                          style: buttonStyleOpenSans(
                              ThemeConstants.blackcolor, FontWeight.w500, 18)),
                      const SizedBox(
                        height: 10,
                      ),
                      PinCodeTextField(
                        appContext: context,
                        autoDisposeControllers: false,
                        enablePinAutofill: true,
                        controller: otpController,
                        keyboardType: TextInputType.number,
                        length: 6,validator: (v) {
                        if (v!.length < 6) {
                          return "Kindly enter six digit code";
                        } else {
                          return null;
                        }
                      },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        cursorColor: ThemeConstants.blackcolor,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(8),
                          fieldHeight: 40,
                          fieldWidth: 35,
                          activeFillColor: Colors.white,
                          selectedColor: ThemeConstants.greenColor,
                          inactiveColor: ThemeConstants.TextColor,
                        ),
                        onCompleted: (value) async {},
                        onChanged: (value) {},
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      CustomButton3(
                          text: "Verify OTP",
                          height: 50,
                          containerColor: ThemeConstants.greenColor,
                          buttonTextSize: 16,
                          fw: FontWeight.w500),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "Don’t Receive an OTP? ",
                              overflow: TextOverflow.ellipsis,
                              textScaler: TextScaler.noScaling,
                              style: buttonStyleOpenSans(
                                  ThemeConstants.blackcolor,
                                  FontWeight.w400,
                                  16),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Get.toNamed(LoginScreen.routeNamed);
                            },
                            child: Text('Resend Now',
                                overflow: TextOverflow.ellipsis,
                                textScaler: TextScaler.noScaling,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: ThemeConstants.greenColor,
                                    decoration: TextDecoration.underline,
                                    decorationColor: ThemeConstants.greenColor,
                                    decorationThickness: 2)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
