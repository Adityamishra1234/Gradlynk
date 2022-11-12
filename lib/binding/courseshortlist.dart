import 'package:get/get.dart';

import 'package:studentpanel/ui/controllers/courseshortlist.dart';

class CourseShortList implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseShortListController>(() => CourseShortListController());
  }
}
