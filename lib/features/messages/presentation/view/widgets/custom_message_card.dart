import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';

class CustomMessageCard extends StatelessWidget {
  const CustomMessageCard({
    super.key,
    required this.messageText,
    required this.isMe,
  });
  final String messageText;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        width: MediaQuery.of(context).size.width / 2.5,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isMe ? Colors.white : AppColor.primaryColor,
        ),
        child: Text(
          messageText,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: isMe ? AppColor.primaryColor : AppColor.secColor4,
              ),
        ),
      ),
    );
  }
}
