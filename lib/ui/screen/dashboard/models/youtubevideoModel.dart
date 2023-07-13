class YoutubeVideoModel {
  String? video;
  String? thumbnail;

  YoutubeVideoModel({this.video, this.thumbnail});

  YoutubeVideoModel.fromJson(Map<String, dynamic> json) {
    video = json['video'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['video'] = video;
    data['thumbnail'] = thumbnail;
    return data;
  }
}
