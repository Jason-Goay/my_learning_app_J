import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:my_learning_app/provider/provider.dart';
import 'package:my_learning_app/utils/utils.dart';
import 'package:my_learning_app/widget/widget.dart';
import 'package:provider/provider.dart';

// https://stackoverflow.com/questions/64443888/flutter-cocoapodss-specs-repository-is-too-out-of-date-to-satisfy-dependencies

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _signUpScreenState = GlobalKey<FormState>();

  final TextEditingController _nameTEC = TextEditingController();
  final TextEditingController _phoneNumberTEC = TextEditingController();
  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _addressTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();

  TextTheme get textTheme => Theme.of(context).textTheme;
  AuthProvider get authProvider =>
      Provider.of<AuthProvider>(context, listen: false);

  bool _isValidated = false;

  // void register(){
  //   final User user = await
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            buildTitle(),
            buildShopIcon(),
            buildContent(),
            buildButton()
          ],
        ),
      ),
    );
  }

  buildShopIcon() {
    return FadeInUp(
      child: SizedBox(
          height: ScreenUtils.screenHeight * 0.15,
          child: Image.asset(AppAssets.appLogo)),
    );
  }

  buildTitle() {
    return Container(
      child: Row(children: [
        IconButton(
          onPressed: (() => context.pop()),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: ScreenUtils.screenWidth * 0.27),
          child: Text(
            'Sign Up',
            style: textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
          ),
        )
      ]),
    );
  }

  buildContent() {
    double spacing = 15;
    return FadeInUp(
      child: Form(
        key: _signUpScreenState,
        child: Column(children: [
          CustomTextFormField(
            textController: _nameTEC,
            textLabel: 'Name',
            hintLabel: "E.g. RAY",
            onChanged: onValueChanged,
            type: TextInputType.name,
            validator: FormValidator.validatePassword,
          ),
          SizedBox(
            height: spacing,
          ),
          CustomTextFormField(
            textController: _phoneNumberTEC,
            textLabel: 'Phone Number',
            hintLabel: "E.g. 0123456789",
            onChanged: onValueChanged,
            type: TextInputType.number,
            validator: FormValidator.validatePhoneNumber,
          ),
          SizedBox(
            height: spacing,
          ),
          CustomTextFormField(
            textController: _emailTEC,
            textLabel: 'Email',
            hintLabel: "E.g. example@example.com",
            onChanged: onValueChanged,
            type: TextInputType.emailAddress,
            validator: FormValidator.validateEmail,
          ),
          SizedBox(
            height: spacing,
          ),
          CustomTextFormField(
            textController: _passwordTEC,
            textLabel: 'Password',
            hintLabel: "E.g. abc123",
            onChanged: onValueChanged,
            type: TextInputType.visiblePassword,
            validator: FormValidator.validatePassword,
          ),
          SizedBox(
            height: spacing,
          ),
          CustomTextFormField(
            maxLines: 3,
            textController: _addressTEC,
            textLabel: 'Address',
            hintLabel: "E.g. address",
            onChanged: onValueChanged,
            type: TextInputType.multiline,
            validator: FormValidator.validateAddress,
          )
        ]),
      ),
    );
  }

  buildButton() {
    return FadeInUp(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
        child: Column(
          children: [
            CustomButton(
              buttonLabel: 'Register',
              buttonWidth: ScreenUtils.screenWidth * 0.8,
              buttonHeight: ScreenUtils.screenHeight * 0.05,
              labelSize: 18,
              buttonColor: AppColor.darkBlue,
              buttonTextColor: AppColor.white,
              onTap: () => onSubmit(),
            ),
          ],
        ),
      ),
    );
  }

  void onValueChanged(String? value) {
    if (_emailTEC.text.isEmpty || _passwordTEC.text.isEmpty) {
      _isValidated = false;
      setState(() {});
    }
    _isValidated = _signUpScreenState.currentState?.validate() ?? false;
    setState(() {});
  }

  void onSubmit() async {
    if (_isValidated) {
      _signUpScreenState.currentState!.save();
      await authProvider.signUp(_nameTEC.text, _emailTEC.text,
          _passwordTEC.text, _addressTEC.text, context);
    }
  }
}
