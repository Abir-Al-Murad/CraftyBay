import 'dart:ui';

import 'package:get/get.dart';

class LanguageController extends GetxController{
  Locale _currentLocal = Locale('en');

  List<Locale> _supportedLocales  =  [
    Locale('en'), // English
    Locale('bn'),        // Bangla
  ];

  Locale get currentLocale => _currentLocal;
  List<Locale> get supportedLocales => _supportedLocales;

  void changeLocale(Locale local){
    if(currentLocale == local){
      return;
    }
    _currentLocal = local;
    update();
  }
}