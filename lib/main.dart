import 'package:flutter/material.dart';
import 'package:my_learning_app/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget material = MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.onGenerateRoute,
    );
    return Container();
  }
}
