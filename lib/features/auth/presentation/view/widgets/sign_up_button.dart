import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/auth/presentation/view/forget_pass_view.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have a Nestify account?",
            style: TextStyle(
                fontSize: 14,
                color: AppColor.secColor3,
                fontWeight: FontWeight.w500)),
        TextButton(
          style: const ButtonStyle(
              padding: WidgetStatePropertyAll(EdgeInsets.zero)),
          onPressed: () {
            Get.to(() => const ForgetPassView(),
                transition: Transition.rightToLeft);
          },
          child: const Text('Sign up',
              style: TextStyle(
                  fontSize: 15,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }
}