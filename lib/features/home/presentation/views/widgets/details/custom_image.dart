import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nestify/features/home/data/model/house_model.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.house,
  });

  final HouseModel house;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: house.img,
          child: Image.asset(
            house.img,
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height / 2,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .1,
          left: 20,
          child: IconButton.filled(
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0x4C000000))),
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .1,
          right: 20,
          child: IconButton.filled(
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0x4C000000))),
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
            ),
          ),
        ),
      ],
    );
  }
}
