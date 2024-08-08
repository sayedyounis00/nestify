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
        RichText(
          text: TextSpan(
            text: house.price,
            style: Theme.of(context).textTheme.titleMedium,
            children: const <TextSpan>[
              TextSpan(text: '/month', style: TextStyle(color: Colors.grey)),
            ],
          ),
        )
      ],
    );
  }
}
