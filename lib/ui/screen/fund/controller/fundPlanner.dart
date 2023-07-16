import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/screen/fund/model/fundPlanner.dart';
import 'package:studentpanel/ui/screen/fund/plan_fund.dart';
import 'package:studentpanel/ui/screen/fund/sponsorDetails.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';
import 'package:studentpanel/widgets/custom_doc_viewer.dart';
import 'package:studentpanel/widgets/custom_image_viewer.dart';

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
    amountData.text = fundplanner.fundPlannersData![index].amount.toString();
    filepath = fundplanner.fundPlannersData![index].fundDocumentName ?? "";
    update();
    Get.to(FundPlan());
    await getBankByCountry(countryId.toString());
    selectedBankname = fundplanner.fundPlannersData![index].bankName;
    selectedBankCode = fundplanner.fundPlannersData![index].bankId.toString();
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
