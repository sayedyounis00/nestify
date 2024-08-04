import 'package:flutter/material.dart';
import 'package:nestify/features/splash/data/landing_data.dart';
import 'package:nestify/features/splash/presentation/view/widgets/landing_view_body.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (value) {
        LandingData.currentPage = value;
      },
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: LandingData.landingList.length,
      itemBuilder: (BuildContext context, int index) {
        return LandingViewBody(
          landingModel: LandingData.landingList[index],
          pageController: _pageController,
        );
      },
    );
  }
}
