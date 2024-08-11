import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';
import 'package:nestify/features/home/presentation/views/widgets/category/category_data.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({
    super.key,
  });

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  @override
  Widget build(BuildContext context) {
    var house = BlocProvider.of<HomeCubit>(context).allhousesList;
    CategoryData.filteredHouses = house.where((house) {
      return CategoryData.selectedCategory.isEmpty ||
          CategoryData.selectedCategory.contains(house.category);
    }).toList();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: CategoryData.categories
            .map((category) => FilterChip(
                  selected: CategoryData.selectedCategory.contains(category),
                  label: Text(category.toString()),
                  onSelected: (selected) {
                    if (selected) {
                      log(CategoryData.filteredHouses.toString());
                      CategoryData.selectedCategory.add(category);
                    } else {
                      CategoryData.selectedCategory.remove(category);
                    }
                    setState(() {});
                  },
                ))
            .toList(),
      ),
    );
  }
}

//  ListView.separated(
//         clipBehavior: Clip.none,
//         scrollDirection: Axis.horizontal,
//         itemCount: 10,
//         itemBuilder: (context, index) {
//           return const CategoryCard();
//         },
//         separatorBuilder: (context, index) {
//           return const SpaceH(10);
//         },
//       ),
