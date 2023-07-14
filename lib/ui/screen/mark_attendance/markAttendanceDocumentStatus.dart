import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/ui/screen/mark_attendance/mark_attendance_controller.dart';
import 'package:studentpanel/ui/screen/upload_document/uploaddocument.dart';
import 'package:studentpanel/utils/theme.dart';
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
            child: Card(
              elevation: 5,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: CustomAutoSizeTextMontserrat(
                      text: "Do you upload your document",
                      textColor: ThemeConstants.bluecolor,
                      fontSize: 18,
                    ),
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
                            Get.to(UploadDocument(is_event: true),
                                arguments: 1);
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
      ),
    );
  }
}
