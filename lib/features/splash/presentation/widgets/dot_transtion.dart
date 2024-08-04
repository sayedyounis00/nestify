import 'package:flutter/material.dart';
import 'package:nestify/core/utils/theme/app_color.dart';
import 'package:nestify/features/splash/presentation/view/landing_page.dart';

class DotTranstion extends StatelessWidget {
  const DotTranstion({
    super.key,
    required this.widget,
    required this.currentIndex,
  });

  final LandingPage widget;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.imgList.asMap().entries.map((entry) {
        return GestureDetector(
          child: Container(
            width: currentIndex == entry.key ? 8.0 : 8.0,
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
