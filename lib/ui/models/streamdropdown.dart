class StreamDropDownModel {
  int? id;
  String? streamName;

  StreamDropDownModel({this.id, this.streamName});

  StreamDropDownModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    streamName = json['stream_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['stream_name'] = streamName;
    return data;
  }
}
