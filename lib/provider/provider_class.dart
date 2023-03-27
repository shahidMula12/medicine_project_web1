import 'package:flutter/material.dart';
import 'package:medicine_project/utils/screen_names.dart';

class ProviderClass extends ChangeNotifier {
  String selectedScreen = DASHBOARD;

  changeScreen(screen) {
    selectedScreen = screen;
    notifyListeners();
  }
}
