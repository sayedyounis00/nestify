import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';
import 'package:nestify/features/home/presentation/views/widgets/messages/chat_app_bar.dart';
import 'package:nestify/features/home/presentation/views/widgets/messages/custom_message_card.dart';
import 'package:nestify/features/home/presentation/views/widgets/messages/send_message_feild.dart';

class ChatView extends StatefulWidget {
  const ChatView({
    super.key,
  });

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
      .collection('messages')
      .orderBy('message_time', descending: true)
      .snapshots();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String fullName = 'any name ';
    return Scaffold(
      backgroundColor: AppColor.secColor4,
      appBar: AppBar(
        elevation: 5,
        automaticallyImplyLeading: false,
        title: ChatAppBar(
          fullName:
              fullName,
          id: BlocProvider.of<HomeCubit>(context).user.userId,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          StreamBuilder<QuerySnapshot>(
              stream: _messageStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                      child: Text('An error occurred while loading messages.'));
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView.builder(
                        reverse: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          Map<String, dynamic> messages =
                              snapshot.data!.docs[index].data()
                                  as Map<String, dynamic>;
                          return CustomMessageCard(
                              messageText: messages['message_text'],isUserOne:BlocProvider.of<HomeCubit>(context).user.userId==messages['user_id']?false:true,);
                        },
                      ),
                    ),
                  );
                } else {
                  return const Center(child: Text('No messages found.'));
                }
              }),
          SendMessageFeild(
              senderid:
                  BlocProvider.of<HomeCubit>(context).user.userId,
              ),
        ],
      ),
    );
  }
}
