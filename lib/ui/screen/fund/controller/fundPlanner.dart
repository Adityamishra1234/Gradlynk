import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/screen/fund/model/fundPlanner.dart';
import 'package:studentpanel/utils/endpoint.dart';

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

/////
  String selectedRelationship = '';
  TextEditingController nameOfThePerson = TextEditingController();
  TextEditingController occupationOfSponsor = TextEditingController();
  // TextEditingController nameOfTheFinnacialIntitution = TextEditingController();
  TextEditingController amountData = TextEditingController();
  // TextEditingController countryOfTheFinnacialIntitution= TextEditingController();
  // TextEditingController occupationOfSponsor = TextEditingController();

  // TextEditingController occupationOfSponsor = TextEditingController();

  // condition
  bool firstTime = true;

  String selectedSourceOfIncome = '';
  String filepath = "";

  bool areFunds6MonthsOld = true;

  @override
  void onInit() {
    getSourceOfIncome();
    getOccupation();
    getFundType();
    getCountry();
    getFundPlannerData();
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
  getBankByCountry() async {
    bankName = [];
    loadingBank = false;
    var id = int.parse(selectedCountryCode!);

    var endpoint = Endpoints.bankByCountry! + id.toString();
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
    print(bankName);
    update();
  }

  uploadDocumentment() async {
    if (selectedRelationship.isEmpty) {
    } else if (nameOfThePerson.text.isEmpty) {
    } else if (occupationOfSponsor.text.isEmpty) {
    } else if (selectedSourceOfIncome.isEmpty) {
    } else if (selectedCountryCode != null) {
    } else if (selectedBankCode != null) {
    } else if (selectedFundTypeId.isEmpty) {
    } else if (amountData.text.isEmpty) {
    } else {
      String endpoint = getFundPlannersave(
          id: 0.toString(),
          enq_id: Get.find<BaseController>().model1.id.toString(),
          name_of_sponsor: nameOfThePerson.value.text,
          relationship: selectedRelationship,
          bank_country: selectedCountryCode.toString(),
          id_of_financial_institution: selectedBankCode ?? '',
          type_of_funds: selectedFundTypeId,
          sponsor_amount: amountData.text,
          occupation: occupationOfSponsor.value.text,
          oldfunds: areFunds6MonthsOld ? '1' : '0',
          source_of_income: selectedSourceOfIncome);
      var res =
          await apiServices.fundPlannerFileSend(filepath, filepath, endpoint);

      if (res != null) {
        print(res);
      }
    }
  }

  submitFundPlannerData() async {
    //TODO
    //condition toast
    if (selectedRelationship.isEmpty) {
    } else if (nameOfThePerson.text.isEmpty) {
    } else if (occupationOfSponsor.text.isEmpty) {
    } else if (selectedSourceOfIncome.isEmpty) {
    } else if (selectedCountryCode != null) {
    } else if (selectedBankCode != null) {
    } else if (selectedFundTypeId.isEmpty) {
    } else if (amountData.text.isEmpty) {
    } else {
      try {
        loadingCountry == false;
        var enq_id = Get.find<BaseController>().model1.id.toString();
        var endpoint = getFundPlannersave(
            id: 0.toString(),
            enq_id: enq_id,
            name_of_sponsor: nameOfThePerson.value.text,
            relationship: selectedRelationship,
            bank_country: selectedCountryCode.toString(),
            id_of_financial_institution: selectedBankCode ?? '',
            type_of_funds: selectedFundTypeId,
            sponsor_amount: amountData.text,
            occupation: occupationOfSponsor.value.text,
            oldfunds: areFunds6MonthsOld ? '1' : '0',
            source_of_income: selectedSourceOfIncome);
        var res = await apiServices.planYourFundSubmit(endpoint);
        if (res != null) {
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

  getFundPlannerData() async {
    try {
      var res = await apiServices
          .getFundPlannerData(Get.find<BaseController>().model1.id.toString());
      if (res != null) {
        fundplanner = fundPlanner.fromJson(res);
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
