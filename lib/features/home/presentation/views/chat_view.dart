import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_text_field.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    String fullName = arguments is String ? arguments : 'Default Name';
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: CircleAvatar(
                    maxRadius: 18,
                    backgroundImage: NetworkImage(
                      'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                    ),
                  ),
                ),
                Text(fullName),
              ],
            ),
            const Icon(
              Icons.call,
              size: 30,
              color: AppColor.primaryColor,
            ),
          ],
        ),
      ),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
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
                const Expanded(
                  child: CustomTextField(
                    width: 200,
                    hinttEXT: 'Type message...',
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
