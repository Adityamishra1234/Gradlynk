import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/mark_attendance/mark_attendance_controller.dart';
import 'package:studentpanel/ui/screen/upload_document/uploaddocument.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/Custom_time_widgets.dart/custom_timer_widget.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/custombutton.dart';

class IntakeScreen extends StatelessWidget {
  IntakeScreen({super.key});

  var controller = Get.put(MarkAttendanceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        onLoading: getLoading(context),
        (state) => Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.5,
              child: Card(
                elevation: 5,
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            border: Border.all(color: ThemeConstants.bluecolor),
                            shape: BoxShape.circle,
                            color: ThemeConstants.ultrilightblue),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Image.asset("assets/images/mark_At_intake.png"),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: CustomAutoSizeTextMontserrat(
                        text: "What your target intake",
                        textColor: ThemeConstants.bluecolor,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: SizedBox(
                          height: 50,
                          child: CustomTimerWidget(callback: (value) {
                            controller.intake = value;
                            controller.update();
                          })),
                    ),
                    SizedBox(
                      height: 55,
                      child: CustomButton(
                          text: "Next",
                          onPressed: () {
                            controller.getIntakeSubmit();
                          },
                          backgroundColor: ThemeConstants.bluecolor),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
