import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_text_field.dart';

class ForgetPassBody extends StatefulWidget {
  const ForgetPassBody({super.key});

  @override
  State<ForgetPassBody> createState() => _ForgetPassBodyState();
}

class _ForgetPassBodyState extends State<ForgetPassBody> {
  TextEditingController emailCon = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset('assets/images/nestify.png', width: 150),
      const Text('Forget password',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      const SpaceV(20),
      Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextField(
                  label: 'Enter email address', controller: emailCon),
              const SpaceV(20),
              CustomButton(
                  text: 'Send',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      auth.sendPasswordResetEmail(email: emailCon.text);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  color: AppColor.primaryColor),
            ],
          )),
    ]);
  }
}
