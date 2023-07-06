import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/utils/endpoint.dart';

class RegisterationCopntroller extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController targetDestinationController = TextEditingController();
  TextEditingController nearestSiecBranch = TextEditingController();
  TextEditingController howDidYouHearAboutUsController =
      TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ApiServices api = ApiServices();

  regsiter() async {
    var endpoint = registerNewUserEndpoint(
        name: nameController.text,
        phoneNumber: phoneNumberController.text,
        emailID: emailIdController.text,
        targetDestination: targetDestinationController.text,
        nearestSiecBranch: nearestSiecBranch.text,
        howDidYouHearAboutUS: howDidYouHearAboutUS);
    var res = await api.registerNewUser();
  }
}
