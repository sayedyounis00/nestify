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
  final List<String> selectedCategory = [];

  @override
  Widget build(BuildContext context) {
    var house = BlocProvider.of<HomeCubit>(context).allhousesList;

    BlocProvider.of<HomeCubit>(context).filterdHousesList =
        house.where((house) {
      return selectedCategory.isEmpty ||
          selectedCategory.contains(house.category);
    }).toList();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: categories
            .map((category) => FilterChip(
                  showCheckmark: false,
                  selectedColor: AppColor.primaryColor,
                  selected: selectedCategory.contains(category),
                  label: Text(category.toString()),
                  onSelected: (selected) {
                    if (selected) {
                      selectedCategory.add(category);
                    } else {
                      selectedCategory.remove(category);
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