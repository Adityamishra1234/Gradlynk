import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/ui/models/filterModel.dart';

class FilterController extends BaseController {
  CourseModelFilter courseModelFilter = CourseModelFilter();
  List<CourseSearchModel> courseSearchModel = [];

  FilterModel filterModel = FilterModel();

  // List of Filter Fields
  List<String>? university;
  List<String>? offerTAT;
  List<String>? visaTAT;
  List<String>? intakeMonth;
  List<String>? intakeYear;
  List<String>? instituteLevel;
  List<String>? scholarship;
  List<String>? siecPriority;
  List<String>? conditionaloffer;
  List<String>? backlogAcceptable;
  List<String>? applicationfee;
  List<String>? placementSandwichYear;
  List<String>? siecRepresent;
  List<String>? countryName;
  List<String>? institutePublicPrivate;

  // Academic % ,  Budget , Select Ranking

  //Loading
  RxBool loadingfuncation = true.obs;

  getUniversity(String? data) async {
    List<CourseSearchModel> courseSearchModel2 = [];
    loadingfuncation.value = false;
    update();
    filterModel = FilterModel();
    university = data!.split(",");
    university!.removeAt(0);
    for (int i = 0; i < university!.length; i++) {
      for (int j = 0; j < courseModelFilter.courseSearchList.length; j++) {
        if (courseModelFilter.courseSearchList[j].universityName ==
            university![i]) {
          courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
        }
      }
    }

    courseSearchModel = courseSearchModel2;
    await setModificationFilter(courseSearchModel2);
  }

  getOfferTAT(String? data) async {
    loadingfuncation!.value = false;
    update();
    List<CourseSearchModel> courseSearchModel2 = [];
    filterModel = FilterModel();
    offerTAT = data!.split(",");
    offerTAT!.removeAt(0);
    for (int i = 0; i < offerTAT!.length; i++) {
      for (int j = 0; j < courseModelFilter.courseSearchList.length; j++) {
        if (courseModelFilter.courseSearchList[j].offerTat == offerTAT![i]) {
          courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
        }
      }
    }

    courseSearchModel = courseSearchModel2;
    await setModificationFilter(courseSearchModel2);
  }

  getVisaTAT(String? data) {
    loadingfuncation.value = false;
    update();
    List<CourseSearchModel> courseSearchModel2 = [];
    filterModel = FilterModel();
    visaTAT = data!.split(",");
    visaTAT!.removeAt(0);
    for (int i = 0; i < visaTAT!.length; i++) {
      for (int j = 0; j < courseModelFilter.courseSearchList.length; j++) {
        if (courseModelFilter.courseSearchList[j].visaTat == visaTAT![i]) {
          courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
        }
      }
    }
    courseSearchModel = courseSearchModel2;
    setModificationFilter(courseSearchModel2);
  }

  getIntakeMonth(String? data) async {
    loadingfuncation!.value = false;
    update();
    List<CourseSearchModel> courseSearchModel2 = [];
    filterModel = FilterModel();
    intakeMonth = data!.split(",");
    intakeMonth!.removeAt(0);
    for (int i = 0; i < intakeMonth!.length; i++) {
      for (int j = 0; j < courseModelFilter.courseSearchList.length; j++) {
        if (courseModelFilter.courseSearchList[j].intakeMonth != null) {
          List<String>? temp =
              courseModelFilter.courseSearchList[j].intakeMonth!.split("|");
          temp = temp.toSet().toList();
          for (var k = 0; k < temp.length; k++) {
            if (temp[k].toString() == intakeMonth![i].toString()) {
              courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
            }
          }
        }
      }
    }

    courseSearchModel = courseSearchModel2;
    await setModificationFilter(courseSearchModel2);
  }

  getIntakeYear(String? data) async {
    loadingfuncation!.value = false;
    update();
    List<CourseSearchModel> courseSearchModel2 = [];
    filterModel = FilterModel();
    intakeYear = data!.split(",");
    intakeYear!.removeAt(0);
    for (int i = 0; i < intakeYear!.length; i++) {
      for (int j = 0; j < courseModelFilter.courseSearchList.length; j++) {
        if (courseModelFilter.courseSearchList[j].intakeYear != null) {
          List<String>? temp =
              courseModelFilter.courseSearchList[j].intakeYear!.split("|");
          temp = temp.toSet().toList();
          for (var k = 0; k < temp.length; k++) {
            if (temp[k].toString() == intakeYear![i].toString()) {
              courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
            }
          }
        }
      }
    }

    courseSearchModel = courseSearchModel2;
    await setModificationFilter(courseSearchModel2);
  }

  getInstituteLevel(String? data) async {
    loadingfuncation!.value = false;
    update();
    List<CourseSearchModel> courseSearchModel2 = [];
    filterModel = FilterModel();
    instituteLevel = data!.split(",");
    instituteLevel!.removeAt(0);
    for (int i = 0; i < instituteLevel!.length; i++) {
      for (int j = 0; j < courseModelFilter.courseSearchList.length; j++) {
        if (courseModelFilter.courseSearchList[j].instituteType ==
            instituteLevel![i]) {
          courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
        }
      }
    }

    courseSearchModel = courseSearchModel2;
    await setModificationFilter(courseSearchModel2);
  }

  getScholarship(String? data) async {
    loadingfuncation!.value = false;
    update();
    List<CourseSearchModel> courseSearchModel2 = [];
    filterModel = FilterModel();
    scholarship = data!.split(",");
    scholarship!.removeAt(0);
    for (int i = 0; i < scholarship!.length; i++) {
      for (int j = 0; j < courseModelFilter.courseSearchList.length; j++) {
        if (courseModelFilter.courseSearchList[j].scholarship ==
            scholarship![i]) {
          courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
        }
      }
    }
    courseSearchModel = courseSearchModel2;
    await setModificationFilter(courseSearchModel2);
  }

  getSiecPriority(String? data) async {
    loadingfuncation!.value = false;
    update();
    List<CourseSearchModel> courseSearchModel2 = [];
    filterModel = FilterModel();
    siecPriority = data!.split(",");
    siecPriority!.removeAt(0);
    for (int i = 0; i < siecPriority!.length; i++) {
      for (int j = 0; j < courseModelFilter.courseSearchList.length; j++) {
        if (courseModelFilter.courseSearchList[j].siecPriority ==
            siecPriority![i]) {
          courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
        }
      }
    }
    courseSearchModel = courseSearchModel2;
    await setModificationFilter(courseSearchModel2);
  }

  getConditionalOffer(String? data) async {
    loadingfuncation!.value = false;
    update();
    List<CourseSearchModel> courseSearchModel2 = [];
    filterModel = FilterModel();
    conditionaloffer = data!.split(",");
    conditionaloffer!.removeAt(0);
    for (int i = 0; i < conditionaloffer!.length; i++) {
      for (int j = 0; j < courseModelFilter.courseSearchList.length; j++) {
        if (courseModelFilter.courseSearchList[j].conditionalOffer ==
            conditionaloffer![i]) {
          courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
        }
      }
    }
    courseSearchModel = courseSearchModel2;
    await setModificationFilter(courseSearchModel2);
  }

  getBackLogAcceptable(String? data) async {
    loadingfuncation!.value = false;
    update();
    List<CourseSearchModel> courseSearchModel2 = [];
    filterModel = FilterModel();
    backlogAcceptable = data!.split(",");
    backlogAcceptable!.removeAt(0);
    for (int i = 0; i < backlogAcceptable!.length; i++) {
      for (int j = 0; j < courseModelFilter.courseSearchList.length; j++) {
        if (courseModelFilter.courseSearchList[j].backlogsAcceptable ==
            backlogAcceptable![i]) {
          courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
        }
      }
    }
    courseSearchModel = courseSearchModel2;
    await setModificationFilter(courseSearchModel2);
  }

  getApplicationFee(String? data) async {
    loadingfuncation!.value = false;
    update();
    List<CourseSearchModel> courseSearchModel2 = [];
    filterModel = FilterModel();
    applicationfee = data!.split(",");
    applicationfee!.removeAt(0);
    for (int i = 0; i < applicationfee!.length; i++) {
      for (int j = 0; j < courseModelFilter.courseSearchList.length; j++) {
        if (courseModelFilter.courseSearchList[j].isApplicationFee ==
            applicationfee![i]) {
          courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
        }
      }
    }
    courseSearchModel = courseSearchModel2;
    await setModificationFilter(courseSearchModel2);
  }

  getplacementSandwich(String? data) async {
    loadingfuncation!.value = false;
    update();
    List<CourseSearchModel> courseSearchModel2 = [];
    filterModel = FilterModel();
    placementSandwichYear = data!.split(",");
    placementSandwichYear!.removeAt(0);
    for (int i = 0; i < placementSandwichYear!.length; i++) {
      for (int j = 0; j < courseModelFilter.courseSearchList.length; j++) {
        if (courseModelFilter.courseSearchList[j].isApplicationFee ==
            placementSandwichYear![i]) {
          courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
        }
      }
    }
    courseSearchModel = courseSearchModel2;
    await setModificationFilter(courseSearchModel2);
  }

  getSiecRepresent(String? data) async {
    loadingfuncation!.value = false;
    update();
    List<CourseSearchModel> courseSearchModel2 = [];
    filterModel = FilterModel();
    siecRepresent = data!.split(",");
    siecRepresent!.removeAt(0);
    for (int i = 0; i < siecRepresent!.length; i++) {
      for (int j = 0; j < courseModelFilter.courseSearchList.length; j++) {
        if (courseModelFilter.courseSearchList[j].siecRep ==
            siecRepresent![i]) {
          courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
        }
      }
    }
    courseSearchModel = courseSearchModel2;
    await setModificationFilter(courseSearchModel2);
  }

  getCountryName(String? data) async {
    loadingfuncation!.value = false;
    update();
    List<CourseSearchModel> courseSearchModel2 = [];
    filterModel = FilterModel();
    countryName = data!.split(",");
    countryName!.removeAt(0);
    for (int i = 0; i < countryName!.length; i++) {
      for (int j = 0; j < courseModelFilter.courseSearchList.length; j++) {
        if (courseModelFilter.courseSearchList[j].countryName ==
            countryName![i]) {
          courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
        }
      }
    }
    courseSearchModel = courseSearchModel2;
    await setModificationFilter(courseSearchModel2);
  }

  getInstitutePublicPrivate(String? data) async {
    loadingfuncation!.value = false;
    update();
    List<CourseSearchModel> courseSearchModel2 = [];
    filterModel = FilterModel();
    institutePublicPrivate = data!.split(",");
    institutePublicPrivate!.removeAt(0);
    for (int i = 0; i < institutePublicPrivate!.length; i++) {
      for (int j = 0; j < courseModelFilter.courseSearchList.length; j++) {
        if (courseModelFilter.courseSearchList[j].instSubCategory ==
            institutePublicPrivate![i]) {
          courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
        }
      }
    }
    courseSearchModel = courseSearchModel2;
    await setModificationFilter(courseSearchModel2);
  }

  setModificationFilter(List<CourseSearchModel>? courseSearchModellist) {
    courseSearchModellist!.forEach((element) {
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

    //Yes No
    filterModel.scholarship = filterModel.scholarship!.toSet().toList();
    filterModel.siecPriority = filterModel.siecPriority!.toSet().toList();
    filterModel.conditionalOffer =
        filterModel.conditionalOffer!.toSet().toList();
    filterModel.backlogAcceptable =
        filterModel.backlogAcceptable!.toSet().toList();
    filterModel.applicationfee = filterModel.applicationfee!.toSet().toList();
    filterModel.siecRep = filterModel.siecRep!.toSet().toList();

    print(filterModel.universityname);

    //   filterModel.intakeMonth!.add(element.intakeMonth ?? "");
    //   filterModel.intakeYear!.add(element.intakeYear ?? "");
    //   filterModel.universityname!.add(element.universityName ?? "");
    //   filterModel.instituteLevel!.add(element.instituteType ?? "");
    //   filterModel.academicPercentage!.add(element.academicRequire ?? "");
    //   filterModel.budget!.add(element.allFeesInr ?? "");
    //   filterModel.offerTAT!.add(element.offerTat ?? "");
    //   filterModel.visaTAT!.add(element.visaTat ?? "");
    //   filterModel.countryName!.add(element.countryName ?? "");
    //   filterModel.scholarship!.add(element.scholarship ?? "");
    //   filterModel.siecPriority!.add(element.siecPriority ?? "");
    //   filterModel.conditionalOffer!.add(element.conditionalOffer ?? "");
    //   filterModel.backlogAcceptable!.add(element.backlogsAcceptable ?? "");
    //   filterModel.applicationfee!.add(element.isApplicationFee ?? "");
    //   // Placement / Sandwich , Ranking, budget
    // });
    // print(filterModel.universityname);
    // filterModel.intakeMonth = filterModel.intakeMonth!.toSet().toList();
    // filterModel.intakeYear = filterModel.intakeYear!.toSet().toList();
    // filterModel.universityname = filterModel.universityname!.toSet().toList();
    // filterModel.instituteLevel = filterModel.instituteLevel!.toSet().toList();
    // filterModel.academicPercentage =
    //     filterModel.academicPercentage!.toSet().toList();
    // filterModel.budget = filterModel.budget!.toSet().toList();
    // filterModel.offerTAT = filterModel.offerTAT!.toSet().toList();
    // filterModel.visaTAT = filterModel.visaTAT!.toSet().toList();
    // filterModel.countryName = filterModel.countryName!.toSet().toList();
    // filterModel.scholarship = filterModel.scholarship!.toSet().toList();
    // filterModel.siecPriority = filterModel.siecPriority!.toSet().toList();
    // filterModel.conditionalOffer =
    //     filterModel.conditionalOffer!.toSet().toList();
    // filterModel.backlogAcceptable =
    //     filterModel.backlogAcceptable!.toSet().toList();
    // filterModel.applicationfee = filterModel.applicationfee!.toSet().toList();

    // Placement / Sandwich , Ranking, budget
    loadingfuncation!.value = true;
    update();

    courseModelFilter.courseSearchList = courseSearchModel;
  }
}
