import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/comonDocumentUploadStatus.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';

import '../model/eventdocumentUpload.dart';

class EventDocumentUploadController extends GetxController with StateMixin {
  ApiServices apiServices = ApiServices();
  eventModuleModel model = eventModuleModel();

  List listIdentity = [];
  List listAcedmic = [];

  String? identityselected;
  String? academicselected;
  String? identityIDselected;
  String? academicIDselected;

  @override
  Future<void> onInit() async {
    await getEventData();
    super.onInit();
  }

  getEventData() async {
    change(null, status: RxStatus.loading());
    var res = await apiServices
        .getEventdocument(Get.find<BaseController>().model1.id.toString());
    if (res != null) {
      model = res;
      if (model.documentsAcedmicData != null &&
          model.documentsIdentityData != null) {
        getToast(
            "Your are now eligible for Platinum Pass. Visit the View Express Pass Section.");
        await Get.find<BaseController>()
            .eventZone(Get.find<BaseController>().model1.id.toString());
        Get.offAndToNamed(DashBoard.routeNamed);
      }

      model.documentsListIdentity?.forEach((element) {
        listIdentity.add(element.name);
      });
      if (model.documentsListIdentity != null) {
        identityselected = listIdentity[0];
        identityIDselected = model.documentsListIdentity![0].id.toString();
      }

      model.documentsListAcedmic?.forEach((element) {
        listAcedmic.add(element.name);
      });
      if (model.documentsListAcedmic != null) {
        academicselected = listAcedmic[0];
        academicIDselected = model.documentsListAcedmic![0].id.toString();
      }
    }
    change(null, status: RxStatus.success());
  }

  uploadFileCamera(String id, String filePath, {String orgName = ""}) async {
    change(null, status: RxStatus.loading());
    try {
      var res = await apiServices.uploadDocumentCommon(filePath, filePath,
          Get.find<BaseController>().model1.id.toString(), id.toString(),
          orgname: orgName, is_event: 1);
      if (res != null) {
        CommonUploadStatus model = CommonUploadStatus();
        model = res;
        await getEventData();
        //   if (model.status == "sucesss") {
        //     // documentModel.add(model.dataModal!);
        //   }
        //   getDocumentType();
        //   getOrganizationName();
        // } else {
        //   getDocumentType();
        //   getOrganizationName();
        //   if (is_event == 1) {
        //     Get.offAndToNamed(DashBoard.routeNamed);
        //   }
      }
      // if (is_event == 1) {
      //   Get.offAndToNamed(DashBoard.routeNamed);
      // } else {
      //   Get.offNamed(UploadDocument.routeNamed);
      // }
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }

  uploadDocument(
    String id, {
    String orgname = "",
  }) async {
    try {
      change(null, status: RxStatus.loading());
      String uploadFilename = "";
      PlatformFile? csvFile2;
      final results = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'tiff', 'pdf', 'doc', 'docx'],
      );
      if (results != null) {
        csvFile2 = results.files.first;
        uploadFilename = results.files.first.name;
      }
      if (csvFile2 != null) {
        if (csvFile2.path != null) {
          final f = File(csvFile2.path!);
          int sizeInBytes = f.lengthSync();
          double sizeInMb = sizeInBytes / (1024 * 1024);
          if (sizeInMb > 5) {
            getToast(SnackBarConstants.maxDocumentUploadSize!);
          } else {
            var res = await apiServices.uploadDocumentCommon(
                csvFile2.path,
                uploadFilename,
                Get.find<BaseController>().model1.id.toString(),
                id,
                orgname: orgname,
                is_event: 1);
            if (res != null) {
              // CommonUploadStatus model = CommonUploadStatus();
              // model = res;
              await getEventData();
              // if (model.status == "sucesss") {
              //   documentModel.add(model.dataModal!);
              // }
              // getDocumentType();
              // getOrganizationName();
            }
            // if (is_event == 1) {
            //   Get.offAndToNamed(DashBoard.routeNamed);
            // }
          }
        }
      }
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }
}
