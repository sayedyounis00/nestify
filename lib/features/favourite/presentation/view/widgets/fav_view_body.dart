import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/core/widgets/shimmer/shimmer_card.dart';
import 'package:nestify/features/favourite/presentation/view/widgets/custom_search_bar.dart';
import 'package:nestify/features/favourite/presentation/view/widgets/fav_card.dart';
import 'package:nestify/features/home/data/model/house_model.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_state.dart';

class FavViewBody extends StatelessWidget {
  const FavViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Favourites',
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        const Divider(),
        const CustomSearchBar(),
        Expanded(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return FutureBuilder(
                future: BlocProvider.of<HomeCubit>(context).getFavHouses(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return FavCard(
                          house: HouseModel.fromJson(
                            snapshot.data![index],
                          ),
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const ShimmerCard(
                            width: double.infinity,
                            height: 117,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 13));
                      },
                    );
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
