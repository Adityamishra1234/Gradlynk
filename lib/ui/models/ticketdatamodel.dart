class TicketDataModel {
  String? status;
  List<Data>? data;

  TicketDataModel({this.status, this.data});

  TicketDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? enqId;
  String? documentName1;
  String? documentName2;
  String? issue;
  String? suggestion;
  int? queryStatus;
  int? isActive;
  int? createdBy;
  int? updatedBy;

  List<Comments>? comments;

  Data(
      {this.id,
      this.enqId,
      this.documentName1,
      this.documentName2,
      this.issue,
      this.suggestion,
      this.queryStatus,
      this.isActive,
      this.createdBy,
      this.updatedBy,
      this.comments});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enqId = json['enq_id'];
    documentName1 = json['document_name1'];
    documentName2 = json['document_name2'];
    issue = json['issue'];
    suggestion = json['suggestion'];
    queryStatus = json['query_status'];
    isActive = json['is_active'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];

    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['enq_id'] = enqId;
    data['document_name1'] = documentName1;
    data['document_name2'] = documentName2;
    data['issue'] = issue;
    data['suggestion'] = suggestion;
    data['query_status'] = queryStatus;
    data['is_active'] = isActive;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;

    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comments {
  int? id;
  int? queryId;
  String? content;
  String? senderBy;
  int? isActive;
  int? createdBy;
  int? updatedBy;
  // String? createdAt;
  // String? updatedAt;

  Comments({
    this.id,
    this.queryId,
    this.content,
    this.senderBy,
    this.isActive,
    this.createdBy,
    this.updatedBy,
  });

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    queryId = json['query_id'];
    content = json['content'];
    senderBy = json['sender_by'];
    isActive = json['is_active'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['query_id'] = queryId;
    data['content'] = content;
    data['sender_by'] = senderBy;
    data['is_active'] = isActive;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;

    return data;
  }
}
