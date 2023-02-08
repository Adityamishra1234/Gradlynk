class FileUploadStatus {
  String? status;
  String? data;
  String? viewLink;
  String? downloadLink;

  FileUploadStatus({this.status, this.data, this.viewLink, this.downloadLink});

  FileUploadStatus.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    viewLink = json['view_link'];
    downloadLink = json['download_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['data'] = this.data;
    data['view_link'] = viewLink;
    data['download_link'] = downloadLink;
    return data;
  }
}
