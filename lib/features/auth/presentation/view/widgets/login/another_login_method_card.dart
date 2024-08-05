import 'package:flutter/material.dart';

class AnotherLoginMethodCard extends StatelessWidget {
  const AnotherLoginMethodCard({
    super.key,
    required this.imgPath,
    required this.onTap,  this.cacheHeight,
  });
  final String imgPath;
  final void Function() onTap;
  final int? cacheHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xC2BCBABA))),
        child: Image.asset(imgPath,cacheHeight:cacheHeight,),
      ),
    );
  }
}
