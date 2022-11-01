import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/ui/models/filterModel.dart';

class FilterController extends BaseController {
  CourseModelFilter courseModelFilter = CourseModelFilter();
  List<CourseSearchModel> courseSearchModel = [];
  FilterModel filterModel = FilterModel();
  CourseModelFilter previouscourseModelFilter = CourseModelFilter();

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
  List<String>? academicpercentage;
  List<String>? budget;
  //Loading
  RxBool loadingfuncation = true.obs;

  // writen some code
  getBudget(String? data) async {
    List<CourseSearchModel> courseSearchModel2 = [];
    loadingfuncation.value = false;
    bool more_30 = false;
    bool between_15_30 = false;
    bool between_7_15 = false;
    bool less_7 = false;
    update();
    filterModel = FilterModel();
    budget = data!.split(",");
    budget!.removeAt(0);
    const ["30 lac or more", "15-30 lac", "7-15 lac", "below 7lac"];
    budget!.forEach((element) {
      if (element.toString() == "15-30 lac") {
        between_15_30 = true;
      } else if (element.toString() == "7-15 lac") {
        between_7_15 = true;
      } else if (element.toString() == "below 7lac") {
        less_7 = true;
      } else if (element.toString() == "30 lac or more") {
        more_30 = true;
      }
    });

    for (int i = 0; i < budget!.length; i++) {
      for (int j = 0; j < courseModelFilter.courseSearchList.length; j++) {
        // three condition
        if (courseModelFilter.courseSearchList[j].annualTutionFeesInr != null ||
            courseModelFilter.courseSearchList[j].annualTutionFeesInr != "") {
          if (between_15_30 == true) {
            if (double.parse(courseModelFilter
                        .courseSearchList[j].annualTutionFeesInr!
                        .toString()) >
                    1700000 ||
                double.parse(courseModelFilter
                        .courseSearchList[j].annualTutionFeesInr!) <
                    3000000) {
              courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
            }
          }
          if (less_7 == true) {
            if (double.parse(courseModelFilter
                    .courseSearchList[j].annualTutionFeesInr!
                    .toString()) <
                700000) {
              courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
            }
          }
          if (more_30 == true) {
            if (double.parse(courseModelFilter
                    .courseSearchList[j].annualTutionFeesInr!
                    .toString()) >
                3000000) {
              courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
            }
          }
          if (between_7_15 == true) {
            if (double.parse(courseModelFilter
                        .courseSearchList[j].annualTutionFeesInr!
                        .toString()) >
                    700000 ||
                double.parse(courseModelFilter
                        .courseSearchList[j].annualTutionFeesInr!
                        .toString()) <
                    1500000) {
              courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
            }
          }
        }
      }
    }

    courseSearchModel = courseSearchModel2;
    await setModificationFilter(courseSearchModel2);
  }

  getAcademic(String? data) async {
    List<CourseSearchModel> courseSearchModel2 = [];
    loadingfuncation.value = false;
    bool between_60_70 = false;
    bool between_50_60 = false;
    bool between_50 = false;
    update();
    filterModel = FilterModel();
    academicpercentage = data!.split(",");
    academicpercentage!.removeAt(0);

    academicpercentage!.forEach((element) {
      if (element.toString() == "between 60-70") {
        between_60_70 = true;
      } else if (element.toString() == "between 50-60") {
        between_50_60 = true;
      } else if (element.toString() == "between 50") {
        between_50 = true;
      }
    });

    for (int i = 0; i < academicpercentage!.length; i++) {
      for (int j = 0; j < courseModelFilter.courseSearchList.length; j++) {
        // three condition
        if (courseModelFilter.courseSearchList[j].academicRequire != null ||
            courseModelFilter.courseSearchList[j].academicRequire != "") {
          if (between_50_60 == true) {
            if (double.parse(courseModelFilter
                        .courseSearchList[j].academicRequire!
                        .split("-")[2]
                        .toString()) >
                    49 ||
                double.parse(courseModelFilter
                        .courseSearchList[j].academicRequire!
                        .split("-")[2]) <
                    60) {
              courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
            }
          }
          if (between_50 == true) {
            if (double.parse(courseModelFilter
                    .courseSearchList[j].academicRequire!
                    .split("-")[2]
                    .toString()) <
                50) {
              courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
            }
          }
          if (between_60_70 == true) {
            if (double.parse(courseModelFilter
                        .courseSearchList[j].academicRequire!
                        .split("-")[2]
                        .toString()) >
                    60 ||
                double.parse(courseModelFilter
                        .courseSearchList[j].academicRequire!
                        .split("-")[2]
                        .toString()) <
                    70) {
              courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
            }
          }
        }
      }
    }
    courseSearchModel = courseSearchModel2;
    await setModificationFilter(courseSearchModel2);
  }

  getRanking(
      int? indexSelect, int? firstIndexValue, int? secondIndexValue) async {
    List<CourseSearchModel> courseSearchModel2 = [];
    loadingfuncation.value = false;

    update();
    filterModel = FilterModel();

    switch (indexSelect) {
      case 0:
        for (int j = 0; j < courseModelFilter.courseSearchList.length; j++) {
          if (courseModelFilter.courseSearchList[j].timesRank != null &&
              courseModelFilter.courseSearchList[j].timesRank != "") {
            if (int.parse(courseModelFilter.courseSearchList[j].timesRank
                        .toString()) >
                    firstIndexValue! ||
                int.parse(courseModelFilter.courseSearchList[j].timesRank
                        .toString()) <
                    secondIndexValue!) {
              courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
            }
          }
        }
        break;
      case 1:
        for (int j = 0; j < courseModelFilter.courseSearchList.length; j++) {
          if (courseModelFilter.courseSearchList[j].timesRank != null &&
              courseModelFilter.courseSearchList[j].timesRank != "") {
            if (int.parse(courseModelFilter.courseSearchList[j].arwuRank
                        .toString()) >
                    firstIndexValue! ||
                int.parse(courseModelFilter.courseSearchList[j].arwuRank
                        .toString()) <
                    secondIndexValue!) {
              courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
            }
          }
        }
        break;
      case 2:
        for (int j = 0; j < courseModelFilter.courseSearchList.length; j++) {
          if (courseModelFilter.courseSearchList[j].timesRank != null &&
              courseModelFilter.courseSearchList[j].timesRank != "") {
            if (int.parse(courseModelFilter.courseSearchList[j].usNewsRank
                        .toString()) >
                    firstIndexValue! ||
                int.parse(courseModelFilter.courseSearchList[j].usNewsRank
                        .toString()) <
                    secondIndexValue!) {
              courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
            }
          }
        }
        break;
      case 3:
        for (int j = 0; j < courseModelFilter.courseSearchList.length; j++) {
          if (courseModelFilter.courseSearchList[j].timesRank != null &&
              courseModelFilter.courseSearchList[j].timesRank != "") {
            if (int.parse(courseModelFilter.courseSearchList[j].qsWorldRank
                        .toString()) >
                    firstIndexValue! ||
                int.parse(courseModelFilter.courseSearchList[j].qsWorldRank
                        .toString()) <
                    secondIndexValue!) {
              courseSearchModel2.add(courseModelFilter.courseSearchList[j]);
            }
          }
        }
        break;
      default:
    }

    courseSearchModel = courseSearchModel2;
    await setModificationFilter(courseSearchModel2);
  }

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
    loadingfuncation.value = false;
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
    loadingfuncation.value = false;
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
    loadingfuncation.value = false;
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
    loadingfuncation.value = false;
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
    loadingfuncation.value = false;
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
    loadingfuncation.value = false;
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
    loadingfuncation.value = false;
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
    loadingfuncation.value = false;
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
    loadingfuncation.value = false;
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
    loadingfuncation.value = false;
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
    loadingfuncation.value = false;
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
    loadingfuncation.value = false;
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
    loadingfuncation.value = false;
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
      if (element.instSubCategory != null && element.instSubCategory != "") {
        filterModel.institutePrivatePublic!.add(element.instSubCategory ?? "");
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

    courseModelFilter.filterModel.filterSelected.academicPercentageSelected =
        academicpercentage;
    courseModelFilter.filterModel.filterSelected.applicationfeeSelected =
        applicationfee;
    //  courseModelFilter.filterModel.filterSelected.arwuNewsRankingSelected =
    // ;
    courseModelFilter.filterModel.filterSelected.backlogAcceptableSelected =
        backlogAcceptable;
    courseModelFilter.filterModel.filterSelected.academicPercentageSelected =
        academicpercentage;
    courseModelFilter.filterModel.filterSelected.backlogAcceptableSelected =
        backlogAcceptable;
    courseModelFilter.filterModel.filterSelected.budgetSelected = budget;
    courseModelFilter.filterModel.filterSelected.conditionalOfferSelected =
        conditionaloffer;
    courseModelFilter.filterModel.filterSelected.countryNameSelected =
        countryName;
    //     courseModelFilter.filterModel.filterSelected.instSubCategorySelected =
    // countryName;
    courseModelFilter.filterModel.filterSelected.instituteLevelSelected =
        instituteLevel;
    courseModelFilter.filterModel.filterSelected
        .institutePrivatePublicSelected = institutePublicPrivate;
    courseModelFilter.filterModel.filterSelected.intakeMonthSelected =
        intakeMonth;
    courseModelFilter.filterModel.filterSelected.intakeYearSelected =
        intakeYear;
    courseModelFilter.filterModel.filterSelected.offerTATSelected = offerTAT;
    courseModelFilter.filterModel.filterSelected.placementSandwichSelected =
        placementSandwichYear;
    // courseModelFilter.filterModel.filterSelected.qsWorldRankingSelected = q;
    courseModelFilter.filterModel.filterSelected.scholarshipSelected =
        scholarship;
    courseModelFilter.filterModel.filterSelected.universitynameSelected =
        university;

    loadingfuncation.value = true;
    update();

    courseModelFilter.courseSearchList = courseSearchModel;
  }

  getRemoveFilter() {
    previouscourseModelFilter.courseSearchList.forEach((element) {
      for (var i = 0;
          i <
              courseModelFilter
                  .filterModel.filterSelected.universitynameSelected!.length;
          i++) {
        if (element.universityName ==
            filterModel.filterSelected.universitynameSelected![i].toString()) {}
      }
    });
  }
}
