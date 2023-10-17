import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/ui/screen/dashboard/models/evenZonestatusModel.dart';
import 'package:studentpanel/ui/screen/mark_attendance/afterIntakePassView.dart';
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
  Future<void> onInit() async {
    url = await apiServices.getBaseUrlForAllApi();
    change(null, status: RxStatus.success());
  }

  String campaignName = '';
  String passName = '';

  bool showBelowContent = false;

  var url;

  getMarkAttendance() async {
    try {
      change(null, status: RxStatus.loading());
      var res = await apiServices.getMarkAttandance(getMarkAttendanceForEvent(
          Get.find<BaseController>().model1.id.toString(), code.text));
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
          showBelowContent = true;
        } else {
          code.clear();
          getToast("Event code not matched");
        }
      }

      change(null, status: RxStatus.success());
      update();
    } catch (e) {
      await apiServices.errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  allTimeAPI({String? campaignId}) async {
    change(null, status: RxStatus.loading());

    var res = await apiServices.allTimeMarkAttandance(
        url,
        getMarkAttandenceAllTime(
            Get.find<BaseController>().model1.id.toString(),
            campaignId ?? markAttendanceModel.campaignId.toString()));
    if (res != null) {
      code = TextEditingController();
      code.text = "";
      change(null, status: RxStatus.success());
    }
  }

  getIntakeSubmit(String campaign_id) async {
    try {
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
            if (markAttendanceIntakeModel.studentCategory == "C") {
              getToast(
                  "Your Silver Express Pass is accessible in View Express Pass Section.");
              Get.offAndToNamed(DashBoard.routeNamed);
            } else {
              Get.to(AfterIntakeScreenView(), arguments: campaign_id);
            }
          } else {
            getToast("kindly view your express pass view option");
            Get.offAndToNamed(DashBoard.routeNamed);
          }
        }
      } else {
        getToast("kindly select your date");
        change(null, status: RxStatus.success());
      }
    } catch (e) {
      await apiServices.errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  documentNotSubmi(String campainID) async {
    String endpoint = documentNotSubmit(
        Get.find<BaseController>().model1.id.toString(), campainID);

    var res = await apiServices.eventOcumentznotSubmited(endpoint);
  }
}
