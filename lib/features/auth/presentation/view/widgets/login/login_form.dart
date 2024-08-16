import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart' as getnav;
import 'package:nestify/core/error/auth_errors_handle.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:nestify/features/auth/presentation/view/widgets/login/forget_pass_text.dart';
import 'package:nestify/features/main/presentation/views/main_view.dart';
import 'package:nestify/features/owner%20main/presentation/views/main_owner_view.dart';
import 'package:nestify/features/splash/presentation/view%20model/navigate%20cubit/navigate_cubit.dart';

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
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SpaceV(20),

            // email
            CustomTextField(
              label: 'Email',
              controller: emailCon,
            ),
            const SpaceV(25),

            // password
            CustomTextField(
              label: 'Password',
              controller: passwordCon,
            ),

            // forget pass
            const ForgetPassText(),
            const SpaceV(10),

            // login button
            isLoading
                ? const SizedBox(
                    height: 50,
                    width: 50,
                    child: Center(child: CircularProgressIndicator()))
                : CustomButton(
                    onPressed: () async {
                      await loginHandle(context);
                    },
                    text: 'login',
                    color: AppColor.primaryColor,
                  ),

            const SpaceV(20),
          ],
        ));
  }

  Future<void> loginHandle(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading = true;
        setState(() {});
        await signInMethod();
        BlocProvider.of<NavigateCubit>(context).setUserInfo();
        Future.delayed(const Duration(seconds: 1), () {
          if (BlocProvider.of<NavigateCubit>(context).userStatus == 'Owner') {
            Get.off(() => const MainOwnerView(),
                transition: getnav.Transition.rightToLeft);
          } else if (BlocProvider.of<NavigateCubit>(context).userStatus ==
              'renter') {
            Get.off(() => const MainView(),
                transition: getnav.Transition.rightToLeft);
          }
        });
      } on FirebaseAuthException catch (e) {
        ErrorHandle().handleAuthErrors(e, context);
      }
      isLoading = false;
      setState(() {});
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  Future<UserCredential> signInMethod() async {
    return await auth.signInWithEmailAndPassword(
        email: emailCon.text, password: passwordCon.text);
  }
}
