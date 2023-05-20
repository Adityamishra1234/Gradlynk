class CarouselListModel {
  int? id;
  int? priorty;
  String? image;
  String? mobileImage;
  String? imageLink;
  String? heading;
  String? subHeading;
  String? buttonName;
  String? buttonLink;
  String? bannerUntil;
  Null? day;
  int? active;
  String? createdAt;
  String? updatedAt;

  CarouselListModel(
      {this.id,
      this.priorty,
      this.image,
      this.mobileImage,
      this.imageLink,
      this.heading,
      this.subHeading,
      this.buttonName,
      this.buttonLink,
      this.bannerUntil,
      this.day,
      this.active,
      this.createdAt,
      this.updatedAt});

  CarouselListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    priorty = json['priorty'];
    image = json['image'];
    mobileImage = json['mobile_image'];
    imageLink = json['image_link'];
    heading = json['heading'];
    subHeading = json['sub_heading'];
    buttonName = json['button_name'];
    buttonLink = json['button_link'];
    bannerUntil = json['banner_until'];
    day = json['day'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['priorty'] = this.priorty;
    data['image'] = this.image;
    data['mobile_image'] = this.mobileImage;
    data['image_link'] = this.imageLink;
    data['heading'] = this.heading;
    data['sub_heading'] = this.subHeading;
    data['button_name'] = this.buttonName;
    data['button_link'] = this.buttonLink;
    data['banner_until'] = this.bannerUntil;
    data['day'] = this.day;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
