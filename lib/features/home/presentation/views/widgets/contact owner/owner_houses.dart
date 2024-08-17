import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/core/widgets/shimmer/shimmer_card.dart';
import 'package:nestify/features/home/data/model/house_model.dart';
import 'package:nestify/features/owner%20main/presentation/view%20model/owner%20cubit/owner_cubit.dart';

class OwnerHouses extends StatelessWidget {
  const OwnerHouses({
    super.key,
    required this.house,
  });
  final HouseModel house;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: BlocProvider.of<OwnerCubit>(context)
            .getMyHouses(context: context, ownerName: house.ownerName),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            log(snapshot.data.toString());
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              padding: EdgeInsets.zero,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          snapshot.data![index].img,
                        )),
                    Text(
                      snapshot.data![index].title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    RichText(
                      text: TextSpan(
                        text:snapshot.data![index].price,
                        style: Theme.of(context).textTheme.titleMedium,
                        children: const <TextSpan>[
                          TextSpan(
                              text: '/month',
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    )
                  ],
                );
                //  FavCard(
                //   house: snapshot.data![index],
                //   onPressed: () {
                //     BlocProvider.of<OwnerCubit>(context)
                //         .removeHouse(docName: snapshot.data![index].title);
                //   },
                // );
              },
            );
          }
          if (snapshot.hasError) {
            return const Text('error');
          } else {
            return ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return ShimmerCard(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .6,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 13));
              },
            );
          }
        });
  }
}
