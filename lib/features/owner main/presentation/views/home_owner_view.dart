import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart' as nav;
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/utils/styles.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:nestify/features/owner%20main/presentation/views/add_property_view.dart';
import 'package:nestify/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:nestify/features/home/presentation/views/widgets/drawer/custom_drawer.dart';
import 'package:nestify/features/owner%20main/presentation/view%20model/owner%20cubit/owner_cubit.dart';
import 'package:nestify/features/owner%20main/presentation/views/widgets/myhouses_list_view.dart';

class HomeViewOwner extends StatelessWidget {
  const HomeViewOwner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OwnerCubit(),
      child: Scaffold(
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
          const MyHousesListView(),
        ]),
        drawer: const CustomDrawer(),
      ),
    );
  }
}
