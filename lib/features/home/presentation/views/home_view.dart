import 'package:flutter/material.dart';
import 'package:nestify/core/utils/home_view_data.dart';
import 'package:nestify/features/home/presentation/views/widgets/nav_bar.dart/bottom_nav_bar.dart';


class HomeView extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageContorller = PageController();
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageContorller,
        children: Views.viewsBody
            .map(
              (Widget w) => w,
            )
            .toList(),
      ),
      bottomNavigationBar: NavBar(
        pageController: _pageContorller,
      ),
    );
  }
}
