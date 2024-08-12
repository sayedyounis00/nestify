import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart' as nav;
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/utils/styles.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/home/data/model/house_model.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';
import 'package:nestify/features/home/presentation/views/home_details_view.dart';

class FavCard extends StatelessWidget {
  const FavCard( {
    super.key,
    required this.house,
  });
  final HouseModel house;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.14,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      margin: const EdgeInsets.only(bottom: 7, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: house.img,
              height: 100,
              width: 110,
              fit: BoxFit.fill,
            ),
          ),
          const SpaceH(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(house.title, style: Styles.style19),
              RichText(
                text: TextSpan(
                  text: '\$${house.price}',
                  style: Theme.of(context).textTheme.titleMedium,
                  children: const <TextSpan>[
                    TextSpan(
                        text: '/month', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Get.to(
                    () => HomeDetailsView(house: house),
                    transition: nav.Transition.zoom,
                  );
                },
                child: const Text(
                  'View Details',
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton.filled(
            onPressed: () {
              BlocProvider.of<HomeCubit>(context)
                  .removeFromFavourite(house.title);
            },
            icon: const Icon(
              Icons.delete_outlined,
              color: Colors.red,
            ),
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0x28FF5252))),
          ),
        ],
      ),
    );
  }
}
