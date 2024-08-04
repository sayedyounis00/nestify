import 'package:flutter/material.dart';
import 'package:nestify/features/splash/data/models/landing_model.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.landingModel,
  });

  final LandingModel landingModel;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(landingModel.assetIamge),
      fit: BoxFit.fill,
    );
  }
}
