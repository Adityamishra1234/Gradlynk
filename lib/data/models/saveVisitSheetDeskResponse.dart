class SaveVisitSheetDeskResponse {
  String? status;
  List<Data>? data;
  String? assignedDesk;

  SaveVisitSheetDeskResponse({this.status, this.data, this.assignedDesk});

  SaveVisitSheetDeskResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    if (json['assigned_desk'] != null) {
      assignedDesk = json['assigned_desk'];
      // json['assigned_desk'].forEach((v) {
      //   assignedDesk!.add(v);
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Data {
  String? id;
  int? deskNumber;
  String? userName;

  Data({this.id, this.deskNumber, this.userName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deskNumber = json['desk_number'];
    userName = json['user_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['desk_number'] = this.deskNumber;
    data['user_name'] = this.userName;
    return data;
  }
}
