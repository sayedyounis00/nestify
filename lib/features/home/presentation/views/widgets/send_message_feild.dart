import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_text_field.dart';

class SendMessageFeild extends StatefulWidget {
  const SendMessageFeild({
    super.key,
    required this.senderid,
  });
  final String senderid;

  @override
  State<SendMessageFeild> createState() => _SendMessageFeildState();
}

class _SendMessageFeildState extends State<SendMessageFeild> {
  CollectionReference message =
      FirebaseFirestore.instance.collection('messages');
  final TextEditingController _formControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 6,
      padding: const EdgeInsets.only(bottom: 10, left: 10, top: 10),
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
            child: CustomTextField(
              controller: _formControler,
              hintText: 'Type message...',
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              addMessageDetail(_formControler.text);
              _formControler.clear();
            },
          ),
        ],
      ),
    );
  }
  
  Future<void> addMessageDetail(String messageText) {
    return message.add({
      'message_text': messageText,
      'user_id': widget.senderid,
      'message_time':DateFormat('h:mm a').format(DateTime.now()),
    });
  }
}
