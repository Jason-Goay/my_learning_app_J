import 'package:flutter/material.dart';
import 'package:my_learning_app/database/db_helper.dart';
import 'package:my_learning_app/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  DBHelper dbHelper = DBHelper();

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  int _counter = 0;
  int get counter => _counter;
  int _quantity = 1;
  int get quantity => _quantity;

  List<Product> cartItem = [];

  get _cartItem => cartItem;

  Future<List<Product>> getData() async {
    cartItem = await dbHelper.getProductList();
    notifyListeners();
    return cartItem;
  }

  void _setPrefsItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', _counter);
    prefs.setInt('item_quantity', _quantity);
    prefs.setDouble("total_price", _totalPrice);
    notifyListeners();
  }

  void getPrefsItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_item') ?? 0;
    _quantity = prefs.getInt('item_quantity') ?? 1;
    _totalPrice = prefs.getDouble('total_price') ?? 0;
  }

  addItemToCart(Product product) {
    cartItem.add(product);
    notifyListeners();
  }

  removeItemFromCart(int id) {
    final index = cartItem.indexWhere((e) => e.id == id);

    cartItem.removeAt(index);
    notifyListeners();
  }

  void addTotalPrice(double productPrice) {
    _totalPrice = _totalPrice + productPrice;
    _setPrefsItem();
    notifyListeners();
  }

  void removeTotalPrice(double productPrice) {
    _totalPrice = _totalPrice - productPrice;
    _setPrefsItem();
    notifyListeners();
  }

  double getTotalPrice() {
    getPrefsItem();
    return _totalPrice;
  }

  // void addQuantity(int id) {
  //   final index = cartItem.indexWhere((e) => e.id == id);
  //   cartItem
  // }
}
