
import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/utils/styles.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/home/data/model/house_model.dart';
import 'package:nestify/features/home/presentation/views/widgets/details/num_bed_card.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({
    super.key,
    required this.house,
  });

  final HouseModel house;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          NumBedsCard(numers: '${house.bd}bd', icon: Icons.bed_outlined),
          const SpaceH(15),
          NumBedsCard(
              numers: '${house.ba}ba', icon: Icons.bathtub_outlined),
          const SpaceH(25),
          const SizedBox(
            height: 70,
            child: VerticalDivider(),
          ),
          const SpaceH(25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ratings', style: Styles.style16),
              const Row(
                children: [
                  Icon(Icons.star_sharp, color: Colors.yellow),
                  Icon(Icons.star_sharp, color: Colors.yellow),
                  Icon(Icons.star_sharp, color: Colors.yellow),
                  Icon(Icons.star_sharp, color: Colors.yellow),
                  Icon(Icons.star_sharp, color: Colors.yellow),
                ],
              ),
              const Text('6 reviews',
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      decoration: TextDecoration.underline))
            ],
          )
        ],
      ),
    );
  }
}