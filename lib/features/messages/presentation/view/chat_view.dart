import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/messages/presentation/view/widgets/chat_app_bar.dart';
import 'package:nestify/features/messages/presentation/view/widgets/chat_view_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    String fullName = 'any name';

    return Scaffold(
      backgroundColor: AppColor.secColor4,
      appBar: AppBar(
        elevation: 5,
        automaticallyImplyLeading: false,
        title: ChatAppBar(fullName: fullName),
      ),
      body: const ChatViewBody(),
    );
  }
}
