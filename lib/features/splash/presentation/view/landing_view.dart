import 'package:flutter/material.dart';
import 'package:nestify/features/splash/data/landing_data.dart';
import 'package:nestify/features/splash/presentation/view/widgets/landing_view_body.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});


  @override
  Widget build(BuildContext context) {
  final PageController pageController = PageController(initialPage: 0);
    return Scaffold(
      body: PageView.builder(
        onPageChanged: (value) {
          LandingData.currentPage = value;
        },
        controller: pageController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: LandingData.landingList.length,
        itemBuilder: (BuildContext context, int index) {
          return LandingViewBody(
            landingModel: LandingData.landingList[index],
            pageController: pageController,
          );
        },
      ),
    );
  }
}
