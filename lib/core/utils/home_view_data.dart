import 'package:flutter/material.dart';
import 'package:nestify/features/home/presentation/views/discover_view.dart';
import 'package:nestify/features/home/presentation/views/fav_view.dart';
import 'package:nestify/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:nestify/features/home/presentation/views/widgets/messages/messanger_view.dart';
import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class Views {
  static final List<Widget> viewsBody = [
    const HomeViewBody(),
    const DiscoverViewBody(),
    const FavViewBody(),
    const MessangerViewBody(),
  ];
}

class BottomNavData {
  static List<TabItem> tabs = const [
    TabItem(icon: FontAwesomeIcons.houseUser, title: 'Home'),
    TabItem(icon: FontAwesomeIcons.compass, title: 'Discover'),
    TabItem(icon: FontAwesomeIcons.heart, title: 'Faviorite'),
    TabItem(icon: FontAwesomeIcons.message, title: 'Messages'),
  ];
}
