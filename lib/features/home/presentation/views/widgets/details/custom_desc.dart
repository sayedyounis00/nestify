import 'package:flutter/material.dart';
import 'package:nestify/core/utils/styles.dart';
import 'package:nestify/features/home/data/model/house_model.dart';

class CustomDescription extends StatelessWidget {
  const CustomDescription({
    super.key,
    required this.house,
  });
  final HouseModel house;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Property Descriotion',
              style: Styles.style18.copyWith(fontSize: 15.5)),
          Text(
            house.description,
            style: Styles.styleDesc,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
