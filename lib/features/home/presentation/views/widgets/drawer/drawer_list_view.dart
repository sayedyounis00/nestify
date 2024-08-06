import 'package:flutter/material.dart';
import 'package:nestify/features/home/presentation/views/widgets/drawer/drawer_option_card.dart';

class DrawerListView extends StatelessWidget {
  const DrawerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 6,
        itemBuilder: (context, index) {
          return const DrawerOptionCard();
        },
      ),
    );
  }
}
