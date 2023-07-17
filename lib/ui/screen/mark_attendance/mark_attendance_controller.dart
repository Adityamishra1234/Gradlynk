import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/ui/screen/dashboard/models/evenZonestatusModel.dart';
import 'package:studentpanel/ui/screen/mark_attendance/intake_screen.dart';
import 'package:studentpanel/ui/screen/mark_attendance/markAttendanceDocumentStatus.dart';
import 'package:studentpanel/ui/screen/mark_attendance/model/mark_attendance_intake.dart';
import 'package:studentpanel/ui/screen/mark_attendance/model/mark_attendance_model.dart';
import 'package:studentpanel/ui/screen/upload_document/uploaddocument.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';

class MarkAttendanceController extends GetxController with StateMixin {
  ApiServices apiServices = ApiServices();
  MarkAttendanceModel markAttendanceModel = MarkAttendanceModel();
  static TextEditingController code = TextEditingController();

  MarkAttendanceIntake markAttendanceIntakeModel = MarkAttendanceIntake();

  String? eventSelected;
  String? id;

  String? intake;

  @override
  void onInit() {
    change(null, status: RxStatus.success());
  }

  String campaignName = '';
  String passName = '';

  bool showBelowContent = false;
  getMarkAttendance(String code) async {
    change(null, status: RxStatus.loading());
    var res = await apiServices.getMarkAttandance(getMarkAttendanceForEvent(
        Get.find<BaseController>().model1.id.toString(), code));
    if (res != null) {
      markAttendanceModel = MarkAttendanceModel.fromJson(res);

      if (markAttendanceModel.uniqueCodeMatch == true) {
        campaignName = markAttendanceModel.campaignName!;
        // passName = markAttendanceModel.pa!;

        await allTimeAPI();
        if (markAttendanceModel.attendanceMarked == false) {
          Get.to(IntakeScreen(
            id: markAttendanceModel.campaignId.toString(),
          ));
        }
      } else {
        getToast("Event code not matched");
      }
    }
    showBelowContent = true;
    change(null, status: RxStatus.success());
    update();
  }

  allTimeAPI({String? campaignId}) async {
    change(null, status: RxStatus.loading());
    var res = await apiServices.allTimeMarkAttandance(getMarkAttandenceAllTime(
        Get.find<BaseController>().model1.id.toString(),
        campaignId ?? markAttendanceModel.campaignId.toString()));
    if (res != null) {
      code = TextEditingController();
      code.text = "";
      change(null, status: RxStatus.success());
    }
  }

  getIntakeSubmit(String campaign_id) async {
    change(null, status: RxStatus.loading());

    if (intake != null) {
      var res = await apiServices.markAttendanceIntake(markAttendanceIntake(
          //TODO HardCoded
          campaign_id: campaign_id,
          enq_id: Get.find<BaseController>().model1.id.toString(),
          intake_month: intake!.split("-")[1],
          intake_year: intake!.split("-")[0]));
      if (res != null) {
        markAttendanceIntakeModel = MarkAttendanceIntake.fromJson(res);
        await allTimeAPI(campaignId: campaign_id);
        if (markAttendanceIntakeModel.documentExists == false) {
          Get.to(MarkAttendanceDocumentStatus());
        } else {
          getToast("kindly view your express pass view option");
          Get.toNamed(DashBoard.routeNamed);
        }
      }
    } else {
      getToast("kindly select your date");
      change(null, status: RxStatus.success());
    }
  }
}
