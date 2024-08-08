import 'package:flutter/material.dart';
import 'package:nestify/core/utils/styles.dart';
import 'package:nestify/features/home/data/model/house_model.dart';

class LocationText extends StatelessWidget {
  const LocationText({
    super.key,
    required this.house,
  });

  final HouseModel house;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        const Icon(
          Icons.location_on_outlined,
          color: Colors.grey,
          size: 22,
        ),
        Text(house.place, style: Styles.styleDesc)
      ]),
    );
  }
}
