import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:studentpanel/ui/screen/mark_attendance/mark_attendance_controller.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customRichTextWidget.dart';
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
          (state) => SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        // border: Border.all(color: ThemeConstants.bluecolor),
                        shape: BoxShape.circle,
                        color: ThemeConstants.ultrilightblue),
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Image.asset("assets/images/mark_attandence.png"),
                    )),
                const SizedBox(
                  height: 20,
                ),
                CustomAutoSizeTextMontserrat(
                  text: "Kindly specify the Event Code",
                  textColor: ThemeConstants.bluecolor,
                  fontSize: 15,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: PinCodeTextField(
                    enablePinAutofill: false,
                    autoDisposeControllers: false,
                    keyboardType: TextInputType.text,
                    controller: MarkAttendanceController.code,
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      backgroundColor: ThemeConstants.ultrilightblue,
                      color: ThemeConstants.TextColor,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 6,
                    cursorHeight: 15,

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
                      fieldHeight: 40,
                      fieldWidth: 35,
                      activeFillColor: ThemeConstants.ultrilightblue,
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
                    onCompleted: (v) {},
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                      // debugPrint(value);
                      // // setState(() {
                      // //   currentText = value;
                      // // });
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
                      onPressed: () {
                        controller.getMarkAttendance(
                            MarkAttendanceController.code.text);
                        controller.update();
                      },
                      backgroundColor: ThemeConstants.bluecolor),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (controller.markAttendanceModel.studentCategory != null)
                  if (controller.showBelowContent != false) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: CustomAutoSizeTextMontserrat(
                        textalingCentre: true,
                        fontWeight: FontWeight.w700,
                        text: controller.markAttendanceModel.campaignName,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (controller.markAttendanceModel.studentCategory != null)
                      CustomAutoSizeTextMontserrat(
                          textColor: ThemeConstants.red,
                          fontSize: 13,
                          text: "Your Attendance has been Marked."),
                    const SizedBox(
                      height: 5,
                    ),
                    if (controller.markAttendanceModel.studentCategory != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: CustomRichTextWidget(
                            firstTextColor: ThemeConstants.blackcolor,
                            customMiddleTextStyle: GoogleFonts.dancingScript(),
                            text1: 'Your',
                            text3:
                                'has been generated in the View Express Pass Section.',
                            textColor: const Color(0xFFebaa2b),
                            fontSize: 16,
                            text:
                                " ${controller.markAttendanceModel.studentCategory ?? ""} Express Pass "),
                      ),
                    const SizedBox(
                      height: 30,
                    ),
                  ]
              ],
            ),
          ),
        ));
  }
}
