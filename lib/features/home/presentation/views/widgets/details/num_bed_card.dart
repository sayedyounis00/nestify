
import 'package:flutter/material.dart';
import 'package:nestify/core/utils/styles.dart';

class NumBedsCard extends StatelessWidget {
  const NumBedsCard({
    super.key,
    required this.icon,
    required this.numers,
  });

  final String numers;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.withOpacity(.5))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.grey,
            size: 30,
          ),
          Text(numers, style: Styles.styleDesc)
        ],
      ),
    );
  }
}
