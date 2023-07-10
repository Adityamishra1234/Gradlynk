import 'package:get/get.dart';

class LetsGetStartedController extends GetxController with StateMixin {
  int questionNumberToShow = 0;

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    //
    //TODO: implement onInit
    // super.onInit();
  }


  //firstQuestion
  String selectedOption = ''; 
}
