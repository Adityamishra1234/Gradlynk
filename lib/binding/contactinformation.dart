import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/contactinformationcontroller.dart';

class ContactInformation implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactInformationController>(
        () => ContactInformationController());
  }
}
