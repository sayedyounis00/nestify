
import 'package:flutter/material.dart';
import 'package:nestify/features/home/presentation/views/data/model/drawer_model.dart';

class DrawerData {
  static List<DrawerCardMoldel> cardData = [
    DrawerCardMoldel(
      icon: const Icon(Icons.person),
      text: 'Profile',
    ),
    DrawerCardMoldel(
      icon: const Icon(Icons.note),
      text: 'Booking History',
    ),
    DrawerCardMoldel(
      icon: const Icon(Icons.watch_later_outlined),
      text: 'Recently Viewed',
    ),
    DrawerCardMoldel(
      icon: const Icon(Icons.payment),
      text: 'Payment Method',
    ),
    DrawerCardMoldel(
      icon: const Icon(Icons.settings),
      text: 'Setting',
    ),
    DrawerCardMoldel(
      icon: const Icon(Icons.headset_mic_outlined),
      text: 'Help & Support',
    ),
  ];
}
