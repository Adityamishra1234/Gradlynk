class CountryWithFlagModel {
  int? id;
  String? country;
  String? flag;

  CountryWithFlagModel({this.id, this.country, this.flag});

  CountryWithFlagModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    country = json['country'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country'] = this.country;
    data['flag'] = this.flag;
    return data;
  }
}
