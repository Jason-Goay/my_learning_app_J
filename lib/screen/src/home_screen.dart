import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_learning_app/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  ColorScheme get colorScheme => Theme.of(context).colorScheme;
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

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: tabs.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColor.white,
      //   title: Text('Home'),
      //   leading: IconButton(
      //     icon: const Icon(Icons.menu),
      //     onPressed: () {},
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(children: [
          AppBar(),
          buildContent(),
        ]),
      ),
    );
  }

  Widget AppBar() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtils.scaleValue(12),
          vertical: ScreenUtils.scaleValue(35)),
      child: Row(children: [
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
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
            badgeColor: AppColor.red,
            padding: EdgeInsets.all(ScreenUtils.scaleValue(4)),
            child: InkWell(
              child: Icon(Icons.shopping_cart),
              onTap: () {},
            ),
          ),
        )
      ]),
    );
  }

  Widget buildContent() {
    return Container(
      height: ScreenUtils.scaleValueH(300),
      padding: EdgeInsets.only(top: ScreenUtils.scaleValueH(10)),
      decoration: BoxDecoration(color: AppColor.grey.withOpacity(0.1)),
      child: Column(
        children: [
          buildSearchBar(),
          buildSlideShow(),
          buildCategories(),
          buildTabBar()
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
        Container(
          margin: EdgeInsets.symmetric(horizontal: ScreenUtils.scaleValue(10)),
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtils.scaleValue(10),
              vertical: ScreenUtils.scaleValue(5)),
          child: Container(),
        )
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
    return TabBar(
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
    );
  }

  List<String> imgList = [
    AppAssets.adidasShoes,
    AppAssets.shirt,
    AppAssets.shopping,
    AppAssets.watch,
    AppAssets.shopping2
  ];
}
