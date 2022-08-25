import 'package:studentpanel/ui/controllers/coursesearchcontroller.dart';
import 'package:studentpanel/ui/controllers/logincontroller.dart';
import 'package:get/get.dart';

class CourseSearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseSearchController>(() => CourseSearchController());
  }
}
