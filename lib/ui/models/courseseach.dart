class CourseSearchModel {
  List? listIntake = [];
  String? durationYear;
  int? id;
  String? courseName;
  String? intakeFromYear;
  String? academicRequire;
  int? allFees;
  int? allFeesInr;
  String? annualTutionFees;
  int? annualTutionFeesInr;
  String? arwuRank;
  String? backlogsAcceptable;
  String? broadFieldName;
  int? courseBroadFieldId;
  int? courseNarrowFieldId;
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
  int? courseOneCreditFeeInr;
  String? cpt;
  String? currencyCode;
  String? durationPlacementYear;
  String? englishProficiency;
  String? feesPlacementYear;
  String? gapDuration;
  int? gapsAccepted;
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
  int? totalFees;
  int? totalFeesInr;
  int? universityId;
  String? universityName;
  String? usNewsRank;
  String? visaTat;
  String? whyChooseUniv;
  String? workExpRequired;
  String? yearOfEducation;

  CourseSearchModel(
      {this.id,
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
    id = json['id'];

    courseName = json['course_name'];
    intakeFromYear = json['IntakeFrom_Year'];
    academicRequire = json['academic_require'];
    allFees = json['all_fees'];
    allFeesInr = json['all_fees_inr'];
    annualTutionFees = json['annual_tution_fees'].toString();
    annualTutionFeesInr = json['annual_tution_fees_inr'];
    arwuRank = json['arwu_rank'];
    backlogsAcceptable = json['backlogs_acceptable'];
    broadFieldName = json['broad_field_name'];
    courseBroadFieldId = json['course_broad_field_id'];
    courseNarrowFieldId = json['course_narrow_field_id'];
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
    courseOneCreditFeeInr = json['course_one_credit_fee_inr'];
    cpt = json['cpt'];
    currencyCode = json['currency_code'];
    durationPlacementYear = json['duration_placement_year'];
    englishProficiency = json['english_proficiency'];
    feesPlacementYear = json['fees_placement_year'];
    gapDuration = json['gap_duration'];
    gapsAccepted = json['gaps_accepted'];
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
    totalFees = json['total_fees'];
    totalFeesInr = json['total_fees_inr'];
    universityId = json['university_id'];
    universityName = json['university_name'];
    usNewsRank = json['us_news_rank'];
    visaTat = json['visa_tat'];
    whyChooseUniv = json['why_choose_univ'];
    workExpRequired = json['work_exp_required'];
    yearOfEducation = json['year_of_education'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['course_name'] = this.courseName;
    data['IntakeFrom_Year'] = this.intakeFromYear;
    data['academic_require'] = this.academicRequire;
    data['all_fees'] = this.allFees;
    data['all_fees_inr'] = this.allFeesInr;
    data['annual_tution_fees'] = this.annualTutionFees;
    data['annual_tution_fees_inr'] = this.annualTutionFeesInr;
    data['arwu_rank'] = this.arwuRank;
    data['backlogs_acceptable'] = this.backlogsAcceptable;
    data['broad_field_name'] = this.broadFieldName;
    data['course_broad_field_id'] = this.courseBroadFieldId;
    data['course_narrow_field_id'] = this.courseNarrowFieldId;
    data['narrow_field_name'] = this.narrowFieldName;
    data['campus_name'] = this.campusName;
    data['city_name'] = this.cityName;
    data['conditional_offer'] = this.conditionalOffer;
    data['country_name'] = this.countryName;
    data['course_credits'] = this.courseCredits;
    data['course_duration'] = this.courseDuration;
    data['course_level'] = this.courseLevel;
    data['course_link'] = this.courseLink;
    data['course_one_credit_fee'] = this.courseOneCreditFee;
    data['course_one_credit_fee_inr'] = this.courseOneCreditFeeInr;
    data['cpt'] = this.cpt;
    data['currency_code'] = this.currencyCode;
    data['duration_placement_year'] = this.durationPlacementYear;
    data['english_proficiency'] = this.englishProficiency;
    data['fees_placement_year'] = this.feesPlacementYear;
    data['gap_duration'] = this.gapDuration;
    data['gaps_accepted'] = this.gapsAccepted;
    data['inst_sub_category'] = this.instSubCategory;
    data['institute_type'] = this.instituteType;
    data['is_application_fee'] = this.isApplicationFee;
    data['min_work_exp'] = this.minWorkExp;
    data['naces'] = this.naces;
    data['offer_tat'] = this.offerTat;
    data['other_tests'] = this.otherTests;
    data['percentage'] = this.percentage;
    data['placement_year'] = this.placementYear;
    data['prepaid_package'] = this.prepaidPackage;
    data['qs_world_rank'] = this.qsWorldRank;
    data['scholarship'] = this.scholarship;
    data['siec_priority'] = this.siecPriority;
    data['siec_rep'] = this.siecRep;
    data['state_name'] = this.stateName;
    data['stem'] = this.stem;
    data['times_rank'] = this.timesRank;
    data['total_fees'] = this.totalFees;
    data['total_fees_inr'] = this.totalFeesInr;
    data['university_id'] = this.universityId;
    data['university_name'] = this.universityName;
    data['us_news_rank'] = this.usNewsRank;
    data['visa_tat'] = this.visaTat;
    data['why_choose_univ'] = this.whyChooseUniv;
    data['work_exp_required'] = this.workExpRequired;
    data['year_of_education'] = this.yearOfEducation;
    return data;
  }
}
