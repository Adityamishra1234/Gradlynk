import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/ui/models/filterModel.dart';
import 'package:studentpanel/utils/endpoint.dart';

class FinalShortListController extends BaseController {
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
  //   getFinalShortlist("78623");
  // }

  setCompare(RxBool data) {
    compareApply = data;
    update();
  }

// Check
  // nextpage(String endpoint, String pageNumber) async {
  //   if (loadingNextAndPrevious.value == true) {
  //     loadingNextAndPrevious = false.obs;
  //     update();
  //   }
  //   var now = DateTime.now();
  //   var formatterYear = DateFormat('yyyy');
  //   var formatterMonth = DateFormat('MM');

  //   debugPrint("$endpoint&page=$pageNumber");
  //   var res = await apiservices.getCourseSearch(
  //       Endpoints.baseUrl!, "$endpoint&page=$pageNumber");
  //   if (res != null) {
  //     courseSearchPages = res;

  //     for (var i = 0; i < courseSearchPages.courseSearchModel!.length; i++) {
  //       if (courseSearchPages.courseSearchModel![i].listIntake!.isNotEmpty) {
  //         for (var j = 0;
  //             j < courseSearchPages.courseSearchModel![i].listIntake!.length;
  //             j++) {
  //           if (int.parse(courseSearchPages.courseSearchModel![i].listIntake![j]
  //                   .split("-")[1]) >=
  //               int.parse(formatterYear.format(now))) {
  //             if (int.parse(courseSearchPages
  //                     .courseSearchModel![i].listIntake![j]
  //                     .split("-")[0]) >=
  //                 int.parse(formatterMonth.format(now))) {
  //               courseSearchPages.courseSearchModel![i].nearByIntake =
  //                   courseSearchPages.courseSearchModel![i].listIntake![j];
  //             }
  //           }
  //         }
  //       }
  //     }
  //     courseSearchPages.courseSearchModel!;
  //     return loadingNextAndPrevious.value = true;
  //   } else {
  //     return loadingNextAndPrevious.value = false;
  //   }
  // }

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

  getFinalShortlist(String? enq_id) async {
    var response = await apiservices.getFinalShortlist(
        Endpoints.finalShortListDetail, enq_id!);
    if (response != null) {
      courseModelFilter = response;
      loadingCourseShortList = true.obs;
      update();
    }
  }

  courseShortList(String? id, String enq_id) {
    apiservices.setShortListCourse(id, enq_id);
  }

  courseFinalShortlist(String? id, String enq_id) {
    apiservices.setFinalShortListCourse(id, enq_id);
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
}
