
import 'package:flutter/material.dart';
import 'package:nestify/features/home/data/model/drawer_model.dart';

class DrawerCardContent extends StatelessWidget {
  const DrawerCardContent({
    super.key,
    required this.cardModel,
  });

  final DrawerCardMoldel cardModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              cardModel.icon,
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  cardModel.text,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 20,
          ),
        ],
      ),
    );
  }
}
