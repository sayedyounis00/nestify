import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart' as nav;
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/auth/presentation/view/login_view.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';

class CustomAppBarSignup extends StatelessWidget {
  const CustomAppBarSignup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/nestify.png', width: 80),
        const Spacer(),
        Text(
          "Signup as ${BlocProvider.of<HomeCubit>(context).userStatus}",
          style: const TextStyle(
              fontSize: 12,
              color: AppColor.secColor1,
              fontWeight: FontWeight.w500),
        ),
        TextButton(
          style: const ButtonStyle(
              padding: WidgetStatePropertyAll(EdgeInsets.zero)),
          onPressed: () {
            Get.off(() => const LoginView(),
                transition: nav.Transition.downToUp);
          },
          child: const Text(
            'login',
            style: TextStyle(
                fontSize: 15,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
