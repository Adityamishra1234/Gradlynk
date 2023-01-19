class UpcomingEvent {
  String? campaignName;
  String? campaignDate;

  UpcomingEvent({this.campaignName, this.campaignDate});

  UpcomingEvent.fromJson(Map<String, dynamic> json) {
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
