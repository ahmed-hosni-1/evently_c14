import 'package:flutter/material.dart';

class AppCategory {
  int id;
  String name;
  String image;
  Widget icon;

  AppCategory(
      {required this.id,
      required this.name,
      required this.image,
      required this.icon});

  static List<AppCategory> categories = [
    AppCategory(
        id: 1,
        name: "Sport",
        image: "assets/images/sport.png",
        icon: const Icon(Icons.sports_baseball)),
    AppCategory(
        id: 2,
        name: "Birthday",
        image: "assets/images/birthday.png",
        icon: const Icon(Icons.bedroom_baby_outlined)),
    AppCategory(
        id: 3,
        name: "Meeting",
        image: "assets/images/meeting.png",
        icon: const Icon(Icons.meeting_room)),
    AppCategory(
        id: 4,
        name: "Gaming",
        image: "assets/images/gaming.png",
        icon: const Icon(Icons.games)),
    AppCategory(
        id: 5,
        name: "Eating",
        image: "assets/images/eating.png",
        icon: const Icon(Icons.fastfood_rounded)),
    AppCategory(
        id: 6,
        name: "Holiday",
        image: "assets/images/holiday.png",
        icon: const Icon(Icons.holiday_village_outlined)),
    AppCategory(
        id: 7,
        name: "Exhibition",
        image: "assets/images/exhibition.png",
        icon: const Icon(Icons.extension)),
    AppCategory(
        id: 8,
        name: "WorkShop",
        image: "assets/images/workshop.png",
        icon: const Icon(Icons.workspaces_sharp)),
    AppCategory(
        id: 9,
        name: "Book Club",
        image: "assets/images/book_club.png",
        icon: const Icon(Icons.book)),
  ];
}
