import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';
import 'package:nestify/features/home/presentation/views/widgets/contact%20owner/about_owner.dart';
import 'package:nestify/features/home/presentation/views/widgets/contact%20owner/owner_contact.dart';
import 'package:nestify/features/home/presentation/views/widgets/contact%20owner/owner_houses.dart';

class OwnerInfo extends StatelessWidget {
  const OwnerInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
              'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            BlocProvider.of<HomeCubit>(context).user.fullName,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const Text('Real State Manager'),
        const SpaceV(10),
        const OwnerContact(),
        const SpaceV(20),
        const TabBar(
            indicatorColor: Colors.transparent,
            labelColor: Colors.black,
            tabs: [
              Text('About'),
              Text('Listings'),
            ]),
        const Expanded(
          child: TabBarView(children: [
            AboutOwner(),
            OwnerHouses()
          ]),
        )
      ],
    );
  }
}