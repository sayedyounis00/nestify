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
    return const Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          InfoRow(),
          SpaceV(15),
          Divider(height: 0, color: Color(0x5A9E9E9E)),
          DrawerListView(),
          Divider(height: 0, color: Color(0x5A9E9E9E)),
          SpaceV(120),
          LogoutText(),
        ],
      ),
    );
  }
}
