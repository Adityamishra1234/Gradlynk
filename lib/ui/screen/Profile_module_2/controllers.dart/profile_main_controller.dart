import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/models/profileDataValidatorModel.dart';

class ProfileViewMainController extends GetxController {
  ApiServices api = ApiServices();
  var data = ProfileDataValidatorModel().obs;

  RxInt indexOfSelection = 0.obs;
  RxBool popupIsOpen = false.obs;

  RxBool loading = false.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    // loading.value = true;
    // var x = await api.profileDataValidation(78623);
    // var z = await ProfileDataValidatorModel.fromJson(x);
    // data.value = z;
    // loading.value = false;
  }

  popUpOpened() {}
}
