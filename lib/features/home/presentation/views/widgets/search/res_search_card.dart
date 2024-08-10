import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nestify/core/helper/helper.dart';
import 'package:nestify/core/utils/styles.dart';
import 'package:nestify/core/widgets/shimmer/shimmer_card.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/home/data/model/house_model.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_state.dart';
import 'package:nestify/features/home/presentation/views/home_details_view.dart';
import 'package:nestify/features/home/presentation/views/widgets/title_and_price_row.dart';

class ResSearchCard extends StatefulWidget {
  const ResSearchCard({
    super.key,
    required this.house,
  });
  final HouseModel house;

  @override
  State<ResSearchCard> createState() => _ResSearchCardState();
}

class _ResSearchCardState extends State<ResSearchCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        Helper.updateFavouriteMethod(widget.house, context);
        setState(() {});
        widget.house.isFav
            ? const Icon(
                Icons.favorite,
                color: Colors.red,
              )
            : const Icon(
                Icons.favorite_border,
              );
      },
      onTap: () {
        Get.to(
          () => HomeDetailsView(house: widget.house),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(children: [
              Hero(
                tag: widget.house.img,
                child: CachedNetworkImage(
                  placeholder: (context, url) {
                    return const ShimmerCard(
                        width: double.infinity, height: 220);
                  },
                  imageUrl: widget.house.img,
                  height: 220,
                  width: double.infinity,
                ),
              ),
              Positioned(
                  top: 20,
                  right: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        return IconButton(
                          onPressed: () {
                            Helper.updateFavouriteMethod(widget.house, context);
                            setState(() {});
                          },
                          icon: widget.house.isFav
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                ),
                        );
                      },
                    ),
                  ))
            ]),
            const SpaceV(18),
            TitleAndPriceRow(house: widget.house),
            Text(widget.house.place, style: Styles.styleDesc),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    leading: const Icon(
                      Icons.bed_outlined,
                      color: Colors.grey,
                      size: 20,
                    ),
                    title:
                        Text('${widget.house.bd}bd', style: Styles.styleDesc),
                    contentPadding: const EdgeInsets.all(0),
                    horizontalTitleGap: 1,
                  ),
                ),
                Expanded(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    horizontalTitleGap: 1,
                    leading: const Icon(Icons.bathtub_outlined,
                        size: 20, color: Colors.grey),
                    title:
                        Text('${widget.house.ba}ba', style: Styles.styleDesc),
                  ),
                ),
                const Expanded(flex: 2, child: SizedBox())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
