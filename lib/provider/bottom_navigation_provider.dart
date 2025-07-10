import 'package:flutter/widgets.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  set setIndex(int value) {
    _index = value;
    notifyListeners();
  }
}