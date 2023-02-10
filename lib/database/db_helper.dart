import 'package:my_learning_app/model/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

// https://blog.logrocket.com/building-shopping-cart-flutter/

class DBHelper {
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDatabase();
    return null;
  }

  initDatabase() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'cart.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  // creating database table
  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE product(id INTEGER PRIMARY KEY, image TEXT,title TEXT, price DOUBLE, bgColor Color, type TEXT, description TEXT)');
  }

  // inserting data to database
  Future<Product> insert(Product product) async {
    var dbClient = await database;
    await dbClient!.insert('product', product.toMap());
    return product;
  }

  // getting all the items in the list from the database
  Future<List<Product>> getProductList() async {
    var dbClient = await database;
    final List<Map<String, Object?>> queryResult =
        await dbClient!.query('product');
    return queryResult.map((e) => Product.fromMap(e)).toList();
  }
}
