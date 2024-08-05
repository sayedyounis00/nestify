import 'package:flutter/material.dart';
import 'package:nestify/features/auth/presentation/view/widgets/login/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(child: LoginViewBody()),
    )));
  }
}
