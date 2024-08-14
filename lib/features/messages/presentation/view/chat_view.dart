import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/messages/presentation/view%20model/get_messages%20cubit/get_messages_cubit.dart';
import 'package:nestify/features/messages/presentation/view/widgets/chat_app_bar.dart';
import 'package:nestify/features/messages/presentation/view/widgets/chat_view_body.dart';

class ChatView extends StatefulWidget {
  const ChatView({
    super.key, required this.fullName,
  });
  final String fullName;

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetMessagesCubit>(context).fetchMessageInformation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secColor4,
      appBar: AppBar(
        elevation: 5,
        automaticallyImplyLeading: false,
        title: ChatAppBar(fullName: widget.fullName),
      ),
      body: const ChatViewBody(),
    );
  }
}
