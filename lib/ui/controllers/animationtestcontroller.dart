import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnimationtestController extends GetxController {
  String? phone;
  @override
  Future<void> onInit() async {
    super.onInit();
    await getUserData();
  }

  getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String phonenumber = sharedPreferences.getString("phonenumber").toString();
    phone = phonenumber;
    return phonenumber;
  }
}
