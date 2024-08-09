import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({
    super.key,
    required this.width,
    required this.height,
    this.padding = EdgeInsets.zero,
  });
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        height: height,
        child: Shimmer.fromColors(
          baseColor: const Color.fromARGB(236, 217, 217, 217),
          highlightColor: Colors.white,
          child: Container(
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: Colors.white),
          ),
        ),
      ),
    );
  }
}
