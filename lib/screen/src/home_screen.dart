// https://github.com/iampawan/ChatGPT-Flutter-AIChatBot/tree/main/ios

import 'dart:developer';

import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_learning_app/model/model.dart';
import 'package:my_learning_app/provider/provider.dart';
import 'package:my_learning_app/screen/src/component/product_card.dart';
import 'package:my_learning_app/screen/src/details_screen.dart';
import 'package:my_learning_app/utils/src/constant.dart';
import 'package:my_learning_app/utils/utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  ColorScheme get colorScheme => Theme.of(context).colorScheme;
  TextTheme get textTheme => Theme.of(context).textTheme;

  HomeTabProvider get homeTabProvider => context.read<HomeTabProvider>();

  late TabController _tabController;
  final List<Tab> tabs = [
    const Tab(
      text: 'All',
    ),
    const Tab(
      text: 'Shirt',
    ),
    const Tab(
      text: 'Shoes',
    ),
    const Tab(
      text: 'Watch',
    ),
    const Tab(
      text: 'Dress',
    ),
  ];
  List<Product> shirtList =
      product.where((element) => element.type == 'Shirt').toList();
  List<Product> shoesList =
      product.where((element) => element.type == 'Shoes').toList();
  List<Product> watchList =
      product.where((element) => element.type == 'Watch').toList();
  List<Product> dressList =
      product.where((element) => element.type == 'Dress').toList();

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: tabs.length);
    _tabController.addListener(() {
      homeTabProvider.currentIndex = _tabController.index;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      drawer: Drawer(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              DrawerItem(
                  onTap: () {
                    context.goNamed('favouriteScreen');
                  },
                  title: 'Favoutrite',
                  icon: Icon(Icons.favorite_outline))
            ]),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          myAppBar(),
          buildContent(),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed('chatScreen');
        },
        child: const Icon(Icons.chat),
      ),
    );
  }

  Widget myAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtils.scaleValue(12),
          vertical: ScreenUtils.scaleValue(35)),
      child: Row(children: [
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            drawerKey.currentState?.openDrawer();
          },
        ),
        Padding(
          padding: EdgeInsets.only(left: ScreenUtils.scaleValue(20)),
          child: const Text(
            "Home",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Spacer(),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: ScreenUtils.scaleValueW(10)),
          child: Badge(
            badgeContent: Text('1'),
            badgeColor: AppColor.red,
            padding: EdgeInsets.all(ScreenUtils.scaleValue(4)),
            child: InkWell(
              child: Icon(Icons.shopping_cart),
              onTap: () => context.goNamed('cartScreen'),
            ),
          ),
        )
      ]),
    );
  }

  Widget buildContent() {
    return Container(
      padding: EdgeInsets.only(top: ScreenUtils.scaleValueH(10)),
      decoration: BoxDecoration(color: AppColor.grey.withOpacity(0.1)),
      child: Column(
        children: [
          Column(
            children: [
              buildSearchBar(),
              buildSlideShow(),
              buildCategories(),
              buildTabBar(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSearchBar() {
    return Column(
      children: [
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: ScreenUtils.scaleValueW(15)),
          margin: EdgeInsets.symmetric(horizontal: ScreenUtils.scaleValueW(5)),
          height: ScreenUtils.scaleValueH(35),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(ScreenUtils.scaleValue(12)),
          ),
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: ScreenUtils.scaleValueW(10)),
                  height: ScreenUtils.scaleValueH(25),
                  width: ScreenUtils.scaleValueW(300),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search product..."),
                  )),
              Icon(Icons.search)
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSlideShow() {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(5.0),
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      item,
                      fit: BoxFit.cover,
                      width: 1000,
                    ),
                  ],
                ),
              ),
            ))
        .toList();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CarouselSlider(
        items: imageSliders,
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 2.0,
        ),
      ),
    );
  }

  Widget buildCategories() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: const Text(
            'Categories',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        // Container(
        //   margin: EdgeInsets.symmetric(horizontal: ScreenUtils.scaleValue(10)),
        //   padding: EdgeInsets.symmetric(
        //       horizontal: ScreenUtils.scaleValue(10),
        //       vertical: ScreenUtils.scaleValue(5)),
        //   child: Container(),
        // )
      ],
    );
  }

  buildSelectionItem({VoidCallback? onTap, String? icon, String? text}) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: ScreenUtils.scaleValueW(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(
                ScreenUtils.scaleValueW(15),
              ),
              height: ScreenUtils.scaleValueH(55),
              width: ScreenUtils.scaleValueW(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }

  Widget buildTabBar() {
    return Column(
      children: [
        TabBar(
          labelPadding:
              EdgeInsets.symmetric(horizontal: ScreenUtils.scaleValueW(25)),
          labelColor: AppColor.white,
          unselectedLabelColor: colorScheme.secondary,
          indicator: BoxDecoration(
            border: Border.all(color: colorScheme.primary),
            borderRadius: BorderRadius.circular(50),
            color: colorScheme.primary,
          ),
          indicatorPadding: EdgeInsets.symmetric(
              vertical: ScreenUtils.scaleValueH(5),
              horizontal: ScreenUtils.scaleValueW(5)),
          isScrollable: true,
          controller: _tabController,
          tabs: tabs,
          onTap: (value) {
            homeTabProvider.currentIndex = value;
            setState(() {});
            log("CurrentINDex ${homeTabProvider.currentIndex}");
          },
        ),
        buildTabView()
      ],
    );
  }

  Widget buildProduct(List<Product> product) {
    return SizedBox(
      width: ScreenUtils.screenWidth,
      height: ScreenUtils.screenHeight * 0.7,
      child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: product
              .map((e) => ProductCard(
                    image: e.image,
                    bgColor: Colors.black,
                    onTap: () {
                      context.goNamed('detailsScreen',
                          extra: DetailsScreenArgument(product: e));
                      // Navigator.pushNamed(context, DetailsScreen.routeName,
                      //     arguments: DetailsScreenArgument(product: e));
                    },
                    price: e.price,
                    title: e.title,
                  ))
              .toList()),
    );
  }

  Widget DrawerItem(
      {required VoidCallback onTap,
      required String title,
      required Widget icon}) {
    return Container(
      child: Column(children: [
        InkWell(
            onTap: onTap,
            child: ListTile(
              title: Text(title,
                  style: textTheme.headline6?.copyWith(
                    color: AppColor.greYer,
                  )),
              leading: icon,
            )),
        Container(
            padding: EdgeInsets.symmetric(vertical: 1),
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.black12.withOpacity(0.05)),
      ]),
    );
  }

  Widget buildTabView() {
    switch (homeTabProvider.currentIndex) {
      case 0:
        return buildProduct(product);
      case 1:
        return buildProduct(shirtList);
      case 2:
        return buildProduct(shoesList);
      case 3:
        return buildProduct(watchList);
      case 4:
        return buildProduct(dressList);
      default:
        return Container();
    }
  }

  List<String> imgList = [
    AppAssets.adidasShoes,
    AppAssets.shirt,
    AppAssets.shopping,
    AppAssets.watch,
    AppAssets.shopping2
  ];
}
