class eventModuleModel {
  String? status;
  List<DocumentsListIdentity>? documentsListIdentity;
  List<DocumentsListIdentity>? documentsListAcedmic;
  DocumentsAcedmicData? documentsIdentityData;
  DocumentsAcedmicData? documentsAcedmicData;

  eventModuleModel(
      {this.status,
      this.documentsListIdentity,
      this.documentsListAcedmic,
      this.documentsIdentityData,
      this.documentsAcedmicData});

  eventModuleModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['documentsListIdentity'] != null) {
      documentsListIdentity = <DocumentsListIdentity>[];
      json['documentsListIdentity'].forEach((v) {
        documentsListIdentity!.add(DocumentsListIdentity.fromJson(v));
      });
    }
    if (json['documentsListAcedmic'] != null) {
      documentsListAcedmic = <DocumentsListIdentity>[];
      json['documentsListAcedmic'].forEach((v) {
        documentsListAcedmic!.add(DocumentsListIdentity.fromJson(v));
      });
    }
    documentsIdentityData = json['documentsIdentityData'] != null
        ? DocumentsAcedmicData.fromJson(json['documentsIdentityData'])
        : null;
    documentsAcedmicData = json['documentsAcedmicData'] != null
        ? DocumentsAcedmicData.fromJson(json['documentsAcedmicData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (documentsListIdentity != null) {
      data['documentsListIdentity'] =
          documentsListIdentity!.map((v) => v.toJson()).toList();
    }
    if (documentsListAcedmic != null) {
      data['documentsListAcedmic'] =
          documentsListAcedmic!.map((v) => v.toJson()).toList();
    }
    data['documentsIdentityData'] = documentsIdentityData;
    if (documentsAcedmicData != null) {
      data['documentsAcedmicData'] = documentsAcedmicData!.toJson();
    }
    return data;
  }
}

class DocumentsListIdentity {
  int? id;
  String? name;

  DocumentsListIdentity({this.id, this.name});

  DocumentsListIdentity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class DocumentsAcedmicData {
  String? documentName;
  String? view;

  DocumentsAcedmicData({this.documentName, this.view});

  DocumentsAcedmicData.fromJson(Map<String, dynamic> json) {
    documentName = json['document_name'];
    view = json['view'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['document_name'] = documentName;
    data['view'] = view;
    return data;
  }
}
