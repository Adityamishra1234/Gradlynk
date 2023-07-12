import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:studentpanel/ui/screen/mark_attendance/mark_attendance_controller.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/custombutton.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

class CodeScreen extends StatelessWidget {
  CodeScreen({super.key});

  var controller = Get.put(MarkAttendanceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar("title"),
        drawer: CustomDrawer(),
        body: controller.obx(
          onLoading: getLoading(context),
          (state) => Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 420,
                child: Card(
                  elevation: 5,
                  child: ListView(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ThemeConstants.bluecolor),
                              shape: BoxShape.circle,
                              color: ThemeConstants.ultrilightblue),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                                "assets/images/mark_attandence.png"),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: CustomAutoSizeTextMontserrat(
                          text: "Kindly specify the Event Code",
                          textColor: ThemeConstants.bluecolor,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: PinCodeTextField(
                          keyboardType: TextInputType.text,
                          controller: MarkAttendanceController.code,
                          appContext: context,
                          pastedTextStyle: TextStyle(
                            backgroundColor: ThemeConstants.whitecolor,
                            color: ThemeConstants.TextColor,
                            fontWeight: FontWeight.bold,
                          ),
                          length: 6,
                          obscureText: true,
                          obscuringCharacter: '*',
                          obscuringWidget: CustomAutoSizeTextMontserrat(
                            text: "*",
                            fontSize: 25,
                          ),
                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          validator: (v) {
                            if (v!.length < 6) {
                              return "Kindly enter your event code";
                            } else {
                              return null;
                            }
                          },
                          pinTheme: PinTheme(
                            activeColor: ThemeConstants.TextColor,
                            selectedColor: ThemeConstants.TextColor,
                            selectedFillColor: ThemeConstants.whitecolor,
                            inactiveFillColor: ThemeConstants.whitecolor,
                            inactiveColor: ThemeConstants.TextColor,
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            activeFillColor: Colors.white,
                          ),
                          cursorColor: Colors.black,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          // errorAnimationController: errorController,
                          // controller: textEditingController,

                          boxShadows: const [
                            BoxShadow(
                              offset: Offset(0, 1),
                              color: Colors.black12,
                              blurRadius: 10,
                            )
                          ],
                          onCompleted: (v) {
                            debugPrint("Completed");
                          },
                          // onTap: () {
                          //   print("Pressed");
                          // },
                          onChanged: (value) {
                            debugPrint(value);
                            // setState(() {
                            //   currentText = value;
                            // });
                          },
                          beforeTextPaste: (text) {
                            debugPrint("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 55,
                        child: CustomButton(
                            text: "Confirm",
                            onPressed: () async {
                              controller.getMarkAttendance(
                                  MarkAttendanceController.code.text);
                              controller.update();
                            },
                            backgroundColor: ThemeConstants.bluecolor),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
