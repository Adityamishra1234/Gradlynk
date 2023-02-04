import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/ui/models/filterModel.dart';
import 'package:studentpanel/utils/endpoint.dart';

class ReviewShortListController extends GetxController {
  ApiServices apiservices = ApiServices();

  // Loading
  RxBool compareApply = false.obs;
  RxBool loadingNextAndPrevious = false.obs;
  RxBool loadingCourseShortList = false.obs;

  List<CompleteCourseDetail> completeCourseDetail = [];

  CourseModelFilter courseModelFilter = CourseModelFilter();
  List<CourseSearchModel> courseSearchModel = [];
  CourseSearchModel courseSearchModelCompare1 = CourseSearchModel();
  CourseSearchModel courseSearchModelCompare2 = CourseSearchModel();

  // @override
  // void onInit() {
  //   super.onInit();
  //   GetCourseShortList("78623");
  // }

  setCompare(RxBool data) {
    compareApply = data;
    update();
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

  GetCourseShortList(String? enqId) async {
    var response = await apiservices.courseShortlistDetail(enqId);
    if (response != null) {
      courseModelFilter = response;
      courseSearchModel = courseModelFilter.courseSearchList;
      loadingCourseShortList = true.obs;
      update();
    }
  }

  courseShortList(String? id, String enqId) {
    apiservices.setShortListCourse(id, enqId);
  }

  courseFinalShortlist(String? id, String enqId) {
    apiservices.setFinalShortListCourse(id, enqId);
  }
}
