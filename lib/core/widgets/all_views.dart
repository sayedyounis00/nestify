import 'package:flutter/material.dart';
import 'package:nestify/core/utils/home_view_data.dart';
import 'package:nestify/core/widgets/bottom_nav_bar.dart';

class AllViews extends StatelessWidget {
  const AllViews({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageContorller = PageController();
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageContorller,
        children: Views.views.map((Widget w) => w).toList(),
      ),
      bottomNavigationBar: NavBar(pageController: pageContorller),
    );
  }
}