import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';

class CourseSearchFullDetailController extends BaseController {
  //
  RxInt index = 0.obs;

  setIndex(int data) {
    index.value = data;
    update();
  }
}
