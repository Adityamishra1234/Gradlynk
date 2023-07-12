import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/profileDataValidatorModel.dart';

class DrawerGetXController extends GetxController with StateMixin {
  ApiServices apiServices = ApiServices();
  var data = ProfileDataValidatorModel().obs;
  RxBool loading = false.obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    await profileDataValidator();
    super.onInit();
    change(null, status: RxStatus.success());
  }

  profileDataValidator() async {
    ///todo
    var x = await apiServices
        .profileDataValidation(Get.find<BaseController>().model1.id!);
    var z = ProfileDataValidatorModel.fromJson(x);
    data.value = z;
    loading.value = false;
  }
}
