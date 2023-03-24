import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/serviceAssignesmodel.dart';
import 'package:studentpanel/utils/endpoint.dart';

class ScheduleExpertCallController extends GetxController {
  ApiServices apiServices = ApiServices();
  List<ServiceAssigneersModel> model = [];

  String dateSelected = "";
  String? timeSelected = "";

  //DropDown fields
  List<String> name = [];
  List<int> nameID = [];

  //Select
  String? nameSelected;
  int? nameSelectedID;

  RxBool loadingServiceAssigned = false.obs;

  @override
  void onInit() {
    super.onInit();
    getServiceAssigned();
  }

  getServiceAssigned() async {
    try {
      var res = await apiServices.getServicesAssigned(
          Endpoints.serviceAssigness! +
              Get.find<BaseController>().model1.id.toString());
      if (res != null) {
        name.add("Select your counsellor");
        nameID.add(0);
        model = res;
        model.forEach((element) {
          name.add(element.name!);
          nameID.add(element.id!);
        });
        loadingServiceAssigned = true.obs;
        update();
      }
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }

  addScheduleAnExpertCall() async {
    try {
      var res = await apiServices.getSheduleExpertCall(
          Endpoints.scheduleAnExpertCallPart1! +
              Get.find<BaseController>().model1.id.toString() +
              Endpoints.scheduleAnExpertCallPart2! +
              dateSelected +
              Endpoints.scheduleAnExpertCallPart3! +
              timeSelected! +
              Endpoints.scheduleAnExpertCallPart4! +
              nameSelectedID.toString());
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }
}