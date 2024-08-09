import 'package:flutter/material.dart';
import 'package:nestify/features/faviorite/presentation/view/widgets/custom_search_bar.dart';
import 'package:nestify/features/faviorite/presentation/view/widgets/fav_card.dart';

class FavViewBody extends StatelessWidget {
  const FavViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Favourites',
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        const Divider(),
        const CustomSearchBar(),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return const FavCard();
            },
          ),
        ),
      ],
    );
  }
}
