import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/ticketdatamodel.dart';
import 'package:studentpanel/utils/endpoint.dart';

class TrackYourTicketsController extends GetxController with StateMixin {
  ApiServices apiServices = ApiServices();
  Rxn<TicketDataModel> model = Rxn<TicketDataModel>();
  RxInt chooseOption = 1.obs;
  @override
  void onInit() {
    // change(null, status: RxStatus.success());
    getTrackYourTicket();
  }

  getTrackYourTicket() async {
    change(null, status: RxStatus.loading());
    var responsive = await apiServices.getTrackYourTickets(
        Endpoints.trackyourticket! +
            Get.find<BaseController>().model1.id.toString());
    if (responsive != null) {
      model.value = responsive;
      change(null, status: RxStatus.success());
    }
  }
}
