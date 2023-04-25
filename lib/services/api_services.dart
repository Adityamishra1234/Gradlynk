import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentpanel/services/api.dart';
import 'package:studentpanel/services/baseservice.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/affiliationdropdown.dart';
import 'package:studentpanel/ui/models/applicationdetailmodel.dart';
import 'package:studentpanel/ui/models/applicationmodel.dart';
import 'package:studentpanel/ui/models/commonuploaddocument.dart';
import 'package:studentpanel/ui/models/comonDocumentUploadStatus.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/ui/models/countryGuide.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/ui/models/dataupdatestatus.dart';
import 'package:studentpanel/ui/models/dropdownOrgName.dart';
import 'package:studentpanel/ui/models/dropdownUploadDocument.dart';
import 'package:studentpanel/ui/models/dropdowndocumenttype.dart';
import 'package:studentpanel/ui/models/englishtestdetailsview.dart';
import 'package:studentpanel/ui/models/fileupload.dart';
import 'package:studentpanel/ui/models/filterModel.dart';
import 'package:studentpanel/ui/models/institutiondropdown.dart';
import 'package:studentpanel/ui/models/loginmodel.dart';
import 'package:studentpanel/ui/models/notificationmodel.dart';
import 'package:studentpanel/ui/models/otherTestDetails.dart';
import 'package:studentpanel/ui/models/passport.dart';
import 'package:studentpanel/ui/models/personalinformation.dart';
import 'package:studentpanel/ui/models/qualificationdetailview.dart';
import 'package:studentpanel/ui/models/realtion.dart';
import 'package:studentpanel/ui/models/serviceAssignesmodel.dart';
import 'package:studentpanel/ui/models/status.dart';
import 'package:studentpanel/ui/models/stream.dart';
import 'package:studentpanel/ui/models/studentpanel.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/models/ticketdatamodel.dart';
import 'package:studentpanel/ui/models/travelhistory.dart';
import 'package:studentpanel/ui/models/upcomingevent.dart';
import 'package:studentpanel/ui/models/viewcourseinformation.dart';
import 'package:studentpanel/ui/models/visadetail.dart';
import 'package:studentpanel/ui/models/visasummarymodel.dart';
import 'package:studentpanel/ui/models/workhistoryview.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/ui/screen/upload_document/uploaddocument.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';
import 'package:studentpanel/utils/snackbarconstants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:http/http.dart' as http;

class ApiServices extends StudentPanelBase implements api {
  StudentPanelBase? crmBase = StudentPanelBase();

  @override
  dashboard(String baseUrl, String endpoint) async {
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
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  getCountry(String baseUrl, String endpoint) async {
    var response;
    try {
      response = await httpPostNullBody(baseUrl + endpoint);
      var jsondata = json.decode(response);
      return jsondata;
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  getCourseLevel(String baseUrl, String endpoint) async {
    var response;

    try {
      response = await httpPostNullBody(baseUrl + endpoint);
      var jsondata = json.decode(response);

      return jsondata;
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  getState(String baseUrl, String endpoint, String countrydata) async {
    var temp = countrydata.split('[');
    var temp2 = temp[1].split(']')[0];

    try {
      var response = await httpPostNullBody(
          baseUrl + endpoint + temp2.removeAllWhitespace.toString());
      var jsondata = json.decode(response);
      return jsondata;
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  getState2(String baseUrl, String endpoint) async {
    try {
      var response = await httpPostNullBody(baseUrl + endpoint);
      var jsondata = json.decode(response);
      return jsondata;
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  getCity(String baseUrl, String endpoint, String statedata) async {
    var temp = statedata.split('[');
    var temp2 = temp[1].split(']')[0];

    try {
      var response = await httpPostNullBody(
          baseUrl + endpoint + temp2.removeAllWhitespace.toString());
      var jsondata = json.decode(response);
      return jsondata;
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  getCity2(
    String baseUrl,
    String endpoint,
  ) async {
    try {
      var response = await httpPostNullBody(baseUrl + endpoint);
      var jsondata = json.decode(response);
      return jsondata;
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
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
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  getCourseBoardField(String baseUrl, String endpoint) async {
    try {
      var response = await httpPostNullBody(baseUrl + endpoint);
      var jsondata = json.decode(response);
      return jsondata;
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
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
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
      Get.back();
      getToast(SnackBarConstants.courseSearchListPart3!);
    }
  }

  @override
  completeCourseDetail(String baseUrl, String endpoint) async {
    try {
      var response = await httpPostNullBody(baseUrl + endpoint);
      if (response != null) {
        var jsondata = json.decode(response);

        List<CompleteCourseDetail> completeCourseDetail =
            List<CompleteCourseDetail>.from(json
                .decode(response)
                .map((x) => CompleteCourseDetail.fromJson(x)));
        var res = await httpPostNullBody(baseUrl +
            Endpoints.countryIDWithUrl! +
            completeCourseDetail[0].countryID);
        if (res != null) {
          List<CountryGuideModel> model = [];
          model = List<CountryGuideModel>.from(
              json.decode(res).map((x) => CountryGuideModel.fromJson(x)));
          completeCourseDetail[0].countryID = model[0].document;
        }

        return completeCourseDetail;
      }
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
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
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  setFinalShortListCourse(String? id, String? enqId) async {
    try {
      var response = await httpPostNullBody(
          "${Endpoints.baseUrl!}${Endpoints.finalCourseShortList!}course_id=$id&enq_id=$enqId");
      if (response != null) {
        Get.snackbar("Course ShortList", response,
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
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
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
      Get.back();
      getToast(SnackBarConstants.reviewcourselistPart1!);
    }
  }

  @override
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
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
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
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
      Get.back();
      getToast(SnackBarConstants.finalcourselistPart1!);
    }
  }

  @override
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
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
      Get.back();
      getToast(SnackBarConstants.applicationPart1!);
    }
  }

  createFilter(CourseModelFilter courseModelFilter) async {
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
            filterModel.budget[3].update("Below 7 Lakh", (value) => true);
          } else if (double.parse(element.annualTutionFeesInr!) > 700000 &&
              double.parse(element.annualTutionFeesInr!) < 1500000) {
            filterModel.budget[2].update("7-15 Lakh", (value) => true);
          } else if (double.parse(element.annualTutionFeesInr!) > 1500000 &&
              double.parse(element.annualTutionFeesInr!) < 3000000) {
            filterModel.budget[1].update("15-30 Lakh", (value) => true);
          } else if (double.parse(element.annualTutionFeesInr!) > 3000000) {
            filterModel.budget[0].update("30 Lakh or More", (value) => true);
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
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
      throw Exception("Try after some time");
    }
  }

  @override
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
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
      Get.back();
      getToast(SnackBarConstants.visaPart1!);
    }
  }

  @override
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
        getToast("Profile details update ${dataUpdateStatus.status} ");

        return jsondata;
      }
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  getCourseNarrowProfile(String baseUrl, String endpoint) async {
    var response;

    try {
      response = await httpPostNullBody(baseUrl + endpoint);
      var jsondata = json.decode(response);

      return jsondata;
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  getCourseBroadFiledByNarrowField(String baseUrl, String endpoint) async {
    var response;

    try {
      response = await httpPostNullBody(baseUrl + endpoint);
      var jsondata = json.decode(response);

      return jsondata;
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
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
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
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

  @override
  getHighestQualification(String baseUrl, String endpoints) async {
    var response;
    try {
      response = await httpPostNullBody(baseUrl + endpoints);
      var jsondata = json.decode(response);

      return jsondata;
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  getStream(String baseUrl, String endpoints) async {
    var response;
    try {
      response = await httpPostNullBody(baseUrl + endpoints);
      List<StreamDropDown> streamDropDown = List<StreamDropDown>.from(
          json.decode(response).map((x) => StreamDropDown.fromJson(x)));
      return streamDropDown;
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  getEducationStatus(String baseUrl, String endpoints) async {
    var response;
    try {
      response = await httpPostNullBody(baseUrl + endpoints);
      var jsondata = json.decode(response);

      return jsondata;
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
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
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  getInstitute(String baseUrl, String endpoints) async {
    var response;
    try {
      response = await httpPostNullBody(baseUrl + endpoints);
      List<InstitutionDropDown> dropdown = List<InstitutionDropDown>.from(
          json.decode(response).map((x) => InstitutionDropDown.fromJson(x)));

      return dropdown;
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
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
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  dropDown1(String baseUrl, String endpoints) async {
    var response;
    try {
      response = await httpPostNullBody(baseUrl + endpoints);
      var jsondata = json.decode(response);
      return jsondata;
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
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
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  addProfileModule(String baseUrl, String endpoints, String snakbarTitle,
      String action) async {
    try {
      var response = await httpPostNullBody(baseUrl + endpoints);
      if (response != null) {
        var jsondata = json.decode(response);
        DataUpdateStatus dataUpdateStatus = DataUpdateStatus.fromJson(jsondata);

        getToast("Work History $action ${dataUpdateStatus.status}");

        return true;
      }
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
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
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
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
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  updateEnglishTestDetails(
      EnglishTestDetailsViewModel englishTestDetailsViewModel,
      String? endpoint) async {
    try {
      String jsonData = json.encode(englishTestDetailsViewModel);
      jsonData = jsonData.replaceAll('"null"', "");
      var response = await httpPost("${Endpoints.baseUrl}$endpoint", jsonData);
      if (response != null) {
        var jsondata = json.decode(response);
        DataUpdateStatus dataUpdateStatus = DataUpdateStatus.fromJson(jsondata);
        getToast("English test details updated successfully");
        // Get.snackbar("English Test Details", dataUpdateStatus.status.toString(),
        //     snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  updatePassport(PassportModel passportModel, String? endpoint) async {
    try {
      String jsonData = jsonEncode(passportModel);

      var response = await httpPost("${Endpoints.baseUrl}$endpoint", jsonData);
      if (response != null) {
        var jsondata = json.decode(response);
        DataUpdateStatus dataUpdateStatus = DataUpdateStatus.fromJson(jsondata);
        getToast("Passport details updated successfully");
        // Get.snackbar("Passport Details:", dataUpdateStatus.status.toString(),
        //     snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
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
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  getTravelHistory(String baseUrl, String endpoints) async {
    var response;
    try {
      response = await httpPostNullBody(baseUrl + endpoints);
      List<TravelHistoryModel> travelHistoryList =
          List<TravelHistoryModel>.from(
              json.decode(response).map((x) => TravelHistoryModel.fromJson(x)));
      return travelHistoryList;
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  updateTravelHistory(String? endpoint, String action) async {
    try {
      var response = await httpPostNullBody(
        "${Endpoints.baseUrl}$endpoint",
      );
      if (response != null) {
        var jsondata = json.decode(response);
        DataUpdateStatus dataUpdateStatus = DataUpdateStatus.fromJson(jsondata);
        getToast("Travel History $action ${dataUpdateStatus.status}");
        return true;
      }
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  viewRelativeInformation(String baseUrl, String endpoints) async {
    var response;
    try {
      response = await httpPostNullBody(baseUrl + endpoints);
      List<RealtionModel> model = List<RealtionModel>.from(
          json.decode(response).map((x) => RealtionModel.fromJson(x)));
      return model;
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  updateRelativeInformation(String? endpoint, String action) async {
    try {
      var response = await httpPostNullBody(
        "${Endpoints.baseUrl}$endpoint",
      );
      if (response != null) {
        var jsondata = json.decode(response);
        DataUpdateStatus dataUpdateStatus = DataUpdateStatus.fromJson(jsondata);
        getToast("Relative Infromation $action ${dataUpdateStatus.status}");
        return true;
      }
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
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
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  updateQualification(String? endpoint, [String action = ""]) async {
    try {
      var response = await httpPostNullBody(
        "${Endpoints.baseUrl}$endpoint",
      );
      if (response != null) {
        var jsondata = json.decode(response);
        DataUpdateStatus dataUpdateStatus = DataUpdateStatus.fromJson(jsondata);
        getToast("Qualification Details $action ${dataUpdateStatus.status}");
        return true;
      }
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  updateOtherTestDetails(
      OtherTestDetailsModel otherTestDetailModel, String? endpoint) async {
    try {
      String jsonData = json.encode(otherTestDetailModel);
      jsonData = jsonData.replaceAll('"null"', "");
      var response = await httpPost("${Endpoints.baseUrl}$endpoint", jsonData);
      if (response != null) {
        var jsondata = json.decode(response);
        DataUpdateStatus dataUpdateStatus = DataUpdateStatus.fromJson(jsondata);
        getToast("Other test details updated successfully");
        // Get.snackbar("Other Test Details:", dataUpdateStatus.status.toString(),
        //     snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
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
      print(e.toString());
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
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
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  Future<String?> sendFile(
    file,
    uploadFilename,
    String enq_id,
    String id,
    String endpoint,
  ) async {
    try {
      var url = Uri.parse(
          "${Endpoints.baseUrl}${Endpoints.applicationDocumentUpload}$enq_id&id=$id");
      var request = http.MultipartRequest("POST", url);

      request.files
          .add(await http.MultipartFile.fromPath('doc', file, filename: file));
      var res = await request.send();
      var responsed = await http.Response.fromStream(res);
      if (responsed.statusCode == 200) {
        var jsondata = json.decode(responsed.body);
        FileUploadStatus status = FileUploadStatus.fromJson(jsondata);
        getsnakbar("Document Upload", status.status.toString());
        return status.viewLink;
      } else {
        return null;
      }
    } catch (e) {
      getToast("Something went to wrong !!");
    }
  }

  @override
  Future<CommonUploadStatus?> uploadDocumentCommon(
      file, uploadFilename, String enq_id, String id,
      {String orgname = ""}) async {
    try {
      var url = Uri.parse(
          "${Endpoints.baseUrl}${Endpoints.uploadCommonDocumentPart1}$enq_id&id=$id&orgname=$orgname");
      var request = http.MultipartRequest("POST", url);

      request.files
          .add(await http.MultipartFile.fromPath('doc', file, filename: file));
      var res = await request.send();
      var responsed = await http.Response.fromStream(res);
      if (responsed.statusCode == 200) {
        var jsondata = json.decode(responsed.body);
        CommonUploadStatus status = CommonUploadStatus.fromJson(jsondata);
        getsnakbar("Document Upload", status.status.toString());
        return status;
      }
    } catch (e) {
      getToast("Something went to wrong !!");
    }
  }

  @override
  getLogin(String? endpoint) async {
    print(endpoint);
    try {
      var response =
          await httpPostNullBody(Endpoints.baseUrl! + endpoint!, login: true);
      if (response != null) {
        LoginModel model = LoginModel.fromJson(json.decode(response));
        return model;
      }
    } catch (e) {
      // await errorHandle(
      //   Get.find<BaseController>().model1.id.toString(),
      //   e.toString().split(":")[1].toString(),
      //   e.toString().split(":")[0].toString(),
      //   StackTrace.current.toString(),
      // );
      return null;
    }
  }

  @override
  getDropdownUploadDocument(String endpoint) async {
    try {
      List<DropDownDocumentType> model = [];
      var res = await httpPostNullBody(Endpoints.baseUrl! + endpoint);
      if (res != null) {
        model = List<DropDownDocumentType>.from(
            json.decode(res).map((x) => DropDownDocumentType.fromJson(x)));
        return model;
      }
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  getDocumentName(String endpoint) async {
    try {
      List<DropDownDocumentName> model = [];
      var res = await httpPostNullBody(Endpoints.baseUrl! + endpoint);
      if (res != null) {
        model = List<DropDownDocumentName>.from(
            json.decode(res).map((x) => DropDownDocumentName.fromJson(x)));
        return model;
      }
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  getServicesAssigned(String endpoint) async {
    try {
      List<ServiceAssigneersModel> model = [];
      var res = await httpPostNullBody(Endpoints.baseUrl! + endpoint);
      if (res != null) {
        model = List<ServiceAssigneersModel>.from(
            json.decode(res).map((x) => ServiceAssigneersModel.fromJson(x)));
        return model;
      }
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  getOrganizationDropDown(String endpoint) async {
    try {
      List<DropDownorganisationName> model = [];
      var res = await httpPostNullBody(Endpoints.baseUrl! + endpoint);
      if (res != null) {
        model = List<DropDownorganisationName>.from(
            json.decode(res).map((x) => DropDownorganisationName.fromJson(x)));
        return model;
      }
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  getcommondocument(String endpoint) async {
    try {
      List<CommonUploadDocument> model = [];
      var res = await httpPostNullBody(Endpoints.baseUrl! + endpoint);
      if (res != null) {
        model = List<CommonUploadDocument>.from(
            json.decode(res).map((x) => CommonUploadDocument.fromJson(x)));
        return model;
      }
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  getSheduleExpertCall(String endpoint) async {
    try {
      StatusModel model = StatusModel();
      var res = await httpPostNullBody(Endpoints.baseUrl! + endpoint);
      if (res != null) {
        model = StatusModel.fromJson(json.decode(res));
        getsnakbar("Schedule an Expert call", model.status!);
        Get.toNamed(DashBoard.routeNamed);
      }
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  logout(String baseUrl, String endpoint, String token) async {
    var jsonData = {"token": token};

    try {
      var response = await logoutPost(baseUrl + endpoint, jsonData, token);
      if (response == true) {
        return true;
      }
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  countryGuide(String endpoint) async {
    try {
      List<CountryGuideModel> model = [];
      var res = await httpPostNullBody(Endpoints.baseUrl! + endpoint);
      if (res != null) {
        model = List<CountryGuideModel>.from(
            json.decode(res).map((x) => CountryGuideModel.fromJson(x)));
        return model;
      }
    } catch (e) {
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  getTrackYourTickets(String endpoint) async {
    try {
      TicketDataModel model = TicketDataModel();

      var res = await httpPostNullBody(Endpoints.baseUrl! + endpoint);
      if (res != null) {
        model = TicketDataModel.fromJson(json.decode(res));

        return model;
      }
    } catch (e) {
      print(e.toString());
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  saveComments(String endpoint) async {
    try {
      List<Comments> model = [];

      var res = await httpPostNullBody(Endpoints.baseUrl! + endpoint);
      if (res != null) {
        var jsondata = json.decode(res);
        getToast("Comment added" + jsondata["status"]);
        // List<CountryGuideModel>.from(
        //     json.decode(res).map((x) => CountryGuideModel.fromJson(x)));
        model = List<Comments>.from(
            jsondata["comments"].map((x) => Comments.fromJson(x)));
        return model;
      }
    } catch (e) {
      print(e.toString());
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  @override
  qualificationUpdateDropdown(String endpoint) async {
    try {
      List<Comments> model = [];

      var res = await httpPostNullBody(Endpoints.baseUrl! + endpoint);
      if (res != null) {
        var jsondata = json.decode(res);
        return jsondata;
      }
    } catch (e) {
      print(e.toString());
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }

  phonenumberVerfiy(String phoneNumber) async {
    try {
      var res = await httpPostNullBody(
          Endpoints.baseUrl! + Endpoints.phoneNuberverfiy! + phoneNumber,
          login: true);
      if (res != null) {
        var jsondata = json.decode(res);
        getToast("Please check the OTP your register phone number");
        return true;
      }
    } catch (e) {
      getToast("Phone number not found in Gradlynk");
      print(e.toString());
      await errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString().split(":")[1].toString(),
        e.toString().split(":")[0].toString(),
        StackTrace.current.toString(),
      );
    }
  }
  // logout(String endpoint, String token) async {
  //   try {
  //     var res = await httplogout(Endpoints.baseUrl! + endpoint, token);
  //     if (res != null) {
  //       if (res["message"] == "Logged out") {
  //         print("object");
  //       }
  //     }
  //   } catch (e) {
  //     print(StackTrace.current);
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
}
