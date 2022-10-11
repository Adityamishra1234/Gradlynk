import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentpanel/utils/theme.dart';

class StudentPanelBase {
  // Api Call Base Method

  getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    return token;
  }

  httpGet(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  httpPost(String url, var jsonData) async {
    String? token = await getToken();
    try {
      var response = await http.post(Uri.parse(url),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
            'Authorization': 'Bearer $token',
          },
          body: jsonData);
      if (response.statusCode == 200) {
        return response;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  httpPostNullBody(String url) async {
    // String? token = await getToken();
    try {
      var response = await http.post(
        Uri.parse(url),
        // headers: {
        //   "Accept": "application/json",
        //   "Content-Type": "application/x-www-form-urlencoded",
        //   //'Authorization': 'Bearer $token',
        // },
        // body: ""
      );

      if (response.statusCode == 200) {
        return response;
      } else {
        Fluttertoast.showToast(
            msg: "Something went to wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: ThemeConstants.whitecolor,
            textColor: ThemeConstants.blackcolor,
            fontSize: 16.0);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  httpPut(String url, var jsonData) async {
    String? token = await getToken();
    try {
      var response = await http.put(Uri.parse(url), body: jsonData, headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        return response;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  httpDelete(String url, var jsonData) async {
    String? token = await getToken();
    try {
      var response = await http.delete(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
        body: jsonData,
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
