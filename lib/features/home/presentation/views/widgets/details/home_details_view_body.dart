import 'package:flutter/material.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/home/data/model/house_model.dart';
import 'package:nestify/features/home/presentation/views/widgets/details/bottons_book.dart';
import 'package:nestify/features/home/presentation/views/widgets/details/custom_desc.dart';
import 'package:nestify/features/home/presentation/views/widgets/details/custom_image.dart';
import 'package:nestify/features/home/presentation/views/widgets/details/location_text.dart';
import 'package:nestify/features/home/presentation/views/widgets/details/rating_row.dart';
import 'package:nestify/features/home/presentation/views/widgets/title_and_price_row.dart';

class HomeDetailsViewBody extends StatelessWidget {
  const HomeDetailsViewBody({super.key, required this.house});
  final HouseModel house;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImage(house: house),
        const SpaceV(17),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TitleAndPriceRow(house: house),
        ),
        LocationText(house: house),
        const SpaceV(19),
        RatingRow(house: house),
        const SpaceV(19),
        const CustomDescription(),
        const SpaceV(13),
        const Divider(),
        const ButtonsBook()
      ],
    );
  }
}
