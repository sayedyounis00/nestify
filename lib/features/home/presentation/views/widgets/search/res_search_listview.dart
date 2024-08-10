import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/features/home/data/model/house_model.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_state.dart';
import 'package:nestify/features/home/presentation/views/widgets/category/category_data.dart';
import 'package:nestify/features/home/presentation/views/widgets/search/res_search_card.dart';
import 'package:nestify/features/home/presentation/views/widgets/search/res_search_shimmer.dart';

class ResSearchListView extends StatelessWidget {
  const ResSearchListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return FutureBuilder<List<HouseModel>>(
          future: BlocProvider.of<HomeCubit>(context).getHousesData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<HouseModel>? house = snapshot.data;
              List<HouseModel>? filterdHouse = CategoryData.filteredHouses;
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: filterdHouse.length,
                //snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ResSearchCard(
                    house:filterdHouse[index]
                    //  house![index],
                  );
                },
              );
            } else {
              return const ResSearchShimmer();
            }
          },
        );
      },
    );
  }
}
