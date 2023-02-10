import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:my_learning_app/provider/src/cart_provider.dart';
import 'package:my_learning_app/utils/utils.dart';
import 'package:my_learning_app/widget/widget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  TextTheme get textTheme => Theme.of(context).textTheme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: AppColor.white,
      ),
      body: Consumer<CartProvider>(builder: (context, provider, widget) {
        if (provider.cartItem.isEmpty) {
          return Center(
            heightFactor: ScreenUtils.scaleValueH(18),
            child: Text(
              'Your Cart is Empty',
              style: textTheme.headline5?.copyWith(color: AppColor.aquaBlue),
            ),
          );
        }
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtils.scaleValueW(5),
              vertical: ScreenUtils.scaleValueH(5)),
          child: ListView.builder(
            itemCount: provider.cartItem.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: AppColor.aquaBlue.withOpacity(0.3),
                child: Row(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtils.scaleValueW(5)),
                    child: Image(
                        height: ScreenUtils.scaleValueH(80),
                        width: ScreenUtils.scaleValueW(60),
                        image: AssetImage(provider.cartItem[index].image)),
                  ),
                  Container(
                    width: ScreenUtils.scaleValueW(180),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                                text: 'Name:',
                                style: textTheme.bodyLarge,
                                children: [
                                  TextSpan(
                                      text: provider.cartItem[index].title,
                                      style: textTheme.bodyText1?.copyWith(
                                          fontWeight: FontWeight.bold))
                                ])),
                        RichText(
                            text: TextSpan(
                                text: 'Price:',
                                style: textTheme.bodyLarge,
                                children: [
                              TextSpan(
                                  text:
                                      provider.cartItem[index].price.toString(),
                                  style: textTheme.bodyText1
                                      ?.copyWith(fontWeight: FontWeight.bold))
                            ]))
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      SnackBarService().show(
                          text:
                              '${provider.cartItem[index].title} has been removed',
                          actionOnPressed: () {},
                          actionText: 'Close',
                          context: context);
                      provider.removeTotalPrice(provider.cartItem[index].price);
                      provider.removeItemFromCart(provider.cartItem[index].id);
                    },
                    icon: const Icon(Icons.delete),
                    color: AppColor.red,
                  ),
                  Text(provider.getTotalPrice().toString())
                ]),
              );
            },
          ),
        );
      }),
    );
  }
}
