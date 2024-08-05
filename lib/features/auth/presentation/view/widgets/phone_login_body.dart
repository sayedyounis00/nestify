import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:nestify/features/auth/presentation/view/widgets/sign_up_button.dart';

class PhoneLoginBody extends StatelessWidget {
  const PhoneLoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: '+20',
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 6,
                  child: CustomTextField(
                    maxInputLength: 10,
                    hintText: 'phone Number',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                text: 'Send OTP', onPressed: () {}, color: AppColor.primaryColor),
                const SignupButton(),
          ],
        ),
      ),
    );
  }
}
