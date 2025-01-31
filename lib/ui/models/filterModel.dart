import 'package:studentpanel/ui/models/courseseach.dart';

class CourseModelFilter {
  List<CourseSearchModel> courseSearchList = [];
  List<CourseSearchModel> previousCourseSearchList = [];

  FilterModel filterModel = FilterModel();
}

class FilterModel {
  List<String>? universityname = [];
  List<String>? intakeMonth = [];
  List<String>? intakeYear = [];
  List<String>? instSubCategory = [];
  List<String>? instituteLevel = [];
  List<Map<String, bool>> academicPercentage = [
    {"70+ %": false},
    {"60%-70%": false},
    {"50%-60%": false},
    {"Between 50%": false}
  ];
  List<Map<String, bool>> budget = [
    {"30 Lakh or More": false},
    {"15-30 Lakh": false},
    {"7-15 Lakh": false},
    {"Below 7 Lakh": false}
  ];
  List<String>? offerTAT = [];
  List<String>? visaTAT = [];
  List<String>? countryName = [];
  List<String>? timesRanking = [];
  List<String>? arwuNewsRanking = [];
  List<String>? usNewsRanking = [];
  List<String>? qsWorldRanking = [];
  List<String>? selectRanking = [];
  List<String>? institutePrivatePublic = [];
  //  Yes/No
  List<String>? scholarship = [];
  List<String>? siecPriority = [];
  List<String>? siecRep = [];
  List<String>? conditionalOffer = [];
  List<String>? backlogAcceptable = [];
  List<String>? applicationfee = [];
  List<String>? placementSandwich = [];
  FilterSelected filterSelected = FilterSelected();
}

class FilterSelected {
  List<String>? universitynameSelected = [];
  List<String>? intakeMonthSelected = [];
  List<String>? intakeYearSelected = [];
  List<String>? instSubCategorySelected = [];
  List<String>? instituteLevelSelected = [];
  List<String> academicPercentageSelected = [];
  List<String> budgetSelected = [];
  List<String>? offerTATSelected = [];
  List<String>? visaTATSelected = [];
  List<String>? countryNameSelected = [];
  List<String>? timesRankingSelected = [];
  List<String>? arwuNewsRankingSelected = [];
  List<String>? usNewsRankingSelected = [];
  List<String>? qsWorldRankingSelected = [];
  List<String>? selectRankingSelected = [];
  List<String>? institutePrivatePublicSelected = [];
  //  Yes/No
  List<String>? scholarshipSelected = [];
  List<String>? siecPrioritySelected = [];
  List<String>? siecRepSelected = [];
  List<String>? conditionalOfferSelected = [];
  List<String>? backlogAcceptableSelected = [];
  List<String>? applicationfeeSelected = [];
  List<String>? placementSandwichSelected = [];
}
