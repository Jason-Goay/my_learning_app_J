// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:mosaic_app/providers/providers.dart';
// import 'package:mosaic_app/screens/screens.dart';
// import 'package:provider/provider.dart';
// // import 'intro_screen.dart';
// import 'package:mosaic_app/utils/utils.dart';

// class SplashScreen extends StatefulWidget {
//   static const String routeName = "/";
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       Future.delayed(const Duration(seconds: 3), () {
//         AuthProvider authProvider = context.read<AuthProvider>();
//         if (authProvider.hasAccessToken) {
//           Navigator.pushReplacementNamed(context, MainScreen.routeName);
//           return;
//         }
//         if (authProvider.isFirstTime) {
//           Navigator.pushReplacementNamed(context, IntroScreen.routeName);
//           return;
//         }
//         Navigator.pushReplacementNamed(context, SignInScreen.routeName);
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size screenSize = MediaQuery.of(context).size;
//     ScreenUtils.setScreenSize(screenSize);

//     return Scaffold(
//       body: Center(
//         child: SizedBox(
//             width: ScreenUtils.screenWidth * 0.8,
//             height: ScreenUtils.screenHeight * 0.1,
//             child: Image.asset(AppAssets.logoImage)),
//       ),
//     );
//   }
// }
