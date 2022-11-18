class WorkHistoryViewModel {
  int? applicantType;
  int? enqId;
  String? organisationName;
  String? jobType;
  String? jobRole;
  int? jobIndustryId;
  String? workingFrom;
  String? workingTill;
  int? income;
  String? jobIndustryName;

  WorkHistoryViewModel(
      {this.applicantType,
      this.enqId,
      this.organisationName,
      this.jobType,
      this.jobRole,
      this.jobIndustryId,
      this.workingFrom,
      this.workingTill,
      this.income,
      this.jobIndustryName});

  WorkHistoryViewModel.fromJson(Map<String, dynamic> json) {
    applicantType = json['applicant_type'];
    enqId = json['enq_id'];
    organisationName = json['organisation_name'];
    jobType = json['job_type'];
    jobRole = json['job_role'];
    jobIndustryId = json['job_industry_id'];
    workingFrom = json['working_from'];
    workingTill = json['working_till'];
    income = json['income'];
    jobIndustryName = json['job_industry_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['applicant_type'] = applicantType;
    data['enq_id'] = enqId;
    data['organisation_name'] = organisationName;
    data['job_type'] = jobType;
    data['job_role'] = jobRole;
    data['job_industry_id'] = jobIndustryId;
    data['working_from'] = workingFrom;
    data['working_till'] = workingTill;
    data['income'] = income;
    data['job_industry_name'] = jobIndustryName;
    return data;
  }
}
