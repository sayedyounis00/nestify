import 'package:flutter/material.dart';
import 'package:nestify/features/faviorite/presentation/view/widgets/fav_view_body.dart';

class FavView extends StatelessWidget {
  const FavView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FavViewBody(),
    );
  }
}

