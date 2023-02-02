import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/models/personalinformation.dart';
import 'package:studentpanel/ui/models/studentpanel.dart';
import 'package:studentpanel/utils/endpoint.dart';

class BaseController extends GetxController {
  ApiServices apiServices = ApiServices();
  StudentPanel model1 = StudentPanel();
  RxBool loadingStudentPanelData1 = false.obs;
  PersonalInformationModel personalModal = PersonalInformationModel();

  @override
  void onInit() {
    super.onInit();
    profiledetail();
  }

  profiledetail() async {
    var res = await apiServices.login(
        Endpoints.baseUrl!, "${Endpoints.login!}8860373603");
    if (res != null) {
      model1 = res;
      loadingStudentPanelData1 = true.obs;
      update();
    }
  }

  getPersonalModal(PersonalInformationModel model) {
    personalModal = model;
    update();
  }
}
