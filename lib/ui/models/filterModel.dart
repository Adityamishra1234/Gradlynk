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
  List<String>? scholarship = [];
  List<String>? offerTAT = [];
  List<String>? visaTAT = [];
  List<String>? countryName = [];
}
