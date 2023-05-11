import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/screen/receiveACallback/model/receiveACallback_model.dart';
import 'package:studentpanel/utils/endpoint.dart';

class ReceiveACallbackController extends GetxController with StateMixin {
  ApiServices apiservices = ApiServices();
  List data = [];
  List name = [];

  RxString oo = 'Receive a call back'.obs;

  @override
  void onInit() {
    getdata();
    super.onInit();
  }

  updatedata(String val) async {
    oo.value = val;
    update();
  }

  getdata() async {
    var id = Get.find<BaseController>().model1.id.toString();
    print(id);

    var res = await apiservices.counselorList(id);

    var courseSearchModel = List<ReceiveACallbackModel>.from(
        res.map((x) => ReceiveACallbackModel.fromJson(x)));

    // await res.map((e) => data.add(e['name']));
    // Map map = Map<String, dynamic>.from(res);

    // name.add(map.keys.toList());

    // var dass = ReceiveACallbackModel.fromJson(res);

    print(courseSearchModel);

    for (var i = 0; i < courseSearchModel.length; i++) {
      name.add(courseSearchModel[i].name);
    }

    change(null, status: RxStatus.success());

    print(name);
    // data = await res;

    // data.add(res['name']);
  }
}
