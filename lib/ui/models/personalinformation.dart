class PersonalInformationModel {
  int? id;
  int? genderId;
  String? enquiryName;
  String? familyName;
  String? email;
  String? secondaryEmail;
  String? mobile;
  int? maritalStatusId;
  int? childrenCount;
  String? whatsappNumber;
  String? alternateNumber;
  int? countryId;
  int? stateId;
  int? cityId;
  String? street;
  int? zipCode;
  String? instagramId;
  String? facebookId;
  String? snapchatId;
  String? dateOfBirth;

  PersonalInformationModel(
      {this.id,
      this.dateOfBirth,
      this.genderId,
      this.enquiryName,
      this.familyName,
      this.email,
      this.secondaryEmail,
      this.mobile,
      this.maritalStatusId,
      this.childrenCount,
      this.whatsappNumber,
      this.alternateNumber,
      this.countryId,
      this.stateId,
      this.cityId,
      this.street,
      this.zipCode,
      this.instagramId,
      this.facebookId,
      this.snapchatId});

  PersonalInformationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateOfBirth = json['date_of_birth'];
    genderId = json['gender'];
    enquiryName = json['enquiry_name'];
    familyName = json['family_name'];
    email = json['email'];
    secondaryEmail = json['secondary_email'];
    mobile = json['mobile'];
    maritalStatusId = json['marital_status'];
    childrenCount = json['children_count'];
    whatsappNumber = json['whatsup_no'].toString();
    alternateNumber = json['secondary_mobile'].toString();
    countryId = json['country_live_in'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    street = json['street'];
    zipCode = json['pincode'];
    instagramId = json['instagram_id'];
    facebookId = json['facebook_id'];
    snapchatId = json['snapchat_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date_of_birth'] = dateOfBirth;
    data['gender'] = genderId;
    data['enquiry_name'] = enquiryName;
    data['family_name'] = familyName;
    data['email'] = email;
    data['secondary_email'] = secondaryEmail;
    data['mobile'] = mobile;
    data['marital_status'] = maritalStatusId;
    data['children_count'] = childrenCount;
    data['whatsup_no'] = whatsappNumber;
    data['secondary_mobile'] = alternateNumber;
    data['country_live_in'] = countryId;
    data['state_id'] = stateId;
    data['city_id'] = cityId;
    data['street'] = street;
    data['pincode'] = zipCode;
    data['instagram_id'] = instagramId;
    data['facebook_id'] = facebookId;
    data['snapchat_id'] = snapchatId;
    return data;
  }
}
