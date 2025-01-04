import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/endpoint.dart';
import '../Network/api_services.dart';


class FieldRepo {
  final SharedPreferences prefs;
  final ApiService _api;

  FieldRepo(this._api, this.prefs);

  fetchProfileValidation(dynamic enquiryId) async {
    Map<String, dynamic> data = {};
    var res = await _api.postRequest("${Endpoints.profileDataValidation}$enquiryId",data);
    print(res);
    if (res == null) {
      throw "no data found";
    }
    return res;
  }

  fetchLoginData() async {
    Map<String, dynamic> data = {};
    var res = await _api.postRequest("${Endpoints.dashboard}${prefs.getString("phonenumber")}",data);
    print(res);
    if (res == null) {
      throw "no data found";
    }
    return res;
  }



}
