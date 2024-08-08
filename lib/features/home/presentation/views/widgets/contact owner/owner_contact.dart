import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_button.dart';

class OwnerContact extends StatelessWidget {
  const OwnerContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
            text: 'Message',
            onPressed: () {},
            color: AppColor.primaryColor),
        const SpaceH(10),
        CustomButton(
          text: 'Call',
          onPressed: () {},
          color: AppColor.secColor4,
          foreCol: AppColor.primaryColor,
        ),
      ],
    );
  }
}