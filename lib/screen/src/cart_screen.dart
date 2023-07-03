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
  CartProvider get cartProvider => context.read<CartProvider>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildAppBar(),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildAppBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(
          ScreenUtils.scaleValue(12),
          ScreenUtils.scaleValue(35),
          ScreenUtils.scaleValue(12),
          ScreenUtils.scaleValue(0)),
      child: Row(children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.pop();
            // Navigator.pop(context);
          },
        ),
        Padding(
          padding: EdgeInsets.only(left: ScreenUtils.scaleValue(90)),
          child: const Text(
            "My Cart",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ]),
    );
  }

  Widget buildContent() {
    return Consumer<CartProvider>(builder: (context, provider, widget) {
      return provider.cartItem.isEmpty
          ? Center(
              heightFactor: ScreenUtils.scaleValueH(18),
              child: Text(
                'Your Cart is Empty',
                style: textTheme.headline5?.copyWith(color: AppColor.darkBlue),
              ),
            )
          : Column(
              children: [
                Container(
                  height: ScreenUtils.screenHeight * 0.72,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
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
                                image:
                                    AssetImage(provider.cartItem[index].image)),
                          ),
                          SizedBox(
                            width: ScreenUtils.scaleValueW(160),
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
                                              text: provider
                                                  .cartItem[index].title,
                                              style: textTheme.bodyText1
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold))
                                        ])),
                                RichText(
                                    text: TextSpan(
                                        text: 'Price:',
                                        style: textTheme.bodyLarge,
                                        children: [
                                      TextSpan(
                                          text: provider.cartItem[index].price
                                              .toString(),
                                          style: textTheme.bodyText1?.copyWith(
                                              fontWeight: FontWeight.bold))
                                    ]))
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: cartProvider.decrementQuantity,
                                  icon: const Icon(Icons.remove)),
                              Text('${cartProvider.quantity}'),
                              IconButton(
                                  onPressed: cartProvider.incrementQuantity,
                                  icon: const Icon(Icons.add)),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              SnackBarService().show(
                                  text:
                                      '${provider.cartItem[index].title} has been removed',
                                  actionOnPressed: () {},
                                  actionText: 'Close',
                                  context: context);
                              provider.removeTotalPrice(
                                  provider.cartItem[index].price);
                              provider.removeItemFromCart(
                                  provider.cartItem[index].id);
                            },
                            icon: const Icon(Icons.delete),
                            color: AppColor.red,
                          ),
                        ]),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtils.scaleValue(10),
                      vertical: ScreenUtils.scaleValue(25)),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColor.aquaBlue),
                    padding: EdgeInsets.all(ScreenUtils.scaleValue(24)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Total Price:'),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              provider.totalPrice.toString(),
                              style: textTheme.headline6,
                            )
                          ],
                        ),
                        CustomElevatedButton(
                          onPressed: () {},
                          minimumSize: 30,
                          child: const Text('PAY NOW'),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
    });
  }
}
