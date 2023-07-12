import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_learning_app/provider/provider.dart';

import 'package:my_learning_app/utils/utils.dart';
import 'package:my_learning_app/widget/widget.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthProvider get authProvider =>
      Provider.of<AuthProvider>(context, listen: false);
  TextTheme get textTheme => Theme.of(context).textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Profile",
            style: textTheme.titleLarge?.copyWith(color: AppColor.black),
          ),
          backgroundColor: AppColor.transparent,
          shadowColor: AppColor.transparent),
      body: Column(
        children: [profilePic(), profileName()],
      ),
    );
  }

  Widget profilePic() {
    return Container(
      padding: EdgeInsets.only(top: ScreenUtils.scaleValueH(10)),
      child: Center(
        child: Column(
          children: [
            ClipOval(
              child: CircleAvatar(
                radius: ScreenUtils.screenWidth * 0.2,
                backgroundImage: const NetworkImage(
                    "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileName() {
    return Text(
      "${authProvider.user.displayName}",
      style: textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  // Widget profileData(){
  //   return
  // }
}
