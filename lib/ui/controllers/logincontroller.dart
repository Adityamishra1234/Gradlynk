import 'dart:convert';

import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/models/loginmodel.dart';
import 'package:studentpanel/ui/models/usermodel.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/utils/endpoint.dart';

class LoginController extends GetxController {
  UserModel? userModel;
  RxInt currentindex = 0.obs;
  ApiServices services = ApiServices();
  LoginModel? model;

  setUpdateCurrentIndex(int data) {
    currentindex.value = data;
    update();
  }

  login(String phone, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var responsive = await services.getLogin(
      Endpoints.login! + phone + Endpoints.login2! + password,
    );
    if (responsive != null) {
      model = responsive;
      prefs.setString("phonenumber", model!.user!.mobile.toString());
      Get.offAllNamed(DashBoard.routeNamed);
      return model;
    } else {
      Get.snackbar(
        "Error",
        "Please Retry phone number and Password",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // checkUserData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var Userlogincheck = prefs.getString("UserModel");
  //   if (kDebugMode) {
  //     debugPrint(Userlogincheck);
  //   }
  //   if (Userlogincheck != null) {
  //     var jsondata = json.decode(Userlogincheck);
  //     UserModel userModel = UserModel.fromJson(jsondata);
  //     if (kDebugMode) {
  //       debugPrint(userModel.toString());
  //     }
  //     return userModel;
  //   } else {
  //     return false;
  //   }
  // }
}
