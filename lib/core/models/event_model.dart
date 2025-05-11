import 'package:flutter/material.dart';

class EventModel {
   String? id;
  String title;
  String desc;
  DateTime eventDate;
  int time;
  String categoryId;
  String categoryImage;

  EventModel({
     this.id,
    required this.time,
    required this.title,
    required this.desc,
    required this.categoryId,
    required this.categoryImage,
    required this.eventDate,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
        id: json["id"],
        title: json["title"],
        categoryId: json["category_id"],
        categoryImage: json["category_image"],
        time: json["time"],
        eventDate: DateTime.fromMillisecondsSinceEpoch(json["eventDate"]),
        desc: json["desc"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "desc": desc,
      "eventDate": eventDate.millisecondsSinceEpoch,
      "time": time,
      "category_id": categoryId,
      "category_image": categoryImage,
    };
  }
}
