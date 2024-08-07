import 'package:flutter/material.dart';
import 'package:nestify/features/home/presentation/views/data/model/home_view_model.dart';
import 'package:nestify/features/home/presentation/views/widgets/nav_bar.dart/bottom_nav_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageContorller = PageController();
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageContorller,
        children: HomeViewModel.viewsBody.map((Widget w) => w).toList(),
      ),
      bottomNavigationBar: NavBar(pageController: pageContorller),
    );
  }
}
