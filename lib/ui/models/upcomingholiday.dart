class UpcomingHoliday {
  int? branchId;
  String? date;
  String? holidayReason;

  UpcomingHoliday({this.branchId, this.date, this.holidayReason});

  UpcomingHoliday.fromJson(Map<String, dynamic> json) {
    branchId = json['branch_id'];
    date = json['date'];
    holidayReason = json['holiday_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['branch_id'] = branchId;
    data['date'] = date;
    data['holiday_reason'] = holidayReason;
    return data;
  }
}
