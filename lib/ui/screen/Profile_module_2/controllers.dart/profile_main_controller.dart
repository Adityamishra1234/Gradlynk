import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/profileDataValidatorModel.dart';
import 'package:studentpanel/ui/screen/Profile_Module/contactinformation.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/QualificationDetails.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/contactinformationcontroller.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/englishtest.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/othertestdetails.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/passport.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/relativeinformation.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/travelhistory.dart';
import 'package:studentpanel/ui/screen/Profile_Module/controller/workhistory.dart';
import 'package:studentpanel/ui/screen/Profile_Module/courseinformation.dart';
import 'package:studentpanel/ui/screen/Profile_Module/englishtestdetails.dart';
import 'package:studentpanel/ui/screen/Profile_Module/othertestdetails.dart';
import 'package:studentpanel/ui/screen/Profile_Module/passportdetails.dart';
import 'package:studentpanel/ui/screen/Profile_Module/qualificationdetails.dart';
import 'package:studentpanel/ui/screen/Profile_Module/relativeinformation.dart';
import 'package:studentpanel/ui/screen/Profile_Module/travinghistory.dart';
import 'package:studentpanel/ui/screen/Profile_Module/workhistory.dart';
import 'package:studentpanel/ui/screen/Profile_module_2/controllers.dart/contact_information_in_popup_controller.dart';
import 'package:studentpanel/widgets/custom_profile_dialogue/custom_profile_dialogue.dart';

class ProfileViewMainController extends GetxController with StateMixin {
  ApiServices api = ApiServices();
  var data = ProfileDataValidatorModel().obs;

  RxInt indexOfSelection = 0.obs;
  RxBool popupIsOpen = false.obs;

  RxBool loading = false.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    // loading.value = true;
    // var x = await api.profileDataValidation(78623);
    // var z = await ProfileDataValidatorModel.fromJson(x);
    // data.value = z;
    // loading.value = false;
  }
}
