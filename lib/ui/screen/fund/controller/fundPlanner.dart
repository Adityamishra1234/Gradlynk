import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/utils/endpoint.dart';

class FundPlannerController extends GetxController with StateMixin {
  ApiServices apiServices = ApiServices();

  //dropdown
  List sourceIncomeName = [];
  List sourceIncomeID = [];
  List occupationName = [];
  List occupationID = [];
  List fundTypeName = [];
  List fundTypeID = [];
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
  TextEditingController occupationOfSponsor = TextEditingController();

  @override
  void onInit() {
    getSourceOfIncome();
    getOccupation();
    getFundType();
    change(null, status: RxStatus.success());
    super.onInit();
  }

  getSourceOfIncome() async {
    change(null, status: RxStatus.loading());
    var res =
        await apiServices.getdropdownfunPlaner(Endpoints.source_of_income!);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);

      sourceIncomeID.addAll(map.keys.toList());
      sourceIncomeName.addAll(map.values.toList());
      change(null, status: RxStatus.success());
    }
  }

  getOccupation() async {
    change(null, status: RxStatus.loading());
    var res = await apiServices.getdropdownfunPlaner(Endpoints.get_occupation!);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);

      occupationName.addAll(map.keys.toList());
      occupationID.addAll(map.values.toList());
      change(null, status: RxStatus.success());
    }
  }

  getFundType() async {
    change(null, status: RxStatus.loading());
    var res = await apiServices.getdropdownfunPlaner(Endpoints.fund_type!);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);

      fundTypeName.addAll(map.keys.toList());
      fundTypeID.addAll(map.values.toList());
      change(null, status: RxStatus.success());
      getBankByCountry("13");
    }
  }

  getBankByCountry(String countryID) async {
    var res = await apiServices
        .getdropdownfunPlaner(Endpoints.bankByCountry! + countryID);
    if (res != null) {
      Map map = Map<String, dynamic>.from(res);
      bankName.addAll(map.keys.toList());
      bankID.addAll(map.values.toList());
      print(bankName);
      print(bankID);
    }
  }
}
