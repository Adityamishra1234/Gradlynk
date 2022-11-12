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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['visa_outcome'] = visaOutcome;
    data['visa_outcome_date'] = visaOutcomeDate;
    data['visa_outcome_time'] = visaOutcomeTime;
    data['payment_amount'] = paymentAmount;
    data['payment_date'] = paymentDate;
    data['payment_mode'] = paymentMode;
    data['reference_number'] = referenceNumber;
    data['file_sent_through'] = fileSentThrough;
    data['visa_submission_date'] = visaSubmissionDate;
    data['visa_sent_by_person'] = visaSentByPerson;
    data['application_number'] = applicationNumber;
    data['biometrics_state_name'] = biometricsStateName;
    data['biometrics_city_name'] = biometricsCityName;
    data['appointment_date'] = appointmentDate;
    data['appointment_time'] = appointmentTime;
    data['gic_acc_no'] = gicAccNo;
    data['gic_account_username'] = gicAccountUsername;
    data['gic_account_password'] = gicAccountPassword;
    data['gic_bank'] = gicBank;
    data['gic_date'] = gicDate;
    data['home_bank_country_name'] = homeBankCountryName;
    data['home_bank_name'] = homeBankName;
    data['payment_received_date'] = paymentReceivedDate;
    data['medical_process_state'] = medicalProcessState;
    data['medical_process_city'] = medicalProcessCity;
    data['doctor_name'] = doctorName;
    data['doctor_address'] = doctorAddress;
    data['medical_appointment_date'] = medicalAppointmentDate;
    data['medical_appointment_time'] = medicalAppointmentTime;
    data['visa_assignee'] = visaAssignee;
    data['country'] = country;
    data['university_name'] = universityName;
    data['campus_name'] = campusName;
    data['course_name'] = courseName;
    data['course_level'] = courseLevel;
    return data;
  }
}
