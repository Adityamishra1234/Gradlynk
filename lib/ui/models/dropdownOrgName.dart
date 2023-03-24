class DropDownorganisationName {
  String? organisationName;
  int? id;
  String? applicantType;
  String? workingFrom;

  DropDownorganisationName(
      {this.organisationName, this.id, this.applicantType, this.workingFrom});

  DropDownorganisationName.fromJson(Map<String, dynamic> json) {
    organisationName = json['organisation_name'];
    id = json['id'];
    applicantType = json['applicant_type'];
    workingFrom = json['working_from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['organisation_name'] = organisationName;
    data['id'] = id;
    data['applicant_type'] = applicantType;
    data['working_from'] = workingFrom;
    return data;
  }
}
