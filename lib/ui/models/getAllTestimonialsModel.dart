class GetAllTestimonialsModel {
  int? id;
  String? image;
  String? comment;
  String? name;
  int? rating;
  String? enquiry;

  GetAllTestimonialsModel(
      {this.id,
      this.image,
      this.comment,
      this.name,
      this.rating,
      this.enquiry});

  GetAllTestimonialsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    comment = json['comment'];
    name = json['name'];
    rating = json['rating'];
    enquiry = json['enquiry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['comment'] = this.comment;
    data['name'] = this.name;
    data['rating'] = this.rating;
    data['enquiry'] = this.enquiry;
    return data;
  }
}
