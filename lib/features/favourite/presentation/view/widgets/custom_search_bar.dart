import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/home/data/model/house_model.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: TextField(
        onChanged: (searchedChar) {
          getSearchedList(searchedChar);
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search_rounded, color: Colors.grey),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.tune, color: AppColor.primaryColor),
          ),
          hintText: 'Search',
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.all(5),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14))),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              borderSide: BorderSide(color: AppColor.primaryColor)),
        ),
      ),
    );
  }

  getSearchedList(String houseTitleChar) {
    List<HouseModel> allFavList =
        BlocProvider.of<HomeCubit>(context).allhousesList;

    BlocProvider.of<HomeCubit>(context).filteredListafterSearch = allFavList
        .where(
          (house) => house.title.toLowerCase().startsWith(houseTitleChar),
        )
        .toList();
    setState(() {});
  }
}
