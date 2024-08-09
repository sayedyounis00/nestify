import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/main/data/main_view_data.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key, required this.pageController});

  final PageController pageController;
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return BottomBarDefault(
      items: BottomNavData.tabs,
      backgroundColor: Colors.white,
      color: AppColor.secColor3,
      colorSelected: AppColor.primaryColor,
      indexSelected: selected,
      onTap: (int index) {
        selected = index;
        // widget.pageController.animateToPage(
        //   selected,
        //   duration: const Duration(milliseconds: 100),
        //   curve: Curves.easeInOut,
        // );
        widget.pageController.jumpToPage(selected);
        setState(() {});
      },
    );
  }
}
