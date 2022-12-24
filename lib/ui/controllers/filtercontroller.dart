import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/ui/models/filterModel.dart';
import 'package:studentpanel/utils/constants.dart';

class FilterController extends BaseController {
  CourseModelFilter courseModelFilter = CourseModelFilter();
  List<CourseSearchModel> courseSearchModel = [];
  FilterModel filterModel = FilterModel();
  CourseModelFilter previouscourseModelFilter = CourseModelFilter();
  List<CourseSearchModel> courseSearchModel2 = [];

  // List of Filter Fields
  List<String> university = [];
  List<String> offerTAT = [];
  List<String> visaTAT = [];
  List<String> intakeMonth = [];
  List<String> intakeYear = [];
  List<String> instituteLevel = [];
  List<String> scholarship = [];
  List<String> siecPriority = [];
  List<String> conditionaloffer = [];
  List<String> backlogAcceptable = [];
  List<String> applicationfee = [];
  List<String> placementSandwichYear = [];
  List<String> siecRepresent = [];
  List<String> countryName = [];
  List<String> institutePublicPrivate = [];
  List<String> academicpercentage = [];
  List<String> budget = [];

  bool more_30 = false;
  bool between_15_30 = false;
  bool between_7_15 = false;
  bool less_7 = false;

  bool between_60_70 = false;
  bool between_50_60 = false;
  bool between_50 = false;
  bool more_70 = false;

  int? indexSelectRanking, firstIndexValueRanking, secondIndexValueRanking;

  //Loading
  RxBool loadingfuncation = true.obs;
  bool loadingRanking = false;

  getBudget(String? data) async {
    loadingfuncation.value = false;
    update();
    filterModel = FilterModel();
    budget = data!.split(",");
    budget.removeAt(0);

    more_30 = false;
    between_15_30 = false;
    between_7_15 = false;
    less_7 = false;

    if (budget.isNotEmpty) {
      for (var i = 0; i < budget.length; i++) {
        if (budget[i] == "15-30 lac") {
          between_15_30 = true;
        } else if (budget[i] == "7-15 Lac") {
          between_7_15 = true;
        } else if (budget[i] == "Below 7 Lac") {
          less_7 = true;
        } else if (budget[i] == "30 Lac or More") {
          more_30 = true;
        }
      }
    }

    filter();
  }

  // writen some code
  getAcademic(String? data) async {
    // courseModelFilter.filterModel.filterSelected.academicPercentageSelected =
    //     [];
    loadingfuncation.value = false;

    update();
    filterModel = FilterModel();
    academicpercentage = data!.split(",");
    academicpercentage.removeAt(0);

    between_60_70 = false;
    between_50_60 = false;
    between_50 = false;
    more_70 = false;
    if (academicpercentage.isNotEmpty) {
      for (var i = 0; i < academicpercentage.length; i++) {
        if (academicpercentage[i] == "60%-70%") {
          between_60_70 = true;
        } else if (academicpercentage[i] == "50%-60%") {
          between_50_60 = true;
        } else if (academicpercentage[i] == "between 50") {
          between_50 = true;
        } else if (academicpercentage[i] == "70+") {
          more_70 = true;
        }
      }
    }
    filter();
  }

  getRanking(
      int? indexSelect, int? firstIndexValue, int? secondIndexValue) async {
    loadingfuncation.value = false;
    update();
    loadingRanking = true;
    indexSelectRanking = indexSelect;
    firstIndexValueRanking = firstIndexValue;
    secondIndexValueRanking = secondIndexValue;
    filterModel = FilterModel();
    filter();
  }

  getUniversity(String? data) {
    loadingfuncation.value = false;
    List<String> temp = [];
    update();
    filterModel = FilterModel();
    temp = data!.split(",");
    temp.removeAt(0);

    university = temp;

    if (kDebugMode) {
      print(university);
    }
    filter();
  }

  getOfferTAT(String? data) {
    loadingfuncation.value = false;
    update();

    filterModel = FilterModel();
    offerTAT = data!.split(",");
    offerTAT.removeAt(0);
    filter();
  }

  getVisaTAT(String? data) {
    loadingfuncation.value = false;
    update();

    filterModel = FilterModel();
    visaTAT = data!.split(",");
    visaTAT.removeAt(0);
    filter();
  }

  getIntakeMonth(String? data) {
    loadingfuncation.value = false;
    update();

    filterModel = FilterModel();
    intakeMonth = data!.split(",");
    intakeMonth.removeAt(0);
    filter();
  }

  getIntakeYear(String? data) {
    loadingfuncation.value = false;
    update();

    filterModel = FilterModel();
    intakeYear = data!.split(",");
    intakeYear.removeAt(0);
    filter();
  }

  getInstituteLevel(String? data) async {
    loadingfuncation.value = false;
    update();

    filterModel = FilterModel();
    instituteLevel = data!.split(",");
    instituteLevel.removeAt(0);
    filter();
  }

  getScholarship(String? data) async {
    loadingfuncation.value = false;
    update();

    filterModel = FilterModel();
    scholarship = data!.split(",");
    scholarship.removeAt(0);
    filter();
  }

  getSiecPriority(String? data) async {
    loadingfuncation.value = false;
    update();

    filterModel = FilterModel();
    siecPriority = data!.split(",");
    siecPriority.removeAt(0);
    filter();
  }

  getConditionalOffer(String? data) async {
    loadingfuncation.value = false;
    update();

    filterModel = FilterModel();
    conditionaloffer = data!.split(",");
    conditionaloffer.removeAt(0);
    filter();
  }

  getBackLogAcceptable(String? data) async {
    loadingfuncation.value = false;
    update();

    filterModel = FilterModel();
    backlogAcceptable = data!.split(",");
    backlogAcceptable.removeAt(0);
    filter();
  }

  getApplicationFee(String? data) async {
    loadingfuncation.value = false;
    update();

    filterModel = FilterModel();
    applicationfee = data!.split(",");
    applicationfee.removeAt(0);
    filter();
  }

  getplacementSandwich(String? data) async {
    loadingfuncation.value = false;
    update();

    filterModel = FilterModel();
    placementSandwichYear = data!.split(",");
    placementSandwichYear.removeAt(0);
    filter();
  }

  getSiecRepresent(String? data) async {
    loadingfuncation.value = false;
    update();

    filterModel = FilterModel();
    siecRepresent = data!.split(",");
    siecRepresent.removeAt(0);
    filter();
  }

  getCountryName(String? data) async {
    loadingfuncation.value = false;
    update();

    filterModel = FilterModel();
    countryName = data!.split(",");
    countryName.removeAt(0);
    filter();
  }

  getInstitutePublicPrivate(String? data) async {
    loadingfuncation.value = false;
    update();

    filterModel = FilterModel();
    institutePublicPrivate = data!.split(",");
    institutePublicPrivate.removeAt(0);
    filter();
  }

  setModificationFilter(List<CourseSearchModel>? courseSearchModellist) {
    courseSearchModellist!.forEach((element) {
      if (getNUllChecker(element.intakeMonth) == false) {
        filterModel.intakeMonth!.addAll(element.intakeMonth!.split("|"));
      }
      if (getNUllChecker(element.intakeMonth) == false) {
        filterModel.intakeYear!.addAll(element.intakeYear!.split("|"));
      }
      if (getNUllChecker(element.intakeMonth) == false) {
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
      if (getNUllChecker(element.universityName) == false) {
        filterModel.universityname!.add(element.universityName ?? "");
      }

      if (getNUllChecker(element.instituteType) == false) {
        filterModel.instituteLevel!.add(element.instituteType ?? "");
      }

      if (getNUllChecker(element.academicRequire) == false) {
        if (double.parse(element.academicRequire!.split("-")[2]) >= 70) {
          filterModel.academicPercentage[0].update("70+ %", (value) => true);
        } else if (double.parse(element.academicRequire!.split("-")[2]) >= 60 &&
            double.parse(element.academicRequire!.split("-")[2]) < 70) {
          filterModel.academicPercentage[1].update("60%-70%", (value) => true);
        } else if (double.parse(element.academicRequire!.split("-")[2]) >= 50 &&
            double.parse(element.academicRequire!.split("-")[2]) < 60) {
          filterModel.academicPercentage[2].update("50%-60%", (value) => true);
        } else if (double.parse(element.academicRequire!.split("-")[2]) < 50) {
          filterModel.academicPercentage[3]
              .update("Between 50%", (value) => true);
        }
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
        filterModel.institutePrivatePublic!.add(element.instSubCategory ?? "");
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
      // filterModel.placementSandwich!.add(element.place)
    });
    filterModel.universityname = filterModel.universityname!.toSet().toList();
    filterModel.instituteLevel = filterModel.instituteLevel!.toSet().toList();

    filterModel.offerTAT = filterModel.offerTAT!.toSet().toList();
    filterModel.visaTAT = filterModel.visaTAT!.toSet().toList();
    filterModel.countryName = filterModel.countryName!.toSet().toList();
    filterModel.intakeMonth = filterModel.intakeMonth!.toSet().toList();
    filterModel.intakeYear = filterModel.intakeYear!.toSet().toList();

    filterModel.institutePrivatePublic =
        filterModel.institutePrivatePublic!.toSet().toList();
    filterModel.intakeMonth = filterModel.intakeMonth!.toSet().toList();
    filterModel.intakeYear = filterModel.intakeYear!.toSet().toList();
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
        return a.compareTo(b);
      });
    }
    if (filterModel.arwuNewsRanking != null) {
      filterModel.arwuNewsRanking =
          filterModel.arwuNewsRanking!.toSet().toList();
      filterModel.arwuNewsRanking!.sort((a, b) {
        return a.compareTo(b);
      });
    }
    if (filterModel.usNewsRanking != null) {
      filterModel.usNewsRanking = filterModel.usNewsRanking!.toSet().toList();
      filterModel.usNewsRanking!.sort((a, b) {
        return a.compareTo(b);
      });
    }
    if (filterModel.qsWorldRanking != null) {
      filterModel.qsWorldRanking = filterModel.qsWorldRanking!.toSet().toList();
      filterModel.qsWorldRanking!.sort((a, b) {
        return a.compareTo(b);
      });
    }

    filterModel.filterSelected.applicationfeeSelected = applicationfee;
    //  courseModelFilter.filterModel.filterSelected.arwuNewsRankingSelected =
    // ;
    filterModel.filterSelected.backlogAcceptableSelected = backlogAcceptable;

// Budget Selected Filter
    filterModel.filterSelected.budgetSelected = [];
    if (more_30 == true) {
      filterModel.filterSelected.budgetSelected.add("30 Lac or More");
    }
    if (between_15_30 == true) {
      filterModel.filterSelected.budgetSelected.add("15-30 lac");
    }
    if (between_7_15 == true) {
      filterModel.filterSelected.budgetSelected.add("7-15 Lac");
    }
    if (less_7 == true) {
      filterModel.filterSelected.budgetSelected.add("Below 7 Lac");
    }

    //Academic Percentage selected Added

    // between_60_70 = false;
    // between_50_60 = false;
    // between_50 = false;
    // more_70 = false;
    // {"70+ %": false},
    // {"60%-70%": false},
    // {"50%-60%": false},
    // {"Between 50%": false}

    //  filterModel.filterSelected.academicPercentageSelected
    //     .add(filterModel.academicPercentage[i].entries.first.key.toString());

    filterModel.filterSelected.academicPercentageSelected = [];
    if (between_60_70 == true) {
      filterModel.filterSelected.academicPercentageSelected.add("60%-70%");
    }
    if (between_50_60 == true) {
      filterModel.filterSelected.academicPercentageSelected.add("50%-60%");
    }
    if (between_50 == true) {
      filterModel.filterSelected.academicPercentageSelected.add("Between 50%");
    }
    if (more_70 == true) {
      filterModel.filterSelected.academicPercentageSelected.add("70+ %");
    }
    //Academic Percentage selected Added

    filterModel.filterSelected.conditionalOfferSelected = conditionaloffer;
    filterModel.filterSelected.countryNameSelected = countryName;
    //     courseModelFilter.filterModel.filterSelected.instSubCategorySelected =
    // countryName;
    filterModel.filterSelected.instituteLevelSelected = instituteLevel;
    filterModel.filterSelected.institutePrivatePublicSelected =
        institutePublicPrivate;
    filterModel.filterSelected.intakeMonthSelected = intakeMonth;
    filterModel.filterSelected.intakeYearSelected = intakeYear;
    filterModel.filterSelected.offerTATSelected = offerTAT;
    filterModel.filterSelected.placementSandwichSelected =
        placementSandwichYear;
    // courseModelFilter.filterModel.filterSelected.qsWorldRankingSelected = q;
    filterModel.filterSelected.scholarshipSelected = scholarship;
    filterModel.filterSelected.universitynameSelected = university;
    courseModelFilter.courseSearchList = courseSearchModel;
    loadingfuncation.value = true;
    update();
  }

  filter() async {
    if (university.isNotEmpty) {
      courseSearchModel2 = [];
      for (int i = 0; i < university.length; i++) {
        for (int j = 0;
            j < courseModelFilter.previousCourseSearchList.length;
            j++) {
          if (courseModelFilter.previousCourseSearchList[j].universityName ==
              university[i]) {
            courseSearchModel2
                .add(courseModelFilter.previousCourseSearchList[j]);
          }
        }
      }
      courseSearchModel = courseSearchModel2;
    } else {
      courseSearchModel = courseModelFilter.previousCourseSearchList;
      courseSearchModel2 = courseSearchModel;
    }
    if (offerTAT.isNotEmpty && offerTAT != []) {
      courseSearchModel2 = [];
      for (int i = 0; i < offerTAT.length; i++) {
        for (int j = 0; j < courseSearchModel.length; j++) {
          if (courseSearchModel[j].offerTat == offerTAT[i]) {
            courseSearchModel2.add(courseSearchModel[j]);
          }
        }
      }
      courseSearchModel = courseSearchModel2;
    }
    if (visaTAT.isNotEmpty && visaTAT != []) {
      courseSearchModel2 = [];
      for (int i = 0; i < visaTAT.length; i++) {
        for (int j = 0; j < courseSearchModel.length; j++) {
          if (courseSearchModel[j].visaTat == visaTAT[i]) {
            courseSearchModel2.add(courseSearchModel[j]);
          }
        }
      }
      courseSearchModel = courseSearchModel2;
    }
    if (intakeMonth.isNotEmpty && intakeMonth != []) {
      courseSearchModel2 = [];
      List<int> indexSelected = [];
      for (int i = 0; i < intakeMonth.length; i++) {
        for (int j = 0; j < courseSearchModel.length; j++) {
          if (courseSearchModel[j].intakeMonth != null) {
            List<String>? temp = courseSearchModel[j].intakeMonth!.split("|");
            temp = temp.toSet().toList();

            for (var k = 0; k < temp.length; k++) {
              if (temp[k].toString() == intakeMonth[i].toString()) {
                indexSelected.add(j);
              }
            }
          }
        }
      }
      indexSelected = indexSelected.toSet().toList();
      for (var i = 0; i < indexSelected.length; i++) {
        courseSearchModel2.add(courseSearchModel[indexSelected[i]]);
      }
      courseSearchModel = courseSearchModel2;
    }
    if (intakeYear.isNotEmpty && intakeMonth != []) {
      courseSearchModel2 = [];
      List<int> indexSelected = [];
      for (int i = 0; i < intakeYear.length; i++) {
        for (int j = 0; j < courseSearchModel.length; j++) {
          if (courseSearchModel[j].intakeYear != null) {
            List<String>? temp = courseSearchModel[j].intakeYear!.split("|");
            temp = temp.toSet().toList();
            for (var k = 0; k < temp.length; k++) {
              if (temp[k].toString() == intakeYear[i].toString()) {
                indexSelected.add(j);
              }
            }
          }
        }
      }
      indexSelected = indexSelected.toSet().toList();
      for (var i = 0; i < indexSelected.length; i++) {
        courseSearchModel2.add(courseSearchModel[indexSelected[i]]);
      }
      courseSearchModel = courseSearchModel2;
    }
    if (instituteLevel.isNotEmpty && instituteLevel != []) {
      courseSearchModel2 = [];
      for (int i = 0; i < instituteLevel.length; i++) {
        for (int j = 0; j < courseSearchModel.length; j++) {
          if (courseSearchModel[j].instituteType == instituteLevel[i]) {
            courseSearchModel2.add(courseSearchModel[j]);
          }
        }
      }
      courseSearchModel = courseSearchModel2;
    }
    if (scholarship.isNotEmpty && scholarship != []) {
      courseSearchModel2 = [];
      for (int i = 0; i < scholarship.length; i++) {
        for (int j = 0; j < courseSearchModel.length; j++) {
          if (courseSearchModel[j].scholarship == scholarship[i]) {
            courseSearchModel2.add(courseSearchModel[j]);
          }
        }
      }
      courseSearchModel = courseSearchModel2;
    }
    if (siecPriority.isNotEmpty && siecPriority != []) {
      courseSearchModel2 = [];
      for (int i = 0; i < siecPriority.length; i++) {
        for (int j = 0; j < courseSearchModel.length; j++) {
          if (courseSearchModel[j].siecPriority == siecPriority[i]) {
            courseSearchModel2.add(courseSearchModel[j]);
          }
        }
      }
      courseSearchModel = courseSearchModel2;
    }
    if (conditionaloffer.isNotEmpty && conditionaloffer != []) {
      courseSearchModel2 = [];
      for (int i = 0; i < conditionaloffer.length; i++) {
        for (int j = 0; j < courseSearchModel.length; j++) {
          if (courseSearchModel[j].conditionalOffer == conditionaloffer[i]) {
            courseSearchModel2.add(courseSearchModel[j]);
          }
        }
      }
      courseSearchModel = courseSearchModel2;
    }
    if (backlogAcceptable.isNotEmpty && backlogAcceptable != []) {
      courseSearchModel2 = [];
      for (int i = 0; i < backlogAcceptable.length; i++) {
        for (int j = 0; j < courseSearchModel.length; j++) {
          if (courseSearchModel[j].backlogsAcceptable == backlogAcceptable[i]) {
            courseSearchModel2.add(courseSearchModel[j]);
          }
        }
      }
      courseSearchModel = courseSearchModel2;
    }
    if (applicationfee.isNotEmpty && applicationfee != []) {
      courseSearchModel2 = [];
      for (int i = 0; i < applicationfee.length; i++) {
        for (int j = 0; j < courseSearchModel.length; j++) {
          if (courseSearchModel[j].isApplicationFee == applicationfee[i]) {
            courseSearchModel2.add(courseSearchModel[j]);
          }
        }
      }
      courseSearchModel = courseSearchModel2;
    }
    if (placementSandwichYear.isNotEmpty && placementSandwichYear != []) {
      courseSearchModel2 = [];
      for (int i = 0; i < placementSandwichYear.length; i++) {
        for (int j = 0; j < courseSearchModel.length; j++) {
          if (courseSearchModel[j].isApplicationFee ==
              placementSandwichYear[i]) {
            courseSearchModel2.add(courseSearchModel[j]);
          }
        }
      }
      courseSearchModel = courseSearchModel2;
    }
    if (siecRepresent.isNotEmpty && siecRepresent != []) {
      courseSearchModel2 = [];
      for (int i = 0; i < siecRepresent.length; i++) {
        for (int j = 0; j < courseSearchModel.length; j++) {
          if (courseSearchModel[j].siecRep == siecRepresent[i]) {
            courseSearchModel2.add(courseSearchModel[j]);
          }
        }
      }
      courseSearchModel = courseSearchModel2;
    }
    if (countryName.isNotEmpty && countryName != []) {
      courseSearchModel2 = [];
      for (int i = 0; i < countryName.length; i++) {
        for (int j = 0; j < courseSearchModel.length; j++) {
          if (courseSearchModel[j].countryName == countryName[i]) {
            courseSearchModel2.add(courseSearchModel[j]);
          }
        }
      }
      courseSearchModel = courseSearchModel2;
    }
    if (institutePublicPrivate.isNotEmpty && institutePublicPrivate != []) {
      courseSearchModel2 = [];

      for (int i = 0; i < institutePublicPrivate.length; i++) {
        for (int j = 0; j < courseSearchModel.length; j++) {
          if (courseSearchModel[j].instSubCategory ==
              institutePublicPrivate[i]) {
            courseSearchModel2.add(courseSearchModel[j]);
          }
        }
      }
      courseSearchModel = courseSearchModel2;
    }
    if (budget.isNotEmpty && budget != []) {
      if (between_15_30 == false &&
          less_7 == false &&
          more_30 == false &&
          between_7_15 == false) {
        courseSearchModel;
      } else {
        courseSearchModel2 = [];
        for (int i = 0; i < budget.length; i++) {
          for (int j = 0; j < courseSearchModel.length; j++) {
            // three condition

            if (getNUllChecker(courseSearchModel[j].annualTutionFeesInr) ==
                false) {
              if (between_15_30 == true) {
                if (double.parse(courseSearchModel[j]
                            .annualTutionFeesInr!
                            .toString()) >
                        1700000 ||
                    double.parse(courseSearchModel[j].annualTutionFeesInr!) <
                        3000000) {
                  courseSearchModel2.add(courseSearchModel[j]);
                }
              }
              if (less_7 == true) {
                if (double.parse(
                        courseSearchModel[j].annualTutionFeesInr!.toString()) <
                    700000) {
                  courseSearchModel2.add(courseSearchModel[j]);
                }
              }
              if (more_30 == true) {
                if (double.parse(
                        courseSearchModel[j].annualTutionFeesInr!.toString()) >
                    3000000) {
                  courseSearchModel2.add(courseSearchModel[j]);
                }
              }
              if (between_7_15 == true) {
                if (double.parse(courseSearchModel[j]
                            .annualTutionFeesInr!
                            .toString()) >
                        700000 ||
                    double.parse(courseSearchModel[j]
                            .annualTutionFeesInr!
                            .toString()) <
                        1500000) {
                  courseSearchModel2.add(courseSearchModel[j]);
                }
              }
            }
          }
        }
        courseSearchModel = courseSearchModel2;
      }
    }

    if (academicpercentage.isNotEmpty && academicpercentage != []) {
      if (between_50_60 == false &&
          between_60_70 == false &&
          between_50 == false &&
          more_70 == false) {
      } else {
        courseSearchModel2 = [];
        for (int i = 0; i < academicpercentage.length; i++) {
          for (int j = 0; j < courseSearchModel.length; j++) {
            if (getNUllChecker(courseSearchModel[j].academicRequire) == false) {
              // 50-60 percentage
              if (between_50_60 == true) {
                if (double.parse(courseSearchModel[j]
                            .academicRequire!
                            .split("-")[2]) >=
                        50 &&
                    double.parse(courseSearchModel[j]
                            .academicRequire!
                            .split("-")[2]) <
                        60) {
                  courseSearchModel2.add(courseSearchModel[j]);
                }
              }
              //60-70 percentage
              if (between_60_70 == true) {
                if (double.parse(courseSearchModel[j]
                            .academicRequire!
                            .split("-")[2]) >=
                        60 &&
                    double.parse(courseSearchModel[j]
                            .academicRequire!
                            .split("-")[2]) <
                        70) {
                  courseSearchModel2.add(courseSearchModel[j]);
                }
              }
              //0-50 percentage
              if (between_50 == true) {
                if (double.parse(
                        courseSearchModel[j].academicRequire!.split("-")[2]) <
                    50) {
                  courseSearchModel2.add(courseSearchModel[j]);
                }
              }
              // 70+ percentage
              if (more_70 == true) {
                if (double.parse(
                        courseSearchModel[j].academicRequire!.split("-")[2]) >=
                    70) {
                  courseSearchModel2.add(courseSearchModel[j]);
                }
              }
            }
          }
        }
        courseSearchModel = courseSearchModel2;
      }
    }

    if (loadingRanking == true) {
      courseSearchModel2 = rankingfilter(indexSelectRanking!,
          firstIndexValueRanking, secondIndexValueRanking, courseSearchModel);
      loadingRanking = false;
      courseSearchModel = courseSearchModel2;
    }

    await setModificationFilter(courseSearchModel2);
  }

  List<CourseSearchModel> rankingfilter(int indexSelect, int? firstIndexValue,
      int? secondIndexValue, List<CourseSearchModel> model) {
    List<CourseSearchModel> courseModel = [];
    switch (indexSelect) {
      case 0:
        for (int j = 0; j < model.length; j++) {
          if (model[j].timesRank != null && model[j].timesRank != "") {
            if (int.parse(model[j].timesRank.toString()) >= firstIndexValue! ||
                int.parse(model[j].timesRank.toString()) <= secondIndexValue!) {
              courseModel.add(model[j]);
            }
          }
        }
        break;
      case 1:
        for (int j = 0; j < model.length; j++) {
          if (model[j].timesRank != null && model[j].timesRank != "") {
            if (int.parse(model[j].arwuRank.toString()) >= firstIndexValue! ||
                int.parse(model[j].arwuRank.toString()) <= secondIndexValue!) {
              courseModel.add(model[j]);
            }
          }
        }
        break;
      case 2:
        for (int j = 0; j < model.length; j++) {
          if (model[j].timesRank != null && model[j].timesRank != "") {
            if (int.parse(model[j].usNewsRank.toString()) >= firstIndexValue! ||
                int.parse(model[j].usNewsRank.toString()) <=
                    secondIndexValue!) {
              courseModel.add(model[j]);
            }
          }
        }
        break;
      case 3:
        for (int j = 0; j < model.length; j++) {
          if (model[j].timesRank != null && model[j].timesRank != "") {
            if (int.parse(model[j].qsWorldRank.toString()) >=
                    firstIndexValue! ||
                int.parse(model[j].qsWorldRank.toString()) <=
                    secondIndexValue!) {
              courseModel.add(model[j]);
            }
          }
        }
        break;
      default:
    }
    return courseModel;
  }
}
