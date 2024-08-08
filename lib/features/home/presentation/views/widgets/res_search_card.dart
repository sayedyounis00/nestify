import 'package:flutter/material.dart';
import 'package:nestify/core/utils/styles.dart';
import 'package:nestify/core/widgets/space.dart';


class ResSearchCard extends StatelessWidget {
  const ResSearchCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/villa1.jpg', height: 220),
            const SpaceV(18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Punta Cana Villa', style: Styles.style18),
                Row(
                  children: [
                    Text('\$5,450', style: Styles.style18),
                    Text('/month', style: Styles.styleDesc),
                  ],
                ),
              ],
            ),
            Text('South Pointer Park, Miami, Florida.',
                style: Styles.styleDesc),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    leading: const Icon(
                      Icons.bed_outlined,
                      color: Colors.grey,
                      size: 20,
                    ),
                    title: Text('16bd', style: Styles.styleDesc),
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
                    title: Text('9ba', style: Styles.styleDesc),
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
