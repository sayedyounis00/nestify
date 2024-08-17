import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/auth/presentation/view/login_view.dart';

class LogoutText extends StatefulWidget {
  const LogoutText({
    super.key,
  });

  @override
  State<LogoutText> createState() => _LogoutTextState();
}

class _LogoutTextState extends State<LogoutText> {
  bool isOut = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.white10,
        onTap: () {
          showMyDialog(context);
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout_outlined, color: AppColor.secColor2),
            SpaceH(8),
            Text('Logout',
                style: TextStyle(color: AppColor.secColor2, fontSize: 18))
          ],
        ),
      ),
    );
  }

  void showMyDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Log out'),
            content: const Text('Are you sure about logging out?'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Get.offAll(() => const LoginView(),
                      transition: Transition.fade);
                },
              ),
              TextButton(
                child: const Text('cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
