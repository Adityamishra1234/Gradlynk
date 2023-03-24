class CourseSearchModel {
  bool? isSelected = false;
  List<String>? listIntake = [];
  String? finalList;
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
  String? shortList;
  String? intakeMonth;
  String? intakeYear;

  CourseSearchModel(
      {this.id,
      this.nearByIntake,
      this.intakeMonth,
      this.intakeYear,
      this.finalList,
      this.shortList,
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
    nearByIntake = json['near_by_intake'].toString();
    intakeMonth = json['intake_month'].toString();
    intakeYear = json['intake_year'].toString();
    finalList = json['is_in_final'].toString();
    courseId = json['course_id'].toString();
    shortList = json['shortlist_added'].toString();
    courseName = json['course_name'];
    intakeFromYear = json['IntakeFrom_Year'].toString();
    academicRequire = json['academic_require'].toString();
    allFees = json['all_fees'].toString();
    allFeesInr = json['all_fees_inr'].toString();
    annualTutionFees = json['annual_tution_fees'].toString();
    annualTutionFeesInr = json['annual_tution_fees_inr'].toString();
    arwuRank = json['arwu_rank'].toString();
    backlogsAcceptable = json['backlogs_acceptable'].toString();
    broadFieldName = json['broad_field_name'].toString();
    courseBroadFieldId = json['course_broad_field_id'].toString();
    courseNarrowFieldId = json['course_narrow_field_id'].toString();
    narrowFieldName = json['narrow_field_name'].toString();
    campusName = json['campus_name'].toString();
    cityName = json['city_name'].toString();
    conditionalOffer = json['conditional_offer'].toString();
    countryName = json['country_name'].toString();
    courseCredits = json['course_credits'].toString();
    courseDuration = json['course_duration'].toString();
    courseLevel = json['course_level'].toString();
    courseLink = json['course_link'].toString();
    courseOneCreditFee = json['course_one_credit_fee'].toString();
    courseOneCreditFeeInr = json['course_one_credit_fee_inr'].toString();
    cpt = json['cpt'].toString();
    currencyCode = json['currency_code'].toString();
    durationPlacementYear = json['duration_placement_year'].toString();
    englishProficiency = json['english_proficiency'].toString();
    feesPlacementYear = json['fees_placement_year'].toString();
    gapDuration = json['gap_duration'].toString();
    gapsAccepted = json['gaps_accepted'].toString();
    instSubCategory = json['inst_sub_category'].toString();
    instituteType = json['institute_type'].toString();
    isApplicationFee = json['is_application_fee'].toString();
    minWorkExp = json['min_work_exp'].toString();
    naces = json['naces'].toString();
    offerTat = json['offer_tat'].toString();
    otherTests = json['other_tests'].toString();
    percentage = json['percentage'].toString();
    placementYear = json['placement_year'].toString();
    prepaidPackage = json['prepaid_package'].toString();
    qsWorldRank = json['qs_world_rank'].toString();
    scholarship = json['scholarship'].toString();
    siecPriority = json['siec_priority'].toString();
    siecRep = json['siec_rep'].toString();
    stateName = json['state_name'].toString();
    stem = json['stem'].toString();
    timesRank = json['times_rank'].toString();
    totalFees = json['total_fees'].toString();
    totalFeesInr = json['total_fees_inr'].toString();
    universityId = json['university_id'].toString();
    universityName = json['university_name'].toString();
    usNewsRank = json['us_news_rank'];
    visaTat = json['visa_tat'].toString();
    whyChooseUniv = json['why_choose_univ'].toString();
    workExpRequired = json['work_exp_required'].toString();
    yearOfEducation = json['year_of_education'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['shortlist_added'] = shortList;
    data['is_in_final'] = finalList;
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
