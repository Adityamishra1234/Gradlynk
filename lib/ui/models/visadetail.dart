class VisaDetailModel {
  String? visaOutcome;
  String? visaOutcomeDate;
  String? visaOutcomeTime;
  int? paymentAmount;
  String? paymentDate;
  String? paymentMode;
  String? referenceNumber;
  String? fileSentThrough;
  String? visaSubmissionDate;
  String? visaSentByPerson;
  String? applicationNumber;
  String? biometricsStateName;
  String? biometricsCityName;
  String? appointmentDate;
  String? appointmentTime;
  String? gicAccNo;
  String? gicAccountUsername;
  String? gicAccountPassword;
  String? gicBank;
  String? gicDate;
  String? homeBankCountryName;
  String? homeBankName;
  String? paymentReceivedDate;
  String? medicalProcessState;
  String? medicalProcessCity;
  String? doctorName;
  String? doctorAddress;
  String? medicalAppointmentDate;
  String? medicalAppointmentTime;
  String? visaAssignee;
  String? country;
  String? universityName;
  String? campusName;
  String? courseName;
  String? courseLevel;

  VisaDetailModel(
      {this.visaOutcome,
      this.visaOutcomeDate,
      this.visaOutcomeTime,
      this.paymentAmount,
      this.paymentDate,
      this.paymentMode,
      this.referenceNumber,
      this.fileSentThrough,
      this.visaSubmissionDate,
      this.visaSentByPerson,
      this.applicationNumber,
      this.biometricsStateName,
      this.biometricsCityName,
      this.appointmentDate,
      this.appointmentTime,
      this.gicAccNo,
      this.gicAccountUsername,
      this.gicAccountPassword,
      this.gicBank,
      this.gicDate,
      this.homeBankCountryName,
      this.homeBankName,
      this.paymentReceivedDate,
      this.medicalProcessState,
      this.medicalProcessCity,
      this.doctorName,
      this.doctorAddress,
      this.medicalAppointmentDate,
      this.medicalAppointmentTime,
      this.visaAssignee,
      this.country,
      this.universityName,
      this.campusName,
      this.courseName,
      this.courseLevel});

  VisaDetailModel.fromJson(Map<String, dynamic> json) {
    visaOutcome = json['visa_outcome'];
    visaOutcomeDate = json['visa_outcome_date'];
    visaOutcomeTime = json['visa_outcome_time'];
    paymentAmount = json['payment_amount'];
    paymentDate = json['payment_date'];
    paymentMode = json['payment_mode'];
    referenceNumber = json['reference_number'];
    fileSentThrough = json['file_sent_through'];
    visaSubmissionDate = json['visa_submission_date'];
    visaSentByPerson = json['visa_sent_by_person'];
    applicationNumber = json['application_number'];
    biometricsStateName = json['biometrics_state_name'];
    biometricsCityName = json['biometrics_city_name'];
    appointmentDate = json['appointment_date'];
    appointmentTime = json['appointment_time'];
    gicAccNo = json['gic_acc_no'];
    gicAccountUsername = json['gic_account_username'];
    gicAccountPassword = json['gic_account_password'];
    gicBank = json['gic_bank'];
    gicDate = json['gic_date'];
    homeBankCountryName = json['home_bank_country_name'];
    homeBankName = json['home_bank_name'];
    paymentReceivedDate = json['payment_received_date'];
    medicalProcessState = json['medical_process_state'];
    medicalProcessCity = json['medical_process_city'];
    doctorName = json['doctor_name'];
    doctorAddress = json['doctor_address'];
    medicalAppointmentDate = json['medical_appointment_date'];
    medicalAppointmentTime = json['medical_appointment_time'];
    visaAssignee = json['visa_assignee'];
    country = json['country'];
    universityName = json['university_name'];
    campusName = json['campus_name'];
    courseName = json['course_name'];
    courseLevel = json['course_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['visa_outcome'] = this.visaOutcome;
    data['visa_outcome_date'] = this.visaOutcomeDate;
    data['visa_outcome_time'] = this.visaOutcomeTime;
    data['payment_amount'] = this.paymentAmount;
    data['payment_date'] = this.paymentDate;
    data['payment_mode'] = this.paymentMode;
    data['reference_number'] = this.referenceNumber;
    data['file_sent_through'] = this.fileSentThrough;
    data['visa_submission_date'] = this.visaSubmissionDate;
    data['visa_sent_by_person'] = this.visaSentByPerson;
    data['application_number'] = this.applicationNumber;
    data['biometrics_state_name'] = this.biometricsStateName;
    data['biometrics_city_name'] = this.biometricsCityName;
    data['appointment_date'] = this.appointmentDate;
    data['appointment_time'] = this.appointmentTime;
    data['gic_acc_no'] = this.gicAccNo;
    data['gic_account_username'] = this.gicAccountUsername;
    data['gic_account_password'] = this.gicAccountPassword;
    data['gic_bank'] = this.gicBank;
    data['gic_date'] = this.gicDate;
    data['home_bank_country_name'] = this.homeBankCountryName;
    data['home_bank_name'] = this.homeBankName;
    data['payment_received_date'] = this.paymentReceivedDate;
    data['medical_process_state'] = this.medicalProcessState;
    data['medical_process_city'] = this.medicalProcessCity;
    data['doctor_name'] = this.doctorName;
    data['doctor_address'] = this.doctorAddress;
    data['medical_appointment_date'] = this.medicalAppointmentDate;
    data['medical_appointment_time'] = this.medicalAppointmentTime;
    data['visa_assignee'] = this.visaAssignee;
    data['country'] = this.country;
    data['university_name'] = this.universityName;
    data['campus_name'] = this.campusName;
    data['course_name'] = this.courseName;
    data['course_level'] = this.courseLevel;
    return data;
  }
}
