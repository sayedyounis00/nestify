import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nestify/core/theme/app_color.dart';

class InputCircule extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool correct;
  final Type textControler;
  const InputCircule({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.textControler, required this.correct,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, top: 10),
      alignment: Alignment.center,
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color:correct? AppColor.primaryColor:Colors.red)),
      child: TextField(
        onChanged: (val) {
          if (val.isNotEmpty && isLast == false) {
            FocusScope.of(context).nextFocus();
          } else if (val.isNotEmpty && isFirst == false) {
            FocusScope.of(context).nextFocus();
          } else if (val.isEmpty && isFirst == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        textAlign: TextAlign.center,
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
