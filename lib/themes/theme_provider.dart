import 'package:flutter/material.dart';
import 'package:msg_app/themes/dark_mode.dart';
import 'package:msg_app/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMmode => _themeData == darkMode;

  set themeData (ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  } 

  void toogleTheme(){
    if(_themeData == lightMode){
      themeData = darkMode;
    }
    else{
      themeData = lightMode;
    }
  }
}