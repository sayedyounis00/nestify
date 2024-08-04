import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.onEnd,
    this.height,
    this.width,
  });
  final VoidCallback onTap;
  final String text;
  final Function()? onEnd;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        onEnd: onEnd,
        alignment: Alignment.center,
        height: height ?? 50,
        width: width ?? 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: AppColor.primaryColor),
        ),
      ),
    );
  }
}
