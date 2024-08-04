import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/splash/data/models/landing_model.dart';

class TitleLanding extends StatelessWidget {
  const TitleLanding({
    super.key,
    required this.landingModel,
  });

  final LandingModel landingModel;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      bottom: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            landingModel.title,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: AppColor.secColor4,
                ),
          ),
          Text(
            landingModel.subTitle,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColor.secColor4,
                ),
          ),
        ],
      ),
    );
  }
}
