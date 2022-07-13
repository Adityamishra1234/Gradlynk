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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branch_id'] = this.branchId;
    data['date'] = this.date;
    data['holiday_reason'] = this.holidayReason;
    return data;
  }
}
