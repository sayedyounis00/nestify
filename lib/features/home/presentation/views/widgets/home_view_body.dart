import 'package:flutter/material.dart';
import 'package:nestify/features/home/presentation/views/widgets/category/category_list_view.dart';
import 'package:nestify/features/home/presentation/views/widgets/category/category_text_row.dart';
import 'package:nestify/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:nestify/features/home/presentation/views/widgets/res_search_listview.dart';
import 'package:nestify/features/home/presentation/views/widgets/search_filter.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomAppBar(),
            SearchFilter(),
          ],
        ),
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            children: const [
              CategoryTextRow(),
              CategoryListView(),
              ResSearchListView(),
            ],
          ),
        ),
      ],
    );
  }
}
