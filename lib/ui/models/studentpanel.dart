class StudentPanel {
  String? gender;
  String? enquiryName;
  String? email;
  int? mobile;
  String? maritalStatus;
  String? countryName;
  String? stateName;
  String? cityName;
  String? applicantType;
  int? id;
  String? passportName;
  String? passportAvailable;
  List<AddtionalDetails>? addtionalDetails;
  TestDetails? testDetails;
  List<PassportDetails>? passportDetails;

  StudentPanel(
      {this.gender,
      this.enquiryName,
      this.email,
      this.mobile,
      this.maritalStatus,
      this.countryName,
      this.stateName,
      this.cityName,
      this.applicantType,
      this.id,
      this.passportName,
      this.passportAvailable,
      this.addtionalDetails,
      this.testDetails,
      this.passportDetails});

  StudentPanel.fromJson(Map<String?, dynamic> json) {
    gender = json['gender'];
    enquiryName = json['enquiry_name'];
    email = json['email'];
    mobile = json['mobile'];
    maritalStatus = json['marital_status'];
    countryName = json['country_name'];
    stateName = json['state_name'];
    cityName = json['city_name'];
    applicantType = json['applicant_type'];
    id = json['id'];
    passportName = json['passport_name'];
    passportAvailable = json['passport_available'];
    if (json['addtionalDetails'] != null) {
      addtionalDetails = <AddtionalDetails>[];
      json['addtionalDetails'].forEach((v) {
        addtionalDetails!.add(AddtionalDetails.fromJson(v));
      });
    }
    testDetails = json['testDetails'] != null
        ? TestDetails.fromJson(json['testDetails'])
        : null;
    if (json['passportDetails'] != null) {
      passportDetails = <PassportDetails>[];
      json['passportDetails'].forEach((v) {
        passportDetails!.add(PassportDetails.fromJson(v));
      });
    }
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = Map<String?, dynamic>();
    data['gender'] = this.gender;
    data['enquiry_name'] = this.enquiryName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['marital_status'] = this.maritalStatus;
    data['country_name'] = this.countryName;
    data['state_name'] = this.stateName;
    data['city_name'] = this.cityName;
    data['applicant_type'] = this.applicantType;
    data['id'] = this.id;
    data['passport_name'] = this.passportName;
    data['passport_available'] = this.passportAvailable;
    if (this.addtionalDetails != null) {
      data['addtionalDetails'] =
          this.addtionalDetails!.map((v) => v.toJson()).toList();
    }
    if (this.testDetails != null) {
      data['testDetails'] = this.testDetails!.toJson();
    }
    if (this.passportDetails != null) {
      data['passportDetails'] =
          this.passportDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddtionalDetails {
  String? branchType;
  String? branchName;
  String? serviceName;
  String? subService;
  String? countryName;

  AddtionalDetails(
      {this.branchType,
      this.branchName,
      this.serviceName,
      this.subService,
      this.countryName});

  AddtionalDetails.fromJson(Map<String?, dynamic> json) {
    branchType = json['branch_type'];
    branchName = json['branch_name'];
    serviceName = json['service_name'];
    subService = json['sub_service'];
    countryName = json['country_name'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = Map<String?, dynamic>();
    data['branch_type'] = this.branchType;
    data['branch_name'] = this.branchName;
    data['service_name'] = this.serviceName;
    data['sub_service'] = this.subService;
    data['country_name'] = this.countryName;
    return data;
  }
}

class TestDetails {
  String? examType;
  String? examStatus;
  String? dateOfExam;
  String? resultDate;
  String? expirationDate;
  String? scoreType;
  int? overAll;

  TestDetails(
      {this.examType,
      this.examStatus,
      this.dateOfExam,
      this.resultDate,
      this.expirationDate,
      this.scoreType,
      this.overAll});

  TestDetails.fromJson(Map<String?, dynamic> json) {
    examType = json['exam_type'];
    examStatus = json['exam_status'];
    dateOfExam = json['date_of_exam'];
    resultDate = json['result_date'];
    expirationDate = json['expiration_date'];
    scoreType = json['score_type'];
    overAll = json['over_all'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = Map<String?, dynamic>();
    data['exam_type'] = this.examType;
    data['exam_status'] = this.examStatus;
    data['date_of_exam'] = this.dateOfExam;
    data['result_date'] = this.resultDate;
    data['expiration_date'] = this.expirationDate;
    data['score_type'] = this.scoreType;
    data['over_all'] = this.overAll;
    return data;
  }
}

class PassportDetails {
  String? citizenOf;
  String? countryOfIssue;
  String? passportNumber;
  String? placeOfIssue;
  String? dateOfIssue;
  String? expiryDate;

  PassportDetails(
      {this.citizenOf,
      this.countryOfIssue,
      this.passportNumber,
      this.placeOfIssue,
      this.dateOfIssue,
      this.expiryDate});

  PassportDetails.fromJson(Map<String?, dynamic> json) {
    citizenOf = json['citizen_of'];
    countryOfIssue = json['country_of_issue'];
    passportNumber = json['passport_number'];
    placeOfIssue = json['place_of_issue'];
    dateOfIssue = json['date_of_issue'];
    expiryDate = json['expiry_date'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = Map<String?, dynamic>();
    data['citizen_of'] = this.citizenOf;
    data['country_of_issue'] = this.countryOfIssue;
    data['passport_number'] = this.passportNumber;
    data['place_of_issue'] = this.placeOfIssue;
    data['date_of_issue'] = this.dateOfIssue;
    data['expiry_date'] = this.expiryDate;
    return data;
  }
}
