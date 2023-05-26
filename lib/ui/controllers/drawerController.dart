import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/models/profileDataValidatorModel.dart';
import 'package:studentpanel/utils/constants.dart';

class DrawerGetXController extends GetxController with StateMixin {
  ApiServices apiServices = ApiServices();
  var data = ProfileDataValidatorModel().obs;
  RxBool loading = false.obs;

  @override
  void onInit() {
    profileDataValidator();
    super.onInit();
    change(null, status: RxStatus.success());
  }

  profileDataValidator() async {
    loading.value = true;
    var x = await apiServices.profileDataValidation(78623);
    var z = await ProfileDataValidatorModel.fromJson(x);
    data.value = z;
    loading.value = false;
  }
}
