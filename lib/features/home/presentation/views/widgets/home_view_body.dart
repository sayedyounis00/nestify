import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nestify/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:nestify/features/home/presentation/views/widgets/search_filter.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            const CustomAppBar(),
            const SearchFilter(),
            Positioned(
              bottom: 100,
              child: IconButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Get.back();
                  },
                  icon: const Icon(Icons.logout)),
            )
          ],
        ),
      ],
    );
  }
}
