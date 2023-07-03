import 'package:flutter/material.dart';
import 'package:my_learning_app/utils/utils.dart';
import 'package:my_learning_app/widget/widget.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textController;
  final String textLabel;
  final String? hintLabel;
  final TextInputType? type;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final int? maxLines;
  const CustomTextFormField(
      {super.key,
      required this.textController,
      required this.textLabel,
      this.hintLabel,
      this.type,
      this.onTap,
      this.validator,
      this.onChanged,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: textLabel,
          color: AppColor.black,
          fontWeight: FontWeight.bold,
        ),
        TextFormField(
          controller: textController,
          validator: validator,
          onChanged: onChanged,
          keyboardType: type,
          maxLines: maxLines,
          style: TextStyle(
              color: AppColor.black,
              fontWeight: FontWeight.w700,
              fontSize: ScreenUtils.screenWidth * 0.03),
          onTap: onTap,
          cursorColor: AppColor.black,
          autocorrect: false,
          decoration: InputDecoration(
            hintText: hintLabel,
            contentPadding: EdgeInsets.symmetric(
              vertical: ScreenUtils.screenHeight * 0.015,
              horizontal: ScreenUtils.screenWidth * 0.035,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColor.black, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColor.black, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColor.black, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColor.black, width: 1.0),
            ),
          ),
        ),
      ],
    );
  }
}
