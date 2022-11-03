import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:studentpanel/services/baseservice.dart';
import 'package:studentpanel/ui/models/applicationdetailmodel.dart';
import 'package:studentpanel/ui/models/applicationmodel.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/ui/models/filterModel.dart';
import 'package:studentpanel/ui/models/personalinformation.dart';
import 'package:studentpanel/ui/models/studentpanel.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:studentpanel/ui/models/visadetail.dart';
import 'package:studentpanel/ui/screen/personalinformation.dart';
import 'package:studentpanel/ui/screen/visa.dart';
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

  getCourseSearch(String baseUrl, String endpoint, String enq_id) async {
    CourseModelFilter courseModelFilter = CourseModelFilter();

    List<CourseSearchModel> courseSearchModel = [];
    print(baseUrl + endpoint + "&enq_id=" + enq_id);

    var response = await httpPostNullBody("$baseUrl$endpoint&enq_id=$enq_id");

    var jsondata = json.decode(response.body);

    courseSearchModel = List<CourseSearchModel>.from(
        json.decode(response.body).map((x) => CourseSearchModel.fromJson(x)));
    if (courseSearchModel.isNotEmpty) {
      courseModelFilter.courseSearchList = courseSearchModel;
      courseModelFilter.filterModel = await createFilter(courseModelFilter);
    }
    courseModelFilter.courseSearchList = courseSearchModel;

    return courseModelFilter;
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
    CourseModelFilter courseModelFilter = CourseModelFilter();

    var response = await httpPostNullBody(
        "${Endpoints.baseUrl!}${Endpoints.courseShortListDetail!}enq_id=$enq_id");
    if (response != null) {
      var jsondata = json.decode(response.body);
      courseModelFilter.courseSearchList = List<CourseSearchModel>.from(
          json.decode(response.body).map((x) => CourseSearchModel.fromJson(x)));
      if (courseModelFilter.courseSearchList.isNotEmpty) {
        courseModelFilter.filterModel = await createFilter(courseModelFilter);
        for (var i = 0; i < courseModelFilter.courseSearchList.length; i++) {
          courseModelFilter.courseSearchList[i].shortList = "1";
        }
      }
    }

    return courseModelFilter;
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

  getFinalShortlist(String? endpoints, String enq_id) async {
    CourseModelFilter courseModelFilter = CourseModelFilter();
    List<CourseSearchModel> courseSearchModel = [];
    var response = await httpPostNullBody(
        "${Endpoints.baseUrl!}${endpoints}enq_id=$enq_id");
    if (response != null) {
      var jsondata = json.decode(response.body);
      courseModelFilter.courseSearchList = List<CourseSearchModel>.from(
          json.decode(response.body).map((x) => CourseSearchModel.fromJson(x)));
      if (courseModelFilter.courseSearchList.isNotEmpty) {
        courseModelFilter.filterModel = await createFilter(courseModelFilter);
      }
    }
    return courseModelFilter;
  }

  getApplicationDetails(String? endpoints, String? apli_id) async {
    ApplicationDetailModel applicationDetailModel = ApplicationDetailModel();
    var response =
        await httpPostNullBody("${Endpoints.baseUrl}${endpoints}$apli_id");
    if (response != null) {
      var jsondata = json.decode(response.body);
      applicationDetailModel = ApplicationDetailModel.fromJson(jsondata);
      return applicationDetailModel;
    }
  }

  createFilter(CourseModelFilter courseModelFilter) {
    FilterModel filterModel = FilterModel();
    courseModelFilter.courseSearchList.forEach((element) {
      if (element.intakeMonth != null && element.intakeMonth != "") {
        filterModel.intakeMonth!.addAll(element.intakeMonth!.split("|"));
      }
      if (element.intakeYear != null && element.intakeYear != "") {
        filterModel.intakeYear!.addAll(element.intakeYear!.split("|"));
      }
      if (element.academicRequire != null && element.academicRequire != "") {
        filterModel.academicPercentage!
            .add(element.academicRequire!.split("-")[1]);
      }
      if (element.universityName != null && element.universityName != "") {
        filterModel.universityname!.add(element.universityName ?? "");
      }
      if (element.instituteType != null && element.instituteType != "") {
        filterModel.instituteLevel!.add(element.instituteType ?? "");
      }
      if (element.academicRequire != null) {
        filterModel.academicPercentage!.add(element.academicRequire ?? "");
      }
      if (element.allFeesInr != null && element.allFeesInr != "") {
        filterModel.budget!.add(element.allFeesInr ?? "");
      }
      if (element.offerTat != null && element.offerTat != "") {
        filterModel.offerTAT!.add(element.offerTat ?? "");
      }
      if (element.visaTat != null && element.visaTat != "") {
        filterModel.visaTAT!.add(element.visaTat ?? "");
      }

      if (element.countryName != null && element.countryName != "") {
        filterModel.countryName!.add(element.countryName ?? "");
      }
      if (element.instSubCategory != null && element.instSubCategory != "") {
        filterModel.institutePrivatePublic!.add(element.instSubCategory ?? "");
      }
      if (element.arwuRank != null && element.arwuRank != "") {
        filterModel.arwuNewsRanking!.add(element.arwuRank ?? "");
      }
      if (element.timesRank != null && element.timesRank != "") {
        filterModel.timesRanking!.add(element.timesRank ?? "");
      }
      if (element.usNewsRank != null && element.usNewsRank != "") {
        filterModel.usNewsRanking!.add(element.usNewsRank ?? "");
      }
      if (element.qsWorldRank != null && element.qsWorldRank != "") {
        filterModel.qsWorldRanking!.add(element.qsWorldRank ?? "");
      }

      // Yes No
      if (element.scholarship != null && element.scholarship != "") {
        filterModel.scholarship!.add(element.scholarship ?? "");
      }
      if (element.siecPriority != null && element.siecPriority != "") {
        filterModel.siecPriority!.add(element.siecPriority ?? "");
      }
      if (element.conditionalOffer != null && element.conditionalOffer != "") {
        filterModel.conditionalOffer!.add(element.conditionalOffer ?? "");
      }
      if (element.backlogsAcceptable != null &&
          element.backlogsAcceptable != "") {
        filterModel.backlogAcceptable!.add(element.backlogsAcceptable ?? "");
      }
      if (element.isApplicationFee != null && element.isApplicationFee != "") {
        filterModel.applicationfee!.add(element.isApplicationFee ?? "");
      }
      if (element.siecRep != null && element.siecRep != "") {
        filterModel.siecRep!.add(element.siecRep ?? "");
      }
      // filterModel.placementSandwich!.add(element.place)
    });
    filterModel.universityname = filterModel.universityname!.toSet().toList();
    filterModel.instituteLevel = filterModel.instituteLevel!.toSet().toList();
    filterModel.academicPercentage =
        filterModel.academicPercentage!.toSet().toList();
    filterModel.budget = filterModel.budget!.toSet().toList();
    filterModel.offerTAT = filterModel.offerTAT!.toSet().toList();
    filterModel.visaTAT = filterModel.visaTAT!.toSet().toList();
    filterModel.countryName = filterModel.countryName!.toSet().toList();
    filterModel.intakeMonth = filterModel.intakeMonth!.toSet().toList();
    filterModel.intakeYear = filterModel.intakeYear!.toSet().toList();
    filterModel.academicPercentage =
        filterModel.academicPercentage!.toSet().toList();
    filterModel.institutePrivatePublic =
        filterModel.institutePrivatePublic!.toSet().toList();

    //Yes No
    filterModel.scholarship = filterModel.scholarship!.toSet().toList();
    filterModel.siecPriority = filterModel.siecPriority!.toSet().toList();
    filterModel.conditionalOffer =
        filterModel.conditionalOffer!.toSet().toList();
    filterModel.backlogAcceptable =
        filterModel.backlogAcceptable!.toSet().toList();
    filterModel.applicationfee = filterModel.applicationfee!.toSet().toList();
    filterModel.siecRep = filterModel.siecRep!.toSet().toList();
    filterModel.timesRanking = filterModel.timesRanking!.toSet().toList();
    if (filterModel.timesRanking != null) {
      filterModel.timesRanking!.sort((a, b) {
        return int.parse(a).compareTo(int.parse(b));
      });
    }

    if (filterModel.arwuNewsRanking != null) {
      filterModel.arwuNewsRanking =
          filterModel.arwuNewsRanking!.toSet().toList();
      filterModel.arwuNewsRanking!.sort((a, b) {
        return int.parse(a).compareTo(int.parse(b));
      });
    }
    if (filterModel.usNewsRanking != null) {
      filterModel.usNewsRanking = filterModel.usNewsRanking!.toSet().toList();
      filterModel.usNewsRanking!.sort((a, b) {
        return int.parse(a).compareTo(int.parse(b));
      });
    }
    if (filterModel.qsWorldRanking != null) {
      filterModel.qsWorldRanking = filterModel.qsWorldRanking!.toSet().toList();
      filterModel.qsWorldRanking!.sort((a, b) {
        return int.parse(a).compareTo(int.parse(b));
      });
    }

    return filterModel;
  }

  getVisaDetail(String? endpoint) async {
    VisaDetailModel visaDetailModel = VisaDetailModel();
    var response = await httpPostNullBody("${Endpoints.baseUrl}$endpoint");
    if (response != null) {
      var jsondata = json.decode(response.body);
      visaDetailModel = VisaDetailModel.fromJson(jsondata);
      return visaDetailModel;
    }
  }

  personalInformationDataUpdate(
      PersonalInformationModel personalInformationModel,
      String? endpoint) async {
    var jsonData = json.encode(personalInformationModel);
    print(jsonData);
    var response = await httpPost("${Endpoints.baseUrl}$endpoint", jsonData);
    if (response != null) {
      var jsondata = json.decode(response.body);
      return jsondata;
    }
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
