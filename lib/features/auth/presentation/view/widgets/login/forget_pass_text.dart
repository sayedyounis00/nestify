
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/auth/presentation/view/forget_pass_view.dart';

class ForgetPassText extends StatelessWidget {
  const ForgetPassText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style:  const ButtonStyle(
          alignment: Alignment.topRight,
          padding: WidgetStatePropertyAll(EdgeInsets.all(0))),
      onPressed: () {
        Get.to(() => const ForgetPassView(),
            transition: Transition.rightToLeft);
      },
      child: const Text(
        'Forget password?',
        style: TextStyle(fontSize: 15, color: AppColor.primaryColor),
      ),
    );
  }
}
