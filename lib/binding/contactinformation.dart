import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/contactinformationcontroller.dart';

class ContactInformation implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactInformationController>(
        () => ContactInformationController());
  }
}
