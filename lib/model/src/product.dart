import 'package:flutter/material.dart';
import 'package:my_learning_app/utils/utils.dart';

class Product {
  final String image, title;
  final int id;
  final double price;
  final Color bgColor;
  final String type;
  final String description;
  Product(
      {required this.image,
      required this.title,
      required this.id,
      required this.price,
      this.bgColor = const Color(0xFFEFEFF2),
      required this.type,
      required this.description});

  Product.fromMap(Map<dynamic, dynamic> data)
      : id = data['id'],
        image = data['image'],
        title = data['title'],
        price = data['price'],
        bgColor = data['bgColor'],
        type = data['type'],
        description = data['description'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'price': price,
      'bgColor': bgColor,
      'type': type,
      'description': description
    };
  }
}

List<Product> product = [
  Product(
      id: 0,
      image: AppAssets.shirt0,
      title: "Long Sleeve Shirts",
      price: 165,
      bgColor: const Color(0xFFFEFBF9),
      type: 'Shirt',
      description: dummyText),
  Product(
      id: 1,
      image: AppAssets.shirt1,
      title: "Casual Henley Shirts",
      price: 99,
      type: 'Shirt',
      description: dummyText),
  Product(
      id: 2,
      image: AppAssets.shirt2,
      title: "Curved Hem Shirts",
      price: 180,
      bgColor: const Color(0xFFF8FEFB),
      type: 'Shirt',
      description: dummyText),
  Product(
      id: 3,
      image: AppAssets.shirt3,
      title: "Casual Nolin",
      price: 149,
      bgColor: const Color(0xFFEEEEED),
      type: 'Shirt',
      description: dummyText),
  Product(
      id: 4,
      image: AppAssets.shirt4,
      title: "FORMAL SHIRT",
      price: 109,
      bgColor: const Color(0xFFEEEEED),
      type: 'Shirt',
      description: dummyText),
  Product(
      id: 5,
      image: AppAssets.shirt5,
      title: "U CREW NECK SHORT SLEEVE T_SHIRT",
      price: 159,
      bgColor: const Color(0xFFEEEEED),
      type: 'Shirt',
      description: dummyText),
  Product(
      id: 6,
      image: AppAssets.shirt5,
      title: "U CREW NECK SHORT SLEEVE T_SHIRT",
      price: 159,
      bgColor: const Color(0xFFEEEEED),
      type: 'Shirt',
      description: dummyText),
  Product(
      id: 7,
      image: AppAssets.shoes0,
      title: "SUPERSTAR SHOES",
      price: 449,
      bgColor: const Color(0xFFEEEEED),
      type: 'Shoes',
      description: dummyText),
  Product(
      id: 8,
      image: AppAssets.shoes1,
      title: "NIKE DEFY ALL MEN's TRAINING SHOE",
      price: 225,
      bgColor: const Color(0xFFEEEEED),
      type: 'Shoes',
      description: dummyText),
  Product(
      id: 9,
      image: AppAssets.shoes2,
      title: "SHOE SENSE FORMAL MEN BLACK FASHION LACE UP SHOES",
      price: 179,
      bgColor: const Color(0xFFEEEEED),
      type: 'Shoes',
      description: dummyText),
  Product(
      id: 10,
      image: AppAssets.shoes3,
      title: "BRUTON TENDY SPORTS SHOES FOR MEN",
      price: 169,
      bgColor: const Color(0xFFEEEEED),
      type: 'Shoes',
      description: dummyText),
  Product(
      id: 11,
      image: AppAssets.shoes4,
      title: "ULTRABOOST 22 SHOES",
      price: 869,
      bgColor: const Color(0xFFEEEEED),
      type: 'Shoes',
      description: dummyText),
  Product(
      id: 12,
      image: AppAssets.watch0,
      title: "GALAXY WATCH4 44MM BLUETOOTH",
      price: 869,
      bgColor: const Color(0xFFEEEEED),
      type: 'Watch',
      description: dummyText),
  Product(
      id: 13,
      image: AppAssets.watch1,
      title: "DANIEL WELLINGTON CLASSIC CAMBRIDGE",
      price: 672,
      bgColor: const Color(0xFFEEEEED),
      type: 'Watch',
      description: dummyText),
  Product(
      id: 14,
      image: AppAssets.watch2,
      title: "PRINNACLE RO SERIES WATCH BLACK MEN",
      price: 899,
      bgColor: const Color(0xFFEEEEED),
      type: 'Watch',
      description: dummyText),
  Product(
      id: 15,
      image: AppAssets.dress0,
      title: "SUNNYDAYSWEETY KOREAN STYLE LADIES OFF SHOLDER DRESS",
      price: 139,
      bgColor: const Color(0xFFEEEEED),
      type: 'Dress',
      description: dummyText),
  Product(
      id: 16,
      image: AppAssets.dress1,
      title: "URBAN OUTLIER SLEEVELESS OFFICE DRESS LADY",
      price: 159,
      bgColor: const Color(0xFFEEEEED),
      type: 'Dress',
      description: dummyText),
  Product(
      id: 17,
      image: AppAssets.dress2,
      title: "JACKIE PLAIN DRESS",
      price: 99,
      bgColor: const Color(0xFFEEEEED),
      type: 'Dress',
      description: dummyText),
  Product(
      id: 18,
      image: AppAssets.dress3,
      title: "KOREAN STYLE ELEGANT LONG_SLEEVED DRESS",
      price: 109,
      bgColor: const Color(0xFFEEEEED),
      type: 'Dress',
      description: dummyText),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
