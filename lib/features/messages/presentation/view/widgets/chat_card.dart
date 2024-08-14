import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/messages/presentation/view/chat_view.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    required this.fullName,
  });
  final String fullName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ChatView(fullName: fullName));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 120,
        child: Row(
          children: [
            const CircleAvatar(
              maxRadius: 30,
              backgroundImage: NetworkImage(
                  'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg'),
            ),
            const SpaceH(10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        fullName,
                        style: Theme.of(context).textTheme.titleMedium!,
                      ),
                      Text('10:47am',
                          style: Theme.of(context).textTheme.labelMedium!),
                    ],
                  ),
                  const SizedBox(
                      width: 260,
                      child: Text(
                        'hello yousief how are you i am  happy to chat with you about your depatment in paris.',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
