
import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/utils/routes.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_button.dart';

class ButtonsBook extends StatelessWidget {
  const ButtonsBook({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomButton(
                text: 'contact owner',
                onPressed: () {
                  Navigator.pushNamed(context, AddRouter.contactOwner);
                },
                color: Colors.white,
                foreCol: AppColor.primaryColor),
          ),
          const SpaceH(15),
          Expanded(
            child: CustomButton(
                text: 'book now',
                onPressed: () {},
                color: AppColor.primaryColor),
          ),
        ],
      ),
    );
  }
}
