import 'dart:convert';

StudentPanel? studentPanelFromJson(String? str) =>
    StudentPanel.fromJson(json.decode(str!));

String? studentPanelToJson(StudentPanel data) => json.encode(data.toJson());

class StudentPanel {
  StudentPanel(
      {this.countryID,
      this.stateID,
      this.cityID,
      this.child_count,
      this.alternateNumber,
      this.whatsappNumber,
      this.secondaryemail,
      this.instagramId,
      this.facebookId,
      this.snapchatId,
      this.lastname,
      this.gender,
      this.enquiryName,
      this.email,
      this.secondaryEmail,
      this.mobile,
      this.maritalStatus,
      this.countryName,
      this.stateName,
      this.cityName,
      this.applicantType,
      this.id,
      this.passportName,
      this.address,
      this.street,
      this.pincode,
      this.dateOfBirth,
      this.passportAvailable,
      this.addtionalDetails,
      this.service_id,
      // this.testDetails,
      // this.passportDetails,
      this.otherCountryOfInterest,
      this.student_consent,

      // this.courseChoice,
      this.loginproof,
      this.is_block});
  int? is_block;
  int? student_consent;
  bool? loginproof;
  int? countryID;
  int? stateID;
  int? cityID;
  int? child_count;
  int? alternateNumber;
  int? whatsappNumber;
  String? secondaryemail;
  String? instagramId;
  String? facebookId;
  String? snapchatId;
  String? lastname;
  //
  String? gender;
  String? enquiryName;
  String? email;
  String? secondaryEmail;
  int? mobile;
  String? maritalStatus;
  String? countryName;
  String? stateName;
  String? cityName;
  String? applicantType;
  int? id;
  String? passportName;
  String? address;
  String? street;
  int? pincode;
  String? dateOfBirth;
  String? passportAvailable;
  List<AddtionalDetail>? addtionalDetails;
  int? service_id;
  // TestDetails? testDetails;
  // List<PassportDetail>? passportDetails;
  List<OtherCountryOfInterest>? otherCountryOfInterest;
  // List<CourseChoice>? courseChoice;

  factory StudentPanel.fromJson(Map<String?, dynamic> json) => StudentPanel(
        service_id: json['service_id'],
        student_consent: json['student_consent'],
        loginproof: json['login_proof'],
        is_block: json['is_blocked'],
        cityID: json['city_id'],
        stateID: json['state_id'],
        countryID: json['country_live_in'],
        child_count: json['children_count'],
        alternateNumber: json['secondary_mobile'],
        whatsappNumber: json['whatsup_no'],
        instagramId: json['instagram_id'],
        snapchatId: json['snapchat_id'],
        lastname: json['family_name'],
        gender: json["gender"],
        enquiryName: json["enquiry_name"],
        email: json["email"],
        secondaryEmail: json["secondary_email"],
        mobile: json["mobile"],
        maritalStatus: json["marital_status"],
        countryName: json["country_name"],
        stateName: json["state_name"],
        cityName: json["city_name"],
        applicantType: json["applicant_type"],
        id: json["id"],
        passportName: json["passport_name"],
        address: json["address"],
        street: json["street"],
        pincode: json["pincode"],
        dateOfBirth: json["date_of_birth"],
        passportAvailable: json["passport_available"],
        addtionalDetails: List<AddtionalDetail>.from(
            json["addtionalDetails"].map((x) => AddtionalDetail.fromJson(x))),
        // testDetails: TestDetails.fromJson(json["testDetails"] ?? ""),
        // courseChoice: List<CourseChoice>.from(
        //     json["courseChoice"].map((x) => CourseChoice.fromJson(x))),
        // passportDetails: List<PassportDetail>.from(
        //     json["passportDetails"].map((x) => PassportDetail.fromJson(x))),
        otherCountryOfInterest: List<OtherCountryOfInterest>.from(
            json["otherCountryOfInterest"]
                .map((x) => OtherCountryOfInterest.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "is_blocked": is_block,
        "login_proof": loginproof,
        "gender": gender,
        "enquiry_name": enquiryName,
        "email": email,
        "secondary_email": secondaryEmail,
        "mobile": mobile,
        "marital_status": maritalStatus,
        "country_name": countryName,
        "state_name": stateName,
        "city_name": cityName,
        "applicant_type": applicantType,
        "id": id,
        "passport_name": passportName,
        "address": address,
        "street": street,
        "pincode": pincode,
        "date_of_birth": dateOfBirth,
        "passport_available": passportAvailable,
        "addtionalDetails":
            List<dynamic>.from(addtionalDetails!.map((x) => x.toJson())),
        // "testDetails": testDetails!.toJson(),
        // "courseChoice":
        //     List<dynamic>.from(courseChoice!.map((x) => x.toJson())),
        // "passportDetails":
        //     List<dynamic>.from(passportDetails!.map((x) => x.toJson())),
        "otherCountryOfInterest":
            List<dynamic>.from(otherCountryOfInterest!.map((x) => x.toJson())),
      };
}

class AddtionalDetail {
  AddtionalDetail(
      {this.branchType,
      this.branchName,
      this.serviceName,
      this.subService,
      this.countryName,
      this.assigned_advisor,
      this.assigne});

  String? branchType;
  String? branchName;
  String? serviceName;
  String? subService;
  String? countryName;
  String? assigned_advisor;
  String? assigne;

  factory AddtionalDetail.fromJson(Map<String?, dynamic> json) =>
      AddtionalDetail(
        branchType: json["branch_type"],
        branchName: json["branch_name"],
        serviceName: json["service_name"],
        subService: json["sub_service"],
        countryName: json["country_name"],
        assigned_advisor: json['assigned_advisor'],
        assigne: json['assignee'],
      );

  Map<String?, dynamic> toJson() => {
        "branch_type": branchType,
        "branch_name": branchName,
        "service_name": serviceName,
        "sub_service": subService,
        "country_name": countryName,
        "assigned_advisor": assigned_advisor,
        "assignee": assigne,
      };
}

class OtherCountryOfInterest {
  OtherCountryOfInterest({this.countryName, this.id});

  String? countryName;
  int? id;

  factory OtherCountryOfInterest.fromJson(Map<String?, dynamic> json) =>
      OtherCountryOfInterest(
          countryName: json["country_name"], id: json['sec_country_id']);

  Map<String?, dynamic> toJson() =>
      {"country_name": countryName, "sec_country_id": id};
}

class PassportDetail {
  PassportDetail({
    this.citizenOf,
    this.countryOfIssue,
    this.passportNumber,
    this.placeOfIssue,
    this.dateOfIssue,
    this.expiryDate,
  });

  String? citizenOf;
  String? countryOfIssue;
  String? passportNumber;
  String? placeOfIssue;
  String? dateOfIssue;
  String? expiryDate;

  factory PassportDetail.fromJson(Map<String?, dynamic> json) => PassportDetail(
        citizenOf: json["citizen_of"],
        countryOfIssue: json["country_of_issue"],
        passportNumber: json["passport_number"],
        placeOfIssue: json["place_of_issue"],
        dateOfIssue: json["date_of_issue"],
        expiryDate: json["expiry_date"],
      );

  Map<String?, dynamic> toJson() => {
        "citizen_of": citizenOf,
        "country_of_issue": countryOfIssue,
        "passport_number": passportNumber,
        "place_of_issue": placeOfIssue,
        "date_of_issue": dateOfIssue,
        "expiry_date": expiryDate,
      };
}

class TestDetails {
  TestDetails(
      {this.examType,
      this.examStatus,
      this.dateOfExam,
      this.resultDate,
      this.expirationDate,
      this.scoreType,
      this.overAll,
      this.examName,
      this.reading,
      this.listening,
      this.speaking,
      this.writing});

  String? examType;
  String? examStatus;
  String? dateOfExam;
  String? resultDate;
  String? expirationDate;
  String? scoreType;
  int? reading;
  int? writing;
  int? listening;
  int? speaking;
  int? overAll;
  String? examName;

  factory TestDetails.fromJson(Map<String?, dynamic> json) => TestDetails(
        examType: json["exam_type"],
        reading: json['reading'],
        writing: json['writing'],
        listening: json['listening'],
        speaking: json['speaking'],
        examStatus: json["exam_status"],
        dateOfExam: json["date_of_exam"],
        resultDate: json["result_date"],
        expirationDate: json["expiration_date"],
        scoreType: json["score_type"],
        overAll: json["over_all"],
        examName: json["exam_name"],
      );

  Map<String?, dynamic> toJson() => {
        "exam_type": examType,
        "exam_status": examStatus,
        "date_of_exam": dateOfExam,
        "result_date": resultDate,
        "expiration_date": expirationDate,
        "score_type": scoreType,
        "over_all": overAll,
        "exam_name": examName,
        "reading": reading,
        "writing": writing,
        "listening": listening,
        "speaking": speaking,
      };
}

class CourseChoice {
  CourseChoice({
    this.broadFieldName,
    this.narrowFieldName,
    this.courseLevel,
  });

  String? broadFieldName;
  String? narrowFieldName;
  String? courseLevel;

  factory CourseChoice.fromJson(Map<String?, dynamic> json) => CourseChoice(
        broadFieldName: json["broad_field_name"],
        narrowFieldName: json["narrow_field_name"],
        courseLevel: json["course_level"],
      );

  Map<String?, dynamic> toJson() => {
        "broad_field_name": broadFieldName,
        "narrow_field_name": narrowFieldName,
        "course_level": courseLevel,
      };
}
