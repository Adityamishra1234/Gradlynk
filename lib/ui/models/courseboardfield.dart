class CourseBoardField {
  int? architectureAndBuilding;
  int? education;
  int? health;
  int? law;
  int? engineeringAndRelatedTechnologies;
  int? managementAndCommerce;
  int? naturalAndPhysicalSciences;
  int? creativeArts;
  int? mixedFieldProgramme;
  int? informationTechnology;
  int? agricultureEnvironmentAndRelatedStudies;
  int? societyAndCulture;
  int? communicationAndMediaStudies;
  int? foodHospitalityAndPersonalServices;
  List? courseBoardFieldList;
  List? courseboardFieldCode;

  CourseBoardField(
      {this.architectureAndBuilding,
      this.education,
      this.health,
      this.law,
      this.engineeringAndRelatedTechnologies,
      this.managementAndCommerce,
      this.naturalAndPhysicalSciences,
      this.creativeArts,
      this.mixedFieldProgramme,
      this.informationTechnology,
      this.agricultureEnvironmentAndRelatedStudies,
      this.societyAndCulture,
      this.communicationAndMediaStudies,
      this.foodHospitalityAndPersonalServices});

  CourseBoardField.fromJson(Map<String, dynamic> json) {
    architectureAndBuilding = json['Architecture and building'];
    education = json['Education'];
    health = json['Health'];
    law = json['Law'];
    engineeringAndRelatedTechnologies =
        json['Engineering and Related Technologies'];
    managementAndCommerce = json['Management and Commerce'];
    naturalAndPhysicalSciences = json['Natural and Physical sciences'];
    creativeArts = json['Creative Arts'];
    mixedFieldProgramme = json['Mixed Field Programme'];
    informationTechnology = json['Information Technology'];
    agricultureEnvironmentAndRelatedStudies =
        json['Agriculture,Environment and Related Studies'];
    societyAndCulture = json['Society and Culture'];
    communicationAndMediaStudies = json['Communication and Media Studies'];
    foodHospitalityAndPersonalServices =
        json['Food Hospitality and Personal Services'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Architecture and building'] = this.architectureAndBuilding;
    data['Education'] = this.education;
    data['Health'] = this.health;
    data['Law'] = this.law;
    data['Engineering and Related Technologies'] =
        this.engineeringAndRelatedTechnologies;
    data['Management and Commerce'] = this.managementAndCommerce;
    data['Natural and Physical sciences'] = this.naturalAndPhysicalSciences;
    data['Creative Arts'] = this.creativeArts;
    data['Mixed Field Programme'] = this.mixedFieldProgramme;
    data['Information Technology'] = this.informationTechnology;
    data['Agriculture,Environment and Related Studies'] =
        this.agricultureEnvironmentAndRelatedStudies;
    data['Society and Culture'] = this.societyAndCulture;
    data['Communication and Media Studies'] = this.communicationAndMediaStudies;
    data['Food Hospitality and Personal Services'] =
        this.foodHospitalityAndPersonalServices;
    return data;
  }
}
