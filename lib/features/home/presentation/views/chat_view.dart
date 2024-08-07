import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:nestify/features/home/presentation/views/widgets/chat_app_bar.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final Stream<QuerySnapshot> messageStream = FirebaseFirestore.instance
      .collection('messages')
      .orderBy('message_time', descending: true)
      .snapshots();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments;
    arguments is Map<String, dynamic>
        ? arguments
        : {
            'fullName': 'anyName',
            'userId': 'any id ',
          };
    String fullName='anyName';
    String userId ='any id ';
    return Scaffold(
      backgroundColor: AppColor.secColor4,
      appBar: AppBar(
        elevation: 5,
        automaticallyImplyLeading: false,
        title: ChatAppBar(
          fullName: fullName,
          id: userId,
        ),
      ),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height:MediaQuery.of(context).size.width / 6 ,
            padding: const EdgeInsets.only(bottom: 10,left: 10,top: 10),
            color: AppColor.secColor4,
            child: Row(
              children: [
                const Icon(
                  Icons.attach_file_rounded,
                  size: 30,
                  color: AppColor.primaryColor,
                ),
                const SpaceH(5),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: const CustomTextField(
                    hintText: 'Type message...',
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {},
                ),
              ],
            ),
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
