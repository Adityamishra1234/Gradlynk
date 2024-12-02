//test

import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/loginmodel.dart';
import 'package:studentpanel/ui/models/usermodel.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';

class LoginController extends GetxController with StateMixin {
  UserModel? userModel;
  RxInt currentindex = 0.obs;
  ApiServices services = ApiServices();
  LoginModel? model;
  // var controller1 = Get.put(AnimationtestController());

  RxBool optverify = false.obs;
  RxBool otpEnable = false.obs;

  @override
  Future<void> onInit() async {
    await getUserData();
    change(null, status: RxStatus.success());
  }

  setUpdateCurrentIndex(int data) {
    currentindex.value = data;
    update();
  }

  login(String phone, String otp) async {
    change(null, status: RxStatus.loading());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var d = '';
    if (phone.length > 10) {
      var data = phone.indexOf('1');
      d = phone.substring(3, phone.length);
      print(d);
    } else {
      d = phone;
    }

    var responsive = await services.getLogin(
      Endpoints.login! + d + Endpoints.login2! + otp,
    );

    if (responsive != null) {
      model = responsive;
      if (prefs.getBool("showcaseEnable") == false ||
          prefs.getBool("showcaseEnable") == null) {
        prefs.setBool("showcaseEnable", false);
      }

      prefs.setString("phonenumber", model!.user!.mobile.toString());
      prefs.setString("userid", model!.user!.id.toString());
      prefs.setString("userToken", model!.token.toString());
      prefs.setString("enq_id", model!.user!.enqId.toString());
      Get.offAllNamed(DashBoard.routeNamed, arguments: true);   // it should go to the

        // custom bottom nav bar instead of dashboard.routenamed
      change(null, status: RxStatus.success());

      return model;
    } else {
      change(null, status: RxStatus.success());
      // Get.snackbar(
      //   "Error",
      //   "Please Retry phone number and Password",
      //   snackPosition: SnackPosition.BOTTOM,
      // );
      getToast('Please enter a correct OTP');
    }
  }

  Templogin(String phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // change(null, status: RxStatus.loading());
    // var responsive = await services.getLogin(
    //   Endpoints.login! + phone + Endpoints.login2! + password,
    // );

    // if (responsive != null) {
    //   model = responsive;
    prefs.setString("phonenumber", phone);
    // prefs.setString("token", model!.token.toString());
    // prefs.setString("id", model!.user!.id.toString());
    // change(null, status: RxStatus.success());
    Get.offAllNamed(DashBoard.routeNamed);
    return model;
    // } else {
    //   change(null, status: RxStatus.success());
    //   Get.snackbar(
    //     "Error",
    //     "Please Retry phone number and Password",
    //     snackPosition: SnackPosition.BOTTOM,
    //   );
    // }
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

  getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String phonenumber = sharedPreferences.getString("phonenumber").toString();
    print(phonenumber);
    if (getNUllChecker(phonenumber) == false) {
      print(sharedPreferences.getBool("showcaseEnable"));
      Get.offAllNamed(DashBoard.routeNamed,
          arguments: sharedPreferences.getBool("showcaseEnable"));
    }
    // else {
    //   Get.offAllNamed(LoginCopy.routeNamed);
    // }
  }

  phonenumberVerfiy(String phonenumber) async {
    change(null, status: RxStatus.loading());
    var d = '';
    if (phonenumber.length > 10) {
      var data = phonenumber.indexOf('1');
      d = phonenumber.substring(3, phonenumber.length);
      print(d);
    } else {
      d = phonenumber;
    }
    var res = await services.phonenumberVerfiy(d);
    if (res['status'] == true) {
      otpEnable.value = true;
      change(null, status: RxStatus.success());
      return true;
    } else {
      getToast('${res['message']}');
      change(null, status: RxStatus.success());
      return false;
    }
  }
}
