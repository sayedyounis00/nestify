import 'package:flutter/material.dart';
import 'package:nestify/features/home/presentation/views/widgets/drawer/custom_drawer.dart';
import 'package:nestify/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewBody(),
      drawer: CustomDrawer(),
    );
  }
}
