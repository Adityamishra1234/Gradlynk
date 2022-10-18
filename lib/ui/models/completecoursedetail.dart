class CompleteCourseDetail {
  String? courseName;
  String? universityName;
  String? courseDuration;
  String? totalTutionFees;
  String? totalTutionFeesInr;
  String? courseLevel;
  String? intakeFromYear;
  String? arwuRank;
  String? timesRank;
  String? usNewsRank;
  String? qsWorldRank;
  String? instituteType;
  String? campusName;
  String? campusAddress;
  String? aboutUniv;
  String? sIECRepresented;
  String? broadFieldName;
  String? narrowFieldName;
  String? description;
  String? specializationDescription;
  String? jobIndustry;
  String? careerOutcome;
  String? averageSalary;
  String? averageSalaryInr;
  String? applicationTat;
  String? scholarship;
  String? scholarshipCriteria;
  String? naces;
  String? cpt;
  String? stem;
  String? yearOfEducation;
  String? earlyApplicationDeadline;
  String? annualTutionFees;
  String? annualTutionFeesInr;
  String? academicRequirementCountry;
  String? academicRequirementCourseLevel;
  String? minPercentage;
  String? minGrade;
  String? mandatorySubjectName;
  String? minPercentageForMandatorySubject;
  String? minGradeForMandatorySubject;
  String? testType;
  String? listening;
  String? reading;
  String? writing;
  String? speaking;
  String? overall;
  String? specialEntryRequirement;
  String? flexible;
  String? backlogsAcceptable;
  String? noOfBacklogs;
  String? isApplicationFee;
  String? applicationFee;
  String? feeWaiver;
  String? applicationFeeAfterWaiver;
  String? offerTat;
  String? visaFees;
  String? visaFeesInr;
  String? visaTat;
  String? countryCurrencyCode;
  String? countryCapital;
  String? countryInrValue;
  String? countryLanguage;
  String? aboutCountry;
  String? popularStates;
  String? eduSystem;
  String? financeAndExpenses;
  String? findingWorkAsStudents;
  String? postStudyWorkOption;
  String? partTimeWorkOption;

  CompleteCourseDetail(
      {this.courseName,
      this.universityName,
      this.courseDuration,
      this.totalTutionFees,
      this.totalTutionFeesInr,
      this.courseLevel,
      this.intakeFromYear,
      this.arwuRank,
      this.timesRank,
      this.usNewsRank,
      this.qsWorldRank,
      this.instituteType,
      this.campusName,
      this.campusAddress,
      this.aboutUniv,
      this.sIECRepresented,
      this.broadFieldName,
      this.narrowFieldName,
      this.description,
      this.specializationDescription,
      this.jobIndustry,
      this.careerOutcome,
      this.averageSalary,
      this.averageSalaryInr,
      this.applicationTat,
      this.scholarship,
      this.scholarshipCriteria,
      this.naces,
      this.cpt,
      this.stem,
      this.yearOfEducation,
      this.earlyApplicationDeadline,
      this.annualTutionFees,
      this.annualTutionFeesInr,
      this.academicRequirementCountry,
      this.academicRequirementCourseLevel,
      this.minPercentage,
      this.minGrade,
      this.mandatorySubjectName,
      this.minPercentageForMandatorySubject,
      this.minGradeForMandatorySubject,
      this.testType,
      this.listening,
      this.reading,
      this.writing,
      this.speaking,
      this.overall,
      this.specialEntryRequirement,
      this.flexible,
      this.backlogsAcceptable,
      this.noOfBacklogs,
      this.isApplicationFee,
      this.applicationFee,
      this.feeWaiver,
      this.applicationFeeAfterWaiver,
      this.offerTat,
      this.visaFees,
      this.visaFeesInr,
      this.visaTat,
      this.countryCurrencyCode,
      this.countryCapital,
      this.countryInrValue,
      this.countryLanguage,
      this.aboutCountry,
      this.popularStates,
      this.eduSystem,
      this.financeAndExpenses,
      this.findingWorkAsStudents,
      this.postStudyWorkOption,
      this.partTimeWorkOption});

  CompleteCourseDetail.fromJson(Map<String, dynamic> json) {
    courseName = json['course_name'];
    universityName = json['university_name'];
    courseDuration = json['course_duration'];
    totalTutionFees = json['total_tution_fees'].toString();
    totalTutionFeesInr = json['total_tution_fees_inr'].toString();
    courseLevel = json['course_level'];
    intakeFromYear = json['IntakeFrom_Year'];
    arwuRank = json['arwu_rank'] == null ? "" : json['arwu_rank'].toString();
    timesRank = json['times_rank'];
    usNewsRank = json['us_news_rank'].toString();
    qsWorldRank = json['qs_world_rank'];
    instituteType = json['institute_type'];
    campusName = json['campus_name'];
    campusAddress = json['campus_address'];
    aboutUniv = json['about_univ'];
    sIECRepresented = json['SIEC_Represented'];
    broadFieldName = json['broad_field_name'];
    narrowFieldName = json['narrow_field_name'];
    description = json['description'];
    specializationDescription = json['specialization_description'];
    jobIndustry = json['job_industry'];
    careerOutcome = json['career_outcome'];
    averageSalary = json['average_salary'].toString();
    averageSalaryInr = json['average_salary_inr'].toString();
    applicationTat = json['application_tat'].toString();
    scholarship = json['scholarship'];
    scholarshipCriteria = json['scholarship_criteria'];
    naces = json['naces'];
    cpt = json['cpt'].toString();
    stem = json['stem'].toString();
    yearOfEducation = json['year_of_education'];
    earlyApplicationDeadline = json['early_application_deadline'];
    annualTutionFees = json['annual_tution_fees'].toString();
    annualTutionFeesInr = json['annual_tution_fees_inr'].toString();
    academicRequirementCountry = json['academic_requirement_country'];
    academicRequirementCourseLevel = json['academic_requirement_course_level'];
    minPercentage = json['min_percentage'];
    minGrade = json['min_grade'];
    mandatorySubjectName = json['mandatory_subject_name'];
    minPercentageForMandatorySubject =
        json['min_percentage_for_mandatory_subject'];
    minGradeForMandatorySubject = json['min_grade_for_mandatory_subject'];
    testType = json['test_type'];
    listening = json['listening'];
    reading = json['reading'];
    writing = json['writing'];
    speaking = json['speaking'];
    overall = json['overall'];
    specialEntryRequirement = json['special_entry_requirement'];
    flexible = json['flexible'];
    backlogsAcceptable = json['backlogs_acceptable'];
    noOfBacklogs = json['no_of_backlogs'].toString();
    isApplicationFee = json['is_application_fee'];
    applicationFee = json['application_fee'].toString();
    feeWaiver = json['fee_waiver'];
    applicationFeeAfterWaiver = json['application_fee_after_waiver'];
    offerTat = json['offer_tat'];
    visaFees = json['visa_fees'];
    visaFeesInr = json['visa_fees_inr'];
    visaTat = json['visa_tat'].toString();
    countryCurrencyCode = json['country_currency_code'];
    countryCapital = json['country_capital'];
    countryInrValue = json['country_inr_value'];
    countryLanguage = json['country_language'];
    aboutCountry = json['about_country'];
    popularStates = json['popular_states'];
    eduSystem = json['edu_system'];
    financeAndExpenses = json['finance_and_expenses'];
    findingWorkAsStudents = json['finding_work_as_students'];
    postStudyWorkOption = json['post_study_work_option'];
    partTimeWorkOption = json['part_time_work_option'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['course_name'] = courseName;
    data['university_name'] = universityName;
    data['course_duration'] = courseDuration;
    data['total_tution_fees'] = totalTutionFees;
    data['total_tution_fees_inr'] = totalTutionFeesInr;
    data['course_level'] = courseLevel;
    data['IntakeFrom_Year'] = intakeFromYear;
    data['arwu_rank'] = arwuRank;
    data['times_rank'] = timesRank;
    data['us_news_rank'] = usNewsRank;
    data['qs_world_rank'] = qsWorldRank;
    data['institute_type'] = instituteType;
    data['campus_name'] = campusName;
    data['campus_address'] = campusAddress;
    data['about_univ'] = aboutUniv;
    data['SIEC_Represented'] = sIECRepresented;
    data['broad_field_name'] = broadFieldName;
    data['narrow_field_name'] = narrowFieldName;
    data['description'] = description;
    data['specialization_description'] = specializationDescription;
    data['job_industry'] = jobIndustry;
    data['career_outcome'] = careerOutcome;
    data['average_salary'] = averageSalary;
    data['average_salary_inr'] = averageSalaryInr;
    data['application_tat'] = applicationTat;
    data['scholarship'] = scholarship;
    data['scholarship_criteria'] = scholarshipCriteria;
    data['naces'] = naces;
    data['cpt'] = cpt;
    data['stem'] = stem;
    data['year_of_education'] = yearOfEducation;
    data['early_application_deadline'] = earlyApplicationDeadline;
    data['annual_tution_fees'] = annualTutionFees;
    data['annual_tution_fees_inr'] = annualTutionFeesInr;
    data['academic_requirement_country'] = academicRequirementCountry;
    data['academic_requirement_course_level'] = academicRequirementCourseLevel;
    data['min_percentage'] = minPercentage;
    data['min_grade'] = minGrade;
    data['mandatory_subject_name'] = mandatorySubjectName;
    data['min_percentage_for_mandatory_subject'] =
        minPercentageForMandatorySubject;
    data['min_grade_for_mandatory_subject'] = minGradeForMandatorySubject;
    data['test_type'] = testType;
    data['listening'] = listening;
    data['reading'] = reading;
    data['writing'] = writing;
    data['speaking'] = speaking;
    data['overall'] = overall;
    data['special_entry_requirement'] = specialEntryRequirement;
    data['flexible'] = flexible;
    data['backlogs_acceptable'] = backlogsAcceptable;
    data['no_of_backlogs'] = noOfBacklogs;
    data['is_application_fee'] = isApplicationFee;
    data['application_fee'] = applicationFee;
    data['fee_waiver'] = feeWaiver;
    data['application_fee_after_waiver'] = applicationFeeAfterWaiver;
    data['offer_tat'] = offerTat;
    data['visa_fees'] = visaFees;
    data['visa_fees_inr'] = visaFeesInr;
    data['visa_tat'] = visaTat;
    data['country_currency_code'] = countryCurrencyCode;
    data['country_capital'] = countryCapital;
    data['country_inr_value'] = countryInrValue;
    data['country_language'] = countryLanguage;
    data['about_country'] = aboutCountry;
    data['popular_states'] = popularStates;
    data['edu_system'] = eduSystem;
    data['finance_and_expenses'] = financeAndExpenses;
    data['finding_work_as_students'] = findingWorkAsStudents;
    data['post_study_work_option'] = postStudyWorkOption;
    data['part_time_work_option'] = partTimeWorkOption;
    return data;
  }
}
