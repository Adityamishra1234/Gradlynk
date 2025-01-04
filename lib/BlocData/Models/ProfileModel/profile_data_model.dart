/// gender : ""
/// enquiry_name : "Ankur"
/// family_name : ""
/// email : "ankursatija@outlook.com"
/// secondary_email : "Target2rana@gmail.com"
/// mobile : 9999999999
/// marital_status : null
/// country_name : "India"
/// state_name : "Maharashtra"
/// city_name : "Pune"
/// applicant_type : ""
/// id : 34447
/// passport_name : ""
/// address : ""
/// street : ""
/// pincode : 0
/// date_of_birth : null
/// facebook_id : ""
/// snapchat_id : ""
/// instagram_id : ""
/// secondary_mobile : null
/// whatsup_no : 9999999999
/// children_count : 0
/// country_live_in : 101
/// state_id : 22
/// city_id : 2763
/// is_blocked : 0
/// student_consent : 1
/// service_id : 2
/// passport_available : "No"
/// login_proof : false
/// addtionalDetails : [{"branch_type":"Branch","branch_name":"West Delhi","service_name":"Student Visa","sub_service":null,"country_name":"Canada","decision_maker":"Parent","assigned_advisor":"Data Parking Station","assignee":null}]
/// otherCountryOfInterest : [{"country_name":"Australia","sec_country_id":13},{"country_name":"Canada","sec_country_id":38},{"country_name":"UK","sec_country_id":230},{"country_name":"USA","sec_country_id":231}]

class ProfileDataModel {
  ProfileDataModel({
      String? gender, 
      String? enquiryName, 
      String? familyName, 
      String? email, 
      String? secondaryEmail, 
      num? mobile, 
      dynamic maritalStatus, 
      String? countryName, 
      String? stateName, 
      String? cityName, 
      String? applicantType, 
      num? id, 
      String? passportName, 
      String? address, 
      String? street, 
      num? pincode, 
      dynamic dateOfBirth, 
      String? facebookId, 
      String? snapchatId, 
      String? instagramId, 
      dynamic secondaryMobile, 
      num? whatsupNo, 
      num? childrenCount, 
      num? countryLiveIn, 
      num? stateId, 
      num? cityId, 
      num? isBlocked, 
      num? studentConsent, 
      num? serviceId, 
      String? passportAvailable, 
      bool? loginProof, 
      List<AddtionalDetails>? addtionalDetails, 
      List<OtherCountryOfInterest>? otherCountryOfInterest,}){
    _gender = gender;
    _enquiryName = enquiryName;
    _familyName = familyName;
    _email = email;
    _secondaryEmail = secondaryEmail;
    _mobile = mobile;
    _maritalStatus = maritalStatus;
    _countryName = countryName;
    _stateName = stateName;
    _cityName = cityName;
    _applicantType = applicantType;
    _id = id;
    _passportName = passportName;
    _address = address;
    _street = street;
    _pincode = pincode;
    _dateOfBirth = dateOfBirth;
    _facebookId = facebookId;
    _snapchatId = snapchatId;
    _instagramId = instagramId;
    _secondaryMobile = secondaryMobile;
    _whatsupNo = whatsupNo;
    _childrenCount = childrenCount;
    _countryLiveIn = countryLiveIn;
    _stateId = stateId;
    _cityId = cityId;
    _isBlocked = isBlocked;
    _studentConsent = studentConsent;
    _serviceId = serviceId;
    _passportAvailable = passportAvailable;
    _loginProof = loginProof;
    _addtionalDetails = addtionalDetails;
    _otherCountryOfInterest = otherCountryOfInterest;
}

  ProfileDataModel.fromJson(dynamic json) {
    _gender = json['gender'];
    _enquiryName = json['enquiry_name'];
    _familyName = json['family_name'];
    _email = json['email'];
    _secondaryEmail = json['secondary_email'];
    _mobile = json['mobile'];
    _maritalStatus = json['marital_status'];
    _countryName = json['country_name'];
    _stateName = json['state_name'];
    _cityName = json['city_name'];
    _applicantType = json['applicant_type'];
    _id = json['id'];
    _passportName = json['passport_name'];
    _address = json['address'];
    _street = json['street'];
    _pincode = json['pincode'];
    _dateOfBirth = json['date_of_birth'];
    _facebookId = json['facebook_id'];
    _snapchatId = json['snapchat_id'];
    _instagramId = json['instagram_id'];
    _secondaryMobile = json['secondary_mobile'];
    _whatsupNo = json['whatsup_no'];
    _childrenCount = json['children_count'];
    _countryLiveIn = json['country_live_in'];
    _stateId = json['state_id'];
    _cityId = json['city_id'];
    _isBlocked = json['is_blocked'];
    _studentConsent = json['student_consent'];
    _serviceId = json['service_id'];
    _passportAvailable = json['passport_available'];
    _loginProof = json['login_proof'];
    if (json['addtionalDetails'] != null) {
      _addtionalDetails = [];
      json['addtionalDetails'].forEach((v) {
        _addtionalDetails?.add(AddtionalDetails.fromJson(v));
      });
    }
    if (json['otherCountryOfInterest'] != null) {
      _otherCountryOfInterest = [];
      json['otherCountryOfInterest'].forEach((v) {
        _otherCountryOfInterest?.add(OtherCountryOfInterest.fromJson(v));
      });
    }
  }
  String? _gender;
  String? _enquiryName;
  String? _familyName;
  String? _email;
  String? _secondaryEmail;
  num? _mobile;
  dynamic _maritalStatus;
  String? _countryName;
  String? _stateName;
  String? _cityName;
  String? _applicantType;
  num? _id;
  String? _passportName;
  String? _address;
  String? _street;
  num? _pincode;
  dynamic _dateOfBirth;
  String? _facebookId;
  String? _snapchatId;
  String? _instagramId;
  dynamic _secondaryMobile;
  num? _whatsupNo;
  num? _childrenCount;
  num? _countryLiveIn;
  num? _stateId;
  num? _cityId;
  num? _isBlocked;
  num? _studentConsent;
  num? _serviceId;
  String? _passportAvailable;
  bool? _loginProof;
  List<AddtionalDetails>? _addtionalDetails;
  List<OtherCountryOfInterest>? _otherCountryOfInterest;
ProfileDataModel copyWith({  String? gender,
  String? enquiryName,
  String? familyName,
  String? email,
  String? secondaryEmail,
  num? mobile,
  dynamic maritalStatus,
  String? countryName,
  String? stateName,
  String? cityName,
  String? applicantType,
  num? id,
  String? passportName,
  String? address,
  String? street,
  num? pincode,
  dynamic dateOfBirth,
  String? facebookId,
  String? snapchatId,
  String? instagramId,
  dynamic secondaryMobile,
  num? whatsupNo,
  num? childrenCount,
  num? countryLiveIn,
  num? stateId,
  num? cityId,
  num? isBlocked,
  num? studentConsent,
  num? serviceId,
  String? passportAvailable,
  bool? loginProof,
  List<AddtionalDetails>? addtionalDetails,
  List<OtherCountryOfInterest>? otherCountryOfInterest,
}) => ProfileDataModel(  gender: gender ?? _gender,
  enquiryName: enquiryName ?? _enquiryName,
  familyName: familyName ?? _familyName,
  email: email ?? _email,
  secondaryEmail: secondaryEmail ?? _secondaryEmail,
  mobile: mobile ?? _mobile,
  maritalStatus: maritalStatus ?? _maritalStatus,
  countryName: countryName ?? _countryName,
  stateName: stateName ?? _stateName,
  cityName: cityName ?? _cityName,
  applicantType: applicantType ?? _applicantType,
  id: id ?? _id,
  passportName: passportName ?? _passportName,
  address: address ?? _address,
  street: street ?? _street,
  pincode: pincode ?? _pincode,
  dateOfBirth: dateOfBirth ?? _dateOfBirth,
  facebookId: facebookId ?? _facebookId,
  snapchatId: snapchatId ?? _snapchatId,
  instagramId: instagramId ?? _instagramId,
  secondaryMobile: secondaryMobile ?? _secondaryMobile,
  whatsupNo: whatsupNo ?? _whatsupNo,
  childrenCount: childrenCount ?? _childrenCount,
  countryLiveIn: countryLiveIn ?? _countryLiveIn,
  stateId: stateId ?? _stateId,
  cityId: cityId ?? _cityId,
  isBlocked: isBlocked ?? _isBlocked,
  studentConsent: studentConsent ?? _studentConsent,
  serviceId: serviceId ?? _serviceId,
  passportAvailable: passportAvailable ?? _passportAvailable,
  loginProof: loginProof ?? _loginProof,
  addtionalDetails: addtionalDetails ?? _addtionalDetails,
  otherCountryOfInterest: otherCountryOfInterest ?? _otherCountryOfInterest,
);
  String? get gender => _gender;
  String? get enquiryName => _enquiryName;
  String? get familyName => _familyName;
  String? get email => _email;
  String? get secondaryEmail => _secondaryEmail;
  num? get mobile => _mobile;
  dynamic get maritalStatus => _maritalStatus;
  String? get countryName => _countryName;
  String? get stateName => _stateName;
  String? get cityName => _cityName;
  String? get applicantType => _applicantType;
  num? get id => _id;
  String? get passportName => _passportName;
  String? get address => _address;
  String? get street => _street;
  num? get pincode => _pincode;
  dynamic get dateOfBirth => _dateOfBirth;
  String? get facebookId => _facebookId;
  String? get snapchatId => _snapchatId;
  String? get instagramId => _instagramId;
  dynamic get secondaryMobile => _secondaryMobile;
  num? get whatsupNo => _whatsupNo;
  num? get childrenCount => _childrenCount;
  num? get countryLiveIn => _countryLiveIn;
  num? get stateId => _stateId;
  num? get cityId => _cityId;
  num? get isBlocked => _isBlocked;
  num? get studentConsent => _studentConsent;
  num? get serviceId => _serviceId;
  String? get passportAvailable => _passportAvailable;
  bool? get loginProof => _loginProof;
  List<AddtionalDetails>? get addtionalDetails => _addtionalDetails;
  List<OtherCountryOfInterest>? get otherCountryOfInterest => _otherCountryOfInterest;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['gender'] = _gender;
    map['enquiry_name'] = _enquiryName;
    map['family_name'] = _familyName;
    map['email'] = _email;
    map['secondary_email'] = _secondaryEmail;
    map['mobile'] = _mobile;
    map['marital_status'] = _maritalStatus;
    map['country_name'] = _countryName;
    map['state_name'] = _stateName;
    map['city_name'] = _cityName;
    map['applicant_type'] = _applicantType;
    map['id'] = _id;
    map['passport_name'] = _passportName;
    map['address'] = _address;
    map['street'] = _street;
    map['pincode'] = _pincode;
    map['date_of_birth'] = _dateOfBirth;
    map['facebook_id'] = _facebookId;
    map['snapchat_id'] = _snapchatId;
    map['instagram_id'] = _instagramId;
    map['secondary_mobile'] = _secondaryMobile;
    map['whatsup_no'] = _whatsupNo;
    map['children_count'] = _childrenCount;
    map['country_live_in'] = _countryLiveIn;
    map['state_id'] = _stateId;
    map['city_id'] = _cityId;
    map['is_blocked'] = _isBlocked;
    map['student_consent'] = _studentConsent;
    map['service_id'] = _serviceId;
    map['passport_available'] = _passportAvailable;
    map['login_proof'] = _loginProof;
    if (_addtionalDetails != null) {
      map['addtionalDetails'] = _addtionalDetails?.map((v) => v.toJson()).toList();
    }
    if (_otherCountryOfInterest != null) {
      map['otherCountryOfInterest'] = _otherCountryOfInterest?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// country_name : "Australia"
/// sec_country_id : 13

class OtherCountryOfInterest {
  OtherCountryOfInterest({
      String? countryName, 
      num? secCountryId,}){
    _countryName = countryName;
    _secCountryId = secCountryId;
}

  OtherCountryOfInterest.fromJson(dynamic json) {
    _countryName = json['country_name'];
    _secCountryId = json['sec_country_id'];
  }
  String? _countryName;
  num? _secCountryId;
OtherCountryOfInterest copyWith({  String? countryName,
  num? secCountryId,
}) => OtherCountryOfInterest(  countryName: countryName ?? _countryName,
  secCountryId: secCountryId ?? _secCountryId,
);
  String? get countryName => _countryName;
  num? get secCountryId => _secCountryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country_name'] = _countryName;
    map['sec_country_id'] = _secCountryId;
    return map;
  }

}

/// branch_type : "Branch"
/// branch_name : "West Delhi"
/// service_name : "Student Visa"
/// sub_service : null
/// country_name : "Canada"
/// decision_maker : "Parent"
/// assigned_advisor : "Data Parking Station"
/// assignee : null

class AddtionalDetails {
  AddtionalDetails({
      String? branchType, 
      String? branchName, 
      String? serviceName, 
      dynamic subService, 
      String? countryName, 
      String? decisionMaker, 
      String? assignedAdvisor, 
      dynamic assignee,}){
    _branchType = branchType;
    _branchName = branchName;
    _serviceName = serviceName;
    _subService = subService;
    _countryName = countryName;
    _decisionMaker = decisionMaker;
    _assignedAdvisor = assignedAdvisor;
    _assignee = assignee;
}

  AddtionalDetails.fromJson(dynamic json) {
    _branchType = json['branch_type'];
    _branchName = json['branch_name'];
    _serviceName = json['service_name'];
    _subService = json['sub_service'];
    _countryName = json['country_name'];
    _decisionMaker = json['decision_maker'];
    _assignedAdvisor = json['assigned_advisor'];
    _assignee = json['assignee'];
  }
  String? _branchType;
  String? _branchName;
  String? _serviceName;
  dynamic _subService;
  String? _countryName;
  String? _decisionMaker;
  String? _assignedAdvisor;
  dynamic _assignee;
AddtionalDetails copyWith({  String? branchType,
  String? branchName,
  String? serviceName,
  dynamic subService,
  String? countryName,
  String? decisionMaker,
  String? assignedAdvisor,
  dynamic assignee,
}) => AddtionalDetails(  branchType: branchType ?? _branchType,
  branchName: branchName ?? _branchName,
  serviceName: serviceName ?? _serviceName,
  subService: subService ?? _subService,
  countryName: countryName ?? _countryName,
  decisionMaker: decisionMaker ?? _decisionMaker,
  assignedAdvisor: assignedAdvisor ?? _assignedAdvisor,
  assignee: assignee ?? _assignee,
);
  String? get branchType => _branchType;
  String? get branchName => _branchName;
  String? get serviceName => _serviceName;
  dynamic get subService => _subService;
  String? get countryName => _countryName;
  String? get decisionMaker => _decisionMaker;
  String? get assignedAdvisor => _assignedAdvisor;
  dynamic get assignee => _assignee;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['branch_type'] = _branchType;
    map['branch_name'] = _branchName;
    map['service_name'] = _serviceName;
    map['sub_service'] = _subService;
    map['country_name'] = _countryName;
    map['decision_maker'] = _decisionMaker;
    map['assigned_advisor'] = _assignedAdvisor;
    map['assignee'] = _assignee;
    return map;
  }

}