class AffiliationDropDownModel {
  String? affiliationName;
  int? id;

  AffiliationDropDownModel({this.affiliationName, this.id});

  AffiliationDropDownModel.fromJson(Map<String, dynamic> json) {
    affiliationName = json['affiliation_name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['affiliation_name'] = affiliationName;
    data['id'] = id;
    return data;
  }
}
