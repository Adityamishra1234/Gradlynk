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
import 'package:studentpanel/ui/screen/upload_document/uploaddocument.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';

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

  @override
  void onInit() {
    super.onInit();
    getDocumentType();
    getOrganizationName();
    getcommondocument();
  }

  getDocumentType() async {
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
      dropdownDocumentType.forEach((element) {
        documenttypeName.add(element.documentType!);
        documenttypeId.add(element.id!);
      });
      loadingDocumentType = true.obs;
      update();
    }
  }

  getOrganizationName() async {
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
      dropdownOrganization.forEach((element) {
        organizationName
            .add("${element.organisationName!} [${element.applicantType!}]");
        organizationId.add(element.id!);
      });
      loadingOrgName = true.obs;
      update();
    }
  }

  getDocumentName(String enqId, String documentID,
      {String organizationName = ""}) async {
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
      dropdownDocumentName.forEach((element) {
        documentNameName.add(element.documentName!);
        documentNameId.add(element.id!);
      });
      loadingDocumentName = true.obs;
      update();
    }
  }

  getcommondocument() async {
    var res = await apiServices.getcommondocument(
        Endpoints.commonUploadDocument! +
            Get.find<BaseController>().model1.id.toString());
    if (res != null) {
      documentModel = res;
      loadingCommonDocument = true.obs;
      update();
    }
  }

  uploadFileCamera(String id, String filePath, {String orgName = ""}) async {
    print(filePath);
    var res = await apiServices.uploadDocumentCommon(filePath, filePath,
        Get.find<BaseController>().model1.id.toString(), id.toString(),
        orgname: orgName);
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
    }
    Get.offNamed(UploadDocument.routeNamed);
  }

  uploadDocument(String id, {String orgname = ""}) async {
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
          var res = await apiServices.uploadDocumentCommon(
              csvFile2.path,
              uploadFilename,
              Get.find<BaseController>().model1.id.toString(),
              id,
              orgname: orgname);
          if (res != null) {
            CommonUploadStatus model = CommonUploadStatus();
            model = res;
            if (model.status == "sucesss") {
              documentModel.add(model.dataModal!);
            }
            getDocumentType();
            getOrganizationName();
          }
          update();
        }
      }
    }
  }
}
