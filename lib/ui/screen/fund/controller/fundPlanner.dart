import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/screen/fund/model/fundPlanner.dart';
import 'package:studentpanel/ui/screen/fund/plan_fund.dart';
import 'package:studentpanel/ui/screen/fund/sponsorDetails.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/widgets/custom_doc_viewer.dart';
import 'package:studentpanel/widgets/custom_image_viewer.dart';
import 'package:studentpanel/widgets/permission_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:device_info_plus/device_info_plus.dart';

class FundPlannerController extends GetxController with StateMixin {
  ApiServices apiServices = ApiServices();
  fundPlanner fundplanner = fundPlanner();
  //dropdown
  List sourceIncomeName = [];
  List sourceIncomeID = [];
  List occupationName = [];
  List occupationID = [];

  bool loadingBank = false;
  List bankName = [];
  List bankID = [];
  List relationShip = [
    'Father',
    'Mother',
    'Paternal Uncle',
    'Maternal Uncle',
    'Paternal Aunt',
    'Maternal Aunt',
    'Sister',
    'Brother',
    'Spouse',
    'Paternal Grand-Father',
    'Maternal Grand-Father',
    'Paternal Grand-Mother',
    'Maternal Grand-Mother',
    'Father-in-law',
    'Mother-in-law'
  ];

// Selected
  String? countrySelected,
      nameFinancial,
      selectedSourceOfIncome,
      occupationNameSelect;
  int? countryId, name_FinancialID, selectedSourceID, occupationIDSelect;
  bool? fund_6_month_old = false;

  String? selectedRelationship;
  TextEditingController nameOfThePerson = TextEditingController();
  // TextEditingController occupationOfSponsor = TextEditingController();
  // TextEditingController nameOfTheFinnacialIntitution = TextEditingController();
  TextEditingController amountData = TextEditingController();
  // TextEditingController countryOfTheFinnacialIntitution= TextEditingController();
  // TextEditingController occupationOfSponsor = TextEditingController();

  // TextEditingController occupationOfSponsor = TextEditingController();

  // condition
  bool firstTime = true;

  String filepath = "";

  bool areFunds6MonthsOld = true;

  @override
  Future<void> onInit() async {
    await getSourceOfIncome();
    await getOccupation();
    await getFundType();
    await getCountry();
    await getFundPlannerData();
    change(null, status: RxStatus.success());
    super.onInit();
  }

  bool loadingCountry = false;
  List countryList = [];
  List countryCode = [];
  String? selectedCountryName = '';
  String? selectedCountryCode = '';

  getCountry() async {
    try {
      loadingCountry == false;
      var res = await apiServices.getCountry(
          Endpoints.baseUrl!, Endpoints.allCountry!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        List<dynamic> temp = map.keys.toList();
        for (var element in temp) {
          countryList.add(element);
        }
        temp = map.values.toList();
        for (var element in temp) {
          countryCode.add(element.toString());
        }

        loadingCountry = true;
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

  getSourceOfIncome() async {
    change(null, status: RxStatus.loading());
    var res =
        await apiServices.getdropdownfundPlaner(Endpoints.source_of_income!);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);

      sourceIncomeID.addAll(map.keys.toList());
      sourceIncomeName.addAll(map.values.toList());
      change(null, status: RxStatus.success());
    }
  }

  getOccupation() async {
    change(null, status: RxStatus.loading());
    var res =
        await apiServices.getdropdownfundPlaner(Endpoints.get_occupation!);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);

      occupationName.addAll(map.keys.toList());
      occupationID.addAll(map.values.toList());
      change(null, status: RxStatus.success());
    }
  }

  List fundTypeName = [];
  List fundTypeID = [];
  String selectedFundTypeName = '';
  String selectedFundTypeId = '';

  getFundType() async {
    change(null, status: RxStatus.loading());
    var res = await apiServices.getdropdownfundPlaner(Endpoints.fund_type!);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);

      fundTypeName.addAll(map.keys.toList());
      fundTypeID.addAll(map.values.toList());
      change(null, status: RxStatus.success());
    }
  }

  String? selectedBankname = '';
  String? selectedBankCode = '';
  getBankByCountry(String countryID) async {
    bankName = [];
    loadingBank = false;

    var endpoint = Endpoints.bankByCountry! + countryID.toString();
    print(endpoint);
    var res = await apiServices.getdropdownfunPlanerPost(endpoint);
    if (res.length == 0) {
      bankName.add('No Bank Available');
    } else if (res != 0) {
      Map map = Map<String, dynamic>.from(res);
      bankName.addAll(map.keys.toList());
      bankID.addAll(map.values.toList());
      print(bankName);
      print(bankID);
    }
    loadingBank = true;

    update();
  }

  uploadDocumentment() async {
    if (selectedRelationship == null) {
      getToast('Kindly select the relationship');
    } else if (nameOfThePerson.text.isEmpty) {
      getToast('Kindly specify sponsor name');
    } else if (occupationNameSelect == null) {
      getToast('Kindly select sponsor occupation');
    } else if (selectedSourceID == null) {
      getToast('Kindly select sponsor source of income');
    } else if (countryId == null) {
      getToast('Kindly select country of financial institution');
    } else if (selectedBankCode == null || selectedBankCode == "") {
      getToast('Kindly select name of financial institution');
    } else if (selectedFundTypeId.isEmpty) {
      getToast('Kindly select type of funds');
    } else if (amountData.text.isEmpty) {
      getToast('Kindly specify amount');
    } else {
      change(null, status: RxStatus.loading());
      String endpoint = getFundPlannersave(
          id: 0.toString(),
          enq_id: Get.find<BaseController>().model1.id.toString(),
          name_of_sponsor: nameOfThePerson.value.text,
          relationship: selectedRelationship ?? "",
          bank_country: countryId.toString(),
          id_of_financial_institution: selectedBankCode ?? '',
          type_of_funds: selectedFundTypeId,
          sponsor_amount: amountData.text,
          occupation: occupationIDSelect.toString(),
          oldfunds: areFunds6MonthsOld ? '1' : '0',
          source_of_income: selectedSourceID.toString() ?? "");
      var res =
          await apiServices.fundPlannerFileSend(filepath, filepath, endpoint);

      if (res != null) {
        deleteFilledFields();
        change(null, status: RxStatus.success());
        print(res);
      }
    }
  }

  submitFundPlannerData() async {
    if (selectedRelationship == null) {
      getToast('Kindly select the relationship');
    } else if (nameOfThePerson.text.isEmpty) {
      getToast('Kindly specify sponsor name');
    } else if (occupationNameSelect == null) {
      getToast('Kindly select sponsor occupation');
    } else if (selectedSourceID == null) {
      getToast('Kindly select sponsor source of income');
    } else if (countryId == null) {
      getToast('Kindly select country of financial institution');
    } else if (selectedBankCode == null || selectedBankCode == "") {
      getToast('Kindly select name of financial institution');
    } else if (selectedFundTypeId.isEmpty) {
      getToast('Kindly select type of funds');
    } else if (amountData.text.isEmpty) {
      getToast('Kindly specify amount');
    } else {
      try {
        loadingCountry == false;
        var enq_id = Get.find<BaseController>().model1.id.toString();
        var endpoint = getFundPlannersave(
            id: 0.toString(),
            enq_id: Get.find<BaseController>().model1.id.toString(),
            name_of_sponsor: nameOfThePerson.value.text,
            relationship: selectedRelationship ?? "",
            bank_country: countryId.toString(),
            id_of_financial_institution: selectedBankCode ?? '',
            type_of_funds: selectedFundTypeId,
            sponsor_amount: amountData.text,
            occupation: occupationIDSelect.toString(),
            oldfunds: areFunds6MonthsOld ? '1' : '0',
            source_of_income: selectedSourceID.toString() ?? "");
        var res = await apiServices.planYourFundSubmit(endpoint);
        if (res != null) {
          deleteFilledFields();
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
  }

  double total_fund = 0.0;
  getFundPlannerData() async {
    change(null, status: RxStatus.loading());
    total_fund = 0.0;
    try {
      var res = await apiServices
          .getFundPlannerData(Get.find<BaseController>().model1.id.toString());
      if (res != null) {
        fundplanner = fundPlanner.fromJson(res);
        if (fundplanner.fundPlannersData != null) {
          for (var i = 0; i < fundplanner.fundPlannersData!.length; i++) {
            total_fund = total_fund +
                double.parse(fundplanner.fundPlannersData![i].amount ?? "");
          }
        }
      }

      firstTime = false;
      change(null, status: RxStatus.success());
      Get.to(SponsorDetails());
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }

  editButton(int index) async {
    change(null, status: RxStatus.success());
    selectedRelationship =
        fundplanner.fundPlannersData![index].relationApplicant ?? "";

    nameOfThePerson.text =
        fundplanner.fundPlannersData![index].sponsorName ?? "";

    occupationNameSelect =
        fundplanner.fundPlannersData![index].occupationName ?? "";
    occupationIDSelect =
        fundplanner.fundPlannersData![index].sponsor_occupation;

    print(fundplanner.fundPlannersData![index].sourceOfIncomeName);
    selectedSourceOfIncome ==
            fundplanner.fundPlannersData![index].sourceOfIncomeName ??
        "";
    selectedSourceID = fundplanner.fundPlannersData![index].sourceOfIncome;
    countryId = fundplanner.fundPlannersData![index].countryId;

    countrySelected = fundplanner.fundPlannersData![index].countryName;
    selectedFundTypeName = fundplanner.fundPlannersData![index].fundTypeName!;
    selectedFundTypeId = fundplanner.fundPlannersData![index].fundType!;
    amountData.text = fundplanner.fundPlannersData![index].amount.toString();
    filepath = fundplanner.fundPlannersData![index].fundDocumentName ?? "";

    update();
    Get.to(FundPlan());
    await getBankByCountry(countryId.toString());
    selectedBankname = fundplanner.fundPlannersData![index].bankName;
    selectedBankCode = fundplanner.fundPlannersData![index].bankId.toString();

    download(
        'https://www.adobe.com/acrobat/hub/how-to/media_10a1d64500ea0cd293a4d9864cb6bcec6fcd7ffc7.jpeg');
  }

  String pathOfImage = '';

  Future download(String url) async {
    var status = await Permission.storage.request();
    var d = await Permission.photos.request();
    var y = await Permission.notification.request();

    // print(status);
    // if (await Permission.storage.request().isGranted) {
    final io.Directory tempDir = await getTemporaryDirectory();

    final io.Directory appDocumentsDir =
        await getApplicationDocumentsDirectory();

    bool dirDownloadExists = true;
    String directory;
    if (io.Platform.isIOS) {
      directory = (await getApplicationDocumentsDirectory()).path;
    } else {
      directory = "/storage/emulated/0/Download/";

      dirDownloadExists = await io.Directory(directory).exists();
      if (dirDownloadExists) {
        directory = "/storage/emulated/0/Download/";
      } else {
        directory = "/storage/emulated/0/Downloads/";
      }
    }

    String basenames = path.basename(url);
    final finalPath = path.join(directory, basenames);
    io.File saveFile = io.File(finalPath);

    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    var sdkVersion = androidInfo.version.sdkInt;

    print(sdkVersion);

// 33=> d
// 30 less=>status
    if (sdkVersion > 30) {
      if (d.isGranted) {
        if (y.isGranted) {
          await FileDownloader.downloadFile(
              url: url,
              name: basenames,
              onDownloadCompleted: (String paths) {
                var newpath = paths;
                // NotificationService.showNotification(
                //     title: 'Downlaod Completed',
                //     body: 'Click to Open',
                //     payload: {'path': newpath, 'type': widget.payload});
              },
              onDownloadError: (String error) {
                print('DOWNLOAD ERROR: $error');
              });
        } else {
          await Permission.notification.request();
        }
      } else {
        getToast(SnackBarConstants.flutterStroageToast);
        Future.delayed(const Duration(seconds: 2))
            .then((value) => openAppSettings());
      }
    } else {
      if (status.isGranted) {
        if (y.isGranted) {
          await FileDownloader.downloadFile(
              url: url,
              name: basenames,
              onDownloadCompleted: (String paths) {
                var newpath = paths;
                // NotificationService.showNotification(
                //     title: 'Downlaod Completed',
                //     body: 'Click to Open',
                //     payload: {'path': newpath, 'type': widget.payload});
              },
              onDownloadError: (String error) {
                print('DOWNLOAD ERROR: $error');
              });
        } else {
          await Permission.notification.request();
        }
      } else {
        getToast(SnackBarConstants.flutterStroageToast);
        Future.delayed(const Duration(seconds: 2))
            .then((value) => openAppSettings());
      }
    }

    // }

    // await dio.Dio().download(url, saveFile.path);

    // print(saveFile.path);

    // var res = await FlutterDownloader.enqueue(
    //   url: url,

    //   headers: {}, // optional: header send with url (auth token etc)
    //   savedDir: directory,
    //   saveInPublicStorage: true,
    //   showNotification:
    //       false, // show download progress in status bar (for Android)
    //   openFileFromNotification:
    //       false, // click on notification to open downloaded file (for Android)
    // );

    // }

    filepath = finalPath;
  }

  getViewDocument(String url) {
    print(url);
    if (url.contains("pdf")) {
      return Get.to(CustomDocumentViewer(
        url: url,
      ));
    } else if (url.contains("doc")) {
      Get.to(CustomDocumentViewer(
        url: url,
      ));
    } else if (url.contains("docx")) {
      Get.to(CustomDocumentViewer(
        url: url,
      ));
    } else {
      Get.to(CustomImageViewer(
        url: url,
      ));
    }
  }

  getDeleteFund(String id) async {
    var res = await apiServices.getfundPlanDelete(id);
    if (res != null) {
      getFundPlannerData();
    }
  }

  deleteFilledFields() {
    selectedRelationship = null;
    nameOfThePerson.text = "";
    occupationNameSelect = null;
    occupationIDSelect = null;
    selectedSourceOfIncome == null;
    selectedSourceID = null;
    countryId = null;
    countrySelected = "";
    selectedFundTypeName = "";
    amountData.text = "";
    filepath = "";
    selectedSourceOfIncome = "";
    nameFinancial = null;
  }
}
