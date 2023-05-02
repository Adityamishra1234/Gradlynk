class TravelHistoryModel {
  String? travelStatus;
  int? chooseCountry;
  String? typeOfVisa;
  String? visaStatus;
  String? dateOfApplication;
  String? dateOfRejection;
  String? reasonOfRejection;
  int? proofAvailable;
  String? countryName;
  String? applicationNumber;
  String? visaNumber;

  TravelHistoryModel(
      {this.travelStatus,
      this.chooseCountry,
      this.typeOfVisa,
      this.visaStatus,
      this.dateOfApplication,
      this.dateOfRejection,
      this.reasonOfRejection,
      this.proofAvailable,
      this.countryName,
      this.applicationNumber,
      this.visaNumber});

  TravelHistoryModel.fromJson(Map<String, dynamic> json) {
    travelStatus = json['travel_status'];
    chooseCountry = json['choose_country'];
    typeOfVisa = json['type_of_visa'].toString();
    visaStatus = json['visa_status'];
    dateOfApplication = json['date_of_application'];
    dateOfRejection = json['date_of_rejection'];
    reasonOfRejection = json['reason_of_rejection'];
    proofAvailable = json['proof_available'];
    countryName = json['country_name'];
    applicationNumber = json['application_number'];
    visaNumber = json['visa_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['travel_status'] = travelStatus;
    data['choose_country'] = chooseCountry;
    data['type_of_visa'] = typeOfVisa;
    data['visa_status'] = visaStatus;
    data['date_of_application'] = dateOfApplication;
    data['date_of_rejection'] = dateOfRejection;
    data['reason_of_rejection'] = reasonOfRejection;
    data['proof_available'] = proofAvailable;
    data['country_name'] = countryName;
    data['application_number'] = applicationNumber;
    data['visa_number'] = visaNumber;
    return data;
  }
}
