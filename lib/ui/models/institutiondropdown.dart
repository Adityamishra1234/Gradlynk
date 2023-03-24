class InstitutionDropDown {
  String? universityName;
  int? id;

  InstitutionDropDown({this.universityName, this.id});

  InstitutionDropDown.fromJson(Map<String, dynamic> json) {
    universityName = json['university_name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['university_name'] = universityName;
    data['id'] = id;
    return data;
  }
}
