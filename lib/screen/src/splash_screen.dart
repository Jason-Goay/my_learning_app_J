import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_learning_app/screen/src/home_screen.dart';
import 'package:my_learning_app/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    ScreenUtils.setScreenSize(screenSize);

    return Scaffold(
      body: Center(
        child: SizedBox(
            width: ScreenUtils.screenWidth * 0.8,
            height: ScreenUtils.screenHeight * 0.1,
            child: Image.asset(AppAssets.appLogo)),
      ),
    );
  }
}
