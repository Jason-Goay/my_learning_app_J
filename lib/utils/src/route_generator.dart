import 'package:flutter/material.dart';
import 'package:my_learning_app/screen/screen.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    switch (settings.name) {
      case HomeScreen.routeName:
        builder = (_) => const HomeScreen();
        break;
      default:
        throw UnimplementedError();
    }

    return MaterialPageRoute(builder: builder);
  }
}
