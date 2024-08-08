import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({
    super.key,
  });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isActive = !isActive;
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        height: 35,
        decoration: BoxDecoration(
          color:
              isActive ? AppColor.primaryColor.withOpacity(.1) : Colors.white,
          border: Border.all(
              color: isActive ? AppColor.primaryColor : Colors.transparent),
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(20),
            right: Radius.circular(20),
          ),
        ),
        child: const Text('Recommended'),
      ),
    );
  }
}
