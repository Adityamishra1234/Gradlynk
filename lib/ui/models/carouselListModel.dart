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
  String? day;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['priorty'] = priorty;
    data['image'] = image;
    data['mobile_image'] = mobileImage;
    data['image_link'] = imageLink;
    data['heading'] = heading;
    data['sub_heading'] = subHeading;
    data['button_name'] = buttonName;
    data['button_link'] = buttonLink;
    data['banner_until'] = bannerUntil;
    data['day'] = day;
    data['active'] = active;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
