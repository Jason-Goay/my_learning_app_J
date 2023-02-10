import 'package:flutter/material.dart';

class SnackBarService {
  void show({
    required BuildContext context,
    required String text,
    required String actionText,
    required VoidCallback actionOnPressed,
  }) {
    ScaffoldMessengerState scaffoldMessageState = ScaffoldMessenger.of(context);
    scaffoldMessageState
      ..clearSnackBars()
      ..showSnackBar(buildSnackBar(
          text: text,
          actionText: actionText,
          actionOnPressed: actionOnPressed));
  }

  SnackBar buildSnackBar(
      {required String text,
      required String actionText,
      required VoidCallback actionOnPressed,
      int seconds = 2}) {
    return SnackBar(
      duration: Duration(seconds: seconds),
      content: Text(text),
      action: SnackBarAction(
        label: actionText,
        onPressed: actionOnPressed,
      ),
    );
  }
}
