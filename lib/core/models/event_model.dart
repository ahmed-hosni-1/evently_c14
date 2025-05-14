import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EventModel {
  String? userId;
  String? id;
  String title;
  String desc;
  DateTime eventDate;
  int time;
  String categoryId;
  String categoryImage;
  bool isFav;

  EventModel(
      {this.userId,
      this.id,
      required this.time,
      required this.title,
      required this.desc,
      required this.categoryId,
      required this.categoryImage,
      required this.eventDate,
      this.isFav = false}) {
    userId = FirebaseAuth.instance.currentUser?.uid;
  }

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json["id"],
      title: json["title"],
      categoryId: json["category_id"],
      categoryImage: json["category_image"],
      time: json["time"],
      eventDate: DateTime.fromMillisecondsSinceEpoch(json["eventDate"]),
      desc: json["desc"],
      userId: json["user_id"],
      isFav: json["is_fav"] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "id": id,
      "title": title,
      "desc": desc,
      "eventDate": eventDate.millisecondsSinceEpoch,
      "time": time,
      "category_id": categoryId,
      "category_image": categoryImage,
      "is_fav": isFav,
    };
  }
}
