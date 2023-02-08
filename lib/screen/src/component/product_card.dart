import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_learning_app/utils/utils.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final double price;
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
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 154,
        padding: const EdgeInsets.all(10 / 2),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            Container(
              height: ScreenUtils.scaleValueH(70),
              width: double.infinity,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Image.asset(
                image,
                height: ScreenUtils.screenHeight * 0.15,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 10 / 2),
            Expanded(
              child: Text(
                title,
                style: textTheme.bodySmall,
              ),
            ),
            const SizedBox(width: 10 / 4),
            Text(
              "\$$price",
              style: textTheme.subtitle2,
            )
          ],
        ),
      ),
    );
  }
}
