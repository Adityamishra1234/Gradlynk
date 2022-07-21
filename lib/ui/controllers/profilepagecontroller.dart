import 'dart:convert';

import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/usermodel.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/utils/endpoint.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageController extends BaseController with StateMixin<UserModel> {
  RxInt? chooseIndex = 0.obs;

  getChooseIndex(RxInt data) {
    chooseIndex = data;
    update();
  }
}
