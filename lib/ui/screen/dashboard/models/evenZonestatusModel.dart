class EventZoneStatus {
  String? status;
  bool? trackApplication;
  bool? expressPass;
  bool? markAttendance;
  List<CampaignDetails>? campaignDetails;
  bool? expressPassGenerated;
  String? expressPassView;

  EventZoneStatus(
      {this.status,
      this.trackApplication,
      this.expressPass,
      this.markAttendance,
      this.campaignDetails,
      this.expressPassGenerated,
      this.expressPassView});

  EventZoneStatus.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    trackApplication = json['track_application'];
    expressPass = json['express_pass'];
    markAttendance = json['mark_attendance'];
    if (json['campaign_details'] != null) {
      campaignDetails = <CampaignDetails>[];
      json['campaign_details'].forEach((v) {
        campaignDetails!.add(new CampaignDetails.fromJson(v));
      });
    }
    expressPassGenerated = json['express_pass_generated'];
    expressPassView = json['express_pass_view'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['track_application'] = this.trackApplication;
    data['express_pass'] = this.expressPass;
    data['mark_attendance'] = this.markAttendance;
    if (this.campaignDetails != null) {
      data['campaign_details'] =
          this.campaignDetails!.map((v) => v.toJson()).toList();
    }
    data['express_pass_generated'] = this.expressPassGenerated;
    data['express_pass_view'] = this.expressPassView;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['campaign_name'] = this.campaignName;
    data['id'] = this.id;
    return data;
  }
}
