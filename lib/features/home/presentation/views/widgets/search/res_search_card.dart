import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nestify/core/utils/styles.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/home/data/model/house_model.dart';
import 'package:nestify/features/home/presentation/views/home_details_view.dart';
import 'package:nestify/features/home/presentation/views/widgets/title_and_price_row.dart';

class ResSearchCard extends StatelessWidget {
  const ResSearchCard({
    super.key,
    required this.house,
  });
  final HouseModel house;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => HomeDetailsView(house: house),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(tag: house.img, child: Image.asset(house.img, height: 220)),
            const SpaceV(18),
            TitleAndPriceRow(house: house),
            Text(house.place, style: Styles.styleDesc),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    leading: const Icon(
                      Icons.bed_outlined,
                      color: Colors.grey,
                      size: 20,
                    ),
                    title: Text('${house.bd}bd', style: Styles.styleDesc),
                    contentPadding: const EdgeInsets.all(0),
                    horizontalTitleGap: 1,
                  ),
                ),
                Expanded(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    horizontalTitleGap: 1,
                    leading: const Icon(Icons.bathtub_outlined,
                        size: 20, color: Colors.grey),
                    title: Text('${house.ba}ba', style: Styles.styleDesc),
                  ),
                ),
                const Expanded(flex: 2, child: SizedBox())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
