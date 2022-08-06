class CourseLevel {
  int? advancedDiplomas;
  int? associateDegree;
  int? masters;
  int? bachelors;
  int? pGDiploma;
  int? diploma;
  int? class12;
  int? class10;
  int? mastersByResearch;
  int? graduateCertificate;
  int? certificateCourse;
  int? doctorateDegree;
  int? graduateDiploma;
  int? major;
  int? minor;
  int? postBaccalaureateCertificate;
  int? apprenticeship;
  int? foundation;
  int? advancedCertificate;
  int? postBaccalaureateDiploma;
  int? pOSTGRADUATECERTIFICATE;
  int? uTPStageI;
  int? uTPStageII;
  int? professionalMasterS;
  int? preMasterS;
  int? uGFoundation;
  int? iBDiploma;
  int? postDiplomaCertificate;
  int? postDegreeDiploma;
  int? postDiplomaBaccalaureate;
  int? pathways;
  int? accelerated;
  int? internationalYearOne;
  int? transferDegree;
  int? dualDegree;
  int? foundationDegree;
  int? combinedDegree;
  int? professionalMasterSDiploma;
  int? certifictaeCourse;
  List<String>? courseLevelList;
  List<String>? courseCode;

  CourseLevel(
      {this.advancedDiplomas,
      this.associateDegree,
      this.masters,
      this.bachelors,
      this.pGDiploma,
      this.diploma,
      this.class12,
      this.class10,
      this.mastersByResearch,
      this.graduateCertificate,
      this.certificateCourse,
      this.doctorateDegree,
      this.graduateDiploma,
      this.major,
      this.minor,
      this.postBaccalaureateCertificate,
      this.apprenticeship,
      this.foundation,
      this.advancedCertificate,
      this.postBaccalaureateDiploma,
      this.pOSTGRADUATECERTIFICATE,
      this.uTPStageI,
      this.uTPStageII,
      this.professionalMasterS,
      this.preMasterS,
      this.uGFoundation,
      this.iBDiploma,
      this.postDiplomaCertificate,
      this.postDegreeDiploma,
      this.postDiplomaBaccalaureate,
      this.pathways,
      this.accelerated,
      this.internationalYearOne,
      this.transferDegree,
      this.dualDegree,
      this.foundationDegree,
      this.combinedDegree,
      this.professionalMasterSDiploma,
      this.certifictaeCourse});

  CourseLevel.fromJson(Map<String, dynamic> json) {
    advancedDiplomas = json['Advanced Diplomas'];
    associateDegree = json['Associate degree'];
    masters = json['Masters'];
    bachelors = json['Bachelors'];
    pGDiploma = json['PG Diploma'];
    diploma = json['Diploma'];
    class12 = json['Class 12'];
    class10 = json['Class 10'];
    mastersByResearch = json['Masters By Research'];
    graduateCertificate = json['Graduate Certificate'];
    certificateCourse = json['Certificate Course'];
    doctorateDegree = json['Doctorate Degree'];
    graduateDiploma = json['Graduate Diploma'];
    major = json['Major'];
    minor = json['Minor'];
    postBaccalaureateCertificate = json['Post-Baccalaureate Certificate'];
    apprenticeship = json['Apprenticeship'];
    foundation = json['Foundation'];
    advancedCertificate = json['Advanced Certificate'];
    postBaccalaureateDiploma = json['Post-Baccalaureate Diploma'];
    pOSTGRADUATECERTIFICATE = json['POST-GRADUATE CERTIFICATE'];
    uTPStageI = json['UTP Stage I'];
    uTPStageII = json['UTP Stage II'];
    professionalMasterS = json['Professional Master’s'];
    preMasterS = json['Pre-Master\'s'];
    uGFoundation = json['UG Foundation'];
    iBDiploma = json['IB Diploma'];
    postDiplomaCertificate = json['Post-Diploma Certificate'];
    postDegreeDiploma = json['Post Degree Diploma'];
    postDiplomaBaccalaureate = json['Post Diploma Baccalaureate'];
    pathways = json['Pathways'];
    accelerated = json['Accelerated'];
    internationalYearOne = json['International Year One'];
    transferDegree = json['Transfer Degree'];
    dualDegree = json['Dual Degree'];
    foundationDegree = json['Foundation Degree'];
    combinedDegree = json['Combined Degree'];
    professionalMasterSDiploma = json['Professional Master\'s Diploma'];
    certifictaeCourse = json['Certifictae Course'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Advanced Diplomas'] = this.advancedDiplomas;
    data['Associate degree'] = this.associateDegree;
    data['Masters'] = this.masters;
    data['Bachelors'] = this.bachelors;
    data['PG Diploma'] = this.pGDiploma;
    data['Diploma'] = this.diploma;
    data['Class 12'] = this.class12;
    data['Class 10'] = this.class10;
    data['Masters By Research'] = this.mastersByResearch;
    data['Graduate Certificate'] = this.graduateCertificate;
    data['Certificate Course'] = this.certificateCourse;
    data['Doctorate Degree'] = this.doctorateDegree;
    data['Graduate Diploma'] = this.graduateDiploma;
    data['Major'] = this.major;
    data['Minor'] = this.minor;
    data['Post-Baccalaureate Certificate'] = this.postBaccalaureateCertificate;
    data['Apprenticeship'] = this.apprenticeship;
    data['Foundation'] = this.foundation;
    data['Advanced Certificate'] = this.advancedCertificate;
    data['Post-Baccalaureate Diploma'] = this.postBaccalaureateDiploma;
    data['POST-GRADUATE CERTIFICATE'] = this.pOSTGRADUATECERTIFICATE;
    data['UTP Stage I'] = this.uTPStageI;
    data['UTP Stage II'] = this.uTPStageII;
    data['Professional Master’s'] = this.professionalMasterS;
    data['Pre-Master\'s'] = this.preMasterS;
    data['UG Foundation'] = this.uGFoundation;
    data['IB Diploma'] = this.iBDiploma;
    data['Post-Diploma Certificate'] = this.postDiplomaCertificate;
    data['Post Degree Diploma'] = this.postDegreeDiploma;
    data['Post Diploma Baccalaureate'] = this.postDiplomaBaccalaureate;
    data['Pathways'] = this.pathways;
    data['Accelerated'] = this.accelerated;
    data['International Year One'] = this.internationalYearOne;
    data['Transfer Degree'] = this.transferDegree;
    data['Dual Degree'] = this.dualDegree;
    data['Foundation Degree'] = this.foundationDegree;
    data['Combined Degree'] = this.combinedDegree;
    data['Professional Master\'s Diploma'] = this.professionalMasterSDiploma;
    data['Certifictae Course'] = this.certifictaeCourse;
    return data;
  }
}
