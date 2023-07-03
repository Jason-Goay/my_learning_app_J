import 'package:flutter/material.dart';
import 'package:my_learning_app/dialog/dialogs/error_dialog.dart';
import 'package:my_learning_app/utils/utils.dart';

class DialogManager {
  static DialogManager? _instance;
  DialogManager._();

  static DialogManager get instance => _instance ??= DialogManager._();

  Future<void> showErrorDialog(BuildContext context, String msg) async {
    return showDialog(
        context: context,
        barrierColor: AppColor.black.withOpacity(0.6),
        barrierDismissible: false,
        builder: ((context) => ErrorDialog(
              errorMessage: msg,
            )));
  }
}
