import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/utils/styles.dart';

class CategoryTextRow extends StatelessWidget {
  const CategoryTextRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Categories', style: Styles.style19),
          TextButton(
            style: const ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.zero)),
            child: const Text('See all',
                style: TextStyle(color: AppColor.primaryColor)),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
