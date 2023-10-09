class EventZoneStatus {
  String? status;
  bool? trackApplication;
  bool? expressPass;
  bool? markAttendance;
  List<CampaignDetails>? campaignDetails;
  bool? expressPassGenerated;
  String? expressPassView;
  bool? searchCourse;
  bool? shortlist;
  bool? applicationShortlist;
  bool? planYourFunds;
  bool? countryGuide;
  bool? qrCodeGenerated;
  String? qrCodeView;
  bool? journeyItinerary;
  String? student_code;

  EventZoneStatus(
      {this.status,
      this.student_code,
      this.trackApplication,
      this.expressPass,
      this.markAttendance,
      this.campaignDetails,
      this.expressPassGenerated,
      this.expressPassView,
      this.searchCourse,
      this.shortlist,
      this.applicationShortlist,
      this.planYourFunds,
      this.countryGuide,
      this.qrCodeGenerated,
      this.journeyItinerary,
      this.qrCodeView});

  EventZoneStatus.fromJson(Map<String, dynamic> json) {
    journeyItinerary = json['journey_itinerary'];
    student_code = json['student_code'];
    status = json['status'];
    trackApplication = json['track_application'];
    expressPass = json['express_pass'];
    markAttendance = json['mark_attendance'];
    if (json['campaign_details'] != null) {
      campaignDetails = <CampaignDetails>[];
      json['campaign_details'].forEach((v) {
        campaignDetails!.add(CampaignDetails.fromJson(v));
      });
    }
    expressPassGenerated = json['express_pass_generated'];
    expressPassView = json['express_pass_view'];
    searchCourse = json['search_course'];
    shortlist = json['shortlist'];
    applicationShortlist = json['application_shortlist'];
    planYourFunds = json['plan_your_funds'];
    countryGuide = json['country_guide'];
    qrCodeGenerated = json['qr_code_generated'];
    qrCodeView = json['qr_code_view'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['student_code'] = student_code;
    data['track_application'] = trackApplication;
    data['express_pass'] = expressPass;
    data['mark_attendance'] = markAttendance;
    data['campaign_details'] = campaignDetails;
    data['express_pass_generated'] = expressPassGenerated;
    data['express_pass_view'] = expressPassView;
    data['search_course'] = searchCourse;
    data['shortlist'] = shortlist;
    data['application_shortlist'] = applicationShortlist;
    data['plan_your_funds'] = planYourFunds;
    data['country_guide'] = countryGuide;
    data['qr_code_generated'] = qrCodeGenerated;
    data['qr_code_view'] = qrCodeView;
    data['journey_itinerary'] = journeyItinerary;
    return data;
  }
}

class CampaignDetails {
  String? campaignName;
  int? id;

  CampaignDetails({this.campaignName, this.id});

  CampaignDetails.fromJson(Map<String, dynamic> json) {
    campaignName = json['campaign_name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['campaign_name'] = campaignName;
    data['id'] = id;
    return data;
  }
}
