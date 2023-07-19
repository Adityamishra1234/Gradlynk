import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/logincontroller.dart';
import 'package:studentpanel/ui/models/loginmodel.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/ui/screen/login%20copy.dart';
import 'package:studentpanel/ui/screen/login.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';

class RegisterationCopntroller extends GetxController with StateMixin {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController targetDestinationController = TextEditingController();
  TextEditingController nearestSiecBranch = TextEditingController();
  TextEditingController howDidYouHearAboutUsController =
      TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ApiServices api = ApiServices();

  void onInit() async {
    super.onInit();
    await getNearestSiecBranch();
    await getLeadSources();
    await getCountry();
    change(null, status: RxStatus.success());
  }

  bool showOtp = false;

  List branchListName = [];
  List branchListID = [];
  String? selectedBranchName = '';
  String? selectedBranchCode = '';
  bool loadingBranches = false;
  getNearestSiecBranch() async {
    loadingBranches = false;
    var res = await api.getAllBranches();

    if (res != null) {
      Map map = Map<String, String>.from(res);
      branchListName.add("Select Branch");
      branchListID.add(0);
      branchListName.addAll(map.values.toList());
      branchListID.addAll(map.keys.toList());

      // branchListID = map.keys.toList();
      loadingBranches = true;
      selectedBranchName = 'Please Select a Branch';
      update();
    }
  }

  List leadSourcesListName = [];
  List leadSourcesListID = [];
  String? selectedLeadSourcesName = '';
  String? selectedLeadSourcesCode = '';
  bool loadingLeadSources = false;
  getLeadSources() async {
    loadingLeadSources = false;
    var res = await api.dropDownGetWithoutLogin(
        Endpoints.baseUrl!, Endpoints.getAllLeadSources!);

    if (res != null) {
      Map map = Map<String, String>.from(res);
      // leadSourcesListName.add("Select Lead Sources");
      // leadSourcesListID.add(0);

      leadSourcesListName.addAll(map.values.toList());
      leadSourcesListID.addAll(map.keys.toList());
      // leadSourcesListName = map.values.toList();
      // leadSourcesListID = map.keys.toList();
      loadingLeadSources = true;
      selectedLeadSourcesName = 'Kindly Select';
      update();
    }
  }

  List countryListName = [];
  List countryListID = [];
  String? selectedCountryName = '';
  String? selectedCountryID = '';
  bool loadingCountry = false;

  getCountry() async {
    try {
      var res = await api.getCountry(Endpoints.baseUrl!, Endpoints.country!);

      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        countryListName.add("Select Destination");
        countryListID.add(0);
        countryListName.addAll(map.keys.toList());
        countryListID.addAll(map.values.toList());
        selectedCountryName = 'Please Select a Country';
        loadingCountry = true;
        update();
      }
    } catch (e) {
      // await ApiServices().errorHandle(
      //   Get.find<BaseController>().model1.id.toString(),
      //   e.toString(),
      //   "1111",
      //   StackTrace.current.toString(),
      // );
    }
  }

  regsiter() async {
    var endpoint = registerNewUserEndpoint(
        name: nameController.text,
        phoneNumber: phoneNumberController.text,
        emailID: emailIdController.text,
        targetDestination: selectedCountryID,
        nearestSiecBranch: selectedBranchCode,
        howDidYouHearAboutUS: selectedLeadSourcesCode);
    var res = await api.registerNewUser(endpoint);
    var status = res['status'];
    var returnData;
    if (status == true) {
      showOtp = true;

      returnData = true;
      startTimer();
    } else {
      returnData = false;
      getToast(res['message']);
    }

    update();
    return returnData;
  }

  LoginModel? model;
  verifyOtp(String otp) async {
    var res = await api.otpValidationInRegister(
      phoneNumberController.text,
      otp,
    );

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (res['status'] == false) {
      // Get.defaultDialog(
      //     content: Container(
      //   child: Column(children: [
      //     Text('Registeration Successfull'),
      //     Text('Redirecting to the login page'),
      //   ]),
      // ));
      getToast(res['message']);
    } else if (res['status'] == true) {
      // model = res;
      if (prefs.getBool("showcaseEnable") == false ||
          prefs.getBool("showcaseEnable") == null) {
        prefs.setBool("showcaseEnable", false);

        prefs.setString("phonenumber", phoneNumberController.text);
        // prefs.setString("token", model!.token.toString());
        // prefs.setString("id", model!.user!.id.toString());
        change(null, status: RxStatus.success());

        Get.offAllNamed(DashBoard.routeNamed, arguments: true);
      } else {
        getToast(res['message']);
      }
    }
    // await Future.delayed(Duration(seconds: 5));
  }

  // var resendOtpTimer = 0;
  int resendOTP = 1;

  startResend() async {
    // var res2 = await api.getOTP(email);
    var res = await api.resendOtpRegister(phoneNumberController.text);

    getToast(res['message']);
    timer.value = 120;
    startTimer();
    update();
  }

  RxInt timer = 120.obs;
  startTimer() async {
    resendOTP = 2;

    for (var i = 0; i < 120; i++) {
      await Future.delayed(Duration(seconds: 1));

      if (timer.value != 0) {
        timer.value = timer.value - 1;
        print(timer.value);
      }
    }

    resendOTP = 1;
    update();

    return null;
  }

  bool buttonClickEnabled = true;
}
