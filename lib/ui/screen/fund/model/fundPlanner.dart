class fundPlanner {
  List<FundPlannersData>? fundPlannersData;
  List<UniCalculatedData>? uniCalculatedData;

  fundPlanner({this.fundPlannersData, this.uniCalculatedData});

  fundPlanner.fromJson(Map<String, dynamic> json) {
    if (json['fund_planners_data'] != null) {
      fundPlannersData = <FundPlannersData>[];
      json['fund_planners_data'].forEach((v) {
        fundPlannersData!.add(FundPlannersData.fromJson(v));
      });
    }
    if (json['uni_calculated_data'] != null) {
      uniCalculatedData = <UniCalculatedData>[];
      json['uni_calculated_data'].forEach((v) {
        uniCalculatedData!.add(UniCalculatedData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fundPlannersData != null) {
      data['fund_planners_data'] =
          fundPlannersData!.map((v) => v.toJson()).toList();
    }
    if (uniCalculatedData != null) {
      data['uni_calculated_data'] =
          uniCalculatedData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FundPlannersData {
  int? id;
  String? sponsorName;
  String? relationApplicant;
  int? countryId;
  int? bankId;
  String? fundType;
  String? amount;
  String? fundDocumentName;
  int? sourceOfIncome;
  String? sourceOfIncomeName;
  String? sponserDocValidated;
  String? bankName;
  String? fundTypeName;
  String? countryName;
  String? documentName;
  String? occupationName;

  FundPlannersData(
      {this.id,
      this.sponsorName,
      this.relationApplicant,
      this.countryId,
      this.bankId,
      this.fundType,
      this.amount,
      this.fundDocumentName,
      this.sourceOfIncome,
      this.sourceOfIncomeName,
      this.sponserDocValidated,
      this.bankName,
      this.fundTypeName,
      this.countryName,
      this.documentName,
      this.occupationName});

  FundPlannersData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sponsorName = json['sponsor_name'];
    relationApplicant = json['relation_applicant'];
    countryId = json['country_id'];
    bankId = json['bank_id'];
    fundType = json['fund_type'];
    amount = json['amount'];
    fundDocumentName = json['fund_document_name'];
    sourceOfIncome = json['source_of_income'];
    sourceOfIncomeName = json['source_of_income_name'];
    sponserDocValidated = json['sponser_doc_validated'];
    bankName = json['bank_name'];
    fundTypeName = json['fund_type_name'];
    countryName = json['country_name'];
    documentName = json['document_name'];
    occupationName = json['occupation_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sponsor_name'] = sponsorName;
    data['relation_applicant'] = relationApplicant;
    data['country_id'] = countryId;
    data['bank_id'] = bankId;
    data['fund_type'] = fundType;
    data['amount'] = amount;
    data['fund_document_name'] = fundDocumentName;
    data['source_of_income'] = sourceOfIncome;
    data['source_of_income_name'] = sourceOfIncomeName;
    data['sponser_doc_validated'] = sponserDocValidated;
    data['bank_name'] = bankName;
    data['fund_type_name'] = fundTypeName;
    data['country_name'] = countryName;
    data['document_name'] = documentName;
    data['occupation_name'] = occupationName;
    return data;
  }
}

class UniCalculatedData {
  int? id;
  String? courseName;
  String? countryName;
  String? stateName;
  String? cityName;
  String? universityName;
  String? campusName;
  String? courseDuration;
  String? convertedTotalFund;

  UniCalculatedData(
      {this.id,
      this.courseName,
      this.countryName,
      this.stateName,
      this.cityName,
      this.universityName,
      this.campusName,
      this.courseDuration,
      this.convertedTotalFund});

  UniCalculatedData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseName = json['course_name'];
    countryName = json['country_name'];
    stateName = json['state_name'];
    cityName = json['city_name'];
    universityName = json['university_name'];
    campusName = json['campus_name'];
    courseDuration = json['course_duration'];
    convertedTotalFund = json['converted_total_fund'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['course_name'] = courseName;
    data['country_name'] = countryName;
    data['state_name'] = stateName;
    data['city_name'] = cityName;
    data['university_name'] = universityName;
    data['campus_name'] = campusName;
    data['course_duration'] = courseDuration;
    data['converted_total_fund'] = convertedTotalFund;
    return data;
  }
}
