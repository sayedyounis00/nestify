import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:nestify/features/auth/presentation/view/widgets/login/login_view_body.dart';
import 'package:nestify/features/auth/presentation/view/widgets/select_user_type.dart';

class UserOrOwnerViewBody extends StatefulWidget {
  const UserOrOwnerViewBody({super.key});

  @override
  State<UserOrOwnerViewBody> createState() => _UserOrOwnerViewBodyState();
}

class _UserOrOwnerViewBodyState extends State<UserOrOwnerViewBody> {
  int _selectedIndex = -1;
  Color buttonColor = AppColor.primaryColor.withOpacity(0.4);

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
              _onCheckBoxChanged(0, value);
              buttonColor = AppColor.primaryColor;
              setState(() {});
            },
          ),
          SelecUserType(
            text: 'As a Properity Owner',
            value: _selectedIndex == 1,
            onChanged: (bool? value) {
              buttonColor = AppColor.primaryColor;
              _onCheckBoxChanged(1, value);
              setState(() {});
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: CustomButton(
              text: 'Creat Account',
              onPressed: () {},
              color: buttonColor,
              width: double.infinity,
            ),
          ),
          const SignupButton(
            text: 'Already have a Nestify account ?',
            buttontext: 'Sign in',
          ),
        ],
      ),
    );
  }

  void _onCheckBoxChanged(int index, bool? value) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
