import 'package:flutter/cupertino.dart';

class HomeScreenViewModel extends ChangeNotifier {
  int dropDownValue = 10;

  void changeDropdownValue(int selectedValue) {
    dropDownValue = selectedValue;
    notifyListeners();
  }

}