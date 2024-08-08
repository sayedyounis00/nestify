
import 'package:flutter/material.dart';
import 'package:nestify/features/home/presentation/views/widgets/res_search_card.dart';

class ResSearchListView extends StatelessWidget {
  const ResSearchListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemCount: 3,
      itemBuilder: (context, index) {
        return const ResSearchCard();
      },
    );
  }
}
