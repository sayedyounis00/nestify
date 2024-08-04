import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/auth/presentation/view/widgets/login/another_login_method_card.dart';
import 'package:nestify/features/auth/presentation/view/widgets/login/login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/nestify.png', width: 120),
        const Text('Sign in to your account',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        const LoginForm(),
        const CustomDivider(),
        const SizedBox(height: 22),
        const AnotherLoginMethodsRow(),
        const SizedBox(height: 22),
        const SignupButton(),
      ],
    );
  }
}

class SignupButton extends StatelessWidget {
  const SignupButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have a Nestify account? ",
            style: TextStyle(
                fontSize: 14,
                color: AppColor.secColor3,
                fontWeight: FontWeight.w500)),
        Text('Sign up',
            style: TextStyle(
                fontSize: 15,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w500)),
      ],
    );
  }
}

class AnotherLoginMethodsRow extends StatelessWidget {
  const AnotherLoginMethodsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnotherLoginMethodCard(
            imgPath: 'assets/images/google.png', onTap: () {}),
        const SizedBox(width: 23),
        AnotherLoginMethodCard(imgPath: 'assets/images/apple.png', onTap: () {})
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(endIndent: 10)),
        Text('Or sign in with',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        Expanded(child: Divider(indent: 10)),
      ],
    );
  }
}
