import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: 30,
      width: 120,
      decoration: const BoxDecoration(
          color: AppColor.secColor4,
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: const Row(
        children: [
          Icon(
            Icons.location_on,
            color: AppColor.primaryColor,
          ),
          Text(
            'Tanta,Egypt',
            style: TextStyle(
              color: AppColor.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
