import 'package:flutter/material.dart';

import 'package:my_learning_app/model/model.dart';
import 'package:my_learning_app/utils/utils.dart';

class DetailsScreenArgument {
  final Product product;
  DetailsScreenArgument({
    required this.product,
  });
}

class DetailsScreen extends StatelessWidget {
  final DetailsScreenArgument productArgument;
  DetailsScreen({
    Key? key,
    required this.productArgument,
  }) : super(key: key);
  static const routeName = '/detail-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: productArgument.product.bgColor,
      body: Column(
        children: [buildAppBar(context), buildContent()],
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
              productArgument.product.title,
              maxLines: 3,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ]),
    );
  }

  Widget buildContent() {
    return Column(
      children: [
        Image.asset(
          productArgument.product.image,
          // height: ScreenUtils.scaleValueH(250),
          // fit: BoxFit.fill,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: ScreenUtils.scaleValueH(180)),
          decoration: BoxDecoration(
              color: AppColor.aquaBlue.withOpacity(0.2),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(ScreenUtils.scaleValue(30)),
                  topRight: Radius.circular(ScreenUtils.scaleValue(30)))),
        )
      ],
    );
  }
}
