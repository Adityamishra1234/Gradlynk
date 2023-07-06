// To parse this JSON data, do
//
//     final receiveACallbackModel = receiveACallbackModelFromJson(jsonString);

import 'dart:convert';

List<ReceiveACallbackModel> receiveACallbackModelFromJson(String str) =>
    List<ReceiveACallbackModel>.from(
        json.decode(str).map((x) => ReceiveACallbackModel.fromJson(x)));

String receiveACallbackModelToJson(List<ReceiveACallbackModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReceiveACallbackModel {
  int id;
  String name;

  ReceiveACallbackModel({
    required this.id,
    required this.name,
  });

  factory ReceiveACallbackModel.fromJson(Map<String, dynamic> json) =>
      ReceiveACallbackModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
