import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';

class UploadDocumentController extends BaseController {
  RxBool loadingDegree = false.obs;
  RxBool loadingSrSecondary = false.obs;
  RxBool loadingSecondary = false.obs;
  RxBool loadingHighestQualification = false.obs;

  setLoadingDegree(bool data) {
    loadingDegree.value = data;
    update();
  }

  setLoadingSrSecondary(bool data) {
    loadingSrSecondary.value = data;
    update();
  }

  setLoadingSecondary(bool data) {
    loadingSecondary.value = data;
    update();
  }

  setLoadingHighestQualification(bool data) {
    loadingHighestQualification.value = data;
    update();
  }
}
