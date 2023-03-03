import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color? background;
  final Widget child;
  final OutlinedBorder? shape;
  final double? minimumSize;
  final VoidCallback onPressed;

  const CustomElevatedButton(
      {super.key,
      required this.onPressed,
      this.background,
      required this.child,
      this.shape,
      this.minimumSize});

  // factory CustomElevatedButton.icon({
  //   required Widget icon,
  //   required VoidCallback? onPressed,
  //   String text,
  // }) = _CustomElevatedButtonIcon;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return ElevatedButtonTheme(
      data: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: background ?? colorScheme.primary,
              shape: shape,
              minimumSize: Size(minimumSize!, 40) ?? const Size(20, 40))),
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

class _CustomElevatedButtonIcon extends CustomElevatedButton {
  _CustomElevatedButtonIcon({
    required Widget icon,
    required super.onPressed,
    required String text,
  }) : super(
            child: _CustomElevatedButtonIconChild(
          text: text,
          icon: icon,
        ));
}

class _CustomElevatedButtonIconChild extends StatelessWidget {
  final String? text;
  final Widget icon;
  final Color? textColor;

  _CustomElevatedButtonIconChild({
    Key? key,
    this.text,
    required this.icon,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Expanded(child: icon)],
    );
  }
}
