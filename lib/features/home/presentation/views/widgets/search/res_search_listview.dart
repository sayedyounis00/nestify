import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/core/widgets/shimmer/shimmer_card.dart';
import 'package:nestify/features/home/data/model/house_model.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';
import 'package:nestify/features/home/presentation/views/widgets/search/res_search_card.dart';

class ResSearchListView extends StatelessWidget {
  const ResSearchListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: BlocProvider.of<HomeCubit>(context).getHousesData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Map<String, dynamic>>? house = snapshot.data;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ResSearchCard(
                house: HouseModel(
                  img: house![index]['img'],
                  title: house[index]['title'],
                  place: house[index]['place'],
                  bd: house[index]['bd'],
                  ba: house[index]['ba'],
                  price: house[index]['price'],
                  isFav: true,
                  ownerName: house[index]['owner_name'],
                ),
              );
            },
          );
        } else {
          return const ResSearchShimmer();
        }
      },
    );
  }
}

class ResSearchShimmer extends StatelessWidget {
  const ResSearchShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 10),
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (context, index) {
        return const ShimmerCard(
          width: double.infinity,
          height: 370,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        );
      },
    );
  }
}
