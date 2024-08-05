import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nestify/core/error/auth_errors_handle.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_text_field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  final TextEditingController fNameCon = TextEditingController();
  final TextEditingController lNameCon = TextEditingController();
  final TextEditingController phoneCon = TextEditingController(text: '+20');
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool valCheck = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            // Name
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextField(
                  width: MediaQuery.of(context).size.width / 2 - 25,
                  label: 'First name',
                  controller: fNameCon,
                ),
                CustomTextField(
                  width: MediaQuery.of(context).size.width / 2 - 25,
                  label: 'Last name',
                  controller: lNameCon,
                ),
              ],
            ),

            const SpaceV(20),

            // email
            CustomTextField(
              label: 'Email',
              controller: emailCon,
            ),

            const SpaceV(20),

            // password
            CustomTextField(
              label: 'Password',
              controller: passwordCon,
            ),

            const SpaceV(20),

            // phone
            CustomTextField(
              label: 'Phone number',
              controller: phoneCon,
            ),

            // Rules 
            Row(
              children: [
                Checkbox(
                    value: valCheck,
                    onChanged: (v) {
                      valCheck = v!;
                      setState(() {});
                    }),
                const Text(
                  "I understand and agree to Nestify's Terms of Service.\nUser Agreement and Privacy Policy.",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),

            const SpaceV(20),

            CustomButton(
              onPressed: valCheck
                  ? () async {
                      await signupHandle(context);
                    }
                  : null,
              text: 'Create account',
              color: valCheck == true
                  ? AppColor.primaryColor
                  : const Color.fromARGB(87, 29, 29, 29),
            ),
          ],
        ));
  }

  Future<void> signupHandle(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        await registerMethod(emailCon, passwordCon);
        ErrorHandle.showSnackBar(context, 'Created done');
        await createUser();
      } on FirebaseAuthException catch (e) {
        ErrorHandle().handleAuthErrors(e, context);
      }
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  Future<void> createUser() async {
    await firestore.collection('users').doc().set({
      'first name': fNameCon.text,
      'last name': lNameCon.text,
      'email': emailCon.text,
      'createdAt': DateTime.now().toString(),
      'phone number': phoneCon.text,
    });
  }

  Future<void> registerMethod(emailCon, passwordCon) async {
    await auth.createUserWithEmailAndPassword(
        email: emailCon.text, password: passwordCon.text);
  }
}
