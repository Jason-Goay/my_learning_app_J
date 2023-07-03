import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? height, size, letterSpace;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;
  final TextDecoration? textDeco;
  final int? maxLine;
  final TextOverflow? overflow;
  final TextAlign? align;
  CustomText({
    Key? key,
    required this.text,
    this.letterSpace,
    this.fontWeight,
    this.color,
    this.fontFamily,
    this.textDeco,
    this.maxLine,
    this.overflow,
    this.align,
    this.height,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLine,
        overflow: overflow,
        textAlign: align,
        style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: size,
            height: height,
            fontFamily: fontFamily,
            decoration: textDeco,
            letterSpacing: letterSpace));
  }
}
