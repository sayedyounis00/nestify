import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/auth/presentation/view/user_or_owner_view.dart';
import 'package:nestify/features/auth/presentation/view/widgets/login/already_hav_acc_text.dart';
import 'package:nestify/features/auth/presentation/view/widgets/login/another_login_method_card.dart';
import 'package:nestify/features/auth/presentation/view/widgets/login/login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/nestify.png', width: 120),
        const Text('Sign in to your account',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        const LoginForm(),
        const CustomDivider(),
        const SpaceV(22),
        const AnotherLoginMethodsRow(),
        const SpaceV(22),
        SignupButton(
          text: 'Don\'t have a Nestify account?',
          buttontext: 'Sign up',
          onPressed: () {
            Get.offAll(() => const UserOrOwnerView(),
                transition: Transition.downToUp);
          },
        ),
      ],
    );
  }
}

class AnotherLoginMethodsRow extends StatelessWidget {
  const AnotherLoginMethodsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnotherLoginMethodCard(
            imgPath: 'assets/images/google.png',
            onTap: () async {
              try {
                await signInWithGoogle();
              } catch (e) {
                rethrow;
              }
            }),
        const SizedBox(width: 23),
        AnotherLoginMethodCard(
            imgPath: 'assets/images/apple.png', onTap: () {}),
      ],
    );
  }

  Future<User?> signInWithGoogle() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
      return userCredential.user;
    }
    return null;
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(endIndent: 10)),
        Text('Or sign in with',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        Expanded(child: Divider(indent: 10)),
      ],
    );
  }
}
