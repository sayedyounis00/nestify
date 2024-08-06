import 'package:flutter/material.dart';
import 'package:nestify/features/home/presentation/views/data/model/home_view_model.dart';
import 'package:nestify/features/home/presentation/views/widgets/nav_bar.dart/bottom_nav_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageContorller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageContorller,
        children: HomeViewModel.viewsBody
            .map(
              (Widget w) => Scaffold(
                body: w,
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: NavBar(
        pageController: _pageContorller,
      ),
    );
  }
}
