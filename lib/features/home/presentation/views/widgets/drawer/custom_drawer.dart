import 'package:flutter/material.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/home/presentation/views/widgets/drawer/drawer_list_view.dart';
import 'package:nestify/features/home/presentation/views/widgets/drawer/info_row.dart';
import 'package:nestify/features/home/presentation/views/widgets/drawer/logout_text.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  const Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          InfoRow(),
          SpaceV(15),
          Divider(height: 0, color: Color.fromARGB(90, 52, 50, 50)),
          SpaceV(10),
          DrawerListView(),
          SpaceV(120),
          LogoutText(),
        ],
      ),
    );
  }
}
