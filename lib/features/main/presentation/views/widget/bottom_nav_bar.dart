import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key, required this.pageController, required this.items});

  final PageController pageController;
  final List<TabItem<dynamic>> items;
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return BottomBarDefault(
      items: widget.items,
      backgroundColor: Colors.white,
      color: AppColor.secColor3,
      colorSelected: AppColor.primaryColor,
      indexSelected: selected,
      onTap: (int index) {
        selected = index;
        widget.pageController.jumpToPage(selected);
        setState(() {});
      },
    );
  }
}
