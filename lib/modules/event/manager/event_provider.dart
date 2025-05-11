import 'package:evently_c14/core/constant/app_category.dart';
import 'package:evently_c14/core/models/event_model.dart';
import 'package:evently_c14/core/services/firebase_services.dart';
import 'package:flutter/material.dart';

class EventProvider extends ChangeNotifier{
  int selectedIndex = 0;
  DateTime? eventDate;
  TimeOfDay? eventTime;

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  void onSelectDate(DateTime date){
    eventDate = date;
    notifyListeners();
  }

  void onSelectedTime(TimeOfDay time){
    eventTime = time;
    notifyListeners();
  }


  void onTap(int value){
    selectedIndex = value;
    notifyListeners();
  }

  bool isLoading = false;


  Future<void> addEvent()async{
    isLoading = true;
    notifyListeners();
    var category = AppCategory.categories[selectedIndex];
    EventModel model = EventModel(
        time: eventTime!.hourOfPeriod, title: titleController.text,
        desc: descController.text,
        categoryId: category.id.toString(),
        categoryImage: category.image,
        eventDate: eventDate!);


   await FireBaseFireStoreServices.addEvent(model);
   isLoading = false;
   notifyListeners();
  }


}
