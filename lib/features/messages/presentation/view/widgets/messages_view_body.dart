import 'package:flutter/material.dart';
import 'package:nestify/features/messages/presentation/view/widgets/chat_card.dart';

class MessangerViewBody extends StatelessWidget {
  const MessangerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'Messages',
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(),
        Expanded(
          child: ListView.separated(
              itemCount: 1,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(indent: 80, height: 0);
              },
              itemBuilder: (BuildContext context, int index) {
                return const ChatCard(
                  fullName: 'No name',
                );
              }),
        ),
      ],
    );
  }
}
