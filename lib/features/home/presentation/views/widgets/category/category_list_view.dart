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
  final List<String> cat = ['Villa', 'House', 'Hotel', 'Tent', 'Camp'];
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 35,
      child: ListView.builder(
        itemCount: cat.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: FilterChip(
              padding: const EdgeInsets.all(3),
              showCheckmark: false,
              selected: isSelected,
              label: Text(cat[index]),
              onSelected: (selected) {
                isSelected = selected;
                if (isSelected) {
                  BlocProvider.of<HomeCubit>(context)
                      .setFilterdHouses(category: cat[index]);
                } else {
                  BlocProvider.of<HomeCubit>(context).filterdHousesList = [];
                }
                setState(() {});
              },
              selectedColor: AppColor.primaryColor,
              shape: ContinuousRectangleBorder(
                  side: const BorderSide(color: AppColor.primaryColor),
                  borderRadius: BorderRadius.circular(16)),
            ),
          );
        },
      ),
    );
  }
}
