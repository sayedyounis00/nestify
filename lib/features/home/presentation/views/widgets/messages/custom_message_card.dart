import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';

class CustomMessageCard extends StatelessWidget {
  const CustomMessageCard({
    super.key,
    required this.messageText,
    required this.isUserOne,
  });
  final String messageText;
  final bool isUserOne;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      alignment: isUserOne ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        alignment: isUserOne ? Alignment.centerLeft : Alignment.centerRight,
        width: MediaQuery.of(context).size.width / 2.5,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isUserOne ? AppColor.primaryColor : Colors.white,
        ),
        child: Text(
          messageText,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: isUserOne ? AppColor.secColor4 : AppColor.primaryColor),
        ),
      ),
    );
  }
}
