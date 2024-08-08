import 'package:flutter/material.dart';
import 'package:nestify/core/utils/styles.dart';
import 'package:nestify/features/home/data/model/house_model.dart';

class TitleAndPriceRow extends StatelessWidget {
  const TitleAndPriceRow({
    super.key,
    required this.house,
  });

  final HouseModel house;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(house.title, style: Styles.style18),
        Row(
          children: [
            Text('\$${house.price}', style: Styles.style18),
            Text('/month', style: Styles.styleDesc),
          ],
        ),
      ],
    );
  }
}
