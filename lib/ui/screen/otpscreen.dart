import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:studentpanel/ui/controllers/logincontroller.dart';
import 'package:studentpanel/ui/controllers/otpscreencontroller.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({Key? key}) : super(key: key);
  static const routeNamed = '/OTPScreen';
  var controller = Get.put(OTPScreenController());
  String? otp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: ThemeConstants.bluecolor),
          child: ListView(
            controller: ScrollController(),
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Row(
                children: [
                  const Spacer(),
                  CustomAutoSizeTextMontserrat(
                    text: "OTP has been send to",
                    textColor: Colors.white,
                    fontSize: 24,
                  ),
                  const Spacer()
                ],
              ),
              Row(
                children: [
                  const Spacer(),
                  CustomAutoSizeTextMontserrat(
                    text: "your sms",
                    textColor: Colors.white,
                    fontSize: 24,
                  ),
                  const Spacer()
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Image.network(
                "https://sieceducation.in/assets/assets/images/otp.png",
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                heightFactor: 1,
                child: Container(
                  height: 230,
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
                            const EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(
                                    10) //                 <--- border radius here
                                ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: OTPTextField(
                              contentPadding:
                                  const EdgeInsets.only(top: 0, bottom: 10),
                              length: 6,
                              width: MediaQuery.of(context).size.width,
                              fieldWidth: 25,
                              style: const TextStyle(fontSize: 17),
                              textFieldAlignment: MainAxisAlignment.spaceAround,
                              fieldStyle: FieldStyle.underline,
                              onCompleted: (pin) {
                                debugPrint("Completed: $pin");
                                otp = pin;
                              },
                            ),
                          ),
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
                                if (otp != null) {
                                  if (otp!.length == 6) {
                                    Get.find<LoginController>()
                                        .login(Get.arguments, otp!);
                                  }
                                }
                              },
                              child: CustomAutoSizeTextMontserrat(
                                text: "Submit",
                                textColor: Colors.white,
                              )),
                        ),
                      ),
                      GetBuilder<OTPScreenController>(
                          builder: (_) => Column(
                                children: [
                                  if (_.loadingcounter.value == true)
                                    TextButton(
                                        onPressed: () {},
                                        child: CustomAutoSizeTextMontserrat(
                                          text: "Resend OTP",
                                          textColor: ThemeConstants.bluecolor,
                                        )),
                                  if (_.loadingcounter.value == false)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: CustomAutoSizeTextMontserrat(
                                        text:
                                            "Resend OTP in 00:${_.count.value}",
                                      ),
                                    )
                                ],
                              ))
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
