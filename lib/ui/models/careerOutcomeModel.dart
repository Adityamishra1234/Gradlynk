class CareerOutcomeModel {
  String? careerOutcome;
  int? id;

  CareerOutcomeModel({this.careerOutcome, this.id});

  CareerOutcomeModel.fromJson(Map<String, dynamic> json) {
    careerOutcome = json['career_outcome'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['career_outcome'] = this.careerOutcome;
    data['id'] = this.id;
    return data;
  }
}
