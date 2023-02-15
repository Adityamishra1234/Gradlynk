import 'package:get/get.dart';
import 'package:hashids2/hashids2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/models/notificationmodel.dart';
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
  List<UpcomingEventModel>? upcomingModel;
  RxBool loadingUpcomingEvents = false.obs;
  List<NotificationModel>? notificationModel;
  RxBool loadingnotificationModel = false.obs;

  @override
  void onInit() {
    super.onInit();
    profiledetail();
  }

  @override
  onReady() {
    upcomingEvents();
  }

  profiledetail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String phonenumber = sharedPreferences.getString("phonenumber").toString();
    var res = await apiServices.dashboard(
        Endpoints.baseUrl!, "${Endpoints.dashboard!}$phonenumber");
    if (res != null) {
      model1 = res;
      loadingStudentPanelData1 = true.obs;
      update();
    }
    getNotificatin(model1.id.toString());
  }

  getPersonalModal(PersonalInformationModel model) {
    personalModal = model;
    update();
  }

  upcomingEvents() async {
    var res = await apiServices.getUpComingEvent(Endpoints.upcomingEvents!);
    if (res != null) {
      upcomingModel = res;
      loadingUpcomingEvents = true.obs;
      update();
    }
  }

  getNotificatin(String id) async {
    var res = await apiServices
        .getNotification("${Endpoints.notificationForUser!}$id");
    if (res != null) {
      notificationModel = res;
      loadingnotificationModel = true.obs;
      update();
    }
  }
}
