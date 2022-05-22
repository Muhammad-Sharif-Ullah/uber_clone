// To parse this JSON data, do
//
//     final todoMdoel = todoMdoelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TodoModel todoMdoelFromJson(String str) => TodoModel.fromJson(json.decode(str));

String todoMdoelToJson(TodoModel data) => json.encode(data.toJson());

class TodoModel {
  TodoModel({
    required this.title,
    required this.subtitle,
    required this.uuid,
    required this.isCompleted,
  });

  String title;
  String subtitle;
  String uuid;
  bool isCompleted;

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
    title: json["title"],
    subtitle: json["subtitle"],
    uuid: json["uui"],
    isCompleted: json["isCompleted"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subtitle": subtitle,
    "uui": uuid,
    "isCompleted": isCompleted,
  };
}
