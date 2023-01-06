import 'package:flutter/material.dart';

import 'package:my_learning_app/model/model.dart';
import 'package:my_learning_app/utils/utils.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.productArgument.product.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [buildAppBar(), buildContent()],
        ),
      ),
    );
  }

  Widget buildAppBar() {
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
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
          widget.productArgument.product.image,
          // height: ScreenUtils.scaleValueH(250),
          fit: BoxFit.fill,
        ),
        Expanded(
          child: Container(
            padding:
                EdgeInsets.symmetric(vertical: ScreenUtils.scaleValueH(150)),
            decoration: BoxDecoration(
                color: AppColor.aquaBlue.withOpacity(0.2),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(ScreenUtils.scaleValue(30)),
                    topRight: Radius.circular(ScreenUtils.scaleValue(30)))),
          ),
        )
      ],
    );
  }
}
