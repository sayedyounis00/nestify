import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';


class BottomNavData {
  static List<TabItem> tabs = const [
    TabItem(icon: FontAwesomeIcons.houseUser, title: 'Home'),
    TabItem(icon: FontAwesomeIcons.compass, title: 'Discover'),
    TabItem(icon: FontAwesomeIcons.heart, title: 'Faviorite'),
    TabItem(icon: FontAwesomeIcons.message, title: 'Messages'),
  ];
  static List<TabItem> ownerTabs = const [
    TabItem(icon: FontAwesomeIcons.houseUser, title: 'Home'),
    TabItem(icon: FontAwesomeIcons.message, title: 'Messages'),
  ];
}
