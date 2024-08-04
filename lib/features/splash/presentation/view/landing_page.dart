import 'package:flutter/material.dart';
import 'package:nestify/core/utils/constant.dart';
import 'package:nestify/core/utils/theme/app_color.dart';
import 'package:nestify/features/splash/presentation/widgets/custom_button.dart';
import 'package:nestify/features/splash/presentation/widgets/dot_transtion.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({
    super.key,
    required this.assetIamge,
    required this.imgList,
    required this.pageController,
    required this.title,
    required this.subTitle,
  });
  final String assetIamge;
  final String title;
  final String subTitle;
  final List<String> imgList;
  final PageController pageController;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Image(
                image: AssetImage(widget.assetIamge),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        Container(color: AppColor.primaryColor.withOpacity(0.7)),
        Positioned(
          left: 20,
          bottom: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: AppColor.secColor4,
                    ),
              ),
              Text(
                widget.subTitle,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColor.secColor4,
                    ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 30,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                DotTranstion(
                  widget: widget,
                  currentIndex: AppConstInt.currentPage,
                ),
                const SizedBox(
                  width: 220,
                ),
                CustomButton(
                  width: AppConstInt.currentPage == 2 ? 120 : 100,
                  text: AppConstInt.currentPage == 2
                      ? 'Start Exploaring'
                      : 'Next',
                  onTap: () => onButtonTaped(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  onButtonTaped() {
    widget.pageController.nextPage(
      duration: const Duration(microseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}
