import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/splash/data/models/landing_model.dart';
import 'package:nestify/features/splash/presentation/view/widgets/button_dots_row.dart';
import 'package:nestify/features/splash/presentation/view/widgets/custom_image.dart';
import 'package:nestify/features/splash/presentation/view/widgets/title_landing.dart';

class LandingViewBody extends StatelessWidget {
  const LandingViewBody({
    super.key,
    required this.landingModel,
    required this.pageController,
  });
  final LandingModel landingModel;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomImageLand(landingModel: landingModel),
        Container(color: AppColor.primaryColor.withOpacity(0.85)),
        TitleLanding(landingModel: landingModel),
        ButtonAndDotsRow(pageController: pageController),
      ],
    );
  }
}

