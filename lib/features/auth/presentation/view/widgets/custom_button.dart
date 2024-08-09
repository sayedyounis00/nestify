import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:nestify/core/theme/app_color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color color;
  final Color foreCol;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.foreCol = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          alignment: Alignment.center,
          // fixedSize: const WidgetStatePropertyAll(Size(120,50)),
            foregroundColor: WidgetStatePropertyAll(foreCol),
            backgroundColor: WidgetStatePropertyAll(color),
            shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
                side: BorderSide(color: AppColor.primaryColor),
                borderRadius: BorderRadius.all(Radius.circular(12)))),
            padding: const WidgetStatePropertyAll(EdgeInsets.all(12))),
        onPressed: onPressed,
        child: Center(
          child: Text(text.capitalize!),
        ));
  }
}
