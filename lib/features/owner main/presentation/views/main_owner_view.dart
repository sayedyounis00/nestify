import 'package:flutter/material.dart';
import 'package:nestify/features/main/data/main_view_data.dart';
import 'package:nestify/features/main/presentation/views/widget/bottom_nav_bar.dart';
import 'package:nestify/features/messages/presentation/view/messanger_view.dart';
import 'package:nestify/features/owner%20main/presentation/views/home_owner_view.dart';

class MainOwnerView extends StatelessWidget {
  const MainOwnerView({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageContorller = PageController();
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageContorller,
        children: const [
          HomeViewOwner(),
          MessangerView(),
        ],
      ),
      bottomNavigationBar: NavBar(
          pageController: pageContorller, items: BottomNavData.ownerTabs),
    );
  }
}
