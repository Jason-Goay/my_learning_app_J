import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_learning_app/dialog/dialog_settings.dart';
import 'package:my_learning_app/widget/widget.dart';

enum Status {
  notSignedIn,
  notSignedUp,
  singedIn,
  signedUp,
  authenticating,
  signOut
}

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  Status _signedInStatus = Status.notSignedIn;
  Status _signedUpStatus = Status.notSignedUp;

  bool get isLoading => _isLoading;
  Status get signedInStatus => _signedInStatus;
  Status get signedUpStatus => _signedUpStatus;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User get user => _firebaseAuth.currentUser!;
  Stream<User?> get authState => _firebaseAuth.authStateChanges();

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future signIn(String email, String password, BuildContext context) async {
    _signedInStatus = Status.authenticating;
    _isLoading = true;
    notifyListeners();
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      context.goNamed('homeScreen');
    } on FirebaseAuthException catch (e) {
      DialogManager.instance.showErrorDialog(
          context, e.toString().replaceRange(0, 14, '').split(']')[1].trim());
      log(e.toString());
    }
    _isLoading = false;
    notifyListeners();
  }

  Future signUp(
      String name, email, password, address, BuildContext context) async {
    notifyListeners();
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      final User? user = _firebaseAuth.currentUser;
      final uid = user!.uid;
      user.updateDisplayName(name);
      user.reload();
      await FirebaseFirestore.instance.collection('Users').add({
        'id': uid,
        'name': name,
        'email': email,
        'shipping-address': address,
        'userWish': [],
        'userCart': [],
        'createdAt': Timestamp.now(),
      });
      context.goNamed('signInScreen');
    } on FirebaseException catch (e) {
      DialogManager.instance.showErrorDialog(
          context, e.toString().replaceRange(0, 14, '').split(']')[1].trim());
      log(e.toString());
    }
    _isLoading = false;
    notifyListeners();
  }

  Future logOut(BuildContext context) async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      DialogManager.instance.showErrorDialog(
          context, e.toString().replaceRange(0, 14, '').split(']')[1].trim());
    }
  }
}
