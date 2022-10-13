import 'package:studentpanel/ui/models/courseseach.dart';

class CourseModelFilter {
  List<CourseSearchModel> courseSearchList = [];
  FilterModel filterModel = FilterModel();
}

class FilterModel {
  List<String>? universityname = [];
  List<String>? intakeMonth = [];
  List<String>? intakeYear = [];
  List<String>? instSubCategory = [];
  List<String>? instituteLevel = [];
  List<String>? academicPercentage = [];
  List<String>? budget = [];
  List<String>? offerTAT = [];
  List<String>? visaTAT = [];
  List<String>? countryName = [];
  List<String>? timesRanking = [];
  List<String>? arwuNewsRanking = [];
  List<String>? usNewsRanking = [];
  List<String>? qsWorldRanking = [];

  //
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
}
