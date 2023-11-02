class FeedBackModel {
  String? enqId;
  String? eventId;
  List<dynamic>? suggestion;
  List<dynamic>? complaint;
  List<dynamic>? compliment;
  String? rating;
  String? feedback;
  bool? optUpdate;

  FeedBackModel(
      {this.enqId,
      this.eventId,
      this.suggestion,
      this.complaint,
      this.compliment,
      this.rating,
      this.feedback,
      this.optUpdate});

  FeedBackModel.fromJson(Map<String, dynamic> json) {
    enqId = json['enq_id'];
    eventId = json['event_id'];
    if (json['suggestion'] != dynamic) {
      suggestion = json['suggestion'].cast<String>();
    }
    if (json['complaint'] != dynamic) {
      complaint = json['complaint'].cast<String>();
    }
    compliment = json['compliment'].cast<String>();
    rating = json['rating'];
    feedback = json['feedback'];
    optUpdate = json['optUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['enq_id'] = enqId;
    data['event_id'] = eventId;
    if (suggestion != dynamic) {
      data['suggestion'] = suggestion ?? [];
    }
    if (complaint != dynamic) {
      data['complaint'] = complaint ?? [];
    }
    data['compliment'] = compliment ?? [];
    data['rating'] = rating;
    data['feedback'] = feedback;
    data['optUpdate'] = optUpdate;
    return data;
  }
}
