import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';

class TravingHistoryController extends BaseController {
//
  RxBool viewDetails = false.obs;

  setViewDetails(bool data) {
    viewDetails.value = data;
    update();
  }
}
