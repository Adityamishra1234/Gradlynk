import 'package:shared_preferences/shared_preferences.dart';

import '../../Network/api_services.dart';



class LoginRepo {
  final SharedPreferences prefs;
  final ApiService _api;

  LoginRepo(this._api, this.prefs);


  // fetchLoginData() async {
  //   Map<String, dynamic> data = {};
  //   var res = await _api.postRequest("${Endpoints.dashboard}${prefs.getString("phonenumber")}",data);
  //   print(res);
  //   if (res == null) {
  //     throw "no data found";
  //   }
  //   return res;
  // }



}
