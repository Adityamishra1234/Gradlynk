import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/applicationdetailmodel.dart';
import 'package:studentpanel/ui/screen/My_Application/applicationcompletedetail.dart';
import 'package:studentpanel/ui/screen/track_application/applicationdetail.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';

class ApplicationCompleteDetailsController extends GetxController {
  RxBool loadingApplicationCompleteDetails = false.obs;
  RxBool loadingUploadDocument = false.obs;
  ApiServices apiServices = ApiServices();
  ApplicationDetailModel model = ApplicationDetailModel();

  @override
  void onInit() {
    getApplicationDetailComplete(Get.arguments.toString());
  }

//Function
  getApplicationDetailComplete(String? apliId) async {
    loadingApplicationCompleteDetails.value = false;
    var response = await apiServices.getApplicationDetails(
        Endpoints.applicationDetail, apliId);
    if (response != null) {
      model = response;
      loadingApplicationCompleteDetails.value = true;
      update();
    } else {
      Get.back();
    }
  }

  uploadDocument(String id, int index) async {
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
          getsnakbar("Document Upload", "Please file upload maximum 5 MB");
        } else {
          String? res = await apiServices.sendFile(
              csvFile2.path,
              uploadFilename,
              Get.find<BaseController>().model1.id.toString(),
              id,
              Endpoints.applicationDocumentUpload!);
          model.documents![index].viewLink = res;
          update();
        }
      }
    }
  }

  uploadFileCamera(
      String id, String index, String filePath, String applicationId) async {
    print(filePath);
    String? res = await apiServices.sendFile(
        filePath,
        filePath,
        Get.find<BaseController>().model1.id.toString(),
        id.toString(),
        Endpoints.applicationDocumentUpload!);
    model.documents![int.parse(index)].viewLink = res;
    Get.offNamed(ApplicationCompleteDetails.routeNamed,
        arguments: applicationId);
  }
}
