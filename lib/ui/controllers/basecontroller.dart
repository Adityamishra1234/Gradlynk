import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/models/personalinformation.dart';
import 'package:studentpanel/ui/models/studentpanel.dart';
import 'package:studentpanel/ui/models/upcomingevent.dart';
import 'package:studentpanel/utils/endpoint.dart';

class BaseController extends GetxController {
  ApiServices apiServices = ApiServices();
  StudentPanel model1 = StudentPanel();
  RxBool loadingStudentPanelData1 = false.obs;
  PersonalInformationModel personalModal = PersonalInformationModel();
  final prefs = SharedPreferences.getInstance();
  List<UpcomingEvent>? upcomingEventlist;
  RxBool loadingUpcomingEvents = false.obs;

  //Image
  // String? create_profile;
  // String? add;
  // String? alarm;
  // String? arrow;
  // String? calender;
  // String? camera;
  // String? cameracapture;
  // String? clock;
  // String? compare;
  // String? course;

  @override
  void onInit() {
    super.onInit();
    profiledetail();
    upcomingEvents();
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

  upcomingEvents() async {
    var res = await apiServices.getUpComingEvent(Endpoints.upcomingEvents!);
    if (res != null) {
      upcomingEventlist = res;
      loadingUpcomingEvents = true.obs;
      update();
    }
  }
}
