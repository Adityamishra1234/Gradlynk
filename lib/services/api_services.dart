import 'dart:convert';
import 'package:studentpanel/services/baseservice.dart';
import 'package:studentpanel/ui/models/applicationmodel.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/ui/models/studentpanel.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:studentpanel/utils/endpoint.dart';

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
      // debugPrint(response);
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
      debugPrint(e.toString());
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
      debugPrint(e.toString());
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
      debugPrint(e.toString());
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
      debugPrint(e.toString());
    }
  }

  getCourseBoardField(String baseUrl, String endpoint) async {
    try {
      var response = await httpPostNullBody(baseUrl + endpoint);
      var jsondata = json.decode(response.body);
      return jsondata;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getCourseSearch(String baseUrl, String endpoint) async {
    CourseSearchPages courseSearchPages = CourseSearchPages();

    var response = await httpPostNullBody(baseUrl + endpoint);
    var jsondata = json.decode(response.body);
    courseSearchPages = CourseSearchPages.fromJson(jsondata);
    // courseSearchModel = jsondata.map(( CourseSearchModel data) {
    //   CourseSearchModel.fromJson(data);
    // }).toList();

    //For Duration In Year
    if (courseSearchPages.courseSearchModel!.isNotEmpty) {
      courseSearchPages.endpoint = endpoint;
      for (var i = 0; i < courseSearchPages.courseSearchModel!.length; i++) {
        if (courseSearchPages.courseSearchModel![i].courseDuration != null) {
          courseSearchPages.courseSearchModel![i].durationYear = ((int.parse(
                      courseSearchPages.courseSearchModel![i].courseDuration!) /
                  12)
              .toStringAsFixed(1));
        }
      }

      //Intake
      if (courseSearchPages.courseSearchModel!.isNotEmpty) {
        for (var i = 0; i < courseSearchPages.courseSearchModel!.length; i++) {
          if (courseSearchPages.courseSearchModel![i].intakeFromYear != null) {
            if (courseSearchPages.courseSearchModel![i].intakeFromYear!
                .contains("|")) {
              courseSearchPages.courseSearchModel![i].listIntake!.addAll(
                  courseSearchPages.courseSearchModel![i].intakeFromYear!
                      .split("|"));
            } else {
              courseSearchPages.courseSearchModel![i].listIntake!.add(
                  courseSearchPages.courseSearchModel![i].intakeFromYear
                      .toString());
            }
          }
        }
      }
      for (var i = 0; i < courseSearchPages.courseSearchModel!.length; i++) {
        courseSearchPages.courseSearchModel![i].listIntake = courseSearchPages
            .courseSearchModel![i].listIntake!
            .toSet()
            .toList();
      }
      for (var i = 0; i < courseSearchPages.courseSearchModel!.length; i++) {
        if (courseSearchPages.courseSearchModel![i].listIntake!.isNotEmpty) {
          String temp = "";
          for (var j = 0;
              j < courseSearchPages.courseSearchModel![i].listIntake!.length;
              j++) {
            if (courseSearchPages.courseSearchModel![i].listIntake![j]
                    .toString()
                    .split("-")[0] ==
                "Jan") {
              temp =
                  "01-${courseSearchPages.courseSearchModel![i].listIntake![j].toString().split("-")[1]}-${courseSearchPages.courseSearchModel![i].listIntake![j].toString().split("-")[2]}";
              debugPrint(temp);
            }
            if (courseSearchPages.courseSearchModel![i].listIntake![j]
                    .toString()
                    .split("-")[0] ==
                "Feb") {
              temp =
                  "02-${courseSearchPages.courseSearchModel![i].listIntake![j].toString().split("-")[1]}-${courseSearchPages.courseSearchModel![i].listIntake![j].toString().split("-")[2]}";
            }
            if (courseSearchPages.courseSearchModel![i].listIntake![j]
                    .toString()
                    .split("-")[0] ==
                "Mar") {
              temp =
                  "03-${courseSearchPages.courseSearchModel![i].listIntake![j].toString().split("-")[1]}-${courseSearchPages.courseSearchModel![i].listIntake![j].toString().split("-")[2]}";
              debugPrint(temp);
            }
            if (courseSearchPages.courseSearchModel![i].listIntake![j]
                    .toString()
                    .split("-")[0] ==
                "Apr") {
              temp =
                  "04-${courseSearchPages.courseSearchModel![i].listIntake![j].toString().split("-")[1]}-${courseSearchPages.courseSearchModel![i].listIntake![j].toString().split("-")[2]}";
            }
            if (courseSearchPages.courseSearchModel![i].listIntake![j]
                    .toString()
                    .split("-")[0] ==
                "May") {
              temp =
                  "05-${courseSearchPages.courseSearchModel![i].listIntake![j].toString().split("-")[1]}-${courseSearchPages.courseSearchModel![i].listIntake![j].toString().split("-")[2]}";
            }
            if (courseSearchPages.courseSearchModel![i].listIntake![j]
                    .toString()
                    .split("-")[0] ==
                "Jun") {
              temp =
                  "06-${courseSearchPages.courseSearchModel![i].listIntake![j].toString().split("-")[1]}-${courseSearchPages.courseSearchModel![i].listIntake![j].toString().split("-")[2]}";
            }
            if (courseSearchPages.courseSearchModel![i].listIntake![j]
                    .toString()
                    .split("-")[0] ==
                "Jul") {
              temp =
                  "07-${courseSearchPages.courseSearchModel![i].listIntake![j].toString().split("-")[1]}-${courseSearchPages.courseSearchModel![i].listIntake![j].toString().split("-")[2]}";
            }
            if (courseSearchPages.courseSearchModel![i].listIntake![j]
                    .toString()
                    .split("-")[0] ==
                "Aug") {
              temp =
                  "08-${courseSearchPages.courseSearchModel![i].listIntake![j].toString().split("-")[1]}-${courseSearchPages.courseSearchModel![i].listIntake![j].toString().split("-")[2]}";
            }
            if (courseSearchPages.courseSearchModel![i].listIntake![j]
                    .toString()
                    .split("-")[0] ==
                "Sep") {
              temp =
                  "09-${courseSearchPages.courseSearchModel![i].listIntake![j].toString().split("-")[1]}-${courseSearchPages.courseSearchModel![i].listIntake![j].toString().split("-")[2]}";
            }
            if (courseSearchPages.courseSearchModel![i].listIntake![j]
                    .toString()
                    .split("-")[0] ==
                "Oct") {
              temp =
                  "10-${courseSearchPages.courseSearchModel![i].listIntake![j].toString().split("-")[1]}-${courseSearchPages.courseSearchModel![i].listIntake![j].toString().split("-")[2]}";
            }
            if (courseSearchPages.courseSearchModel![i].listIntake![j]
                    .toString()
                    .split("-")[0] ==
                "Nov") {
              temp =
                  "11-${courseSearchPages.courseSearchModel![i].listIntake![j].toString().split("-")[1]}-${courseSearchPages.courseSearchModel![i].listIntake![j].toString().split("-")[2]}";
            }
            if (courseSearchPages.courseSearchModel![i].listIntake![j]
                    .toString()
                    .split("-")[0] ==
                "Dec") {
              temp =
                  "12-${courseSearchPages.courseSearchModel![i].listIntake![j].toString().split("-")[1]}-${courseSearchPages.courseSearchModel![i].listIntake![j].toString().split("-")[2]}";
            }
            courseSearchPages.courseSearchModel![i].listIntake![j] = temp;
          }
        }
      }
    }
    return courseSearchPages;
  }

  completeCourseDetail(String baseUrl, String endpoint) async {
    debugPrint(endpoint);
    // try {
    var response = await httpPostNullBody(baseUrl + endpoint);
    if (response != null) {
      var jsondata = json.decode(response.body);
      debugPrint("object");
      List<CompleteCourseDetail> completeCourseDetail =
          List<CompleteCourseDetail>.from(json
              .decode(response.body)
              .map((x) => CompleteCourseDetail.fromJson(x)));

      debugPrint("object");
      return completeCourseDetail;
    }

    // } catch (e) {
    //   debugdebugPrint(e.toString());
    // }
  }

  setShortListCourse(String? id, String? enq_id) async {
    var response = await httpPostNullBody(
        "${Endpoints.baseUrl!}${Endpoints.courseShortList!}course_id=$id&enq_id=$enq_id");
    if (response != null) {
      Get.snackbar("Course ShortList", response.body,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  setFinalShortListCourse(String? id, String? enq_id) async {
    var response = await httpPostNullBody(
        "${Endpoints.baseUrl!}${Endpoints.finalCourseShortList!}course_id=$id&enq_id=$enq_id");
    if (response != null) {
      Get.snackbar("Course ShortList", response.body,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  courseShortlistDetail(String? enq_id) async {
    CourseSearchPages courseSearchPages = CourseSearchPages();
    var response = await httpPostNullBody(
        "${Endpoints.baseUrl!}${Endpoints.courseShortListDetail!}enq_id=$enq_id");
    if (response != null) {
      var jsondata = json.decode(response.body);
      courseSearchPages = CourseSearchPages.fromJson(jsondata);
    }
    return courseSearchPages;
  }

  getApplicationSummaryList(String enq_id) async {
    List<ApplicationSummaryModel> applicationSummaryModel = [];
    var response = await httpPostNullBody(
        "${Endpoints.baseUrl!}${Endpoints.applicationSummary!}enq_id=$enq_id");
    if (response != null) {
      applicationSummaryModel = List<ApplicationSummaryModel>.from(json
          .decode(response.body)
          .map((x) => ApplicationSummaryModel.fromJson(x)));
    }
    return applicationSummaryModel;
  }

  getFinalShortlist(String enq_id) async {
    CourseSearchPages courseSearchPages = CourseSearchPages();
    var response = await httpPostNullBody(
        "${Endpoints.baseUrl!}${Endpoints.finalShortListDetail}enq_id=$enq_id");
    if (response != null) {
      var jsondata = json.decode(response.body);
      courseSearchPages = CourseSearchPages.fromJson(jsondata);
    }
    return courseSearchPages;
  }

  // logout(String baseUrl, String endpoint) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var jsonData = {"token": sharedPreferences.getString("token")};
  //   var response;

  //   try {
  //     response = await crmBase!.httpPost(baseUrl + endpoint, jsonData);
  //   } catch (e) {
  //     if (kDebugMode) {
  //       debugPrint(e);
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
  //       debugPrint(e);
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
  //       debugPrint(e);
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
  //       debugPrint(e);
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
  //       debugPrint(e);
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
  //       debugPrint(e);
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
