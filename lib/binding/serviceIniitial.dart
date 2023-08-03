import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetSignedInUserInfoRepoImp extends GetxService {
  bool isLoggedIn = false;

  @override
  void onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? phonenumber = prefs.getString("phonenumber");
    if (phonenumber != null) {
      isLoggedIn = true;
    } else {
      isLoggedIn = false;
    }
    // TODO: implement onInit
    super.onInit();
  }

  // int isUserSignedIn() {
  //   // SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // String? phonenumber = prefs.getString("phonenumber");

  // }
}

// MIDDLEWARE

