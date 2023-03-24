class UpcomingEventModel {
  String? campaignName;
  String? campaignDate;

  UpcomingEventModel({this.campaignName, this.campaignDate});

  UpcomingEventModel.fromJson(Map<String, dynamic> json) {
    campaignName = json['campaign_name'];
    campaignDate = json['campaign_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['campaign_name'] = campaignName;
    data['campaign_date'] = campaignDate;
    return data;
  }
}
