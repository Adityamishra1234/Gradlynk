import 'dart:convert';
import 'package:studentpanel/services/baseservice.dart';
import 'package:studentpanel/ui/models/country.dart';
import 'package:studentpanel/ui/models/courseboardfield.dart';
import 'package:studentpanel/ui/models/courselevel.dart';
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
    Country country = Country();
    String data;
    var response;
    List<String> countrylist = [], countryCode = [], listdata = [];
    try {
      response = await httpPostNullBody(baseUrl + endpoint);
      var jsondata = json.decode(response.body);
      data = jsondata.toString();
      data = data.split("{[")[0];
      data = data.split("{")[1].split("}")[0];
      listdata = data.split(",");
      listdata.forEach((element) {
        countrylist.add(element.toString().split(":")[0]);
        countryCode.add(element.toString().split(":")[1]);
      });

      country = Country.fromJson(jsondata);
      country.countrylist = countrylist;
      country.codelist = countryCode;
      return country;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getCourseLevel(String baseUrl, String endpoint) async {
    String data;
    var response;
    List<String> courselist = [], courseCode = [], listdata = [];
    CourseLevel courseLevel = CourseLevel();
    try {
      response = await httpPostNullBody(baseUrl + endpoint);
      var jsondata = json.decode(response.body);

      data = jsondata.toString();
      data = data.split("{[")[0];
      data = data.split("{")[1].split("}")[0];
      listdata = data.split(",");
      listdata.forEach((element) {
        courselist.add(element.toString().split(":")[0]);
        courseCode.add(element.toString().split(":")[1]);
      });

      courseLevel = CourseLevel.fromJson(jsondata);
      courseLevel.courseLevelList = courselist;
      courseLevel.courseCode = courseCode;
      return courseLevel;
    } catch (e) {
      print(e.toString());
    }
  }

  getState(String baseUrl, String endpoint, String countrydata) async {
    var temp = countrydata.split('[');
    var temp2 = temp[1].split(']')[0];
    print(temp2.removeAllWhitespace);
    print(baseUrl + endpoint + temp2.removeAllWhitespace.toString());

    try {
      var response = await httpPostNullBody(
          baseUrl + endpoint + temp2.removeAllWhitespace.toString());
      return response.body;
    } catch (e) {
      print(e.toString());
    }
  }

  getCity(String baseUrl, String endpoint, String statedata) async {
    var temp = statedata.split('[');
    var temp2 = temp[1].split(']')[0];
    print(temp2.removeAllWhitespace);
    print(baseUrl + endpoint + temp2.removeAllWhitespace.toString());

    try {
      var response = await httpPostNullBody(
          baseUrl + endpoint + temp2.removeAllWhitespace.toString());
      return response.body;
    } catch (e) {
      print(e.toString());
    }
  }

  getCoursenarrowField(
      String baseUrl, String endpoint, String broadFieldId) async {
    var temp = broadFieldId.split('[');
    var temp2 = temp[1].split(']')[0];
    print(temp2.removeAllWhitespace);
    print(baseUrl + endpoint + temp2.removeAllWhitespace.toString());

    try {
      var response = await httpPostNullBody(
          baseUrl + endpoint + temp2.removeAllWhitespace.toString());
      return response.body;
    } catch (e) {
      print(e.toString());
    }
  }

  getCourseBoardField(String baseUrl, String endpoint) async {
    CourseBoardField courseBoardField = CourseBoardField();
    String data;
    List<String> courseBoardFieldList = [],
        courseBoardFieldCode = [],
        listdata = [];
    try {
      var response = await httpPostNullBody(baseUrl + endpoint);
      var jsondata = json.decode(response.body);
      courseBoardField = CourseBoardField.fromJson(jsondata);
      data = jsondata.toString();
      data = data.split("{[")[0];
      data = data.split("{")[1].split("}")[0];
      listdata = data.split(", ");
      for (int i = 0; i <= listdata.length - 1; i++) {
        // Bug Field Update
        if (i == 10) {
          courseBoardFieldCode.add("18");
          courseBoardFieldList
              .add("Agriculture,Environment and Related Studies");
        } else {
          courseBoardFieldCode.add(listdata[i].toString().split(":")[1]);
          courseBoardFieldList.add(listdata[i].toString().split(":")[0]);
        }
      }

      courseBoardField.courseBoardFieldList = courseBoardFieldList;
      courseBoardField.courseboardFieldCode = courseBoardFieldCode;
      return courseBoardField;
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
          print(i);
          print(courseSearchModel[i].durationYear);
        }
      }

      //Intake
      if (courseSearchModel.isNotEmpty) {
        for (var i = 0; i < courseSearchModel.length; i++) {
          if (courseSearchModel[i].intakeFromYear != null) {
            courseSearchModel[i]
                .listIntake!
                .addAll(courseSearchModel[i].intakeFromYear!.split("|"));
          }
        }
      }
      for (var i = 0; i < courseSearchModel.length; i++) {
        courseSearchModel[i].listIntake =
            courseSearchModel[i].listIntake!.toSet().toList();
      }
    }

    return courseSearchModel;
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
