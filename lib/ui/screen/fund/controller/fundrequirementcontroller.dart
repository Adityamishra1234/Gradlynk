import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/screen/fund/fund_parameter.dart';
import 'package:studentpanel/ui/screen/fund/model/dataneedfundcalculator.dart';
import 'package:studentpanel/ui/screen/fund/model/fund_calculator.dart';

class FundRequirementController extends GetxController with StateMixin {
  ApiServices apiServices = ApiServices();
  FundCalulator model = FundCalulator();
  DataNeedFundCalulator dataNeedFundCalulator = DataNeedFundCalulator();

  TextEditingController child1 = TextEditingController();
  TextEditingController child2 = TextEditingController();
  TextEditingController child3 = TextEditingController();
  TextEditingController child4 = TextEditingController();

// single=true,  married=false

// yes=true,no=false
  RxBool spouse_accompany = false.obs;

// yes=true,no=false
  bool kids = false;
//min=0, max=4
  int? manay_kids = 1;

  @override
  void onInit() {
    // TODO: implement onInit
    getFundRequirement(2900);
    super.onInit();
  }

  getFundRequirement(int inst_course) async {
    var response = await apiServices.getFundRequirement(
        inst_course, Get.find<BaseController>().model1.id!);
    if (response != null) {
      model = FundCalulator.fromJson(response);
      change(null, status: RxStatus.success());
    }
  }

  getCalculated(int inst_course) async {
    var response = await apiServices.getFundCalculator(
        Get.find<BaseController>().model1.id!,
        inst_course,
        spouse_accompany == true.obs ? 1 : 0,
        kids == true ? 1 : 0,
        manay_kids!,
        int.parse(child1.text == "" ? "0" : child1.text),
        int.parse(child2.text == "" ? "0" : child2.text),
        int.parse(child3.text == "" ? "0" : child3.text),
        int.parse(child4.text == "" ? "0" : child4.text));
    if (response != null) {
      dataNeedFundCalulator = DataNeedFundCalulator.fromJson(response);
      change(null, status: RxStatus.success());
      Get.to(FundParameter(model: dataNeedFundCalulator));
    }
  }
}
