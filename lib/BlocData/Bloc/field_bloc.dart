

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/models/ProfileModel/profile_validation_model.dart';
import '../../ui/controllers/basecontroller.dart';
import '../Models/ProfileModel/profile_data_model.dart';
import '../Repositories/field_repo.dart';


ProfileValidationModel? profileValidationModel;
ProfileDataModel? profileDataModel;
late FieldBloc bloc;

class FieldBloc {
  final FieldRepo _repo;
  FieldBloc(this._repo);
  var baseController = Get.find<BaseController>();

  ValueNotifier<bool> loadingProfileValidation = ValueNotifier(false);
  Future getProfileValidation(dynamic enquiryId) async {
    loadingProfileValidation.value = true;
    try {
      if (loadingProfileValidation.value == true) {
        var res = await _repo.fetchProfileValidation(enquiryId);
        if (res != null) {
          profileValidationModel = ProfileValidationModel.fromJson(res);
        }
      }
    } catch (e, s) {
      debugPrint('$e');
      debugPrintStack(stackTrace: s);
    } finally {
      loadingProfileValidation.value = false;
    }
  }

  ValueNotifier<bool> loginLoading = ValueNotifier(false);

  Future getLoginData() async {
    loginLoading.value = true;
    try {
      if (loginLoading.value == true) {
        var res = await _repo.fetchLoginData();
        if (res != null) {
          profileDataModel = ProfileDataModel.fromJson(res);
        }
      }
    } catch (e, s) {
      debugPrint('$e');
      debugPrintStack(stackTrace: s);
    } finally {
      loginLoading.value = false;
    }
  }

}
