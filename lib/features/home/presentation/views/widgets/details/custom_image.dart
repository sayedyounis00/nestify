import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nestify/core/widgets/shimmer/shimmer_card.dart';
import 'package:nestify/features/home/data/model/house_model.dart';

class CustomImage extends StatefulWidget {
  const CustomImage({
    super.key,
    required this.house,
  });

  final HouseModel house;

  @override
  State<CustomImage> createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: widget.house.img,
          child: CachedNetworkImage(
            placeholder: (context, url) {
              return ShimmerCard(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2);
            },
            imageUrl: widget.house.img,
            height: MediaQuery.of(context).size.height / 2,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .1,
          left: 20,
          child: IconButton.filled(
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white)),
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
            top: MediaQuery.of(context).size.height * .1,
            right: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {
                  widget.house.isFav = !widget.house.isFav;
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
              ),
            ))
      ],
    );
  }
}
