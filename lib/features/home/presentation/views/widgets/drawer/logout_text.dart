import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/auth/presentation/view/login_view.dart';

class LogoutText extends StatelessWidget {
  const LogoutText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.white10,
        onTap: () {
          FirebaseAuth.instance.signOut();
          Get.offAll(() => const LoginView(),transition: Transition.fade);
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
}
