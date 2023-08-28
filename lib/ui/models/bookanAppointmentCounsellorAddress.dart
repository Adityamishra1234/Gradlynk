class BookAnAppointmentCounsellorAddress {
  String? branchName;
  int? id;
  String? name;
  int? branchId;
  Address? address;

  BookAnAppointmentCounsellorAddress(
      {this.branchName, this.id, this.name, this.branchId, this.address});

  BookAnAppointmentCounsellorAddress.fromJson(Map<String, dynamic> json) {
    branchName = json['branch_name'];
    id = json['id'];
    name = json['name'];
    branchId = json['branch_id'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branch_name'] = this.branchName;
    data['id'] = this.id;
    data['name'] = this.name;
    data['branch_id'] = this.branchId;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}

class Address {
  int? id;
  String? name;
  String? address;
  String? link;
  String? imageLink;

  Address({this.id, this.name, this.address, this.link, this.imageLink});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    link = json['link'];
    imageLink = json['image_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['link'] = this.link;
    data['image_link'] = this.imageLink;
    return data;
  }
}
