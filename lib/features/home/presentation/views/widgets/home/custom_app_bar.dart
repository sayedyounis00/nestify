import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';
import 'package:nestify/features/home/presentation/views/widgets/home/location_card.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: const BoxDecoration(color: AppColor.primaryColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 20),
            child: GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: const CircleAvatar(
                backgroundColor: AppColor.secColor4,
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Hi ${BlocProvider.of<HomeCubit>(context).user.firstName.capitalize},',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColor.secColor3,
                        )),
                Text('Welcome!,',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColor.secColor4))
              ],
            ),
          ),
          const Spacer(),
          const LocationCard(),
          const Padding(
            padding: EdgeInsets.only(top: 50.0, left: 10, right: 10),
            child: Icon(
              Icons.notifications_none,
              size: 30,
              color: AppColor.secColor4,
            ),
          )
        ],
      ),
    );
  }
}
