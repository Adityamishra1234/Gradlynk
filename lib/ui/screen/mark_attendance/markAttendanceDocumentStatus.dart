import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/ui/screen/mark_attendance/mark_attendance_controller.dart';
import 'package:studentpanel/ui/screen/upload_document/uploaddocument.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customRichTextWidget.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/custombutton.dart';

class MarkAttendanceDocumentStatus extends StatelessWidget {
  MarkAttendanceDocumentStatus({super.key});

  var controller = Get.put(MarkAttendanceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: ListView(
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
                      child: Image.asset("assets/images/mark_attandence.png"),
                    )),
                const SizedBox(
                  height: 20,
                ),
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
                  CustomRichTextWidget(
                      firstTextColor: ThemeConstants.blackcolor,
                      customMiddleTextStyle: GoogleFonts.dancingScript(),
                      text1: 'Your',
                      text3: 'has been generated.',
                      textColor: const Color(0xFFebaa2b),
                      fontSize: 16,
                      text:
                          " ${controller.markAttendanceModel.studentCategory ?? ""} Express Pass "),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: 100,
                      child: CustomButton(
                        backgroundColor: ThemeConstants.bluecolor,
                        onPressed: () {
                          Get.to(UploadDocument(is_event: true), arguments: 1);
                        },
                        text: 'Yes',
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: CustomButton(
                        backgroundColor: ThemeConstants.bluecolor,
                        onPressed: () {
                          Get.toNamed(DashBoard.routeNamed);
                        },
                        text: 'No',
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
