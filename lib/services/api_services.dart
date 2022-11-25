import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:studentpanel/services/baseservice.dart';
import 'package:studentpanel/ui/models/affiliationdropdown.dart';
import 'package:studentpanel/ui/models/applicationdetailmodel.dart';
import 'package:studentpanel/ui/models/applicationmodel.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/ui/models/dataupdatestatus.dart';
import 'package:studentpanel/ui/models/englishtestdetailsview.dart';
import 'package:studentpanel/ui/models/filterModel.dart';
import 'package:studentpanel/ui/models/otherTestDetails.dart';
import 'package:studentpanel/ui/models/passport.dart';
import 'package:studentpanel/ui/models/personalinformation.dart';
import 'package:studentpanel/ui/models/qualificationdetailview.dart';
import 'package:studentpanel/ui/models/stream.dart';
import 'package:studentpanel/ui/models/studentpanel.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/models/travelhistory.dart';
import 'package:studentpanel/ui/models/viewcourseinformation.dart';
import 'package:studentpanel/ui/models/visadetail.dart';
import 'package:studentpanel/ui/models/workhistoryview.dart';
import 'package:studentpanel/utils/endpoint.dart';
import 'package:studentpanel/utils/theme.dart';

class ApiServices extends StudentPanelBase {
  StudentPanelBase? crmBase = StudentPanelBase();

  login(String baseUrl, String endpoint) async {
    try {
      StudentPanel studentPanel;
      var response;

      response = await httpPostNullBody(baseUrl + endpoint);
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
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  getCountry(String baseUrl, String endpoint) async {
    var response;
    try {
      response = await httpPostNullBody(baseUrl + endpoint);
      var jsondata = json.decode(response.body);
      return jsondata;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  getCourseLevel(String baseUrl, String endpoint) async {
    var response;

    try {
      response = await httpPostNullBody(baseUrl + endpoint);
      var jsondata = json.decode(response.body);

      return jsondata;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
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
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  getState2(String baseUrl, String endpoint) async {
    try {
      var response = await httpPostNullBody(baseUrl + endpoint);
      var jsondata = json.decode(response.body);
      return jsondata;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
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
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  getCity2(
    String baseUrl,
    String endpoint,
  ) async {
    try {
      var response = await httpPostNullBody(baseUrl + endpoint);
      var jsondata = json.decode(response.body);
      return jsondata;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
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
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  getCourseBoardField(String baseUrl, String endpoint) async {
    try {
      var response = await httpPostNullBody(baseUrl + endpoint);
      var jsondata = json.decode(response.body);
      return jsondata;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  getCourseSearch(String baseUrl, String endpoint, String enq_id) async {
    CourseModelFilter courseModelFilter = CourseModelFilter();
    List<CourseSearchModel> courseSearchModel = [];
    try {
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
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  completeCourseDetail(String baseUrl, String endpoint) async {
    debugPrint(endpoint);
    try {
      var response = await httpPostNullBody(baseUrl + endpoint);
      if (response != null) {
        var jsondata = json.decode(response.body);

        List<CompleteCourseDetail> completeCourseDetail =
            List<CompleteCourseDetail>.from(json
                .decode(response.body)
                .map((x) => CompleteCourseDetail.fromJson(x)));

        debugPrint("object");
        return completeCourseDetail;
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  setShortListCourse(String? id, String? enq_id) async {
    try {
      var response = await httpPostNullBody(
          "${Endpoints.baseUrl!}${Endpoints.courseShortList!}course_id=$id&enq_id=$enq_id");
      if (response != null) {
        Get.snackbar("Course ShortList", response.body,
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  setFinalShortListCourse(String? id, String? enq_id) async {
    try {
      var response = await httpPostNullBody(
          "${Endpoints.baseUrl!}${Endpoints.finalCourseShortList!}course_id=$id&enq_id=$enq_id");
      if (response != null) {
        Get.snackbar("Course ShortList", response.body,
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  courseShortlistDetail(String? enq_id) async {
    CourseModelFilter courseModelFilter = CourseModelFilter();
    try {
      var response = await httpPostNullBody(
          "${Endpoints.baseUrl!}${Endpoints.courseShortListDetail!}enq_id=$enq_id");
      if (response != null) {
        var jsondata = json.decode(response.body);
        courseModelFilter.courseSearchList = List<CourseSearchModel>.from(json
            .decode(response.body)
            .map((x) => CourseSearchModel.fromJson(x)));
        if (courseModelFilter.courseSearchList.isNotEmpty) {
          courseModelFilter.filterModel = await createFilter(courseModelFilter);
          for (var i = 0; i < courseModelFilter.courseSearchList.length; i++) {
            courseModelFilter.courseSearchList[i].shortList = "1";
          }
        }
      }

      return courseModelFilter;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  getApplicationSummaryList(String enq_id) async {
    try {
      List<ApplicationSummaryModel> applicationSummaryModel = [];
      var response = await httpPostNullBody(
          "${Endpoints.baseUrl!}${Endpoints.applicationSummary!}enq_id=$enq_id");
      if (response != null) {
        applicationSummaryModel = List<ApplicationSummaryModel>.from(json
            .decode(response.body)
            .map((x) => ApplicationSummaryModel.fromJson(x)));
      }
      return applicationSummaryModel;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  getFinalShortlist(String? endpoints, String enq_id) async {
    try {
      CourseModelFilter courseModelFilter = CourseModelFilter();
      List<CourseSearchModel> courseSearchModel = [];
      var response = await httpPostNullBody(
          "${Endpoints.baseUrl!}${endpoints}enq_id=$enq_id");
      if (response != null) {
        var jsondata = json.decode(response.body);
        courseModelFilter.courseSearchList = List<CourseSearchModel>.from(json
            .decode(response.body)
            .map((x) => CourseSearchModel.fromJson(x)));
        if (courseModelFilter.courseSearchList.isNotEmpty) {
          courseModelFilter.filterModel = await createFilter(courseModelFilter);
        }
      }
      return courseModelFilter;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  getApplicationDetails(String? endpoints, String? apli_id) async {
    try {
      ApplicationDetailModel applicationDetailModel = ApplicationDetailModel();
      var response =
          await httpPostNullBody("${Endpoints.baseUrl}${endpoints}$apli_id");
      if (response != null) {
        var jsondata = json.decode(response.body);
        applicationDetailModel = ApplicationDetailModel.fromJson(jsondata);
        return applicationDetailModel;
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  createFilter(CourseModelFilter courseModelFilter) {
    try {
      FilterModel filterModel = FilterModel();

      courseModelFilter.courseSearchList.forEach((element) {
        if (element.intakeMonth != null && element.intakeMonth != "") {
          filterModel.intakeMonth!.addAll(element.intakeMonth!.split("|"));
        }
        if (element.intakeYear != null && element.intakeYear != "") {
          filterModel.intakeYear!.addAll(element.intakeYear!.split("|"));
        }

        if (element.academicRequire != null &&
            element.academicRequire != "" &&
            element.academicRequire != "null") {
          if (double.parse(element.academicRequire!.split("-")[2]) >= 70) {
            filterModel.academicPercentage[0].update("70+ %", (value) => true);
          } else if (double.parse(element.academicRequire!.split("-")[2]) >=
                  60 &&
              double.parse(element.academicRequire!.split("-")[2]) < 70) {
            filterModel.academicPercentage[1]
                .update("60%-70%", (value) => true);
          } else if (double.parse(element.academicRequire!.split("-")[2]) >=
                  50 &&
              double.parse(element.academicRequire!.split("-")[2]) < 60) {
            filterModel.academicPercentage[2]
                .update("50%-60%", (value) => true);
          } else if (double.parse(element.academicRequire!.split("-")[2]) <
              50) {
            filterModel.academicPercentage[3]
                .update("Between 50%", (value) => true);
          }
        }

        //   // !.add(element.allFeesInr ?? "");
        // }
        // if (element.academicRequire != null && element.academicRequire != "") {
        //   filterModel.academicPercentage!
        //       .add(element.academicRequire!.split("-")[1]);
        // }
        if (element.universityName != null && element.universityName != "") {
          filterModel.universityname!.add(element.universityName ?? "");
        }
        if (element.instituteType != null && element.instituteType != "") {
          filterModel.instituteLevel!.add(element.instituteType ?? "");
        }
        // if (element.academicRequire != null) {
        //   filterModel.academicPercentage!.add(element.academicRequire ?? "");
        // }

        if (element.annualTutionFeesInr != null &&
            element.annualTutionFeesInr != "" &&
            element.annualTutionFeesInr != "null") {
          if (double.parse(element.annualTutionFeesInr!) < 700000) {
            filterModel.budget[3].update("Below 7 Lac", (value) => true);
          } else if (double.parse(element.annualTutionFeesInr!) > 700000 &&
              double.parse(element.annualTutionFeesInr!) < 1500000) {
            filterModel.budget[2].update("7-15 Lac", (value) => true);
          } else if (double.parse(element.annualTutionFeesInr!) > 1500000 &&
              double.parse(element.annualTutionFeesInr!) < 3000000) {
            filterModel.budget[1].update("15-30 lac", (value) => true);
          } else if (double.parse(element.annualTutionFeesInr!) > 3000000) {
            filterModel.budget[0].update("30 Lac or More", (value) => true);
          }
          // !.add(element.allFeesInr ?? "");
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
          filterModel.institutePrivatePublic!
              .add(element.instSubCategory ?? "");
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
        if (element.conditionalOffer != null &&
            element.conditionalOffer != "") {
          filterModel.conditionalOffer!.add(element.conditionalOffer ?? "");
        }
        if (element.backlogsAcceptable != null &&
            element.backlogsAcceptable != "") {
          filterModel.backlogAcceptable!.add(element.backlogsAcceptable ?? "");
        }
        if (element.isApplicationFee != null &&
            element.isApplicationFee != "") {
          filterModel.applicationfee!.add(element.isApplicationFee ?? "");
        }
        if (element.siecRep != null && element.siecRep != "") {
          filterModel.siecRep!.add(element.siecRep ?? "");
        }
        // filterModel.placementSandwich!.add(element.place)
      });

      filterModel.universityname = filterModel.universityname!.toSet().toList();
      filterModel.instituteLevel = filterModel.instituteLevel!.toSet().toList();
      // filterModel.academicPercentage =
      //     filterModel.academicPercentage!.toSet().toList();
      filterModel.budget = filterModel.budget.toSet().toList();
      filterModel.offerTAT = filterModel.offerTAT!.toSet().toList();
      filterModel.visaTAT = filterModel.visaTAT!.toSet().toList();
      filterModel.countryName = filterModel.countryName!.toSet().toList();
      filterModel.intakeMonth = filterModel.intakeMonth!.toSet().toList();
      filterModel.intakeYear = filterModel.intakeYear!.toSet().toList();
      // filterModel.academicPercentage =
      //     filterModel.academicPercentage.toSet().toList();
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
        filterModel.qsWorldRanking =
            filterModel.qsWorldRanking!.toSet().toList();
        filterModel.qsWorldRanking!.sort((a, b) {
          return int.parse(a).compareTo(int.parse(b));
        });
      }

      return filterModel;
    } catch (e) {
      throw Exception("Try after some time");
    }
  }

  getVisaDetail(String? endpoint) async {
    try {
      VisaDetailModel visaDetailModel = VisaDetailModel();
      var response = await httpPostNullBody("${Endpoints.baseUrl}$endpoint");
      if (response != null) {
        var jsondata = json.decode(response.body);
        visaDetailModel = VisaDetailModel.fromJson(jsondata);
        return visaDetailModel;
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  personalInformationDataUpdate(
      PersonalInformationModel personalInformationModel,
      String? endpoint) async {
    try {
      String jsonData = json.encode(personalInformationModel);
      var response = await httpPost("${Endpoints.baseUrl}$endpoint", jsonData);
      if (response != null) {
        var jsondata = json.decode(response.body);
        DataUpdateStatus dataUpdateStatus = DataUpdateStatus.fromJson(jsondata);

        Get.snackbar("Personal Detail", dataUpdateStatus.status.toString(),
            snackPosition: SnackPosition.BOTTOM);

        return jsondata;
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  getCourseNarrowProfile(String baseUrl, String endpoint) async {
    var response;

    try {
      response = await httpPostNullBody(baseUrl + endpoint);
      var jsondata = json.decode(response.body);

      return jsondata;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  getCourseBroadFiledByNarrowField(String baseUrl, String endpoint) async {
    var response;

    try {
      response = await httpPostNullBody(baseUrl + endpoint);
      var jsondata = json.decode(response.body);

      return jsondata;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  getCourseInformation(String baseUrl, String endpoint) async {
    var response;

    try {
      response = await httpPostNullBody(baseUrl + endpoint);
      if (response != null && response != "") {
        List<ViewCourseInformation> viewCourseInformationList =
            List<ViewCourseInformation>.from(json
                .decode(response.body)
                .map((x) => ViewCourseInformation.fromJson(x)));
        return viewCourseInformationList;
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  // courseInformationupdate(String baseUrl, String endpoint) async {
  //   try {
  //     var response = await httpPostNullBody(baseUrl + endpoint);
  //     if (response != null) {
  //       var jsondata = json.decode(response.body);
  //       DataUpdateStatus dataUpdateStatus = DataUpdateStatus.fromJson(jsondata);

  //       Get.snackbar("Course detail added", dataUpdateStatus.status.toString(),
  //           snackPosition: SnackPosition.BOTTOM);

  //       return jsondata;
  //     }
  //   } catch (e) {
  //     Fluttertoast.showToast(
  //         msg: e.toString(),
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: ThemeConstants.whitecolor,
  //         textColor: ThemeConstants.blackcolor,
  //         fontSize: 16.0);
  //   }
  // }

  getHighestQualification(String baseUrl, String endpoints) async {
    var response;
    try {
      response = await httpPostNullBody(baseUrl + endpoints);
      var jsondata = json.decode(response.body);

      return jsondata;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  getStream(String baseUrl, String endpoints) async {
    var response;
    try {
      response = await httpPostNullBody(baseUrl + endpoints);
      List<StreamDropDown> streamDropDown = List<StreamDropDown>.from(
          json.decode(response.body).map((x) => StreamDropDown.fromJson(x)));
      return streamDropDown;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  getEducationStatus(String baseUrl, String endpoints) async {
    var response;
    try {
      response = await httpPostNullBody(baseUrl + endpoints);
      var jsondata = json.decode(response.body);

      return jsondata;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  getAffiliation(String baseUrl, String endpoints) async {
    var response;
    try {
      response = await httpPostNullBody(baseUrl + endpoints);
      List<AffiliationDropDownModel> affiliationDropDown =
          List<AffiliationDropDownModel>.from(json
              .decode(response.body)
              .map((x) => AffiliationDropDownModel.fromJson(x)));
      return affiliationDropDown;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  getInstitute(String baseUrl, String endpoints) async {
    var response;
    try {
      response = await httpPostNullBody(baseUrl + endpoints);
      var jsondata = json.decode(response.body);

      return jsondata;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  getQualificationDetails(String baseUrl, String endpoints) async {
    var response;
    try {
      response = await httpPostNullBody(baseUrl + endpoints);
      List<QualificationDetailsViewModel> qualificationDetailsView =
          List<QualificationDetailsViewModel>.from(json
              .decode(response.body)
              .map((x) => QualificationDetailsViewModel.fromJson(x)));
      return qualificationDetailsView;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  dropDown1(String baseUrl, String endpoints) async {
    var response;
    try {
      response = await httpPostNullBody(baseUrl + endpoints);
      var jsondata = json.decode(response.body);

      return jsondata;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  getWorkHistoryView(String baseUrl, String endpoints) async {
    var response;
    try {
      response = await httpPostNullBody(baseUrl + endpoints);
      List<WorkHistoryViewModel> workHistoryViewModel =
          List<WorkHistoryViewModel>.from(json
              .decode(response.body)
              .map((x) => WorkHistoryViewModel.fromJson(x)));
      return workHistoryViewModel;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  addProfileModule(
      String baseUrl, String endpoints, String snakbarTitle) async {
    try {
      var response = await httpPostNullBody(baseUrl + endpoints);
      if (response != null) {
        var jsondata = json.decode(response.body);
        DataUpdateStatus dataUpdateStatus = DataUpdateStatus.fromJson(jsondata);

        Fluttertoast.showToast(
            msg: "Work History Added ${dataUpdateStatus.status}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: ThemeConstants.whitecolor,
            textColor: ThemeConstants.blackcolor,
            fontSize: 16.0);

        return dataUpdateStatus;
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  viewEnglishTestDetails(
    String baseUrl,
    String endpoints,
  ) async {
    try {
      var response = await httpPostNullBody(baseUrl + endpoints);
      if (response != null) {
        var jsondata = json.decode(response.body);
        EnglishTestDetailsViewModel englishTestDetailsViewModel =
            EnglishTestDetailsViewModel.fromJson(jsondata);

        return englishTestDetailsViewModel;
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  viewOtherTestDetails(
    String baseUrl,
    String endpoints,
  ) async {
    try {
      var response = await httpPostNullBody(baseUrl + endpoints);
      if (response != null) {
        var jsondata = json.decode(response.body);
        OtherTestDetailsViewModel englishTestDetailsViewModel =
            OtherTestDetailsViewModel.fromJson(jsondata);

        return englishTestDetailsViewModel;
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  updateEnglishTestDetails(
      EnglishTestDetailsViewModel englishTestDetailsViewModel,
      String? endpoint) async {
    try {
      String jsonData = json.encode(englishTestDetailsViewModel);
      var response = await httpPost("${Endpoints.baseUrl}$endpoint", jsonData);
      if (response != null) {
        var jsondata = json.decode(response.body);
        DataUpdateStatus dataUpdateStatus = DataUpdateStatus.fromJson(jsondata);

        Get.snackbar("English Test Details", dataUpdateStatus.status.toString(),
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  updatePassport(PassportModel passportModel, String? endpoint) async {
    try {
      String jsonData = jsonEncode(passportModel);

      var response = await httpPost("${Endpoints.baseUrl}$endpoint", jsonData);
      if (response != null) {
        var jsondata = json.decode(response.body);
        DataUpdateStatus dataUpdateStatus = DataUpdateStatus.fromJson(jsondata);

        Get.snackbar("Passport Details:", dataUpdateStatus.status.toString(),
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  viewPassportDetail(
    String baseUrl,
    String endpoints,
  ) async {
    try {
      var response = await httpPostNullBody(baseUrl + endpoints);
      if (response != null) {
        var jsondata = json.decode(response.body);
        PassportModel passportModel = PassportModel.fromJson(jsondata);
        return passportModel;
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  getTravelHistory(String baseUrl, String endpoints) async {
    var response;
    try {
      response = await httpPostNullBody(baseUrl + endpoints);
      List<TravelHistoryModel> workHistoryViewModel =
          List<TravelHistoryModel>.from(json
              .decode(response.body)
              .map((x) => TravelHistoryModel.fromJson(x)));
      return workHistoryViewModel;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }

  updateTravelHistory(String? endpoint) async {
    try {
      var response = await httpPostNullBody(
        "${Endpoints.baseUrl}$endpoint",
      );
      if (response != null) {
        var jsondata = json.decode(response.body);
        DataUpdateStatus dataUpdateStatus = DataUpdateStatus.fromJson(jsondata);
        Get.snackbar("Travel History:", dataUpdateStatus.status.toString(),
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ThemeConstants.whitecolor,
          textColor: ThemeConstants.blackcolor,
          fontSize: 16.0);
    }
  }
}
