import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart' as nav;
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/utils/styles.dart';
import 'package:nestify/core/widgets/load_indicator.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:nestify/features/favourite/presentation/view/widgets/fav_card.dart';
import 'package:nestify/features/home/data/model/house_model.dart';
import 'package:nestify/features/owner%20main/presentation/view%20model/owner%20cubit/owner_state.dart';
import 'package:nestify/features/owner%20main/presentation/views/add_property_view.dart';
import 'package:nestify/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:nestify/features/home/presentation/views/widgets/drawer/custom_drawer.dart';
import 'package:nestify/features/owner%20main/presentation/view%20model/owner%20cubit/owner_cubit.dart';

class HomeViewOwner extends StatelessWidget {
  const HomeViewOwner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CustomAppBar(),
        const SpaceV(15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomButton(
              text: 'Add property',
              onPressed: () {
                Get.to(const AddPropertyView(),
                    transition: nav.Transition.fade);
              },
              color: AppColor.primaryColor,
              width: double.infinity),
        ),
        const SpaceV(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text('My properties', style: Styles.style18),
        ),
        const SpaceV(15),
        Expanded(
          child: BlocBuilder<OwnerCubit, OwnerState>(
            builder: (context, state) {
              if (state is AddHouseSuccess ||
                  state is RemoveHouseDone ||
                  state is OwnerInit) {
                return FutureBuilder(
                  future: BlocProvider.of<OwnerCubit>(context)
                      .getMyHouses(context: context),
                  builder: (context, snapshot) {
                    return handleGetHouses(snapshot);
                  },
                );
              } else {
                return const Center(
                  child: Text('Error'),
                );
              }
            },
          ),
        )
      ]),
      drawer: const CustomDrawer(),
    );
  }

  Widget handleGetHouses(AsyncSnapshot<List<HouseModel>> snapshot) {
    if (snapshot.hasData) {
      return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          return FavCard(
            house: snapshot.data![index],
            onPressed: () {
              BlocProvider.of<OwnerCubit>(context).removeHouse(
                docName: snapshot.data![index].title,
              );
            },
          );
        },
      );
    } else if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: LoadIndicator());
    } else {
      return const Center(child: Text('Failed to get your properties'));
    }
  }
}
