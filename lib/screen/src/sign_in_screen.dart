import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:my_learning_app/provider/provider.dart';
import 'package:my_learning_app/utils/utils.dart';
import 'package:my_learning_app/widget/widget.dart';
import 'package:provider/provider.dart';

//https://github.com/RivaanRanawat/flutter-firebase-auth/blob/master/lib/services/firebase_auth_methods.dart
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _passTEC = TextEditingController();
  TextTheme get textTheme => Theme.of(context).textTheme;
  AuthProvider get authProvider =>
      Provider.of<AuthProvider>(context, listen: false);

  bool _isValidated = false;

  @override
  void dispose() {
    _emailTEC.dispose();
    _passTEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: ScreenUtils.screenWidth * 0.03),
        child: ListView(children: [
          buildShopIcon(),
          buildTitle(),
          buildContent(),
          buildButton()
        ]),
      ),
    );
  }

  buildTitle() {
    return FadeInUp(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenUtils.screenWidth * 0.34,
            vertical: ScreenUtils.screenWidth * 0.1),
        child: Text(
          "Sign In",
          style: textTheme.headline4?.copyWith(color: AppColor.black),
        ),
      ),
    );
  }

  buildShopIcon() {
    return FadeInUp(
        child: SizedBox(
            width: ScreenUtils.screenWidth * 0.7,
            height: ScreenUtils.screenHeight * 0.2,
            child: Image.asset(
              AppAssets.appLogo,
            )));
  }

  buildContent() {
    return FadeInUp(
      child: Form(
        key: _signInFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              textController: _emailTEC,
              textLabel: 'Email Address',
              hintLabel: "E.g. example@example.com",
              onChanged: onValueChanged,
              type: TextInputType.emailAddress,
              validator: FormValidator.validateEmail,
            ),
            const SizedBox(height: 12),
            CustomTextFormField(
              textController: _passTEC,
              textLabel: 'Password',
              hintLabel: "E.g. abc123",
              onChanged: onValueChanged,
              type: TextInputType.visiblePassword,
              validator: FormValidator.validatePassword,
            )
          ],
        ),
      ),
    );
  }

  buildButton() {
    return FadeInUp(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            CustomButton(
              buttonLabel: 'Sign In',
              buttonColor: AppColor.darkBlue,
              buttonHeight: ScreenUtils.screenHeight * 0.05,
              buttonWidth: ScreenUtils.screenWidth * 0.8,
              buttonTextColor: AppColor.white,
              labelSize: 18,
              onTap: () {
                onTapSignIn(_emailTEC.text, _passTEC.text);
              },
            ),
            const SizedBox(
              height: 12,
            ),
            CustomButton(
              buttonLabel: 'Sign Up',
              buttonColor: AppColor.darkBlue.withOpacity(0.6),
              buttonHeight: ScreenUtils.screenHeight * 0.05,
              buttonWidth: ScreenUtils.screenWidth * 0.8,
              buttonTextColor: AppColor.white,
              labelSize: 18,
              onTap: () {
                context.goNamed('signUpScreen');
              },
            ),
          ],
        ),
      ),
    );
  }

  void onValueChanged(String? value) {
    if (_emailTEC.text.isEmpty || _passTEC.text.isEmpty) {
      _isValidated = false;
      setState(() {});
    }
    _isValidated = _signInFormKey.currentState?.validate() ?? false;
    setState(() {});
  }

  onTapSignIn(String email, String password) async {
    if (_isValidated) {
      _signInFormKey.currentState?.save();
      await authProvider.signIn(email, password, context);
    }
  }
}
