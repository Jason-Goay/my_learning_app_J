import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:my_learning_app/provider/provider.dart';
import 'package:my_learning_app/screen/screen.dart';
import 'package:my_learning_app/utils/src/app_color.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  BottomNavigatorProvider get bottomNavigatorProvider =>
      context.read<BottomNavigatorProvider>();
  ColorScheme get colorScheme => Theme.of(context).colorScheme;
  TextTheme get textTheme => Theme.of(context).textTheme;

  List<Widget> tabs = [const HomeScreen(), const ProfileScreen()];

  BottomNavigationBarItem navBarItem(Icon icon) {
    return BottomNavigationBarItem(icon: icon, label: '');
  }

  List<BottomNavigationBarItem> get navBarList => [
        navBarItem(const Icon(Icons.home)),
        navBarItem(const Icon(Icons.person)),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(
      //   child: SafeArea(
      //     child: Container(
      //       padding: const EdgeInsets.all(10),
      //       child: Column(children: [
      //         DrawerItem(
      //             onTap: () {
      //               context.goNamed('favouriteScreen');
      //             },
      //             title: 'Favoutrite',
      //             icon: const Icon(Icons.favorite_outline)),
      //         DrawerItem(
      //             onTap: () {
      //               context.read<AuthProvider>().logOut(context);
      //               if (context.read<AuthProvider>().user.uid == null) {
      //                 context.goNamed('signInScreen');
      //               }
      //             },
      //             title: 'Sign Out',
      //             icon: const Icon(Icons.logout))
      //       ]),
      //     ),
      //   ),
      // ),
      body: IndexedStack(
        index: bottomNavigatorProvider.currentIndex,
        children: tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: navBarList,
        currentIndex: bottomNavigatorProvider.currentIndex,
        onTap: (index) {
          bottomNavigatorProvider.currentIndex = index;
          setState(() {});
        },
      ),
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
                  style: textTheme.titleLarge?.copyWith(
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
}
