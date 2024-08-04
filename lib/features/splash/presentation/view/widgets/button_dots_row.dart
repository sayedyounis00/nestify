import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nestify/features/auth/presentation/view/login_view.dart';
import 'package:nestify/features/splash/data/landing_data.dart';
import 'package:nestify/features/splash/presentation/view/widgets/custom_landing_button.dart';
import 'package:nestify/features/splash/presentation/view/widgets/dot_transtion.dart';

class ButtonAndDotsRow extends StatelessWidget {
  const ButtonAndDotsRow({
    super.key,
    required this.pageController,
  });
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DotTranstion(
                currentIndex: LandingData.currentPage,
              ),
              CustomLandingButton(
                width: LandingData.currentPage == 2 ? 120 : 100,
                text:
                    LandingData.currentPage == 2 ? 'Start Exploaring' : 'Next',
                onTap: () {
                  if (LandingData.currentPage == 2) {
                    Get.off(() => const LoginView(),transition: Transition.rightToLeft);
                  } else {
                    pageController.nextPage(
                      duration: const Duration(microseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
