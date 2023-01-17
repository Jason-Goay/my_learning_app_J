import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier {
  bool _isFavourite = false;
  bool get isFavourite => _isFavourite;

  set isFavourite(bool value) {
    isFavourite = value;
    notifyListeners();
  }
}
