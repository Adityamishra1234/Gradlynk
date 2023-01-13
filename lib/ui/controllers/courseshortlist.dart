import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/ui/models/filterModel.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/endpoint.dart';

class CourseShortListController extends BaseController {
  ApiServices apiservices = ApiServices();

  // Loading
  RxBool compareApply = false.obs;
  RxBool loadingCourseSearch = false.obs;
  RxBool loadingCourseShortList = false.obs;

  List<CompleteCourseDetail> completeCourseDetail = [];

  CourseModelFilter courseModelFilter = CourseModelFilter();
  List<CourseSearchModel> courseSearchModel = [];
  CourseSearchModel courseSearchModelCompare1 = CourseSearchModel();
  CourseSearchModel courseSearchModelCompare2 = CourseSearchModel();

  // @override
  // void onInit() {
  //   super.onInit();
  //   // GetCourseShortList("78623");
  // }

  setCompare(RxBool data) {
    compareApply = data;
    update();
  }

  courseShortList(String? id, String enq_id) {
    apiservices.setShortListCourse(id, enq_id);
  }

  completeCourseDetailMethod(
      String universityId, String courseId, String instituteCourseId) async {
    String endpoint = Endpoints.completeCoursePart1! +
        universityId +
        Endpoints.completeCoursePart2! +
        courseId +
        Endpoints.completeCoursePart3! +
        instituteCourseId;
    var res =
        await apiservices.completeCourseDetail(Endpoints.baseUrl!, endpoint);
    if (res != null) {
      completeCourseDetail = res;
      return completeCourseDetail;
    }
  }

  GetCourseShortList(String? enq_id) async {
    var response = await apiservices.courseShortlistDetail(enq_id);
    if (response != null) {
      courseModelFilter = response;
      loadingCourseShortList = true.obs;
      update();
    }
  }

  compare(String? varTopic) {
    if (varTopic.toString().split(",")[0].toString() == true.toString()) {
      if (courseSearchModelCompare1.id == null) {
        courseSearchModelCompare1 = courseModelFilter
            .courseSearchList[int.parse(varTopic.toString().split(",")[1])];
        courseModelFilter
            .courseSearchList[int.parse(varTopic.toString().split(",")[1])]
            .isSelected = true;
        update();
      } else if (courseSearchModelCompare2.id == null) {
        courseSearchModelCompare2 = courseModelFilter
            .courseSearchList[int.parse(varTopic.toString().split(",")[1])];
        courseModelFilter
            .courseSearchList[int.parse(varTopic.toString().split(",")[1])]
            .isSelected = true;
        update();
      } else {
        debugPrint(varTopic);
      }
      // Added Button For Comparing
    } else {}
  }

  callbackModelCompare(varTopic) {
    if (varTopic == "Model1") {
      courseSearchModelCompare1 = CourseSearchModel();
      update();
    } else {
      courseSearchModelCompare2 = CourseSearchModel();
      update();
    }
  }

  // callbackCompareCourseRemove(data) {
  //   if (data == "1") {
  //     courseSearchModelCompare1 = CourseSearchModel();
  //     update();
  //   } else if (data == "2") {
  //     courseSearchModelCompare2 = CourseSearchModel();
  //     update();
  //   } else if (data == "12") {
  //     courseSearchModelCompare2 = CourseSearchModel();
  //     courseSearchModelCompare1 = CourseSearchModel();
  //     update();
  //   }
  // }

  courseSearch(String country, String courseLevel, String enq_id,
      [String state = "[]",
      String city = "[]",
      String boarder_ield = "[]",
      String narrow_field = "[]"]) async {
    loadingCourseSearch = false.obs;
    courseModelFilter = CourseModelFilter();
    var now = DateTime.now();
    var formatterYear = DateFormat('yyyy');
    var formatterMonth = DateFormat('MM');

    String? endpoint = Endpoints.courseSearchPart1! +
        getRemoveSquarebracket(country) +
        Endpoints.courseSearchPart2! +
        getRemoveSquarebracket(courseLevel) +
        Endpoints.courseSearchPart3! +
        getRemoveSquarebracket(state) +
        Endpoints.courseSearchPart4! +
        getRemoveSquarebracket(city) +
        Endpoints.courseSearchPart5! +
        getRemoveSquarebracket(boarder_ield) +
        Endpoints.courseSearchPart6! +
        getRemoveSquarebracket(narrow_field);
    var res =
        await apiservices.getCourseSearch(Endpoints.baseUrl!, endpoint, enq_id);
    if (res != null) {
      courseModelFilter = res;
      courseSearchModel = courseModelFilter.courseSearchList;
      for (var i = 0; i < courseSearchModel.length; i++) {
        if (courseSearchModel[i].listIntake!.isNotEmpty) {
          for (var j = 0; j < courseSearchModel[i].listIntake!.length; j++) {
            if (int.parse(courseSearchModel[i].listIntake![j].split("-")[1]) >=
                int.parse(formatterYear.format(now))) {
              if (int.parse(
                      courseSearchModel[i].listIntake![j].split("-")[0]) >=
                  int.parse(formatterMonth.format(now))) {
                courseSearchModel[i].nearByIntake =
                    courseSearchModel[i].listIntake![j];
              }
            }
          }
        }
      }
      loadingCourseSearch = true.obs;
      update();
      return courseModelFilter;
    }
  }
}
