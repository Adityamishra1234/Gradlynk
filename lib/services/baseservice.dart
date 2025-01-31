import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';

import 'error.dart';

class StudentPanelBase {
  // Api Call Base Method

  getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    return token;
  }

  httpGet(String url) async {
    await checkUserConnection();
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

  httpGetWithoutLogin(String url) async {
    await checkUserConnectionWithoutLogin();
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
    await checkUserConnection();
    jsonData = jsonData.replaceAll('"null"', "");
    var response = await http.post(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          // 'Authorization': 'Bearer $token',

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
        getToast("Server Error : Status : 500");
        throw InternetError("Please try after sometime");
      default:
        throw FetchDataException(
            'Something went to wrong : ${response.statusCode}');
    }
  }

  logoutPost(String url, var jsonData, String token) async {
    try {
      var response = await http.post(Uri.parse(url),
          headers: {
            // "Accept": "application/json",
            // "Content-Type": "application/x-www-form-urlencoded",
            'Authorization': 'Bearer $token',
          },
          body: jsonData);

      if (response.statusCode == 200) {
        return true;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  httpPostNullBody2(String url, {bool login = false}) async {
    // String? token = await getToken();
    url = url.replaceAll('"null"', "''");
    if (login == false) {
      await checkUserConnection();
    }

    var response = await http.post(
      Uri.parse(url),
    );
    switch (response.statusCode) {
      case 200:
        {
          var res = json.decode(response.body);

          return res;
        }
      case 440:
        throw EmptyDataException("440:${response.body}");
      case 400:
        throw BadRequestException("${response.statusCode}:${response.body}");
      case 401:
      case 403:
        throw UnauthorisedException("${response.statusCode}:${response.body}");
      case 502:
        throw InternetError("${response.statusCode}:${response.body}");
      case 500:
        getToast("Server Error : Status : 500");
        throw InternetError("Please try after sometime");
      default:
        throw FetchDataException("${response.statusCode}:${response.body}");
    }
  }

  httpPostNullBody(String url,
      {bool login = false, bool handele404Error = false}) async {
    // String? token = await getToken();
    url = url.replaceAll('"null"', "");
    if (login == false) {
      await checkUserConnection();
    }
    var response = await http.post(
      Uri.parse(url),
    );
    switch (response.statusCode) {
      case 200:
        return response.body.isNotEmpty &&
                response.body != "" &&
                response.body != "[]" &&
                response.body != []
            ? response.body
            : throw EmptyDataException("440 :${response.body}");

      case 429:
        throw BadRequestException("${response.statusCode} :${response.body}");

      case 440:
        throw EmptyDataException("440 :${response.body}");
      case 400:
        throw BadRequestException("${response.statusCode} :${response.body}");
      case 401:
        throw InternetError("${response.statusCode} :${response.body}");
      case 403:
        throw UnauthorisedException("${response.statusCode} :${response.body}");
      case 502:
        throw InternetError("${response.statusCode} :${response.body}");
      case 500:
        getToast("Server Error : Status : 500");
        throw InternetError("Please try after sometime");
      case 404:
        return handele404Error == true
            ? response.body
            : throw FetchDataException(
                "${response.statusCode} :${response.body}");
      default:
        throw FetchDataException("${response.statusCode} :${response.body}");
    }
  }

  getRequest(String url, {bool login = false}) async {
    // String? token = await getToken();
    url = url.replaceAll('"null"', "");
    if (login == false) {
      await checkUserConnection();
    }

    var response = await http.get(
      Uri.parse(url),
    );
    switch (response.statusCode) {
      case 200:
        return response.body.isNotEmpty &&
                response.body != "" &&
                response.body != "[]" &&
                response.body != []
            ? response.body
            : throw EmptyDataException("440 :${response.body}");
      case 440:
        throw EmptyDataException("440 :${response.body}");
      case 400:
        throw BadRequestException("${response.statusCode} :${response.body}");
      case 401:
      case 403:
        throw UnauthorisedException("${response.statusCode} :${response.body}");
      case 502:
        throw InternetError("${response.statusCode} :${response.body}");
      case 500:
        getToast("Server Error : Status : 500");
        throw InternetError("Please try after sometime");
      default:
        throw FetchDataException("${response.statusCode} :${response.body}");
    }
  }

  httplogout(String url, String token) async {
    // String? token = await getToken();
    // await checkUserConnection();

    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $token',
      },
    );
    print(token);
    print(response.body);

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
        getToast("Server Error : Status : 500");
        throw InternetError("Please try after sometime");
      default:
        throw FetchDataException(
            'Something went to wrong : ${response.statusCode}');
    }
  }

  httpPut(String url, var jsonData) async {
    // String? token = await getToken();
    await checkUserConnection();
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
    await checkUserConnection();
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

  errorHandle(String enq_id, String error_message, String statusCode,
      [String extra = ""]) async {
    String endpoint = Endpoints.errorHandlePart1! +
        enq_id +
        Endpoints.errorHandlepart2! +
        error_message +
        Endpoints.errorHandlepart3! +
        statusCode +
        Endpoints.errorHandlepart4! +
        extra.replaceAll("#", "");

    try {
      if (statusCode != 440 || statusCode != 440.toString()) {
        var res = await httpPostNullBody(Endpoints.baseUrl! + endpoint);
        if (res != null) {}
      }
    } catch (e) {}
  }

  httpPostNullBodyWithNullData(String url, {bool login = false}) async {
    // String? token = await getToken();
    url = url.replaceAll('"null"', "");
    if (login == false) {
      await checkUserConnection();
    }

    var response = await http.post(
      Uri.parse(url),
    );
    switch (response.statusCode) {
      case 200:
        return response.body;

      case 440:
        throw EmptyDataException("440 :${response.body}");
      case 400:
        throw BadRequestException("${response.statusCode} :${response.body}");
      case 401:
      case 403:
        throw UnauthorisedException("${response.statusCode} :${response.body}");
      case 502:
        throw InternetError("${response.statusCode} :${response.body}");
      case 500:
        getToast("Server Error : Status : 500");
        throw InternetError("Please try after sometime");
      default:
        throw FetchDataException("${response.statusCode} :${response.body}");
    }
  }

  // httpPostNullBody(String url, {bool login = false}) async {
  //   // String? token = await getToken();
  //   url = url.replaceAll('"null"', "");
  //   if (login == false) {
  //     await checkUserConnection();
  //   }

  //   var response = await http.post(
  //     Uri.parse(url),
  //   );
  //   switch (response.statusCode) {
  //     case 200:
  //       return response.body.isNotEmpty &&
  //               response.body != "" &&
  //               response.body != "[]" &&
  //               response.body != []
  //           ? response.body
  //           : throw EmptyDataException("440 :${response.body}");
  //     case 440:
  //       throw EmptyDataException("440 :${response.body}");
  //     case 400:
  //       throw BadRequestException("${response.statusCode} :${response.body}");
  //     case 401:
  //     case 403:
  //       throw UnauthorisedException("${response.statusCode} :${response.body}");
  //     case 502:
  //       throw InternetError("${response.statusCode} :${response.body}");
  //     case 500:
  //     default:
  //       throw FetchDataException("${response.statusCode} :${response.body}");
  //   }
  // }
}
