import 'package:flutter/material.dart';

import 'package:my_learning_app/model/model.dart';
import 'package:my_learning_app/provider/provider.dart';
import 'package:my_learning_app/utils/utils.dart';
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
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtils.scaleValue(12),
          vertical: ScreenUtils.scaleValue(35)),
      child: Row(children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
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
            color:
                favouriteProvider.isFavourite ? AppColor.red : AppColor.white,
          ),
          onPressed: () {},
        ),
      ]),
    );
  }

  Widget buildContent(BuildContext context) {
    return
        // Column(
        //   children: [
        // Image.asset(
        //   widget.productArgument.product.image,
        //   // height: ScreenUtils.scaleValueH(250),
        //   // fit: BoxFit.fill,
        // ),
        Container(
      height: ScreenUtils.screenHeight * 0.5,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          vertical: ScreenUtils.screenHeight,
          horizontal: ScreenUtils.screenWidth),
      decoration: BoxDecoration(
          color: AppColor.aquaBlue.withOpacity(0.2),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(ScreenUtils.scaleValue(30)),
              topRight: Radius.circular(ScreenUtils.scaleValue(30)))),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.productArgument.product.title,
                style: TextStyle(color: Colors.red),
              ),
            ],
          )

          // Text(
          //   '${widget.productArgument.product.price}',
          //   style: TextStyle(color: Colors.red),
          // ),
        ],
      ),
      //   ),
      // ],
    );
  }
}
