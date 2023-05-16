import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';

class ProfileViewMainController extends GetxController {
  ApiServices api = ApiServices();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    api.profileDataValidation(78623);
  }
}
