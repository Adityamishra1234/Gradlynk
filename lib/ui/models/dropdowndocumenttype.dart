class DropDownDocumentType {
  int? id;
  String? documentType;

  DropDownDocumentType({this.id, this.documentType});

  DropDownDocumentType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    documentType = json['document_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['document_type'] = this.documentType;
    return data;
  }
}
