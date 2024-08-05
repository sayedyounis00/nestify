import 'package:flutter/material.dart';
import 'package:nestify/features/auth/presentation/view/widgets/login/login_view_body.dart';
import 'package:nestify/features/auth/presentation/view/widgets/signup/custom_app_bar_signup.dart';
import 'package:nestify/features/auth/presentation/view/widgets/signup/signup_form.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBarSignup(),
        Text('Sign up and find your\nnew apartment',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600)),
        SizedBox(height: 20),
        SignupForm(),
        SizedBox(height: 20),
        CustomDivider(),
        SizedBox(height: 22),
        AnotherLoginMethodsRow(),
      ],
    );
  }
}
