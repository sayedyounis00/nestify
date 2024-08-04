import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:nestify/features/auth/presentation/view/widgets/login/forget_pass_text.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),

            // email
            CustomTextField(
              label: 'Email',
              controller: emailCon,
            ),

            const SizedBox(
              height: 25,
            ),
            // password
            CustomTextField(
              label: 'Password',
              controller: passwordCon,
            ),

            // forget pass
            const ForgetPassText(),

            const SizedBox(
              height: 10,
            ),

            // login button
            isLoading
                ? const SizedBox(height: 50, child: CircularProgressIndicator())
                : CustomButton(
                    onPressed: () {},
                    text: 'login',
                    color: AppColor.primaryColor,
                  ),

            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}

//   Future<UserCredential> signInMethod() {
//     return FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailCon.text, password: passwordCon.text);
//   }
// }

// void handleShowErrors(FirebaseAuthException e, BuildContext context) {
//   if (e.code == 'wrong-password') {
//     showSnackBar(context, 'wrong password');
//   } else if (e.code == 'invalid-email') {
//     showSnackBar(context, 'invalid email');
//   } else {
//     showSnackBar(context, 'Your email or password is wrong.');
//   }
// }

// ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
//     BuildContext context, String message) {
//   return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//     content: Text(
//       message,
//     ),
//   ));
// }
