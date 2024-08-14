import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';
import 'package:nestify/features/messages/data/message_model.dart';
import 'package:nestify/features/messages/presentation/view%20model/add_messages%20cubit/add_message_cubit.dart';
import 'package:nestify/features/messages/presentation/view%20model/get_messages%20cubit/get_messages_cubit.dart';
import 'package:nestify/features/messages/presentation/view/widgets/custom_message_card.dart';
import 'package:nestify/features/messages/presentation/view/widgets/send_message_feild.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BlocBuilder<GetMessagesCubit, GetMessageState>(
          builder: (context, state) {
            if (state is GetMessagesSuccess) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    reverse: true,
                    itemCount: state.messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      List<MessageModel> message = state.messages;
                      return CustomMessageCard(
                        messageText: message[index].messageText,
                        isMe: message[index].senderName ==
                                BlocProvider.of<HomeCubit>(context).user.userId
                            ? true
                            : false,
                      );
                    },
                  ),
                ),
              );
            } else {
              return const Text('fail to get message');
            }
          },
        ),
        BlocProvider(
          create: (context) => AddMessageCubit(),
          child: const SendMessageFeild(),
        ),
      ],
    );
  }
}
