import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:studentpanel/services/api_services.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/models/careerOutcomeModel.dart';
import 'package:studentpanel/ui/models/completecoursedetail.dart';
import 'package:studentpanel/ui/models/country_with_flag_model.dart';
import 'package:studentpanel/ui/models/courseseach.dart';
import 'package:studentpanel/ui/models/filterModel.dart';
import 'package:studentpanel/ui/models/getAllCourseBroadFieldModel.dart';
import 'package:studentpanel/utils/endpoint.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';

class CourseSearchController extends GetxController with StateMixin {
////new Updatebool s

  var courseOrJobbInustry = false;

  //Select Code
  int? selectCountryCode;
  int? selectStateCode;
  int? selectCityCode;
  int? selectCourseBoardFieldCode;
  int? selectCourseNarrowFieldCode;
  int? selectCourseLevelCode;
//Select Name
  String? selectCountryName;
  String? selectStateName;
  String? selectCityName;
  String? selectCourseBoardFieldName;
  String? selectCourseNarrowFieldName;
  String? selectCourseLevelName;

// Using for Local Variable for DropDown
  List<dynamic> countryList = [];
  List<dynamic> countryCode = [];
  List<dynamic> stateList = [];
  List<dynamic> stateCode = [];
  List<dynamic> cityList = [];
  List<dynamic> cityCode = [];
  List<dynamic> courseLevelList = [];
  List<dynamic> courseLevelCode = [];
  List<dynamic> courseBoardList = [];
  List<dynamic> courseBoardCode = [];
  List<dynamic> courseNarrowList = [];
  List<dynamic> courseNarrowCode = [];

// Model Create
  List<CompleteCourseDetail> completeCourseDetail = [];
  ApiServices apiservices = ApiServices();
  CourseModelFilter courseModelFilter = CourseModelFilter();
  List<CourseSearchModel> courseSearchModel = [];
  CourseSearchModel courseSearchModelCompare1 = CourseSearchModel();
  CourseSearchModel courseSearchModelCompare2 = CourseSearchModel();

  //Loading State
  RxBool loadingCourseSearchDetail = false.obs;
  RxBool loadingCountry = false.obs;
  RxBool loadingCourseLevel = false.obs;
  RxBool loadingState = false.obs;
  RxBool loadingCity = false.obs;
  RxBool loadingCourseBoardField = false.obs;
  RxBool loadingCourseNarrowField = false.obs;
  RxBool loadingNextAndPrevious = false.obs;
  RxBool compareApply = false.obs;
  RxBool loadingCourseShortList = false.obs;

  @override
  void onInit() {
    super.onInit();
    getCountry();
    getCourseLevel();
    getIndustries();
    getCourseBoardField();
  }

  List industriesList = [];
  List industriesCode = [];
  String? selectedIndustryName = '';
  String? selectedIndustryCode = '';
  bool loadingIndustries = false;

  getIndustries() async {
    try {
      var res = await apiservices.dropDown1(
          Endpoints.baseUrl!, Endpoints.jobInstitute!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        industriesList = map.values.toList();
        industriesCode = map.keys.toList();
        loadingIndustries = true;
        update();
      }
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }

  List<CareerOutcomeModel> careerOutcomeDropDown = [];
  List careerOutcomeDropDownName = [];
  List careerOutcomeDropDownId = [];
  String? selectedcareerOutcomeDropDownName = '';
  String? selectedcareerOutcomeDropDownID = null;
  bool careerOutcomeLoading = false;

  getCareerOutComes() async {
    try {
      var res = await apiservices.getCareerOutcomes(selectedIndustryCode);
      if (res != null) {
        var data = List<CareerOutcomeModel>.from(
            res.map((e) => CareerOutcomeModel.fromJson(e)));

        careerOutcomeDropDown = data;

        for (var i = 0; i < careerOutcomeDropDown.length; i++) {
          careerOutcomeDropDownName.add(careerOutcomeDropDown[i].careerOutcome);
          careerOutcomeDropDownId.add(careerOutcomeDropDown[i].id);
        }
        careerOutcomeLoading = true;
        update();
        // Map map = Map<String, dynamic>.from(res);
        // industriesList = map.values.toList();
        // industriesCode = map.keys.toList();
      }
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }

  List<CountryWithFlagModel> countryWithFlagDataList = [];
  CountryWithFlagModel selectedCountry = CountryWithFlagModel();

  getCountry() async {
    try {
      var res = await apiservices.getCountryWithFlags();
      // var res =
      //     await apiservices.dropDown1(Endpoints.baseUrl!, Endpoints.country!);

      var data = List<CountryWithFlagModel>.from(
          res.map((e) => CountryWithFlagModel.fromJson(e)));

      if (res != null) {
        countryWithFlagDataList = data;

        // Map map = Map<String, dynamic>.from(res);
        // countryList.add("Select Country");
        // countryCode.add(0);
        // countryList.addAll(map.keys.toList());
        // countryCode.addAll(map.values.toList());
        // loadingCountry.value = true;
        update();
      }
    } catch (e) {
      // await ApiServices().errorHandle(
      //   Get.find<BaseController>().model1.id.toString(),
      //   e.toString(),
      //   "1111",
      //   StackTrace.current.toString(),
      // );
    }
  }

  getCourseLevel() async {
    try {
      var res = await apiservices.dropDown1(
          Endpoints.baseUrl!, Endpoints.courselevel!);
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        courseLevelList.add("Select Course Level");
        courseLevelCode.add(0);
        courseLevelList.addAll(map.keys.toList());
        courseLevelCode.addAll(map.values.toList());
        loadingCourseLevel.value = true;
        update();
      }
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }

  RxBool loadingcountryFromContientName = false.obs;
  var countryFromContientName = [];
  String? selectedCountryNameFromContinent = 'Select Country';
  String? selectedCountryCodeFromContinent = '0';
  var countryFromContientId = [];
  bool showCountryFromContinentDropDown = false;

  getCountryFromContinent(continentID) async {
    countryFromContientName = [];
    countryFromContientId = [];

    var res = await apiservices.getCountriesOfContinent(continentID);
    Map map = Map<String, dynamic>.from(res);
    countryFromContientName.add("Select Country");
    countryFromContientId.add(0);
    countryFromContientName.addAll(map.values.toList());
    countryFromContientId.addAll(map.keys.toList());

    print(countryFromContientName);
    print(countryFromContientId);
    loadingcountryFromContientName.value = true;
    showCountryFromContinentDropDown = true;
    update();
  }

  List<Widget> courseFieldWidgetList = [];
  List<GetAllCourseBroadFieldModel> AllCourseSearchBroadField = [];
  getCourseBoardField() async {
    try {
      var res = await apiservices.getAllCourseBroadField();

      var data = List<GetAllCourseBroadFieldModel>.from(
          res.map((e) => GetAllCourseBroadFieldModel.fromJson(e)));

      AllCourseSearchBroadField = data;
      print(data);

      // for (var i = 0; i < data.length; i++) {
      //   courseFieldWidgetList.add(InkWell(
      //     onTap: () {
      //       selectCourseBoardFieldCode = data[i].id;
      //       getCoursenarrowField(selectCourseBoardFieldCode!);
      //     },
      //     child: Container(
      //       padding: EdgeInsets.symmetric(horizontal: 5),
      //       margin: EdgeInsets.symmetric(horizontal: 10),
      //       width: 140,
      //       decoration: BoxDecoration(
      //           color: selectCourseBoardFieldCode == data[i].id
      //               ? ThemeConstants.ultraLightgreyColor2
      //               : ThemeConstants.GreenColor,
      //           borderRadius: BorderRadius.circular(15),
      //           border: Border.all(width: 1, color: ThemeConstants.bluecolor)),
      //       child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             Container(
      //               width: 50,
      //               height: 50,
      //               child: CachedNetworkImage(
      //                 imageUrl: data[i].imageLink!,
      //               ),
      //             ),
      //             SizedBox(
      //               height: 5,
      //             ),
      //             Text(
      //               '${data[i].broadFieldName}',
      //               textAlign: TextAlign.center,
      //               style: TextStyle(
      //                 fontSize: 12,
      //                 fontWeight: FontWeight.w500,
      //               ),
      //             )
      //           ]),
      //     ),
      //   ));
      // }

      update();
      change(null, status: RxStatus.success());

      // if (res != null) {
      //   Map map = Map<String, dynamic>.from(res);
      //   courseBoardList.add("Select Course Level");
      //   courseBoardCode.add(0);
      //   courseBoardList.addAll(map.keys.toList());
      //   courseBoardCode.addAll(map.values.toList());
      //   loadingCourseBoardField = true.obs;
      //   update();
      // }
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }

  getState(int country) async {
    cityCode = [];
    cityList = [];
    stateCode = [];
    stateList = [];
    selectCityCode = null;
    selectCityName = null;
    loadingCity.value = false;
    loadingState.value = false;
    selectStateName = null;
    selectStateCode = null;
    try {
      var res = await apiservices.dropDown1(
          Endpoints.baseUrl!, Endpoints.state! + country.toString());
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        stateList.add("Select State");
        stateCode.add(0);
        stateList.addAll(map.keys.toList());
        stateCode.addAll(map.values.toList());
        loadingState = true.obs;
      }
      update();
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }

  getCity(int state) async {
    cityList = [];
    cityCode = [];
    loadingCity.value = false;
    selectCityName = null;
    selectCityCode = null;
    try {
      List tempList;
      var res = await apiservices.dropDown1(
          Endpoints.baseUrl!, Endpoints.city! + state.toString());
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        cityList.add("Select City");
        cityCode.add(0);
        cityList.addAll(map.keys.toList());
        cityCode.addAll(map.values.toList());
        loadingCity = true.obs;
      }
      update();
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }

///// CourseSelection or  Job industry
  ///
  /// 0 course 1 job

  int courseSearchType = 0;

  //// course level
  int courseLevelSelector = 1;

  getCoursenarrowField(int boardField) async {
    courseNarrowList = [];
    courseNarrowCode = [];
    loadingCourseNarrowField.value = false;
    selectCourseNarrowFieldName = null;
    selectCourseNarrowFieldCode = null;
    try {
      List tempList;
      var res = await apiservices.dropDown1(Endpoints.baseUrl!,
          Endpoints.courseNarrowField! + boardField.toString());
      if (res != null) {
        Map map = Map<String, dynamic>.from(res);
        courseNarrowList.add("Select course Narrow");
        courseNarrowCode.add(0);
        courseNarrowList.addAll(map.keys.toList());
        courseNarrowCode.addAll(map.values.toList());
        loadingCourseNarrowField = true.obs;
        update();
      }
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }

  // setCountryDropdown(List data) {
  //   countryDropdown.value = data;
  //   update();
  // }

  // setCourseDropdown(String data) {
  //   courseLevelDropdown.value = data;
  //   update();
  // }

  courseSearch(String country, String courseLevel, String enqId) async {
    courseModelFilter = CourseModelFilter();
    var now = DateTime.now();
    var formatterYear = DateFormat('yyyy');
    var formatterMonth = DateFormat('MM');
    var temp = country.split('[');
    var temp2 = temp[1].split(']')[0];
    var temp3 = courseLevel.split('[');
    var temp4 = temp3[1].split(']')[0];
    String? endpoint = Endpoints.courseSearchPart1! +
        temp2 +
        Endpoints.courseSearchPart2! +
        temp4;
    var res = await apiservices.getCourseSearch(Endpoints.baseUrl!, endpoint);
    if (res != null) {
      try {
        courseModelFilter = res;
        courseSearchModel = courseModelFilter.courseSearchList;
        for (var i = 0; i < courseSearchModel.length; i++) {
          if (courseSearchModel[i].listIntake!.isNotEmpty) {
            for (var j = 0; j < courseSearchModel[i].listIntake!.length; j++) {
              if (int.parse(
                      courseSearchModel[i].listIntake![j].split("-")[1]) >=
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
      } catch (e) {
        await ApiServices().errorHandle(
          Get.find<BaseController>().model1.id.toString(),
          e.toString(),
          "1111",
          StackTrace.current.toString(),
        );
      }

      return courseModelFilter;
    }
  }

  completeCourseDetailMethod(
      String universityId, String courseId, String instituteCourseId) async {
    try {
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
    } catch (e) {
      await ApiServices().errorHandle(
        Get.find<BaseController>().model1.id.toString(),
        e.toString(),
        "1111",
        StackTrace.current.toString(),
      );
    }
  }

  setCompare(RxBool data) {
    compareApply = data;
    update();
  }

  courseShortList(String? id, String enqId) {
    apiservices.setShortListCourse(id, enqId);
  }

  courseFinalShortlist(String? id, String enqId, bool action) {
    apiservices.setFinalShortListCourse(
      id,
      enqId,
    );
  }

  List universityListName = [];
  List universityListID = [];
  String? selectedUniversityName = '';
  String? selectedUniversityID = '';
  bool universityLoading = false;

  getUniversityDropDownData() async {
    universityListName = [];
    selectedUniversityName = null;
    selectedUniversityID = null;
    universityLoading = false;

    var countrySelected = '';

    if (showCountryFromContinentDropDown == true) {
      countrySelected = selectedCountryCodeFromContinent!;
    } else {
      countrySelected = selectedCountry.id.toString();
    }

    var countrySelectedInt = int.parse(countrySelected);

    var res = await apiservices.getUniversitiesByCountryStateCity(
        countryId: countrySelectedInt,
        stateID: selectStateCode,
        cityID: selectCityCode);

    if (res.length != 0) {
      Map map = Map<String, dynamic>.from(res);
      universityListName.add("Select University");
      universityListID.add(0.toString());

      universityListName.addAll(map.values.toList());
      universityListID.addAll(map.keys.toList());
      selectedUniversityName = universityListName[0];
    } else {
      universityListName.add('No Unibversity Available');
    }

    universityLoading = true;

    update();
  }
}
