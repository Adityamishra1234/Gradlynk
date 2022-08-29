class CourseSearchPages {
  int? currentPage;
  List<CourseSearchModel>? courseSearchModel;
  int? lastPage;
  String? endpoint;

  CourseSearchPages({this.currentPage, this.courseSearchModel, this.lastPage});

  CourseSearchPages.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      courseSearchModel = <CourseSearchModel>[];
      json['data'].forEach((v) {
        courseSearchModel!.add(CourseSearchModel.fromJson(v));
      });
    }
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['current_page'] = currentPage;
    if (courseSearchModel != null) {
      data['data'] = courseSearchModel!.map((v) => v.toJson()).toList();
    }
    data['last_page'] = lastPage;
    return data;
  }
}

class CourseSearchModel {
  List<String>? listIntake = [];
  String? nearByIntake;
  String? durationYear;
  String? id;
  String? courseId;
  String? courseName;
  String? intakeFromYear;
  String? academicRequire;
  String? allFees;
  String? allFeesInr;
  String? annualTutionFees;
  String? annualTutionFeesInr;
  String? arwuRank;
  String? backlogsAcceptable;
  String? broadFieldName;
  String? courseBroadFieldId;
  String? courseNarrowFieldId;
  String? narrowFieldName;
  String? campusName;
  String? cityName;
  String? conditionalOffer;
  String? countryName;
  String? courseCredits;
  String? courseDuration;
  String? courseLevel;
  String? courseLink;
  String? courseOneCreditFee;
  String? courseOneCreditFeeInr;
  String? cpt;
  String? currencyCode;
  String? durationPlacementYear;
  String? englishProficiency;
  String? feesPlacementYear;
  String? gapDuration;
  String? gapsAccepted;
  String? instSubCategory;
  String? instituteType;
  String? isApplicationFee;
  String? minWorkExp;
  String? naces;
  String? offerTat;
  String? otherTests;
  String? percentage;
  String? placementYear;
  String? prepaidPackage;
  String? qsWorldRank;
  String? scholarship;
  String? siecPriority;
  String? siecRep;
  String? stateName;
  String? stem;
  String? timesRank;
  String? totalFees;
  String? totalFeesInr;
  String? universityId;
  String? universityName;
  String? usNewsRank;
  String? visaTat;
  String? whyChooseUniv;
  String? workExpRequired;
  String? yearOfEducation;
  List<dynamic>? IntakeMonth = [];
  List<dynamic>? IntakeYear = [];
  List<dynamic>? admission = [];

  CourseSearchModel(
      {this.id,
      this.courseId,
      this.courseName,
      this.intakeFromYear,
      this.academicRequire,
      this.allFees,
      this.allFeesInr,
      this.annualTutionFees,
      this.annualTutionFeesInr,
      this.arwuRank,
      this.backlogsAcceptable,
      this.broadFieldName,
      this.courseBroadFieldId,
      this.courseNarrowFieldId,
      this.narrowFieldName,
      this.campusName,
      this.cityName,
      this.conditionalOffer,
      this.countryName,
      this.courseCredits,
      this.courseDuration,
      this.courseLevel,
      this.courseLink,
      this.courseOneCreditFee,
      this.courseOneCreditFeeInr,
      this.cpt,
      this.currencyCode,
      this.durationPlacementYear,
      this.englishProficiency,
      this.feesPlacementYear,
      this.gapDuration,
      this.gapsAccepted,
      this.instSubCategory,
      this.instituteType,
      this.isApplicationFee,
      this.minWorkExp,
      this.naces,
      this.offerTat,
      this.otherTests,
      this.percentage,
      this.placementYear,
      this.prepaidPackage,
      this.qsWorldRank,
      this.scholarship,
      this.siecPriority,
      this.siecRep,
      this.stateName,
      this.stem,
      this.timesRank,
      this.totalFees,
      this.totalFeesInr,
      this.universityId,
      this.universityName,
      this.usNewsRank,
      this.visaTat,
      this.whyChooseUniv,
      this.workExpRequired,
      this.yearOfEducation});

  CourseSearchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    courseId = json['course_id'].toString();
    courseName = json['course_name'];
    intakeFromYear = json['IntakeFrom_Year'];
    academicRequire = json['academic_require'];
    allFees = json['all_fees'].toString();
    allFeesInr = json['all_fees_inr'].toString();
    annualTutionFees = json['annual_tution_fees'].toString();
    annualTutionFeesInr = json['annual_tution_fees_inr'].toString();
    arwuRank = json['arwu_rank'];
    backlogsAcceptable = json['backlogs_acceptable'];
    broadFieldName = json['broad_field_name'];
    courseBroadFieldId = json['course_broad_field_id'].toString();
    courseNarrowFieldId = json['course_narrow_field_id'].toString();
    narrowFieldName = json['narrow_field_name'];
    campusName = json['campus_name'];
    cityName = json['city_name'];
    conditionalOffer = json['conditional_offer'];
    countryName = json['country_name'];
    courseCredits = json['course_credits'];
    courseDuration = json['course_duration'];
    courseLevel = json['course_level'];
    courseLink = json['course_link'];
    courseOneCreditFee = json['course_one_credit_fee'];
    courseOneCreditFeeInr = json['course_one_credit_fee_inr'].toString();
    cpt = json['cpt'];
    currencyCode = json['currency_code'];
    durationPlacementYear = json['duration_placement_year'];
    englishProficiency = json['english_proficiency'];
    feesPlacementYear = json['fees_placement_year'];
    gapDuration = json['gap_duration'];
    gapsAccepted = json['gaps_accepted'].toString();
    instSubCategory = json['inst_sub_category'];
    instituteType = json['institute_type'];
    isApplicationFee = json['is_application_fee'];
    minWorkExp = json['min_work_exp'];
    naces = json['naces'];
    offerTat = json['offer_tat'];
    otherTests = json['other_tests'];
    percentage = json['percentage'];
    placementYear = json['placement_year'];
    prepaidPackage = json['prepaid_package'];
    qsWorldRank = json['qs_world_rank'];
    scholarship = json['scholarship'];
    siecPriority = json['siec_priority'];
    siecRep = json['siec_rep'];
    stateName = json['state_name'];
    stem = json['stem'];
    timesRank = json['times_rank'];
    totalFees = json['total_fees'].toString();
    totalFeesInr = json['total_fees_inr'].toString();
    universityId = json['university_id'].toString();
    universityName = json['university_name'];
    usNewsRank = json['us_news_rank'];
    visaTat = json['visa_tat'].toString();
    whyChooseUniv = json['why_choose_univ'];
    workExpRequired = json['work_exp_required'];
    yearOfEducation = json['year_of_education'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['course_id'] = courseId;
    data['course_name'] = courseName;
    data['IntakeFrom_Year'] = intakeFromYear;
    data['academic_require'] = academicRequire;
    data['all_fees'] = allFees;
    data['all_fees_inr'] = allFeesInr;
    data['annual_tution_fees'] = annualTutionFees;
    data['annual_tution_fees_inr'] = annualTutionFeesInr;
    data['arwu_rank'] = arwuRank;
    data['backlogs_acceptable'] = backlogsAcceptable;
    data['broad_field_name'] = broadFieldName;
    data['course_broad_field_id'] = courseBroadFieldId;
    data['course_narrow_field_id'] = courseNarrowFieldId;
    data['narrow_field_name'] = narrowFieldName;
    data['campus_name'] = campusName;
    data['city_name'] = cityName;
    data['conditional_offer'] = conditionalOffer;
    data['country_name'] = countryName;
    data['course_credits'] = courseCredits;
    data['course_duration'] = courseDuration;
    data['course_level'] = courseLevel;
    data['course_link'] = courseLink;
    data['course_one_credit_fee'] = courseOneCreditFee;
    data['course_one_credit_fee_inr'] = courseOneCreditFeeInr;
    data['cpt'] = cpt;
    data['currency_code'] = currencyCode;
    data['duration_placement_year'] = durationPlacementYear;
    data['english_proficiency'] = englishProficiency;
    data['fees_placement_year'] = feesPlacementYear;
    data['gap_duration'] = gapDuration;
    data['gaps_accepted'] = gapsAccepted;
    data['inst_sub_category'] = instSubCategory;
    data['institute_type'] = instituteType;
    data['is_application_fee'] = isApplicationFee;
    data['min_work_exp'] = minWorkExp;
    data['naces'] = naces;
    data['offer_tat'] = offerTat;
    data['other_tests'] = otherTests;
    data['percentage'] = percentage;
    data['placement_year'] = placementYear;
    data['prepaid_package'] = prepaidPackage;
    data['qs_world_rank'] = qsWorldRank;
    data['scholarship'] = scholarship;
    data['siec_priority'] = siecPriority;
    data['siec_rep'] = siecRep;
    data['state_name'] = stateName;
    data['stem'] = stem;
    data['times_rank'] = timesRank;
    data['total_fees'] = totalFees;
    data['total_fees_inr'] = totalFeesInr;
    data['university_id'] = universityId;
    data['university_name'] = universityName;
    data['us_news_rank'] = usNewsRank;
    data['visa_tat'] = visaTat;
    data['why_choose_univ'] = whyChooseUniv;
    data['work_exp_required'] = workExpRequired;
    data['year_of_education'] = yearOfEducation;
    return data;
  }
}
