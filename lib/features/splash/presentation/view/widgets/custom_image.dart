import 'package:flutter/material.dart';
import 'package:nestify/features/splash/data/models/landing_model.dart';

class CustomImageLand extends StatelessWidget {
  const CustomImageLand({
    super.key,
    required this.landingModel,
  });

  final LandingModel landingModel;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(landingModel.assetIamge),
      fit: BoxFit.cover,
      filterQuality: FilterQuality.low,
    );
  }
}
