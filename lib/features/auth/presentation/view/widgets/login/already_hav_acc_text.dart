
import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({
    super.key,
    required this.text,
    required this.buttontext,
    required this.onPressed,
  });
  final String text;
  final String buttontext;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,
            style: const TextStyle(
                fontSize: 14,
                color: AppColor.secColor3,
                fontWeight: FontWeight.w500)),
        TextButton(
          style: const ButtonStyle(
              padding: WidgetStatePropertyAll(EdgeInsets.zero)),
          onPressed: onPressed,
          child: Text(buttontext,
              style: const TextStyle(
                  fontSize: 15,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }
}
