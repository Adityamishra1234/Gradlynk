import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/utils/theme.dart';

import 'error.dart';

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
        return response.body;
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
    // String? token = await getToken();

    var response = await http.post(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          // // 'Authorization': 'Bearer $token',

          //login
          // "Accept": "application/json",
          // "Content-Type": "application/x-www-form-urlencoded"
        },
        body: jsonData);
    switch (response.statusCode) {
      case 200:
        return response.body.isNotEmpty
            ? response.body
            : throw EmptyDataException("440");
      case 440:
        throw EmptyDataException("440");
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 502:
        throw InternetError("Please try after sometime");
      case 500:
      default:
        throw FetchDataException(
            'Something went to wrong : ${response.statusCode}');
    }
  }

  httpPostNullBody(String url) async {
    // String? token = await getToken();
    var response = await http.post(
      Uri.parse(url),
    );
    switch (response.statusCode) {
      case 200:
        return response.body.isNotEmpty &&
                response.body != "" &&
                response.body != "[]"
            ? response.body
            : throw EmptyDataException("440");
      case 440:
        throw EmptyDataException("440");
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 502:
        throw InternetError(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Something went to wrong : ${response.statusCode}');
    }
  }
}

httpPut(String url, var jsonData) async {
  // String? token = await getToken();
  try {
    var response = await http.put(Uri.parse(url), body: jsonData, headers: {
      "Accept": "application/json",
      // 'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return response.body;
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
  // String? token = await getToken();
  try {
    var response = await http.delete(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        // 'Authorization': 'Bearer $token'
      },
      body: jsonData,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}
