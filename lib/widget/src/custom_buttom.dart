import 'package:flutter/material.dart';
import 'package:my_learning_app/utils/utils.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String buttonLabel;
  final double buttonWidth;
  final double buttonHeight;
  final Color buttonColor;
  final double? labelSize;
  final Color buttonTextColor;

  const CustomButton(
      {super.key,
      this.onTap,
      required this.buttonLabel,
      required this.buttonWidth,
      required this.buttonHeight,
      required this.buttonColor,
      this.labelSize,
      required this.buttonTextColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(AppPadding.p20),
        ),
        child: Center(
          child: Text(
            buttonLabel,
            style: TextStyle(
              color: buttonTextColor,
              fontSize: labelSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
