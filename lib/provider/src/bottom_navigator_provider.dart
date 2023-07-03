import 'package:flutter/material.dart';

class BottomNavigatorProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int ind) {
    _currentIndex = ind;
    notifyListeners();
  }
}
