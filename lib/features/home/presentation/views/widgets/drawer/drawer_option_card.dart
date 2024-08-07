import 'package:flutter/material.dart';
import 'package:nestify/features/home/presentation/views/data/model/drawer_model.dart';
import 'package:nestify/features/home/presentation/views/widgets/drawer_card_content.dart';

class DrawerOptionCard extends StatelessWidget {
  const DrawerOptionCard({
    super.key, required this.cardModel,
  });
  final DrawerCardMoldel cardModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3 /6-5,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: DrawerCardContent(cardModel: cardModel),
    );
  }
}
