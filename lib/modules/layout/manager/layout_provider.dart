import 'package:evently_c14/core/constant/app_category.dart';
import 'package:evently_c14/core/models/event_model.dart';
import 'package:evently_c14/modules/layout/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/services/firebase_services.dart';
import '../screens/love_screen.dart';
import '../screens/map_screen.dart';
import '../screens/profile_screen.dart';

class LayoutProvider extends ChangeNotifier {
  User get user => FirebaseAuth.instance.currentUser!;

  List<EventModel> events = [];
  int tabIndex = 0;
  void onChangeTab(int index) {
    tabIndex = index;
    getEvents();
    notifyListeners();
  }

  int selectedIndex = 0;
  void onBtnNavTap(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> screens = [
    HomeScreen(),
    MapScreen(),
    LoveScreen(),
    ProfileScreen(),
  ];

  Future<void> getEvents() async {
    String id = "0";
    if (tabIndex > 0) {
      id = AppCategory.categories[tabIndex - 1].id.toString();
    }
    events.clear();
    var data = await FireBaseFireStoreServices.getEvents(id);
    for (var e in data) {
      events.add(e.data());
    }
    notifyListeners();
  }
}
