import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/dropdownmodel.dart';
import 'package:studentpanel/ui/models/studentpanel.dart';
import 'package:studentpanel/ui/models/usermodel.dart';

import 'package:get/get.dart';

class ProfilePageController extends BaseController with StateMixin<UserModel> {
  RxInt? chooseIndex = 0.obs;
  RxBool? englishTestDetail = true.obs;
  RxBool? showAnimation = false.obs;
  RxBool? firstTimeAnimation = false.obs;

  DropDownModel? dropDownModel;
  StudentPanel studentPanel = StudentPanel();
  RxBool loadingStudentPanelData = false.obs;
  RxBool loadingCreateModel = false.obs;
  RxBool loadingBranchname = false.obs;
  List<String>? model = [];
  RxString? dropdown1 = "".obs;

  List<RxBool> loading = [];

  setdropdown1(String? data) {
    dropdown1 = data!.obs;
    update();
    loadingBranchname = true.obs;
    update();
  }

  List<String>? createModelForDropdown() {
    if (loadingStudentPanelData.value == true) {
      studentPanel.addtionalDetails!.forEach((element) {
        model!.add(element.branchType!);
      });
    }
    model = model!.toSet().toList();
    loadingCreateModel = true.obs;
    update();

    return model;
  }

  List<String>? createDropDownData(
    String choose1, [
    String choose2 = "",
    String choose3 = "",
    String choose4 = "",
  ]) {
    print("choose1" + choose1);
    List<String>? tempModel = [];

    studentPanel.addtionalDetails!.forEach((element) {
      if (choose1 == element.branchType) {
        tempModel!.add(element.branchName!);
      }
    });

    tempModel = tempModel!.toSet().toList();
    return tempModel;
  }

  getEnglishTestDetail(RxBool data) {
    englishTestDetail = data;
    update();
  }

  getChooseIndex(RxInt data) {
    chooseIndex = data;
    update();
  }

  getShowAnimationTrue(RxBool showAnimation, RxBool firstTime) {
    showAnimation = showAnimation;
    firstTimeAnimation = firstTime;
    update();
  }

  getShowAnimation(RxBool data) {
    showAnimation = data;
    update();
  }
}
