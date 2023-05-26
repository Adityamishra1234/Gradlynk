class IdsFromZipCodeModel {
  int? id;
  String? pinCode;
  String? countryId;
  String? stateId;
  String? cityId;
  String? createdAt;
  String? updatedAt;
  String? countryName;
  String? stateName;
  String? cityName;

  IdsFromZipCodeModel(
      {this.id,
      this.pinCode,
      this.countryId,
      this.stateId,
      this.cityId,
      this.createdAt,
      this.updatedAt,
      this.countryName,
      this.stateName,
      this.cityName});

  IdsFromZipCodeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pinCode = json['pin_code'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    countryName = json['country_name'];
    stateName = json['state_name'];
    cityName = json['city_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pin_code'] = this.pinCode;
    data['country_id'] = this.countryId;
    data['state_id'] = this.stateId;
    data['city_id'] = this.cityId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['country_name'] = this.countryName;
    data['state_name'] = this.stateName;
    data['city_name'] = this.cityName;
    return data;
  }
}
