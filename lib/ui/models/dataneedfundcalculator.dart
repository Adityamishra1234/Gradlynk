class DataNeedFundCalulator {
  int? mstCourseId;
  String? country;
  String? university;
  String? courseName;
  String? courseDuration;
  String? currencySymbol;
  String? atf;
  String? ttf;
  String? haveofferletter;
  String? maritalStatus;
  String? scholarshipAmount;
  String? isPartner;
  String? isChild;
  String? numOfChild;
  String? childAge1;
  String? childAge2;
  String? childAge3;
  String? childAge4;
  String? lastUpdatedAt;
  List<TableData>? tableData;

  DataNeedFundCalulator(
      {this.mstCourseId,
      this.country,
      this.university,
      this.courseName,
      this.courseDuration,
      this.currencySymbol,
      this.atf,
      this.ttf,
      this.haveofferletter,
      this.maritalStatus,
      this.scholarshipAmount,
      this.isPartner,
      this.isChild,
      this.numOfChild,
      this.childAge1,
      this.childAge2,
      this.childAge3,
      this.childAge4,
      this.lastUpdatedAt,
      this.tableData});

  DataNeedFundCalulator.fromJson(Map<String, dynamic> json) {
    mstCourseId = json['mstCourseId'];
    country = json['country'];
    university = json['university'];
    courseName = json['course_name'];
    courseDuration = json['course_duration'];
    currencySymbol = json['currency_symbol'];
    atf = json['atf'];
    ttf = json['ttf'];
    haveofferletter = json['haveofferletter'];
    maritalStatus = json['marital_status'];
    scholarshipAmount = json['scholarshipAmount'];
    isPartner = json['is_partner'];
    isChild = json['is_child'];
    numOfChild = json['num_of_child'];
    childAge1 = json['child_age1'];
    childAge2 = json['child_age2'];
    childAge3 = json['child_age3'];
    childAge4 = json['child_age4'];
    lastUpdatedAt = json['last_updated_at'];
    if (json['tableData'] != null) {
      tableData = json['tableData'].forEach((v) {
        tableData!.add(TableData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mstCourseId'] = mstCourseId;
    data['country'] = country;
    data['university'] = university;
    data['course_name'] = courseName;
    data['course_duration'] = courseDuration;
    data['currency_symbol'] = currencySymbol;
    data['atf'] = atf;
    data['ttf'] = ttf;
    data['haveofferletter'] = haveofferletter;
    data['marital_status'] = maritalStatus;
    data['scholarshipAmount'] = scholarshipAmount;
    data['is_partner'] = isPartner;
    data['is_child'] = isChild;
    data['num_of_child'] = numOfChild;
    data['child_age1'] = childAge1;
    data['child_age2'] = childAge2;
    data['child_age3'] = childAge3;
    data['child_age4'] = childAge4;
    data['last_updated_at'] = lastUpdatedAt;
    if (tableData != null) {
      data['tableData'] = tableData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TableData {
  String? nameOfFiled;
  int? expenses;
  String? participants;
  int? total;
  int? inr;

  TableData(
      {this.nameOfFiled,
      this.expenses,
      this.participants,
      this.total,
      this.inr});

  TableData.fromJson(Map<String?, dynamic> json) {
    nameOfFiled = json['name_of_filed'];
    expenses = json['Expenses'];
    participants = json['participants'];
    total = json['total'];
    inr = json['inr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name_of_filed'] = nameOfFiled;
    data['Expenses'] = expenses;
    data['participants'] = participants;
    data['total'] = total;
    data['inr'] = inr;
    return data;
  }
}
