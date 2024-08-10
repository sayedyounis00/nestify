import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart' as nav;
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/auth/presentation/view/get_owner_info_view.dart';
import 'package:nestify/features/auth/presentation/view/login_view.dart';
import 'package:nestify/features/auth/presentation/view/signup_view.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:nestify/features/auth/presentation/view/widgets/login/already_hav_acc_text.dart';
import 'package:nestify/features/auth/presentation/view/widgets/select_user_type.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';

class UserOrOwnerViewBody extends StatefulWidget {
  const UserOrOwnerViewBody({super.key});

  @override
  State<UserOrOwnerViewBody> createState() => _UserOrOwnerViewBodyState();
}

class _UserOrOwnerViewBodyState extends State<UserOrOwnerViewBody> {
  int _selectedIndex = -1;
  Color buttonColor = AppColor.primaryColor.withOpacity(0.4);
  String userStatus = 'No status Yet';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sign Up as a renter or a\n property Owner',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SelecUserType(
            text: 'As a Renter',
            value: _selectedIndex == 0,
            onChanged: (bool? value) {
              userStatus = 'renter';
              _onCheckBoxChanged(0, value);
              buttonColor = AppColor.primaryColor;
              setState(() {});
            },
          ),
          SelecUserType(
            text: 'As a Properity Owner',
            value: _selectedIndex == 1,
            onChanged: (bool? value) {
              userStatus = 'Owner';
              buttonColor = AppColor.primaryColor;
              _onCheckBoxChanged(1, value);
              setState(() {});
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: CustomButton(
              text: 'Create Account',
              onPressed: () {
                goToMethod(context);
              },
              color: buttonColor,
              width: double.infinity,
            ),
          ),
          SignupButton(
            text: 'Already have a Nestify account ?',
            buttontext: 'Sign in',
            onPressed: () {
              Get.to(() => const LoginView(),
                  transition: nav.Transition.rightToLeft);
            },
          ),
        ],
      ),
    );
  }

  void goToMethod(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).setUserStatus(status: userStatus);
    if (BlocProvider.of<HomeCubit>(context).userStatus == 'Owner') {
      Get.to(() => const GetAboutOwnerView(),
          transition: nav.Transition.rightToLeft);
    } else if (BlocProvider.of<HomeCubit>(context).userStatus == 'renter') {
      Get.to(() => const SignupView(), transition: nav.Transition.rightToLeft);
    }
  }

  void _onCheckBoxChanged(int index, bool? value) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
