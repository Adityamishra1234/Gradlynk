import 'dart:convert';
import 'package:studentpanel/services/baseservice.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';

import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/ui/models/newsandupdate.dart';
import 'package:studentpanel/ui/models/studentpanel.dart';
import 'package:studentpanel/ui/models/upcomingevent.dart';
import 'package:studentpanel/ui/models/upcomingholiday.dart';
import 'package:studentpanel/ui/models/userHistory.dart';
import 'package:studentpanel/ui/models/usermodel.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentpanel/ui/screen/coursesearch.dart';

class ApiServices extends StudentPanelBase {
  StudentPanelBase? crmBase = StudentPanelBase();

  login(String baseUrl, String endpoint, String number) async {
    StudentPanel studentPanel;
    var response;
    var jsonData = {"mobile_number": number};
    try {
      response = await http.post(Uri.parse(baseUrl + endpoint),

          // Api Call
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded"
          },
          body: jsonData);
    } catch (e) {
      Get.snackbar("", response.body);
    }
    if (response != null) {
      // print(response);
      // SharedPreferences sharedPreferences =
      //     await SharedPreferences.getInstance();
      // final formattedStr = formatDate(
      //     DateTime.now(), [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss]);
      // sharedPreferences.setString('UserModel', response.body);
      var jsondata = json.decode(response.body);
      studentPanel = StudentPanel.fromJson(jsondata);
      // sharedPreferences.setString('token', userModel.token);
      // sharedPreferences.setString("login_time", formattedStr);
      // sharedPreferences.setString("id", userModel.user.id.toString());
      return studentPanel;
    } else {
      return false;
    }
  }

  getCountry(String baseUrl, String endpoint) async {
    // Country country = Country();
    String data;
    var response;
    List<String> countrylist = [], countryCode = [], listdata = [];
    try {
      response = await httpPostNullBody(baseUrl + endpoint);
      var jsondata = json.decode(response.body);
      return jsondata;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getCourseLevel(String baseUrl, String endpoint) async {
    var response;

    try {
      response = await httpPostNullBody(baseUrl + endpoint);
      var jsondata = json.decode(response.body);

      return jsondata;
    } catch (e) {
      print(e.toString());
    }
  }

  getState(String baseUrl, String endpoint, String countrydata) async {
    var temp = countrydata.split('[');
    var temp2 = temp[1].split(']')[0];

    try {
      var response = await httpPostNullBody(
          baseUrl + endpoint + temp2.removeAllWhitespace.toString());
      var jsondata = json.decode(response.body);
      return jsondata;
    } catch (e) {
      print(e.toString());
    }
  }

  getCity(String baseUrl, String endpoint, String statedata) async {
    var temp = statedata.split('[');
    var temp2 = temp[1].split(']')[0];

    try {
      var response = await httpPostNullBody(
          baseUrl + endpoint + temp2.removeAllWhitespace.toString());
      var jsondata = json.decode(response.body);
      return jsondata;
    } catch (e) {
      print(e.toString());
    }
  }

  getCoursenarrowField(
      String baseUrl, String endpoint, String broadFieldId) async {
    var temp = broadFieldId.split('[');
    var temp2 = temp[1].split(']')[0];

    try {
      var response = await httpPostNullBody(
          baseUrl + endpoint + temp2.removeAllWhitespace.toString());
      var jsondata = json.decode(response.body);
      return jsondata;
    } catch (e) {
      print(e.toString());
    }
  }

  getCourseBoardField(String baseUrl, String endpoint) async {
    try {
      var response = await httpPostNullBody(baseUrl + endpoint);
      var jsondata = json.decode(response.body);
      return jsondata;
    } catch (e) {
      print(e.toString());
    }
  }

  getCourseSearch(String baseUrl, String endpoint) async {
    List<CourseSearchModel> courseSearchModel = [];

    var response = await httpPostNullBody(baseUrl + endpoint);
    // var jsondata = json.decode(response.body);
    courseSearchModel = List<CourseSearchModel>.from(
        json.decode(response.body).map((x) => CourseSearchModel.fromJson(x)));
    // courseSearchModel = jsondata.map(( CourseSearchModel data) {
    //   CourseSearchModel.fromJson(data);
    // }).toList();

    //For Duration In Year
    if (courseSearchModel.isNotEmpty) {
      for (var i = 0; i < courseSearchModel.length; i++) {
        if (courseSearchModel[i].courseDuration != null) {
          courseSearchModel[i].durationYear =
              ((int.parse(courseSearchModel[i].courseDuration!) / 12)
                  .toStringAsFixed(1));
        }
      }

      //Intake
      if (courseSearchModel.isNotEmpty) {
        for (var i = 0; i < courseSearchModel.length; i++) {
          if (courseSearchModel[i].intakeFromYear != null) {
            if (courseSearchModel[i].intakeFromYear!.contains("|")) {
              courseSearchModel[i]
                  .listIntake!
                  .addAll(courseSearchModel[i].intakeFromYear!.split("|"));
            } else {
              courseSearchModel[i]
                  .listIntake!
                  .add(courseSearchModel[i].intakeFromYear.toString());
            }
          }
        }
      }
      for (var i = 0; i < courseSearchModel.length; i++) {
        courseSearchModel[i].listIntake =
            courseSearchModel[i].listIntake!.toSet().toList();
      }
      for (var i = 0; i < courseSearchModel.length; i++) {
        if (courseSearchModel[i].listIntake!.isNotEmpty) {
          String temp = "";
          for (var j = 0; j < courseSearchModel[i].listIntake!.length; j++) {
            if (courseSearchModel[i].listIntake![j].toString().split("-")[0] ==
                "Jan") {
              temp =
                  "01-${courseSearchModel[i].listIntake![j].toString().split("-")[1]}-${courseSearchModel[i].listIntake![j].toString().split("-")[2]}";
              print(temp);
            }
            if (courseSearchModel[i].listIntake![j].toString().split("-")[0] ==
                "Feb") {
              temp =
                  "02-${courseSearchModel[i].listIntake![j].toString().split("-")[1]}-${courseSearchModel[i].listIntake![j].toString().split("-")[2]}";
            }
            if (courseSearchModel[i].listIntake![j].toString().split("-")[0] ==
                "Mar") {
              temp =
                  "03-${courseSearchModel[i].listIntake![j].toString().split("-")[1]}-${courseSearchModel[i].listIntake![j].toString().split("-")[2]}";
              print(temp);
            }
            if (courseSearchModel[i].listIntake![j].toString().split("-")[0] ==
                "Apr") {
              temp =
                  "04-${courseSearchModel[i].listIntake![j].toString().split("-")[1]}-${courseSearchModel[i].listIntake![j].toString().split("-")[2]}";
            }
            if (courseSearchModel[i].listIntake![j].toString().split("-")[0] ==
                "May") {
              temp =
                  "05-${courseSearchModel[i].listIntake![j].toString().split("-")[1]}-${courseSearchModel[i].listIntake![j].toString().split("-")[2]}";
            }
            if (courseSearchModel[i].listIntake![j].toString().split("-")[0] ==
                "Jun") {
              temp =
                  "06-${courseSearchModel[i].listIntake![j].toString().split("-")[1]}-${courseSearchModel[i].listIntake![j].toString().split("-")[2]}";
            }
            if (courseSearchModel[i].listIntake![j].toString().split("-")[0] ==
                "Jul") {
              temp =
                  "07-${courseSearchModel[i].listIntake![j].toString().split("-")[1]}-${courseSearchModel[i].listIntake![j].toString().split("-")[2]}";
            }
            if (courseSearchModel[i].listIntake![j].toString().split("-")[0] ==
                "Aug") {
              temp =
                  "08-${courseSearchModel[i].listIntake![j].toString().split("-")[1]}-${courseSearchModel[i].listIntake![j].toString().split("-")[2]}";
            }
            if (courseSearchModel[i].listIntake![j].toString().split("-")[0] ==
                "Sep") {
              temp =
                  "09-${courseSearchModel[i].listIntake![j].toString().split("-")[1]}-${courseSearchModel[i].listIntake![j].toString().split("-")[2]}";
            }
            if (courseSearchModel[i].listIntake![j].toString().split("-")[0] ==
                "Oct") {
              temp =
                  "10-${courseSearchModel[i].listIntake![j].toString().split("-")[1]}-${courseSearchModel[i].listIntake![j].toString().split("-")[2]}";
            }
            if (courseSearchModel[i].listIntake![j].toString().split("-")[0] ==
                "Nov") {
              temp =
                  "11-${courseSearchModel[i].listIntake![j].toString().split("-")[1]}-${courseSearchModel[i].listIntake![j].toString().split("-")[2]}";
            }
            if (courseSearchModel[i].listIntake![j].toString().split("-")[0] ==
                "Dec") {
              temp =
                  "12-${courseSearchModel[i].listIntake![j].toString().split("-")[1]}-${courseSearchModel[i].listIntake![j].toString().split("-")[2]}";
            }
            courseSearchModel[i].listIntake![j] = temp;
          }
        }
      }
    }
    return courseSearchModel;
  }

  completeCourseDetail() async {
    // try {
    var response = await httpPostNullBody(
        "http://14.97.86.202:205/api/get-course-details?university_id=8571&course_id=31819");
    if (response != null) {
      var jsondata = json.decode(response.body);
      print("object");
      List<CompleteCourseDetail> completeCourseDetail =
          List<CompleteCourseDetail>.from(json
              .decode(response.body)
              .map((x) => CompleteCourseDetail.fromJson(x)));

      print("object");
      return completeCourseDetail;
    }
    // } catch (e) {
    //   debugPrint(e.toString());
    // }
  }
  // logout(String baseUrl, String endpoint) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var jsonData = {"token": sharedPreferences.getString("token")};
  //   var response;

  //   try {
  //     response = await crmBase!.httpPost(baseUrl + endpoint, jsonData);
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   }
  //   if (response != null) {
  //     return response.body;
  //   } else {
  //     return "Error";
  //   }
  // }

  // updateUserHistory(String baseUrl, String endpoint, String reason) async {
  //   // Cache Data
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   final formattedStr = formatDate(
  //       DateTime.now(), [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss]);

  //   var jsondata =
  //       json.decode(sharedPreferences.getString("UserModel").toString());
  //   UserModel userModel = UserModel.fromJson(jsondata);
  //   var response;

  //   // Api Call
  //   var jsonData = {
  //     "user_id": userModel.user.id.toString(),
  //     "login_time": sharedPreferences.getString("login_time"),
  //     "logout_time": formattedStr,
  //     "reason": reason
  //   };
  //   try {
  //     response = await crmBase!.httpPost(baseUrl + endpoint, jsonData);
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   }

  //   if (response != null) {
  //     return response.body;
  //   } else {
  //     return "Error";
  //   }
  // }

  // getUserHistory(String baseUrl, String endpoint) async {
  //   List<UserHistory>? userHistoryList;
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var jsonData = {"user_id": sharedPreferences.getString("id")};
  //   var response;

  //   try {
  //     response = await crmBase!.httpPost(baseUrl + endpoint, jsonData);
  //     if (response != null) {
  //       List jsonResponse = json.decode(response.body);
  //       userHistoryList =
  //           jsonResponse.map((job) => UserHistory.fromJson(job)).toList();
  //       return userHistoryList;
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   }
  // }

  // newAndUpdates(String baseUrl, String endpoint) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   List<NewsAndUpdate> newsAndUpdatelist;
  //   var jsonData = {"user_id": sharedPreferences.getString("id")};
  //   var response;

  //   try {
  //     response = await crmBase!.httpPost(baseUrl + endpoint, jsonData);
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   }

  //   if (response != null) {
  //     List jsonResponse = json.decode(response.body);
  //     newsAndUpdatelist =
  //         jsonResponse.map((job) => NewsAndUpdate.fromJson(job)).toList();
  //     return newsAndUpdatelist;
  //   } else {
  //     Get.snackbar("Dashboard Page Alert ", response.body);
  //     return null;
  //   }
  // }

  // upcomingEvents(String baseUrl, String endpoint) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var jsonData = {"user_id": sharedPreferences.getString("id")};
  //   var response;

  //   try {
  //     response = await crmBase!.httpPost(baseUrl + endpoint, jsonData);
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   }

  //   List<UpcomingEvent> upcomingList;
  //   if (response != null) {
  //     List jsonResponse = json.decode(response.body);
  //     upcomingList =
  //         jsonResponse.map((job) => UpcomingEvent.fromJson(job)).toList();
  //     return upcomingList;
  //   } else {
  //     Get.snackbar("Dashboard Page Alert ", response.body);
  //     return null;
  //   }
  // }

  // upcomingholidays(String baseUrl, String endpoint) async {
  //   List<UpcomingHoliday> upComingHolidayList;
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var jsonData = {"user_id": sharedPreferences.getString("id")};
  //   var response;
  //   try {
  //     response = await crmBase!.httpPost(baseUrl + endpoint, jsonData);
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   }

  //   if (response != null) {
  //     List jsonResponse = json.decode(response.body);
  //     upComingHolidayList =
  //         jsonResponse.map((job) => UpcomingHoliday.fromJson(job)).toList();
  //     return upComingHolidayList;
  //   } else {
  //     Get.snackbar("Dashboard Page Alert ", response.body);
  //     return null;
  //   }
  // }

  // Notification For User is pending

}
