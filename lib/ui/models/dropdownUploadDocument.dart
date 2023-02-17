class DropDownDocumentName {
  int? id;
  String? documentName;

  DropDownDocumentName({this.id, this.documentName});

  DropDownDocumentName.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    documentName = json['document_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['document_name'] = documentName;
    return data;
  }
}
