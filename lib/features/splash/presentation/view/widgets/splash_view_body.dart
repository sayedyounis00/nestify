import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
      'assets/images/logo.webp',
      width: 180,
      height: 100,
    ));
  }
}
