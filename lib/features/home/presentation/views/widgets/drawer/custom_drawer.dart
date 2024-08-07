import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';
import 'package:nestify/features/home/presentation/views/widgets/drawer/drawer_list_view.dart';
import 'package:nestify/features/home/presentation/views/widgets/drawer/info_row.dart';
import 'package:nestify/features/home/presentation/views/widgets/drawer/logout_text.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          InfoRow(user: BlocProvider.of<HomeCubit>(context).user),
          const SpaceV(15),
          const Divider(height: 0, color: Color.fromARGB(90, 52, 50, 50)),
          const SpaceV(10),
          const DrawerListView(),
          const Divider(height: 0, color: Color.fromARGB(90, 52, 50, 50)),
          const SpaceV(120),
          const LogoutText(),
        ],
      ),
    );
  }
}
