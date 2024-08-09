import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/utils/styles.dart';
import 'package:nestify/core/widgets/space.dart';

class FavCard extends StatelessWidget {
  const FavCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 117,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      margin: const EdgeInsets.only(bottom: 7, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/villa1.jpg',
              height: 100,
              width: 110,
              fit: BoxFit.fill,
            ),
          ),
          const SpaceH(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('house.title', style: Styles.style19),
              RichText(
                text: TextSpan(
                  text: '\$20,000',
                  style: Theme.of(context).textTheme.titleMedium,
                  children: const <TextSpan>[
                    TextSpan(
                        text: '/month', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              const Spacer(),
              const Text(
                'View Details',
                style: TextStyle(
                    color: AppColor.primaryColor,
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
          const Spacer(),
          IconButton.filled(
            onPressed: () {},
            icon: const Icon(
              Icons.delete_outlined,
              color: Colors.red,
            ),
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0x28FF5252))),
          ),
        ],
      ),
    );
  }
}
