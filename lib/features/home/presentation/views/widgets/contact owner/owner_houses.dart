import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/core/widgets/shimmer/shimmer_card.dart';
import 'package:nestify/features/favourite/presentation/view/widgets/fav_card.dart';
import 'package:nestify/features/owner%20main/presentation/view%20model/owner%20cubit/owner_cubit.dart';

class OwnerHouses extends StatelessWidget {
  const OwnerHouses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: 2,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemBuilder: (context, index) => FutureBuilder(
          future: BlocProvider.of<OwnerCubit>(context).getMyHouses(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return FavCard(
                    house: snapshot.data![index],
                    onPressed: () {
                      BlocProvider.of<OwnerCubit>(context)
                          .removeHouse(docName: snapshot.data![index].title);
                    },
                  );
                },
              );
            } else {
              return ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const ShimmerCard(
                      width: double.infinity,
                      height: 117,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 13));
                },
              );
            }
          }),
    );
  }
}
