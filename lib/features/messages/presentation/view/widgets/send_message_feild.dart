import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';
import 'package:nestify/features/messages/presentation/view%20model/add_messages%20cubit/add_message_cubit.dart';

class SendMessageFeild extends StatefulWidget {
  const SendMessageFeild({
    super.key,
  });

  @override
  State<SendMessageFeild> createState() => _SendMessageFeildState();
}

class _SendMessageFeildState extends State<SendMessageFeild> {
  final TextEditingController _formControler = TextEditingController();
  final _sendKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddMessageCubit, AddMessageState>(
      builder: (context, state) {
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
              Expanded(
                child: Form(
                  key: _sendKey,
                  child: CustomTextField(
                    onChanged: (val) {},
                    controller: _formControler,
                    hintText: 'Type message...',
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  // if (_sendKey.currentState!.validate()) {
                  // } else {
                  //   return;
                  // }
                    String userId =
                        BlocProvider.of<HomeCubit>(context).user.userId;
                    BlocProvider.of<AddMessageCubit>(context).addMessageDetail(
                      messageText: _formControler.text,
                      userID: userId,
                    );
                    _formControler.clear();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
