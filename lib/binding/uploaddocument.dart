import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/uploaddocumentcontroller.dart';

class UploadDocument implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadDocumentController>(() => UploadDocumentController());
  }
}
