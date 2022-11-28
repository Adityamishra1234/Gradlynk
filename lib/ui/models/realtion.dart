class RealtionModel {
  String? id;
  String? anyRelativeCountryInterested;
  String? citizenshipStatus;
  int? relativeCountry;
  String? relationWithRelative;
  String? relativeEmailId;
  int? contactOfRelative;
  String? addressOfRelative;
  int? applicantType;
  int? isActive;
  String? countryName;

  RealtionModel(
      {this.id,
      this.anyRelativeCountryInterested,
      this.citizenshipStatus,
      this.relativeCountry,
      this.relationWithRelative,
      this.relativeEmailId,
      this.contactOfRelative,
      this.addressOfRelative,
      this.applicantType,
      this.isActive,
      this.countryName});

  RealtionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    anyRelativeCountryInterested = json['any_relative_country_interested'];
    citizenshipStatus = json['citizenship_status'];
    relativeCountry = json['relative_country'];
    relationWithRelative = json['relation_with_relative'];
    relativeEmailId = json['relative_email_id'];
    contactOfRelative = json['contact_of_relative'];
    addressOfRelative = json['address_of_relative'];
    applicantType = json['applicant_type'];
    isActive = json['is_active'];
    countryName = json['country_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['any_relative_country_interested'] = anyRelativeCountryInterested;
    data['citizenship_status'] = citizenshipStatus;
    data['relative_country'] = relativeCountry;
    data['relation_with_relative'] = relationWithRelative;
    data['relative_email_id'] = relativeEmailId;
    data['contact_of_relative'] = contactOfRelative;
    data['address_of_relative'] = addressOfRelative;
    data['applicant_type'] = applicantType;
    data['is_active'] = isActive;
    data['country_name'] = countryName;
    return data;
  }
}
