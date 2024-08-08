
import 'package:flutter/material.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/home/presentation/views/widgets/category/category_card.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 35,
      child: ListView.separated(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const CategoryCard();
        },
        separatorBuilder: (context, index) {
          return const SpaceH(10);
        },
      ),
    );
  }
}
