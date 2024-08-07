import 'package:flutter/material.dart';
import 'package:nestify/core/utils/home_view_data.dart';
import 'package:nestify/features/home/presentation/views/widgets/nav_bar.dart/bottom_nav_bar.dart';


class HomeView extends StatelessWidget {

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
      final PageController pageContorller = PageController();
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageContorller,
        children: Views.viewsBody
            .map(
              (Widget w) => Scaffold(
                body: w,
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: NavBar(pageController: pageContorller),
    );
  }
}
