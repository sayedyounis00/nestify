import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({
    super.key,
  });

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  final List<String> categories = ['Villa', 'House', 'Hotel', 'Tent', 'Camp'];
  List<String> selectedCategory = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: categories
            .map((category) => FilterChip(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  showCheckmark: false,
                  selectedColor: AppColor.primaryColor,
                  selected: selectedCategory.contains(category),
                  label: Text(category.toString()),
                  onSelected: (selected) {
                    if (selected) {
                      if (selectedCategory.isNotEmpty) {
                        selectedCategory = [];
                      }
                      selectedCategory.add(category);
                      BlocProvider.of<HomeCubit>(context)
                          .setFilterdHouses(category: selectedCategory.first);
                    } else {
                      selectedCategory.remove(category);
                      BlocProvider.of<HomeCubit>(context).filterdHousesList =
                          [];
                    }
                    setState(() {});
                  },
                ))
            .toList(),
      ),
    );
  }
}
