import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/splash/data/landing_data.dart';

class DotTranstion extends StatelessWidget {
  const DotTranstion({
    super.key,
    required this.currentIndex,
  });
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: LandingData.landingList.asMap().entries.map((entry) {
        return GestureDetector(
          child: Container(
            width: currentIndex == entry.key ? 10.0 : 10.0,
            height: 12.0,
            margin: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 5,
            ),
            decoration: BoxDecoration(
              borderRadius:
                  currentIndex == entry.key ? BorderRadius.circular(8.0) : null,
              shape: currentIndex == entry.key
                  ? BoxShape.rectangle
                  : BoxShape.circle,
              color: currentIndex == entry.key
                  ? AppColor.primaryColor
                  : Colors.grey[200],
            ),
          ),
        );
      }).toList(),
    );
  }
}
