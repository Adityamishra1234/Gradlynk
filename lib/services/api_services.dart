import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:studentpanel/services/baseservice.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/affiliationdropdown.dart';
import 'package:studentpanel/ui/models/applicationdetailmodel.dart';
import 'package:studentpanel/ui/models/applicationmodel.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/ui/models/dataupdatestatus.dart';
import 'package:studentpanel/ui/models/englishtestdetailsview.dart';
import 'package:studentpanel/ui/models/fileupload.dart';
import 'package:studentpanel/ui/models/filterModel.dart';
import 'package:studentpanel/ui/models/institutiondropdown.dart';
import 'package:studentpanel/ui/models/notificationmodel.dart';
import 'package:studentpanel/ui/models/otherTestDetails.dart';
import 'package:studentpanel/ui/models/passport.dart';
import 'package:studentpanel/ui/models/personalinformation.dart';
import 'package:studentpanel/ui/models/qualificationdetailview.dart';
import 'package:studentpanel/ui/models/realtion.dart';
import 'package:studentpanel/ui/models/stream.dart';
import 'package:studentpanel/ui/models/studentpanel.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/models/travelhistory.dart';
import 'package:studentpanel/ui/models/upcomingevent.dart';
import 'package:studentpanel/ui/models/viewcourseinformation.dart';
import 'package:studentpanel/ui/models/visadetail.dart';
import 'package:studentpanel/ui/models/visasummarymodel.dart';
import 'package:studentpanel/ui/models/workhistoryview.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:http/http.dart' as http;

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
        // sharedPreferences.setString('UserModel', response);
        var jsondata = json.decode(response);
        studentPanel = StudentPanel.fromJson(jsondata);
        // sharedPreferences.setString('token', userModel.token);
        // sharedPreferences.setString("login_time", formattedStr);
        // sharedPreferences.setString("id", userModel.user.id.toString());
        return studentPanel;
      } else {
        return false;
      }
    } catch (e) {
      print(StackTrace.current);
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
      var jsondata = json.decode(response);
      return jsondata;
    } catch (e) {
      print(StackTrace.current);
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
      var jsondata = json.decode(response);

      return jsondata;
    } catch (e) {
      print(StackTrace.current);
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
      var jsondata = json.decode(response);
      return jsondata;
    } catch (e) {
      print(StackTrace.current);
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
      var jsondata = json.decode(response);
      return jsondata;
    } catch (e) {
      print(StackTrace.current);
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
      var jsondata = json.decode(response);
      return jsondata;
    } catch (e) {
      print(StackTrace.current);
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
      var jsondata = json.decode(response);
      return jsondata;
    } catch (e) {
      print(StackTrace.current);
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
      var jsondata = json.decode(response);
      return jsondata;
    } catch (e) {
      print(StackTrace.current);
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
      var jsondata = json.decode(response);
      return jsondata;
    } catch (e) {
      print(StackTrace.current);
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

  getCourseSearch(String baseUrl, String endpoint) async {
    CourseModelFilter courseModelFilter = CourseModelFilter();
    List<CourseSearchModel> courseSearchModel = [];

    try {
      var response = await httpPostNullBody("$baseUrl$endpoint");
      courseSearchModel = List<CourseSearchModel>.from(
          json.decode(response).map((x) => CourseSearchModel.fromJson(x)));
      if (courseSearchModel.isNotEmpty) {
        courseModelFilter.courseSearchList = courseSearchModel;
        courseModelFilter.filterModel = await createFilter(courseModelFilter);
      }
      courseModelFilter.courseSearchList = courseSearchModel;

      return courseModelFilter;
    } catch (e) {
      Get.back();
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
    try {
      var response = await httpPostNullBody(baseUrl + endpoint);
      if (response != null) {
        var jsondata = json.decode(response);

        List<CompleteCourseDetail> completeCourseDetail =
            List<CompleteCourseDetail>.from(json
                .decode(response)
                .map((x) => CompleteCourseDetail.fromJson(x)));

        return completeCourseDetail;
      }
    } catch (e) {
      print(StackTrace.current);
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

  setShortListCourse(String? id, String? enqId) async {
    try {
      var response = await httpPostNullBody(
          "${Endpoints.baseUrl!}${Endpoints.courseShortList!}course_id=$id&enq_id=$enqId");
      if (response != null) {
        Get.snackbar(
          "Course ShortList",
          duration: const Duration(seconds: 2),
          response,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white.withOpacity(0.0),
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        );
      }
    } catch (e) {
      print(StackTrace.current);
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

  setFinalShortListCourse(String? id, String? enqId) async {
    try {
      var response = await httpPostNullBody(
          "${Endpoints.baseUrl!}${Endpoints.finalCourseShortList!}course_id=$id&enq_id=$enqId");
      if (response != null) {
        Get.snackbar("Course ShortList", response,
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print(StackTrace.current);
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

  courseShortlistDetail(String? enqId) async {
    CourseModelFilter courseModelFilter = CourseModelFilter();
    try {
      var response = await httpPostNullBody(
          "${Endpoints.baseUrl!}${Endpoints.courseShortListDetail!}enq_id=$enqId");
      if (response != null) {
        var jsondata = json.decode(response);
        courseModelFilter.courseSearchList = List<CourseSearchModel>.from(
            json.decode(response).map((x) => CourseSearchModel.fromJson(x)));
        if (courseModelFilter.courseSearchList.isNotEmpty) {
          courseModelFilter.filterModel = await createFilter(courseModelFilter);
          for (var i = 0; i < courseModelFilter.courseSearchList.length; i++) {
            courseModelFilter.courseSearchList[i].shortList = "1";
          }
        }
      }

      return courseModelFilter;
    } catch (e) {
      Get.back();
      print(StackTrace.current);
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

  getApplicationSummaryList(String enqId) async {
    try {
      List<ApplicationSummaryModel> applicationSummaryModel = [];
      var response = await httpPostNullBody(
          "${Endpoints.baseUrl!}${Endpoints.applicationSummary!}enq_id=$enqId");
      if (response != null) {
        applicationSummaryModel = List<ApplicationSummaryModel>.from(json
            .decode(response)
            .map((x) => ApplicationSummaryModel.fromJson(x)));
      }
      return applicationSummaryModel;
    } catch (e) {
      Get.back();
      print(StackTrace.current);
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

  getFinalShortlist(String? endpoints, String enqId) async {
    try {
      CourseModelFilter courseModelFilter = CourseModelFilter();
      List<CourseSearchModel> courseSearchModel = [];
      var response = await httpPostNullBody(
          "${Endpoints.baseUrl!}${endpoints}enq_id=$enqId");
      if (response != null) {
        var jsondata = json.decode(response);
        courseModelFilter.courseSearchList = List<CourseSearchModel>.from(
            json.decode(response).map((x) => CourseSearchModel.fromJson(x)));
        if (courseModelFilter.courseSearchList.isNotEmpty) {
          courseModelFilter.filterModel = await createFilter(courseModelFilter);
        }
      }
      return courseModelFilter;
    } catch (e) {
      Get.back();
      print(StackTrace.current);
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

  getApplicationDetails(String? endpoints, String? apliId) async {
    try {
      ApplicationDetailModel applicationDetailModel = ApplicationDetailModel();
      var response =
          await httpPostNullBody("${Endpoints.baseUrl}$endpoints$apliId");
      if (response != null) {
        var jsondata = json.decode(response);
        applicationDetailModel = ApplicationDetailModel.fromJson(jsondata);
        return applicationDetailModel;
      }
    } catch (e) {
      Get.back();
      print(StackTrace.current);
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

      for (var element in courseModelFilter.courseSearchList) {
        if (getNUllChecker(element.intakeMonth) == false) {
          filterModel.intakeMonth!.addAll(element.intakeMonth!.split("|"));
        }
        if (getNUllChecker(element.intakeYear) == false) {
          filterModel.intakeYear!.addAll(element.intakeYear!.split("|"));
        }

// Academic Require Filter
        if (getNUllChecker(element.academicRequire) == false) {
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
        if (getNUllChecker(element.universityName) == false) {
          filterModel.universityname!.add(element.universityName ?? "");
        }
        if (getNUllChecker(element.instituteType) == false) {
          filterModel.instituteLevel!.add(element.instituteType ?? "");
        }
        // if (element.academicRequire != null) {
        //   filterModel.academicPercentage!.add(element.academicRequire ?? "");
        // }

        //annual tutionFee and Budget
        if (getNUllChecker(element.annualTutionFeesInr) == false) {
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
        if (getNUllChecker(element.offerTat) == false) {
          filterModel.offerTAT!.add(element.offerTat ?? "");
        }
        if (getNUllChecker(element.visaTat) == false) {
          filterModel.visaTAT!.add(element.visaTat ?? "");
        }

        if (getNUllChecker(element.countryName) == false) {
          filterModel.countryName!.add(element.countryName ?? "");
        }
        if (getNUllChecker(element.instSubCategory) == false) {
          filterModel.institutePrivatePublic!
              .add(element.instSubCategory ?? "");
        }
        if (getNUllChecker(element.arwuRank) == false) {
          filterModel.arwuNewsRanking!.add(element.arwuRank ?? "");
        }
        if (getNUllChecker(element.timesRank) == false) {
          filterModel.timesRanking!.add(element.timesRank ?? "");
        }
        if (getNUllChecker(element.usNewsRank) == false) {
          filterModel.usNewsRanking!.add(element.usNewsRank ?? "");
        }
        if (getNUllChecker(element.qsWorldRank) == false) {
          filterModel.qsWorldRanking!.add(element.qsWorldRank ?? "");
        }

        // Yes No
        if (getNUllChecker(element.scholarship) == false) {
          filterModel.scholarship!.add(element.scholarship ?? "");
        }
        if (getNUllChecker(element.siecPriority) == false) {
          filterModel.siecPriority!.add(element.siecPriority ?? "");
        }
        if (getNUllChecker(element.conditionalOffer) == false) {
          filterModel.conditionalOffer!.add(element.conditionalOffer ?? "");
        }
        if (getNUllChecker(element.backlogsAcceptable) == false) {
          filterModel.backlogAcceptable!.add(element.backlogsAcceptable ?? "");
        }
        if (getNUllChecker(element.isApplicationFee) == false) {
          filterModel.applicationfee!.add(element.isApplicationFee ?? "");
        }
        if (getNUllChecker(element.siecRep) == false) {
          filterModel.siecRep!.add(element.siecRep ?? "");
        }
        // filterModel.placementSandwich!.add(element.place)
      }

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
      print(StackTrace.current);
      throw Exception("Try after some time");
    }
  }

  getVisaDetail(String? endpoint) async {
    try {
      VisaDetailModel visaDetailModel = VisaDetailModel();
      var response = await httpPostNullBody("${Endpoints.baseUrl}$endpoint");
      if (response != null) {
        var jsondata = json.decode(response);
        visaDetailModel = VisaDetailModel.fromJson(jsondata);
        return visaDetailModel;
      }
    } catch (e) {
      Get.back();
      print(StackTrace.current);
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
        Get.find<BaseController>().getPersonalModal(personalInformationModel);
        var jsondata = json.decode(response);
        DataUpdateStatus dataUpdateStatus = DataUpdateStatus.fromJson(jsondata);
        Get.snackbar("Personal Detail", dataUpdateStatus.status.toString(),
            snackPosition: SnackPosition.BOTTOM);

        return jsondata;
      }
    } catch (e) {
      print(StackTrace.current);
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
      var jsondata = json.decode(response);

      return jsondata;
    } catch (e) {
      print(StackTrace.current);
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
      var jsondata = json.decode(response);

      return jsondata;
    } catch (e) {
      print(StackTrace.current);
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
                .decode(response)
                .map((x) => ViewCourseInformation.fromJson(x)));
        return viewCourseInformationList;
      }
    } catch (e) {
      print(StackTrace.current);
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
  //       var jsondata = json.decode(response);
  //       DataUpdateStatus dataUpdateStatus = DataUpdateStatus.fromJson(jsondata);

  //       Get.snackbar("Course detail added", dataUpdateStatus.status.toString(),
  //           snackPosition: SnackPosition.BOTTOM);

  //       return jsondata;
  //     }
  //   } catch (e) {
  //     print(StackTrace.current);Fluttertoast.showToast(
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
      var jsondata = json.decode(response);

      return jsondata;
    } catch (e) {
      print(StackTrace.current);
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
          json.decode(response).map((x) => StreamDropDown.fromJson(x)));
      return streamDropDown;
    } catch (e) {
      print(StackTrace.current);
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
      var jsondata = json.decode(response);

      return jsondata;
    } catch (e) {
      print(StackTrace.current);
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
              .decode(response)
              .map((x) => AffiliationDropDownModel.fromJson(x)));
      return affiliationDropDown;
    } catch (e) {
      print(StackTrace.current);
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
      List<InstitutionDropDown> dropdown = List<InstitutionDropDown>.from(
          json.decode(response).map((x) => InstitutionDropDown.fromJson(x)));

      return dropdown;
    } catch (e) {
      print(StackTrace.current);
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
              .decode(response)
              .map((x) => QualificationDetailsViewModel.fromJson(x)));
      return qualificationDetailsView;
    } catch (e) {
      print(StackTrace.current);
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
      var jsondata = json.decode(response);
      return jsondata;
    } catch (e) {
      print(StackTrace.current);
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
              .decode(response)
              .map((x) => WorkHistoryViewModel.fromJson(x)));
      return workHistoryViewModel;
    } catch (e) {
      print(StackTrace.current);
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
        var jsondata = json.decode(response);
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
      print(StackTrace.current);
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
        var jsondata = json.decode(response);
        EnglishTestDetailsViewModel englishTestDetailsViewModel =
            EnglishTestDetailsViewModel.fromJson(jsondata);

        return englishTestDetailsViewModel;
      }
    } catch (e) {
      print(StackTrace.current);
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
        var jsondata = json.decode(response);
        OtherTestDetailsModel englishTestDetailsViewModel =
            OtherTestDetailsModel.fromJson(jsondata);

        return englishTestDetailsViewModel;
      }
    } catch (e) {
      print(StackTrace.current);
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
        var jsondata = json.decode(response);
        DataUpdateStatus dataUpdateStatus = DataUpdateStatus.fromJson(jsondata);

        Get.snackbar("English Test Details", dataUpdateStatus.status.toString(),
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print(StackTrace.current);
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
        var jsondata = json.decode(response);
        DataUpdateStatus dataUpdateStatus = DataUpdateStatus.fromJson(jsondata);

        Get.snackbar("Passport Details:", dataUpdateStatus.status.toString(),
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print(StackTrace.current);
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
        var jsondata = json.decode(response);
        PassportModel passportModel = PassportModel.fromJson(jsondata);
        return passportModel;
      }
    } catch (e) {
      print(StackTrace.current);
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
      List<TravelHistoryModel> travelHistoryList =
          List<TravelHistoryModel>.from(
              json.decode(response).map((x) => TravelHistoryModel.fromJson(x)));
      return travelHistoryList;
    } catch (e) {
      print(StackTrace.current);
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
        var jsondata = json.decode(response);
        DataUpdateStatus dataUpdateStatus = DataUpdateStatus.fromJson(jsondata);
        Get.snackbar("Travel History:", dataUpdateStatus.status.toString(),
            snackPosition: SnackPosition.BOTTOM);
        return true;
      }
    } catch (e) {
      print(StackTrace.current);
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

  viewRelativeInformation(String baseUrl, String endpoints) async {
    var response;
    try {
      response = await httpPostNullBody(baseUrl + endpoints);
      List<RealtionModel> model = List<RealtionModel>.from(
          json.decode(response).map((x) => RealtionModel.fromJson(x)));
      return model;
    } catch (e) {
      print(StackTrace.current);
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

  updateRelativeInformation(String? endpoint) async {
    try {
      var response = await httpPostNullBody(
        "${Endpoints.baseUrl}$endpoint",
      );
      if (response != null) {
        var jsondata = json.decode(response);
        DataUpdateStatus dataUpdateStatus = DataUpdateStatus.fromJson(jsondata);
        Get.snackbar(
            "Relative Infromation:", dataUpdateStatus.status.toString(),
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print(StackTrace.current);
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

  getvisaSummary(String? endpoint) async {
    try {
      var response = await httpPostNullBody(
        "${Endpoints.baseUrl}$endpoint",
      );
      if (response != null) {
        List<VisaSummaryModel> visaSummaryModel = List<VisaSummaryModel>.from(
            json.decode(response).map((x) => VisaSummaryModel.fromJson(x)));

        return visaSummaryModel;
      }
    } catch (e) {
      Get.back();
      print(StackTrace.current);
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

  updateQualification(String? endpoint) async {
    try {
      var response = await httpPostNullBody(
        "${Endpoints.baseUrl}$endpoint",
      );
      if (response != null) {
        var jsondata = json.decode(response);
        DataUpdateStatus dataUpdateStatus = DataUpdateStatus.fromJson(jsondata);
        Get.snackbar(
            "Qualification Details:", dataUpdateStatus.status.toString(),
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print(StackTrace.current);
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

  updateOtherTestDetails(
      OtherTestDetailsModel otherTestDetailModel, String? endpoint) async {
    try {
      String jsonData = json.encode(otherTestDetailModel);
      var response = await httpPost("${Endpoints.baseUrl}$endpoint", jsonData);
      if (response != null) {
        var jsondata = json.decode(response);
        DataUpdateStatus dataUpdateStatus = DataUpdateStatus.fromJson(jsondata);

        Get.snackbar("Other Test Details:", dataUpdateStatus.status.toString(),
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print(StackTrace.current);
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

  getUpComingEvent(String endpoint) async {
    try {
      List<UpcomingEventModel> model = [];
      var res = await httpPostNullBody(Endpoints.baseUrl! + endpoint);
      if (res != null) {
        model = List<UpcomingEventModel>.from(
            json.decode(res).map((x) => UpcomingEventModel.fromJson(x)));
        return model;
      }
    } catch (e) {
      print(StackTrace.current);
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

  getNotification(String endpoint) async {
    try {
      List<NotificationModel> model = [];
      var res = await httpPostNullBody(Endpoints.baseUrl! + endpoint);
      if (res != null) {
        model = List<NotificationModel>.from(
            json.decode(res).map((x) => NotificationModel.fromJson(x)));
        return model;
      }
    } catch (e) {
      print(StackTrace.current);
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

  Future<String?> sendFile(
    file,
    uploadFilename,
    String enq_id,
    String id,
    String endpoint,
  ) async {
    var url = Uri.parse(
        "${Endpoints.baseUrl}${Endpoints.applicationDocumentUpload}$enq_id&id=$id");
    var request = http.MultipartRequest("POST", url);

    request.files.add(await http.MultipartFile.fromPath('doc', file.path,
        filename: file.path));
    var res = await request.send();
    var responsed = await http.Response.fromStream(res);
    if (responsed.statusCode == 200) {
      var jsondata = json.decode(responsed.body);
      FileUploadStatus status = FileUploadStatus.fromJson(jsondata);
      getsnakbar("Document Upload", status.status.toString());
      return status.viewLink;
    } else {
      return "";
    }
  }
}
