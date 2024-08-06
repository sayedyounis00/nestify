import 'package:flutter/material.dart';
import 'package:nestify/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:nestify/features/home/presentation/views/widgets/drawer/custom_drawer.dart';
import 'package:nestify/features/home/presentation/views/widgets/search_filter.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Stack(
            children: [
              CustomAppBar(),
              SearchFilter(),
            ],
          ),
        ],
      ),
    );
  }
}
