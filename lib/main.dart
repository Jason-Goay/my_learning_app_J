import 'package:flutter/material.dart';
import 'package:my_learning_app/generated/l10n.dart';
import 'package:my_learning_app/utils/utils.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
    return material;
  }
}
