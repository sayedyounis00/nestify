import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/auth/presentation/view/login_view.dart';

class CustomAppBarSignup extends StatelessWidget {
  const CustomAppBarSignup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/images/nestify.png', width: 80),
        TextButton(
          style: const ButtonStyle(
              padding: WidgetStatePropertyAll(EdgeInsets.zero)),
          onPressed: () {
            Get.off(() => const LoginView(),
                transition: Transition.downToUp);
          },
          child: const Text('login',
              style: TextStyle(
                  fontSize: 15,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }
}
