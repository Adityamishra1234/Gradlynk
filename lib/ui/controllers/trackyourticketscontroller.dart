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
      if (model.value!.data!.isNotEmpty) {
        for (var i = 0; i < model.value!.data!.length; i++) {
          if (model.value!.data![i].comments!.isNotEmpty) {
            model.value!.data![i].firstComment =
                model.value!.data![i].comments![0].content;
          }
        }
      }

      change(null, status: RxStatus.success());
    }
  }

  saveComment(String id, String content, int dataIndex) async {
    // save-comment-data?id=10&content=test by aman 7&enq_id=78623
    var responsive = await apiServices.saveComments(
        Endpoints.saveCommentTrackYourTicketpart1! +
            id +
            Endpoints.saveCommentTrackYourTicketPart2! +
            content +
            Endpoints.saveCommentTrackYourTicketPar3! +
            Get.find<BaseController>().model1.id.toString());
    if (responsive != null) {
      model.value!.data![dataIndex].comments!.add(responsive[0]);
      update();
    }
  }
}
