import 'dart:convert';

import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/usermodel.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/utils/endpoint.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends BaseController {
  UserModel? userModel;
  ApiServices services = ApiServices();

  Future<UserModel> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var jsondata =
        json.decode(sharedPreferences.getString("UserModel").toString());
    return userModel = UserModel.fromJson(jsondata);
  }

  Login(String email, String password) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    bool responsive = await services.login(
        Endpoints.baseUrl!, Endpoints.login!, email, password);
    if (responsive == true) {
      return getUserData();
    } else {
      Get.snackbar(
        "Error",
        "Please Retry email and Password",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  checkUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var Userlogincheck = prefs.getString("UserModel");
    if (kDebugMode) {
      print(Userlogincheck);
    }
    if (Userlogincheck != null) {
      var jsondata = json.decode(Userlogincheck);
      UserModel userModel = UserModel.fromJson(jsondata);
      if (kDebugMode) {
        print(userModel);
      }
      return userModel;
    } else {
      return false;
    }
  }
}
