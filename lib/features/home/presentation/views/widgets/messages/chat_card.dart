import 'package:flutter/material.dart';
import 'package:nestify/core/utils/routes.dart';
import 'package:nestify/core/widgets/space.dart';

class ChatCard extends StatefulWidget {
  const ChatCard({
    super.key,
    required this.fullName,
    required this.userId,
  });
  final String fullName;
  final String userId;

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AddRouter.chatView);
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
                        widget.fullName,
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
