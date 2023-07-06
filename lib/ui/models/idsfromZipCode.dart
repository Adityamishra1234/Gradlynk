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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['pin_code'] = pinCode;
    data['country_id'] = countryId;
    data['state_id'] = stateId;
    data['city_id'] = cityId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['country_name'] = countryName;
    data['state_name'] = stateName;
    data['city_name'] = cityName;
    return data;
  }
}
