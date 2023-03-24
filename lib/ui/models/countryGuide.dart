class CountryGuideModel {
  String? country;
  String? flag;
  String? document;
  String? details;

  CountryGuideModel({this.country, this.flag, this.document, this.details});

  CountryGuideModel.fromJson(Map<String, dynamic> json) {
    country = json['Country'];
    flag = json['Flag'];
    document = json['Document'];
    details = json['Details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Country'] = country;
    data['Flag'] = flag;
    data['Document'] = document;
    data['Details'] = details;
    return data;
  }
}
