import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:nestify/features/home/data/model/house_model.dart';
import 'package:nestify/features/home/presentation/views/contact_owner_view.dart';

class ButtonsBook extends StatelessWidget {
  const ButtonsBook({
    super.key, required this.house,
  });
  final HouseModel house;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomButton(
                text: 'contact owner',
                onPressed: () {
                  Get.to(() =>  ContactOwnerView(house: house),transition: Transition.fade);
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
