import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:my_learning_app/utils/utils.dart';

class ErrorDialog extends StatefulWidget {
  final String errorMessage;
  const ErrorDialog({super.key, required this.errorMessage});

  @override
  State<ErrorDialog> createState() => _ErrorDialogState();
}

class _ErrorDialogState extends State<ErrorDialog> {
  String get errorMSg => widget.errorMessage;
  TextTheme get textTheme => Theme.of(context).textTheme;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20, vertical: AppPadding.p20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      backgroundColor: AppColor.white,
      content: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SizedBox(
          height: ScreenUtils.screenHeight * 0.25,
          width: ScreenUtils.screenWidth * 0.42,
          child: Column(children: [
            Text(
              'Error!',
              style: textTheme.headline4?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(errorMSg),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment(0.1, 0.1),
              child: IconButton(
                icon: const Icon(Icons.close_rounded),
                onPressed: () {
                  context.pop();
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
