import 'package:flutter/material.dart';
import 'package:my_learning_app/model/model.dart';

class FavouriteProvider with ChangeNotifier {
  bool _isFavourite = false;
  bool get isFavourite => _isFavourite;
  List<Product> favouriteItem = [];

  get _favouriteItem => favouriteItem;

  set isFavourite(bool value) {
    isFavourite = value;
    notifyListeners();
  }

  addItemToFavourite(Product product) {
    if (!isExist(product)) {
      favouriteItem.add(product);
      notifyListeners();
    }
  }

  removeItemFromFavourite(int id) {
    final index = favouriteItem.indexWhere((e) => e.id == id);
    favouriteItem.removeAt(index);
    notifyListeners();
  }

  bool isExist(Product product) {
    return favouriteItem.contains(product);
  }
}
