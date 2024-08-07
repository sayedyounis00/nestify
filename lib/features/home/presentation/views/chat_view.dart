import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/home/data/model/user.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';
import 'package:nestify/features/home/presentation/views/widgets/messages/chat_app_bar.dart';
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
    String userid = 'id';
    String fullName = 'any name ';
    return Scaffold(
      backgroundColor: AppColor.secColor4,
      appBar: AppBar(
        elevation: 5,
        automaticallyImplyLeading: false,
        title: ChatAppBar(
          fullName:
              fullName,
          id: userid,
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
                              messageText: messages['message_text']);
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

class CustomMessageCard extends StatelessWidget {
  const CustomMessageCard({
    super.key,
    required this.messageText,
  });
  final String messageText;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      alignment: Alignment.centerLeft,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.primaryColor,
        ),
        child: Text(
          messageText,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColor.secColor4),
        ),
      ),
    );
  }
}
