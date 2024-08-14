import 'package:flutter/material.dart';
import 'package:nestify/features/main/data/main_view_data.dart';
import 'package:nestify/features/main/presentation/views/widget/bottom_nav_bar.dart';
import 'package:nestify/features/favourite/presentation/view/fav_view.dart';
import 'package:nestify/features/home/presentation/views/home_view.dart';
import 'package:nestify/features/messages/presentation/view/messanger_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageContorller = PageController();
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageContorller,
        children: const [
          HomeView(),
          // DiscoverView(),
          FavView(),
          MessangerView(),
        ],
      ),
      bottomNavigationBar:
          NavBar(pageController: pageContorller, items: BottomNavData.tabs),
    );
  }
}
