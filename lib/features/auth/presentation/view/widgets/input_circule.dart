import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nestify/core/theme/app_color.dart';

class InputCircule extends StatelessWidget {
  const InputCircule({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, top: 10),
      padding: const EdgeInsets.only(left: 25),
      alignment: Alignment.center,
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: AppColor.primaryColor)),
      child: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        style: const TextStyle(color: AppColor.primaryColor, fontSize: 20),
        cursorWidth: 0,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
