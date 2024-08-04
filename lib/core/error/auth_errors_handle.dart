import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ErrorHandle {
  void handleAuthErrors(FirebaseAuthException e, BuildContext context) {
    if (e.code == 'wrong-password') {
      showSnackBar(context, 'Wrong password');
    } else if (e.code == 'invalid-email') {
      showSnackBar(context, 'Invalid email');
    } else if (e.code == 'weak-password') {
      showSnackBar(context, 'Weak password');
    } else if (e.code == 'email-already-in-use') {
      showSnackBar(context, 'email already in use');
    } else {
      showSnackBar(context, 'Your email or password is wrong');
    }
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
      ),
    ));
  }
}
