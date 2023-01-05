import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductCard extends StatefulWidget {
  final String image;
  final String title;
  final String price;
  final VoidCallback onTap;
  final Color bgColor;
  const ProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.onTap,
    required this.bgColor,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

// https://github.com/abuanwar072/Flutter-Shop-UI-Kit/blob/master/lib/screens/home/components/product_card.dart
class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(),
    );
  }
}
