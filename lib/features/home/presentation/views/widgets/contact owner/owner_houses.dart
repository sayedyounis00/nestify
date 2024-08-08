
import 'package:flutter/material.dart';

class OwnerHouses extends StatelessWidget {
  const OwnerHouses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: 2,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/villa1.jpg',
              )),
          Text(
            'Punta Cana Villa',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          RichText(
            text: TextSpan(
              text: r'$5,450',
              style: Theme.of(context).textTheme.titleMedium,
              children: const <TextSpan>[
                TextSpan(
                    text: '/month',
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
