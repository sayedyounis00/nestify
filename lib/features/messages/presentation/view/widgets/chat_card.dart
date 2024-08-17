import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart'    as nav;
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/messages/presentation/view%20model/get_messages%20cubit/get_messages_cubit.dart';
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
        Get.to(() => ChatView(fullName: fullName),transition: nav.Transition.rightToLeft);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 120,
        child: Row(
          children: [
            const CircleAvatar(
              maxRadius: 30,
              backgroundImage: CachedNetworkImageProvider(
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
                  SizedBox(
                      width: 260,
                      child: BlocBuilder<GetMessagesCubit, GetMessageState>(
                        builder: (context, state) {
                          return Text(
                            BlocProvider.of<GetMessagesCubit>(context)
                                .getLastMessage(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          );
                        },
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
