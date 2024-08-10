import 'package:flutter/material.dart';
import 'package:nestify/core/widgets/shimmer/shimmer_card.dart';

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
        return Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          height: 362,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerCard(
                width: double.infinity,
                height: 200,
                padding: EdgeInsets.symmetric(vertical: 8),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerCard(
                    width: 155,
                    height: 13,
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
                  ShimmerCard(
                    width: 70,
                    height: 13,
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
                ],
              ),
              ShimmerCard(
                width: 60,
                height: 13,
                padding: EdgeInsets.symmetric(vertical: 5),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ShimmerCard(
                    width: 60,
                    height: 13,
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  ShimmerCard(
                    width: 60,
                    height: 13,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
