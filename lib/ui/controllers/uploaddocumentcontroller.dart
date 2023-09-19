import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/commonuploaddocument.dart';
import 'package:studentpanel/ui/models/comonDocumentUploadStatus.dart';
import 'package:studentpanel/ui/models/dropdownOrgName.dart';
import 'package:studentpanel/ui/models/dropdownUploadDocument.dart';
import 'package:studentpanel/ui/models/dropdowndocumenttype.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/ui/screen/upload_document/uploaddocument.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';

class UploadDocumentController extends GetxController {
  ApiServices apiServices = ApiServices();
  List<DropDownDocumentType> dropdownDocumentType = [];
  List<DropDownDocumentName> dropdownDocumentName = [];
  List<DropDownorganisationName> dropdownOrganization = [];
  List<CommonUploadDocument> documentModel = [];

  //DropDown fields
  List<String> documenttypeName = [];
  List<int> documenttypeId = [];
  List<String> documentNameName = [];
  List<int> documentNameId = [];
  List<String> organizationName = [];
  List<int> organizationId = [];

  //Select
  String? documentTypeSelectedName;
  int? documentTypeSelectedID;
  String? documentNameSelectedName;
  int? documentNameSelectedID;
  String? organizationSelectedName;
  int? organizationSelectedID;

  RxBool loadingDocumentType = false.obs;
  RxBool loadingDocumentName = false.obs;
  RxBool loadingOrgName = false.obs;
  RxBool loadingCommonDocument = false.obs;
  int is_event = 0;

  @override
  Future<void> onInit() async {
    super.onInit();
    List<Future> futures = [
      getDocumentType(),
      getOrganizationName(),
      getcommondocument()
    ];

    await Future.wait(futures);

    if (Get.arguments != null) {
      is_event = Get.arguments;
    }
  }

  getDocumentType() async {
    try {
      documentTypeSelectedName = null;
      documentTypeSelectedID = null;
      documentNameSelectedName = null;
      documentNameSelectedID = null;
      organizationSelectedName = null;
      organizationSelectedID = null;
      documenttypeName = [];
      documenttypeId = [];
      documentNameName = [];
      documentNameId = [];
      organizationName = [];
      organizationId = [];
      documenttypeName = [];
      documenttypeId = [];
      documentTypeSelectedName = null;
      documentTypeSelectedID = null;
      var res =
          await apiServices.getDropdownUploadDocument(Endpoints.documentList!);
      if (res != null) {
        documenttypeName.add("Select your document type");
        documenttypeId.add(0);
        dropdownDocumentType = res;
        for (var element in dropdownDocumentType) {
          documenttypeName.add(element.documentType!);
          documenttypeId.add(element.id!);
        }
        loadingDocumentType = true.obs;
        update();
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

  getOrganizationName() async {
    try {
      organizationName = [];
      organizationId = [];
      organizationSelectedName = null;
      organizationSelectedID = null;
      var res = await apiServices.getOrganizationDropDown(
          Endpoints.orranizationWorkList! +
              Get.find<BaseController>().model1.id.toString());
      if (res != null) {
        organizationName.add("Select your organiztion name");
        organizationId.add(0);
        dropdownOrganization = res;
        for (var element in dropdownOrganization) {
          organizationName
              .add("${element.organisationName!} [${element.applicantType!}]");
          organizationId.add(element.id!);
        }
        loadingOrgName = true.obs;
        update();
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

  getDocumentName(String enqId, String documentID,
      {String organizationName = ""}) async {
    try {
      documentNameName = [];
      documentNameId = [];
      documentNameSelectedName = null;
      documentNameSelectedID = null;

      var res = await apiServices.getDocumentName(
          "${Endpoints.documentNameForDocumentTypePart1}$enqId${Endpoints.documentNameForDocumentTypePart2}$documentID${Endpoints.documentNameForDocumentTypePart3}$organizationName");
      if (res != null) {
        documentNameName.add("Select your document Name");
        documentNameId.add(0);
        dropdownDocumentName = res;
        for (var element in dropdownDocumentName) {
          documentNameName.add(element.documentName!);
          documentNameId.add(element.id!);
        }
        loadingDocumentName = true.obs;
        update();
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

  getcommondocument() async {
    try {
      var res = await apiServices.getcommondocument(
          Endpoints.commonUploadDocument! +
              Get.find<BaseController>().model1.id.toString());
      if (res != null) {
        documentModel = res;
        loadingCommonDocument = true.obs;
        update();
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

  uploadFileCamera(String id, String filePath, {String orgName = ""}) async {
    try {
      var res = await apiServices.uploadDocumentCommon(filePath, filePath,
          Get.find<BaseController>().model1.id.toString(), id.toString(),
          orgname: orgName, is_event: is_event);
      if (res != null) {
        CommonUploadStatus model = CommonUploadStatus();
        model = res;
        if (model.status == "sucesss") {
          documentModel.add(model.dataModal!);
        }
        getDocumentType();
        getOrganizationName();
      } else {
        getDocumentType();
        getOrganizationName();
        if (is_event == 1) {
          Get.offAndToNamed(DashBoard.routeNamed);
        }
      }
      if (is_event == 1) {
        Get.offAndToNamed(DashBoard.routeNamed);
      } else {
        Get.offNamed(UploadDocument.routeNamed);
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

  uploadDocument(
    String id, {
    String orgname = "",
  }) async {
    try {
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
                is_event: is_event);
            if (res != null) {
              CommonUploadStatus model = CommonUploadStatus();
              model = res;
              if (model.status == "sucesss") {
                documentModel.add(model.dataModal!);
              }
              getDocumentType();
              getOrganizationName();
            }
            if (is_event == 1) {
              Get.offAndToNamed(DashBoard.routeNamed);
            }
            update();
          }
        }
      }
    } catch (e) {
      await getToast('Please give Storage Permission');
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }
}
