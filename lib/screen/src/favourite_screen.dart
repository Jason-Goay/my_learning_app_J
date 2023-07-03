import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:my_learning_app/model/model.dart';
import 'package:my_learning_app/provider/provider.dart';
import 'package:my_learning_app/provider/src/cart_provider.dart';
import 'package:my_learning_app/utils/utils.dart';
import 'package:my_learning_app/widget/widget.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  TextTheme get textTheme => Theme.of(context).textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [buildAppBar(), buildCcntent()],
      ),
    );
  }

  buildAppBar() {
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
          },
        ),
        Padding(
          padding: EdgeInsets.only(left: ScreenUtils.scaleValue(90)),
          child: const Text(
            "My Favourite",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ]),
    );
  }

  buildCcntent() {
    return Consumer<FavouriteProvider>(builder: (context, provider, widget) {
      return provider.favouriteItem.isEmpty
          ? Center(
              heightFactor: ScreenUtils.scaleValueH(18),
              child: Text(
                'Your Favourite Screen is Empty',
                style: textTheme.headline5?.copyWith(color: AppColor.darkBlue),
              ),
            )
          : Column(children: [
              Container(
                height: ScreenUtils.screenHeight * 0.72,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: provider.favouriteItem.length,
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
                              image: AssetImage(
                                  provider.favouriteItem[index].image)),
                        ),
                        Container(
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
                                                .favouriteItem[index].title,
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
                                        text: provider
                                            .favouriteItem[index].price
                                            .toString(),
                                        style: textTheme.bodyText1?.copyWith(
                                            fontWeight: FontWeight.bold))
                                  ]))
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            SnackBarService().show(
                                text:
                                    '${provider.favouriteItem[index].title} has been removed',
                                actionOnPressed: () {},
                                actionText: 'Close',
                                context: context);
                            provider.removeItemFromFavourite(
                                provider.favouriteItem[index].id);
                          },
                          icon: const Icon(Icons.delete),
                          color: AppColor.red,
                        ),
                      ]),
                    );
                  },
                ),
              )
            ]);
    });
  }
}
