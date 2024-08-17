import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/home/data/model/house_model.dart';
import 'package:nestify/features/home/presentation/views/widgets/contact%20owner/about_owner.dart';
import 'package:nestify/features/home/presentation/views/widgets/contact%20owner/owner_contact.dart';
import 'package:nestify/features/home/presentation/views/widgets/contact%20owner/owner_houses.dart';

class OwnerInfo extends StatelessWidget {
  const OwnerInfo({
    super.key,
    required this.house,
  });
  final HouseModel house;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: CachedNetworkImageProvider(
              'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            house.ownerName,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const Text('Real State Manager'),
        const SpaceV(10),
        OwnerContact(house: house),
        const SpaceV(20),
        const TabBar(
            labelStyle: TextStyle(fontSize: 20),
            padding: EdgeInsets.all(10),
            indicatorColor: Colors.transparent,
            labelColor: Colors.black,
            tabs: [
              Text('About'),
              Text('Listings'),
            ]),
        Expanded(
          child: TabBarView(children: [
            const AboutOwner(),
            OwnerHouses(
              house: house,
            )
          ]),
        )
      ],
    );
  }
}
