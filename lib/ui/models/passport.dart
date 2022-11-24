class PassportModel {
  String? id;
  String? enqId;

  String? passportNumber;
  String? citizenOf;
  String? countryOfIssue;
  String? stateOfIssue;
  String? placeOfIssue;
  String? dateOfIssue;
  String? expiryDate;
  String? countryOfResidence;

  String? isActive;
  // String? createdAt;
  // String? createdBy;
  // String? updatedAt;
  // String? updatedBy;
  String? passportTentativeDate;
  String? passportAvailable;

  PassportModel(
      {this.id,
      this.enqId,
      // this.applicantType,
      this.passportNumber,
      this.citizenOf,
      this.countryOfIssue,
      this.stateOfIssue,
      this.placeOfIssue,
      this.dateOfIssue,
      this.expiryDate,
      this.countryOfResidence,
      // this.notes,
      this.isActive,
      // this.createdAt,
      // this.createdBy,
      // this.updatedAt,
      // this.updatedBy,
      this.passportTentativeDate,
      this.passportAvailable});

  PassportModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    enqId = json['enq_id'].toString();
    // applicantType = json['applicant_type'].toString();
    passportNumber = json['passport_number'].toString();
    citizenOf = json['citizen_of'].toString();
    countryOfIssue = json['country_of_issue'].toString();
    stateOfIssue = json['state_of_issue'].toString();
    placeOfIssue = json['place_of_issue'].toString();
    dateOfIssue = json['date_of_issue'].toString();
    expiryDate = json['expiry_date'].toString();
    countryOfResidence = json['country_of_residence'].toString();
    // notes = json['notes'].toString();
    isActive = json['is_active'].toString();
    // createdAt = json['created_at'].toString();
    // createdBy = json['created_by'].toString();
    // updatedAt = json['updated_at'].toString();
    // updatedBy = json['updated_by'].toString();
    passportTentativeDate = json['passport_tentative_date'].toString();
    passportAvailable = json['passport_available'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['enq_id'] = enqId;
    // data['applicant_type'] = applicantType;
    data['passport_number'] = passportNumber;
    data['citizen_of'] = citizenOf;
    data['country_of_issue'] = countryOfIssue;
    data['state_of_issue'] = stateOfIssue;
    data['place_of_issue'] = placeOfIssue;
    data['date_of_issue'] = dateOfIssue;
    data['expiry_date'] = expiryDate;
    data['country_of_residence'] = countryOfResidence;
    // data['notes'] = notes;
    data['is_active'] = isActive;
    // data['created_at'] = createdAt;
    // data['created_by'] = createdBy;
    // data['updated_at'] = updatedAt;
    // data['updated_by'] = updatedBy;
    data['passport_tentative_date'] = passportTentativeDate;
    data['passport_available'] = passportAvailable;
    return data;
  }
}
