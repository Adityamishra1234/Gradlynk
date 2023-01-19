class DataUpdateStatus {
  String? status;
  String? data;
  String? name;

  DataUpdateStatus({this.status, this.data, this.name});

  DataUpdateStatus.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['data'] = this.data;
    data['name'] = name;
    return data;
  }
}
