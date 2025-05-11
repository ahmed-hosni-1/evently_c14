import 'package:evently_c14/core/services/shared_service.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String lang  = "en";
  bool isLoading = false;

  void changeTheme(ThemeMode theme) {
    themeMode = theme;
    SharedService.save("theme", theme.name);
    notifyListeners();
  }
  void getTheme()async{
   var theme = await SharedService.getString("theme",);
   themeMode = theme == "dark"? ThemeMode.dark : ThemeMode.light;
   notifyListeners();
  }


  void changeLanguage(String language){
    lang = language;
    SharedService.save("lang", language);
    notifyListeners();
  }

  Future<void> getLang()async{
   lang = await SharedService.getString("lang")??"en";
   notifyListeners();

  }
  Future<void> login()async{
    isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    isLoading = false;
    notifyListeners();
  }
}
