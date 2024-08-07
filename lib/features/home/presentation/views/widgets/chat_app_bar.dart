
import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({
    super.key,
    required this.fullName, required this.id,
  });

  final String fullName;
  final String id;

  @override
  Widget build(BuildContext context) {
    return

     Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: CircleAvatar(
                  maxRadius: 18,
                  backgroundImage: NetworkImage(
                    'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                  ),
                ),
              ),
              Text(fullName),
            ],
          ),
          const Icon(
            Icons.call,
            size: 30,
            color: AppColor.primaryColor,
          ),
        ],
      );
  }
}
