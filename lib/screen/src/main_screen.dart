import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_learning_app/provider/provider.dart';
import 'package:my_learning_app/screen/screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  BottomNavigatorProvider get bottomNavigatorProvider =>
      context.read<BottomNavigatorProvider>();

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
}
