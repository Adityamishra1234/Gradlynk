class PersonalInformationModel {
  int? id;
  int? genderId;
  String? enquiryName;
  String? familyName;
  String? email;
  String? secondaryEmail;
  int? mobile;
  int? maritalStatusId;
  int? childrenCount;
  int? whatsappNumber;
  int? alternateNumber;
  int? countryId;
  int? stateId;
  int? cityId;
  String? street;
  int? zipCode;
  String? instagramId;
  String? facebookId;
  String? snapchatId;

  PersonalInformationModel(
      {this.id,
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
    genderId = json['gender'];
    enquiryName = json['enquiry_name'];
    familyName = json['family_name'];
    email = json['email'];
    secondaryEmail = json['secondary_email'];
    mobile = json['mobile'];
    maritalStatusId = json['marital_status'];
    childrenCount = json['children_count'];
    whatsappNumber = json['whatsapp_number'];
    alternateNumber = json['alternate_number'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    street = json['street'];
    zipCode = json['zip_code'];
    instagramId = json['instagram_id'];
    facebookId = json['facebook_id'];
    snapchatId = json['snapchat_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['gender'] = genderId;
    data['enquiry_name'] = enquiryName;
    data['family_name'] = familyName;
    data['email'] = email;
    data['secondary_email'] = secondaryEmail;
    data['mobile'] = mobile;
    data['marital_status'] = maritalStatusId;
    data['children_count'] = childrenCount;
    data['whatsapp_number'] = whatsappNumber;
    data['alternate_number'] = alternateNumber;
    data['country_id'] = countryId;
    data['state_id'] = stateId;
    data['city_id'] = cityId;
    data['street'] = street;
    data['zip_code'] = zipCode;
    data['instagram_id'] = instagramId;
    data['facebook_id'] = facebookId;
    data['snapchat_id'] = snapchatId;
    return data;
  }
}
