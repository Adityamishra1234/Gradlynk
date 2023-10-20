import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/screen/dashboard/models/evenZonestatusModel.dart';
import 'package:studentpanel/ui/screen/mark_attendance/mark_attendance_controller.dart';
import 'package:studentpanel/ui/screen/upload_document/uploaddocument.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/Custom%20Dropdown/custom_dropdown.dart';
import 'package:studentpanel/widgets/Custom_time_widgets.dart/custom_timer_widget.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/custombutton.dart';
import 'package:studentpanel/widgets/customdropdownbutton.dart';

class IntakeScreen extends StatefulWidget {
  String? id;
  IntakeScreen({Key? key, this.id}) : super(key: key);

  @override
  State<IntakeScreen> createState() => _IntakeScreenState();
}

class _IntakeScreenState extends State<IntakeScreen> {
  var controller = Get.put(MarkAttendanceController());

  @override
  void dispose() {
    controller.onDelete;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        onLoading: getLoading(context),
        (state) => Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                          // border: Border.all(color: ThemeConstants.bluecolor),
                          shape: BoxShape.circle,
                          color: ThemeConstants.ultrilightblue),
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Image.asset("assets/images/mark_At_intake.png"),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (Get.find<BaseController>().eventlist.length > 1)
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: CustomAutoSizeTextMontserrat(
                      text: "Select your event",
                      fontSize: 14,
                      textColor: ThemeConstants.bluecolor,
                    ),
                  ),
                if (Get.find<BaseController>().eventlist.length > 1)
                  CustomDropDownSingle(
                    selectedValue: controller.eventSelected,
                    bgColor: ThemeConstants.ultraLightgreyColor2,
                    model: Get.find<BaseController>().eventlist,
                    initialSelectedValue:
                        Get.find<BaseController>().eventlist[0],
                    choosefieldtype: false,
                    callbackFunction: (value) {
                      for (var i = 0;
                          i < Get.find<BaseController>().eventlist.length;
                          i++) {
                        if (Get.find<BaseController>().eventlist[i] == value) {
                          controller.eventSelected = value;
                          controller.id = Get.find<BaseController>()
                              .meetingZoneStatus
                              .campaignDetails![i]
                              .id
                              .toString();
                        }
                      }
                    },
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: CustomAutoSizeTextMontserrat(
                    text: "What is your target intake?",
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
                      child: CustomTimerWidget(
                          startingDate: DateTime.now(),
                          isBlank: true,
                          callback: (value) {
                            controller.intake = value;
                            controller.update();
                          })),
                ),
                Center(
                  child: SizedBox(
                    height: 55,
                    child: CustomButton(
                        text: "Next",
                        onPressed: () {
                          try {
                            if (widget.id != null) {
                              controller.getIntakeSubmit(widget.id!);
                            } else {
                              if (Get.find<BaseController>().eventlist.length >
                                  1) {
                                controller.getIntakeSubmit(controller.id!);
                              } else {
                                if (Get.find<BaseController>()
                                        .meetingZoneStatus
                                        .campaignDetails !=
                                    null) {
                                  controller.getIntakeSubmit(
                                      Get.find<BaseController>()
                                          .meetingZoneStatus
                                          .campaignDetails![0]
                                          .id
                                          .toString());
                                } else {
                                  getToast('Campaign detail not found');
                                }
                              }
                            }
                          } catch (e) {}
                        },
                        backgroundColor: ThemeConstants.bluecolor),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
