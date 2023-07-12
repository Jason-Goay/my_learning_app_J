import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:my_learning_app/model/model.dart';
import 'package:my_learning_app/provider/provider.dart';
import 'package:my_learning_app/provider/src/cart_provider.dart';
import 'package:my_learning_app/utils/utils.dart';
import 'package:my_learning_app/widget/widget.dart';
import 'package:provider/provider.dart';

class DetailsScreenArgument {
  final Product product;
  DetailsScreenArgument({
    required this.product,
  });
}

class DetailsScreen extends StatefulWidget {
  final DetailsScreenArgument productArgument;
  DetailsScreen({
    Key? key,
    required this.productArgument,
  }) : super(key: key);
  static const routeName = '/detail-screen';

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  FavouriteProvider get favouriteProvider => context.read<FavouriteProvider>();
  CartProvider get cartProvider => context.read<CartProvider>();
  TextTheme get textTheme => Theme.of(context).textTheme;

  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.productArgument.product.bgColor,
      body: SingleChildScrollView(
        child: Column(children: [
          buildAppBar(context),
          buildContent(context),
        ]),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    var isFavourite = context.select<FavouriteProvider, bool>((favouritepage) =>
        favouritepage.favouriteItem.contains(widget.productArgument.product));
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtils.scaleValue(12),
          vertical: ScreenUtils.scaleValue(35)),
      child: Row(children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.pop();
            // Navigator.pop(context);
          },
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: ScreenUtils.scaleValue(20)),
            child: Text(
              widget.productArgument.product.title,
              maxLines: 3,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.favorite_rounded,
            color: isFavourite ? AppColor.red : AppColor.white,
          ),
          onPressed: isFavourite
              ? () {
                  SnackBarService().show(
                      context: context,
                      text:
                          "${widget.productArgument.product.title} has been removed to favourite sreen",
                      actionText: 'Close',
                      actionOnPressed: () {});
                  favouriteProvider.removeItemFromFavourite(
                      widget.productArgument.product.id);
                }
              : () {
                  SnackBarService().show(
                      context: context,
                      text:
                          "${widget.productArgument.product.title} has been added to favourite sreen",
                      actionText: 'Close',
                      actionOnPressed: () {});
                  favouriteProvider
                      .addItemToFavourite(widget.productArgument.product);
                },
        ),
      ]),
    );
  }

  Widget buildContent(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          widget.productArgument.product.image,
          height: ScreenUtils.scaleValueH(200),

          // fit: BoxFit.fill,
        ),
        SizedBox(
          height: ScreenUtils.scaleValueH(30),
        ),
        Container(
          height: ScreenUtils.screenHeight * 0.4,
          width: ScreenUtils.screenWidth,
          decoration: BoxDecoration(
              color: AppColor.aquaBlue.withOpacity(0.2),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(ScreenUtils.scaleValue(30)),
                  topRight: Radius.circular(ScreenUtils.scaleValue(30)))),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.productArgument.product.title,
                  style: textTheme.headlineSmall,
                ),
                Text(
                  '\$${widget.productArgument.product.price.toString()}',
                  style: textTheme.titleLarge,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
                  child: Text(
                    widget.productArgument.product.description,
                    style: textTheme.bodyLarge,
                  ),
                ),
                buildQuantityButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildQuantityButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: cartProvider.decrementQuantity,
              icon: Icon(Icons.remove),
            ),
            SizedBox(
              width: ScreenUtils.scaleValueW(15),
            ),
            Text('${cartProvider.quantity}'),
            SizedBox(
              width: ScreenUtils.scaleValueW(15),
            ),
            IconButton(
                onPressed: cartProvider.incrementQuantity,
                icon: const Icon(Icons.add)),
            SizedBox(
              width: ScreenUtils.scaleValueW(15),
            ),
          ],
        ),
        CustomElevatedButton(
          onPressed: () {
            SnackBarService().show(
                context: context,
                text: cartProvider.isExist(widget.productArgument.product)
                    ? '${widget.productArgument.product.title} existed in cart'
                    : '${widget.productArgument.product.title} added to cart',
                actionText: 'Close',
                actionOnPressed: () {});
            cartProvider.addItemToCart(widget.productArgument.product);
          },
          minimumSize: 10,
          child: const Text('Add to Cart'),
        )
      ],
    );
  }

  void _incrementQuantity() {
    setState(() {
      numOfItems++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (numOfItems > 1) {
        numOfItems--;
      }
    });
  }
}
